import os

from django import forms


class LoadXMLFile(forms.Form):
    file = forms.FileField(label='XML File')
    form_type = forms.CharField(widget=forms.HiddenInput(), initial='file')


class LoadXMLExample(forms.Form):
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