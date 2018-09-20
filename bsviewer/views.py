import os
import tempfile

from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, Http404
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView, UpdateView, DeleteView

from .models.schema import Schema
from .models.use_case import UseCase

from bsviewer import forms
from bsviewer.lib.validator.workflow import ValidationWorkflow


def index(request):
    context = {}
    return render(request, 'bsviewer/index.html', context)


def use_cases(request):
    user_usecases = {}
    if request.user.is_authenticated:
        user_usecases = UseCase.objects.filter(owner=request.user)

    public_usecases = UseCase.objects.filter(make_public=True)
    context = {
        'user_usecases': user_usecases,
        'public_usecases': public_usecases
    }
    return render(request, 'bsviewer/use_cases.html', context)

def validator(request):
    context = {
        'load_xml_file_form': forms.LoadXMLFile(),
        'load_xml_example_form': forms.LoadXMLExample(),
        'a_var': ''
    }

    if request.POST:
        form_type = request.POST['form_type']
        is_example = False
        if form_type == 'file':
            form = forms.LoadXMLFile(request.POST, request.FILES)
        elif form_type == 'example':
            form = forms.LoadXMLExample(request.POST)
            is_example = True
        elif form_type == 'url':
            form = forms.LoadXMLURL(request.POST)
        else:
            return HttpResponseServerError('Invalid form data')
    else:
        return render(request, 'bsviewer/validator.html', context)

    if form.is_valid():
        if form_type == 'file':
            f = request.FILES['file']
            filename = f.name

            # save tmp file
            tmp_file = tempfile.NamedTemporaryFile(delete=False)
            filepath = tmp_file.name
            print('tmp file at: {}'.format(filepath))
            for chunk in f.chunks():
                tmp_file.write(chunk)
            tmp_file.close()

        else:
            f = open(request.POST['file_name'], 'r')
            filename = os.path.basename(request.POST['file_name'])
            filepath = request.POST['file_name']

        version = '0.3'
        print("FILENAME: {}".format(filename))
        print("FORM TYPE: {}".format(form_type))

        workflow = ValidationWorkflow(f, filepath, version)
        validation_results = workflow.validate_all()
        #validation_results = workflow.validate_schema()

        #print(validation_results)

        # cleanup file after validation
        if form_type == 'file':
            os.unlink(tmp_file.name)

        return render(request, 'bsviewer/validator_results.html', {
            'validation_results': validation_results,
            'filename': filename,
            'schema_version': version
        })

    else:
        context['load_xml_{}_form'.format(form_type)] = form
        return render(request, 'bsviewer/validator.html', context)


@login_required
def profile(request):
    # if request.GET and request.GET['passwordchange'] == 'done':
    #     messages.add_message(request, messages.SUCCESS, 'Password changed')
    return render(request, 'registration/profile.html')


def download_template(request, name):
    if name:
        schema = Schema.objects.filter(name=name)[0]
        if schema:

            file_path = schema.usecase_template_file.path

            if os.path.exists(file_path):
                with open(file_path, 'rb') as fh:
                    response = HttpResponse(fh.read(), content_type="application/vnd.ms-excel")
                    response['Content-Disposition'] = 'inline; filename=' + os.path.basename(
                        file_path)
                    return response
            raise Http404
        raise Http404
    raise Http404


class UseCaseCreate(CreateView):
    model = UseCase
    fields = ['name', 'schema', 'import_file']
    success_url = reverse_lazy('bsviewer:cases')

    def form_valid(self, form):
        form.instance.owner = self.request.user
        return super().form_valid(form)


class UseCaseUpdate(UpdateView):
    model = UseCase
    fields = ['name', 'schema', 'import_file']
    success_url = reverse_lazy('bsviewer:cases')


class UseCaseDelete(DeleteView):
    model = UseCase
    success_url = reverse_lazy('bsviewer:cases')
