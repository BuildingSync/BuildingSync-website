import os
import tempfile
import json

from django.forms.models import model_to_dict
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseServerError, HttpResponseRedirect, Http404, JsonResponse, HttpResponseForbidden
from django.contrib import messages
from django.contrib.auth import update_session_auth_hash
from django.shortcuts import render, redirect
from django.urls import reverse_lazy, reverse
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.contrib.auth.forms import PasswordChangeForm

from .models.schema import Schema
from .models.use_case import UseCase
from .models.attribute_enumeration_class import AttributeEnumerationClass
from .models.bedes_models import BedesMapping, BedesTerm
from .models.enumeration import Enumeration

from bsviewer import forms
from bsviewer.lib.validator.workflow import ValidationWorkflow
from bsviewer.lib.tree_viewer import get_schema_jstree_data

from django.conf import settings
DEFAULT_SCHEMA_VERSION = settings.DEFAULT_SCHEMA_VERSION


def index(request):
    context = {}
    return render(request, 'index.html', context)


def use_cases(request):
    user_usecases = {}
    if request.user.is_authenticated:
        user_usecases = UseCase.objects.filter(owner=request.user)

    public_usecases = UseCase.objects.filter(make_public=True)
    context = {
        'user_usecases': user_usecases,
        'public_usecases': public_usecases
    }
    return render(request, 'use_cases.html', context)


def redirect_data_dictionary(request):
    return redirect(reverse('dictionaryversion', args=[DEFAULT_SCHEMA_VERSION]))


def dictionary(request, version):
    versions = []

    # find schema matching version
    try:
        schema = Schema.objects.get(version=version)
    except BaseException:
        raise Http404('Schema version provided does not exist.')

    for version_obj in Schema.objects.all():
        versions.append({
            'name': version_obj.version,
            'is_current': version_obj.version == version,
            'link': reverse('dictionaryversion', args=[version_obj.version])
        })

    context = {
        'schema_version': version,
        'schema_tree_data': json.dumps(get_schema_jstree_data(version)),
        'versions': versions
    }

    return render(request, 'dictionary.html', context)


def retrieve_additional_dictionary_data(request):

    element_id = request.GET.get('element_id', None)

    # get Bedes mapping
    bedes_term = None
    bedes_mappings = BedesMapping.objects.filter(attribute_id=element_id)
    if bedes_mappings.count() > 0:
        # take first, there should only be 1
        bedes_term = model_to_dict(BedesTerm.objects.get(pk=bedes_mappings[0].bedesTerm_id))
        #bedes_term = serializers.serialize("json", BedesTerm.objects.get(pk=bedes_mappings[0].bedesTerm_id))
        print("BEDES TERM: {}".format(bedes_term))

    # GET ENUMS
    has_enum = False
    enums = []
    # first get enumeration class id from the attributeEnumeration relationship table
    enum_ids = AttributeEnumerationClass.objects.filter(attribute_id=element_id)
    if enum_ids.count() > 0:
        # if found, means that this attribute has enums. Retrieve the actual enum values
        has_enum = True
        print("ENUM ID RETRIEVED: {}".format(enum_ids[0].pk))
        enum_results = Enumeration.objects.filter(enumeration_class_id=enum_ids[0].enumeration_class_id).only('name').order_by('pk')
        print("ENUM_RESULTS: {}".format(enum_results))
        for item in enum_results:
            enums.append(item.name)
        print("ENUMS: {}".format(enums))

    # TODO: get bedes enum defs

    data = {
        'bedes_term': bedes_term,
        'has_enum': has_enum,
        'enums': enums
    }
    return JsonResponse(data)


def validator(request):
    context = {
        'load_xml_file_form': forms.LoadXMLFile(),
        'load_xml_example_form': forms.LoadXMLExample(),
        'a_var': ''
    }

    if request.POST:
        form_type = request.POST['form_type']
        version = request.POST['schema_version']
        if form_type == 'file':
            form = forms.LoadXMLFile(request.POST, request.FILES)
        elif form_type == 'example':
            form = forms.LoadXMLExample(request.POST)
        elif form_type == 'url':
            form = forms.LoadXMLURL(request.POST)
        else:
            return HttpResponseServerError('Invalid form data')
    else:
        return render(request, 'validator.html', context)

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

        print("FILENAME: {}".format(filename))
        print("FORM TYPE: {}".format(form_type))

        workflow = ValidationWorkflow(f, filepath, version)
        validation_results = workflow.validate_all()

        # print(validation_results)

        # cleanup file after validation
        if form_type == 'file':
            os.unlink(tmp_file.name)

        return render(request, 'validator_results.html', {
            'validation_results': validation_results,
            'filename': filename,
            'schema_version': version
        })

    else:
        context['load_xml_{}_form'.format(form_type)] = form
        return render(request, 'validator.html', context)


@login_required
def profile(request):
    # if request.GET and request.GET['passwordchange'] == 'done':
    #     messages.add_message(request, messages.SUCCESS, 'Password changed')
    return render(request, 'registration/profile.html')


@login_required
def update_user(request):
    if request.POST:
        form = forms.UpdateUserForm(request.POST)
        if form.is_valid():
            model_fields_to_update = {
                'first_name': request.user,
                'last_name': request.user,
                'email': request.user
            }
            for field_name, model in model_fields_to_update.items():
                if field_name not in request.POST:
                    continue
                setattr(model, field_name, request.POST[field_name])
            request.user.save()
            messages.add_message(request, messages.SUCCESS, 'Profile Updated')
            return HttpResponseRedirect(reverse_lazy('profile'))
        else:
            return render(request, 'registration/updateuser.html', {'update_user_form': form})
    else:
        update_user_form = forms.UpdateUserForm({
            'first_name': request.user.first_name,
            'last_name': request.user.last_name,
            'email': request.user.email
        })
        return render(request, 'registration/updateuser.html', {'update_user_form': update_user_form})


@login_required
def download_template(request, name):
    if name:
        # For some reason, this is linked to the version, not the name. hmm...
        schema = Schema.objects.filter(version=name)[0]
        if schema:

            file_path = schema.usecase_template_file.path

            if os.path.exists(file_path):
                with open(file_path, 'rb') as fh:
                    response = HttpResponse(fh.read(), content_type="application/vnd.ms-excel")
                    response['Content-Disposition'] = 'inline; filename=' + os.path.basename(
                        file_path) + '.csv'
                    return response
            raise Http404
        raise Http404
    raise Http404


@login_required
def change_password(request):
    if request.method == 'POST':
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)  # Important!
            messages.success(request, 'Your password was successfully updated!')
            return redirect('profile')
        else:
            messages.error(request, 'Please correct the error below.')
    else:
        form = PasswordChangeForm(request.user)
    return render(request, 'registration/change_password.html', {
        'form': form
    })


class UseCaseCreate(LoginRequiredMixin, CreateView):
    model = UseCase
    fields = ['name', 'schema', 'import_file']
    success_url = reverse_lazy('cases')

    def form_valid(self, form):
        form.instance.owner = self.request.user
        return super().form_valid(form)


class UseCaseUpdate(LoginRequiredMixin, UpdateView):
    model = UseCase
    fields = ['name', 'schema', 'import_file']
    success_url = reverse_lazy('cases')


class UseCaseDelete(LoginRequiredMixin, DeleteView):
    model = UseCase
    success_url = reverse_lazy('cases')
