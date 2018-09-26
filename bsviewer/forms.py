import os

from django import forms
from .models.schema import Schema

SCHEMA_DEFAULT_VERSION = 0.3

class LoadXMLFile(forms.Form):
    schema_version = forms.ModelChoiceField(queryset=Schema.objects.all(), empty_label=None, to_field_name='version', initial=SCHEMA_DEFAULT_VERSION)
    file = forms.FileField(label='XML File')
    form_type = forms.CharField(widget=forms.HiddenInput(), initial='file')


class LoadXMLExample(forms.Form):
    schema_version = forms.ModelChoiceField(queryset=Schema.objects.all(), empty_label=None, to_field_name='version',
                                            initial=SCHEMA_DEFAULT_VERSION)
    file_name = forms.FilePathField(
        path=os.path.join(os.path.abspath(os.path.dirname(__file__)), 'lib', 'validator', 'examples'),
        recursive=False,
        match=r'\.xml$',
        allow_files=True
    )
    form_type = forms.CharField(widget=forms.HiddenInput(), initial='example')


class UpdateUserForm(forms.Form):
    first_name = forms.CharField(max_length=30, required=False)
    last_name = forms.CharField(max_length=30, required=False)
    email = forms.EmailField(required=True)