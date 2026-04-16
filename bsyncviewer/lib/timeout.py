"""
Minimal CPython threading timeout helper.

This replaces the small subset of ``stopit`` used by the validator workflow.
``stopit`` imports ``pkg_resources`` at module import time, and that module was
removed from setuptools 82.0.0.
"""

import ctypes
import threading


class TimeoutException(Exception):
    """Raised when a code block exceeds the allowed timeout."""


def _async_raise(thread_id, exception_type):
    result = ctypes.pythonapi.PyThreadState_SetAsyncExc(
        ctypes.c_long(thread_id), ctypes.py_object(exception_type)
    )
    if result == 0:
        raise ValueError(f"Invalid thread ID {thread_id}")
    if result > 1:
        ctypes.pythonapi.PyThreadState_SetAsyncExc(ctypes.c_long(thread_id), None)
        raise SystemError("PyThreadState_SetAsyncExc failed")


class ThreadingTimeout:
    EXECUTED, EXECUTING, TIMED_OUT, INTERRUPTED, CANCELED = range(5)

    def __init__(self, seconds, swallow_exc=True):
        self.seconds = seconds
        self.swallow_exc = swallow_exc
        self.state = self.EXECUTED
        self._target_tid = threading.current_thread().ident
        self._timer = None

    def __bool__(self):
        return self.state in (self.EXECUTED, self.EXECUTING, self.CANCELED)

    __nonzero__ = __bool__

    def __enter__(self):
        self.state = self.EXECUTING
        self._timer = threading.Timer(self.seconds, self._trigger_timeout)
        self._timer.start()
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        if exc_type is TimeoutException:
            if self.state != self.TIMED_OUT:
                self.state = self.INTERRUPTED
                self._cancel_timer()
            return self.swallow_exc

        if exc_type is None:
            self.state = self.EXECUTED

        self._cancel_timer()
        return False

    def cancel(self):
        self.state = self.CANCELED
        self._cancel_timer()

    def _cancel_timer(self):
        if self._timer is not None:
            self._timer.cancel()

    def _trigger_timeout(self):
        self.state = self.TIMED_OUT
        _async_raise(self._target_tid, TimeoutException)
