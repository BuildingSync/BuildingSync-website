import os

from django import forms
from django.conf import settings

from .models.schema import Schema

DEFAULT_SCHEMA_VERSION = settings.DEFAULT_SCHEMA_VERSION


class LoadXMLFile(forms.Form):
    schema_version = forms.ModelChoiceField(queryset=Schema.objects.all(), empty_label=None,
                                            to_field_name='version', initial=DEFAULT_SCHEMA_VERSION, required=True)
    file = forms.FileField(label='XML File', required=True)
    form_type = forms.CharField(widget=forms.HiddenInput(), initial='file')


class LoadXMLExample(forms.Form):
    schema_version = forms.ModelChoiceField(
        queryset=Schema.objects.all(),
        empty_label=None,
        to_field_name='version',
        initial=DEFAULT_SCHEMA_VERSION,
        widget=forms.Select(attrs={'id': 'schema_dropdown'})
    )

    file_name = forms.FilePathField(
        path=os.path.join(
            os.path.abspath(os.path.dirname(__file__)), 'lib', 'validator', 'examples'
        ),
        recursive=True,
        match=r'\.xml$',
        allow_files=True,
        widget=forms.Select(attrs={'id': 'file_dropdown'})
    )

    form_type = forms.CharField(widget=forms.HiddenInput(), initial='example')


class UpdateUserForm(forms.Form):
    first_name = forms.CharField(max_length=30, required=False)
    last_name = forms.CharField(max_length=30, required=False)
    email = forms.EmailField(required=True)


class ContactForm(forms.Form):
    email = forms.EmailField(required=True)
    subject = forms.CharField(required=True)
    message = forms.CharField(widget=forms.Textarea, required=True)
