import json
import os
import pathlib
import subprocess
import tempfile
import zipfile
from typing import Dict, List

import semantic_version
from django.conf import settings
from django.contrib import messages
from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth.mixins import LoginRequiredMixin
from django.core.mail import BadHeaderError, send_mail
from django.forms.models import model_to_dict
from django.http import (
    FileResponse,
    Http404,
    HttpResponse,
    HttpResponseRedirect,
    HttpResponseServerError,
    JsonResponse
)
from django.shortcuts import redirect, render
from django.urls import reverse, reverse_lazy
from django.views.generic.edit import CreateView, DeleteView, UpdateView
from rest_framework import views
from rest_framework.parsers import MultiPartParser
from rest_framework.response import Response

from bsyncviewer import forms
from bsyncviewer.lib.documentation_generator.generate_docs import get_docs_path
from bsyncviewer.lib.tree_viewer import get_schema_jstree_data
from bsyncviewer.lib.validator.workflow import ValidationWorkflow

from .models.attribute_enumeration_class import AttributeEnumerationClass
from .models.bedes_models import (
    BedesEnumeration,
    BedesEnumerationMapping,
    BedesMapping,
    BedesTerm
)
from .models.enumeration import Enumeration
from .models.schema import Schema
from .models.use_case import UseCase

DEFAULT_SCHEMA_VERSION = settings.DEFAULT_SCHEMA_VERSION
# version 2.0 tags and earlier didn't follow MAJOR.MINOR.PATCH so we handle that here
GITHUB_VERSION_MAP = {
    '1.0.0': 'v1.0',
    '2.0.0': 'v2.0'
}
GITHUB_RELEASE_TAG_URL = 'https://github.com/BuildingSync/schema/releases/tag/{version}'
GITHUB_RELEASE_DOWNLOAD_URL = 'https://github.com/BuildingSync/schema/releases/download/{version}/{resource}'


class ValidatorApi(views.APIView):
    """
    API endpoint for validating schemas
    """
    parser_classes = (MultiPartParser,)

    def post(self, request, *args, **kwargs):

        version = request.data.get('schema_version', None)

        if not version:
            # use default version
            version = DEFAULT_SCHEMA_VERSION

        # find schema matching version
        try:
            Schema.objects.get(version=version)
        except BaseException:
            return Response({"success": False, "error": "No schema matching schema_version {} in database".format(version)})

        f = request.data['file']
        if f:
            tmp_file = tempfile.NamedTemporaryFile(delete=False)
            filepath = tmp_file.name
            # print('tmp file at: {}'.format(filepath))
            for chunk in f.chunks():
                tmp_file.write(chunk)
            tmp_file.close()

            # check if zipfile or single XML
            if zipfile.is_zipfile(filepath):

                with zipfile.ZipFile(filepath, 'r') as zip_file:

                    try:
                        tmp_dir = tempfile.TemporaryDirectory()
                        dirname = tmp_dir.name

                        # make clean filenames for response (weird encoding assumptions by zipfile module)
                        filenames = []
                        for member in zip_file.infolist():
                            if member.filename.endswith(".xml") and not member.filename.startswith("__MACOSX"):
                                filenames.append({"new": member.filename.encode('cp437').decode('utf-8'), "old": member.filename})

                        zip_file.extractall(dirname)

                        results = []
                        all_valid = True

                        for the_file in filenames:
                            fp = dirname + '/' + the_file['old']
                            wf = ValidationWorkflow(the_file['old'], fp, version)
                            val_res = wf.validate_all()

                            if val_res['schema']['valid'] is False:
                                all_valid = False

                            results.append({"file": the_file['new'], "results": val_res})

                        return Response({"schema_version": version, "all_files_valid": all_valid, "validation_results": results, "success": True})
                    except BaseException as err:
                        print(err)
                        return Response({"success": False, "error": "error processing Zip file"})

            else:

                try:
                    workflow = ValidationWorkflow(f, filepath, version)
                    validation_results = workflow.validate_all()
                    # cleanup file after validation
                    os.unlink(tmp_file.name)

                    return Response({"schema_version": version, "validation_results": validation_results, "success": True})
                except BaseException:
                    return Response({"success": False, "error": "error processing XML file"})

        else:
            return Response({"success": False, "error": "No schema_version or file parameters sent"})


def index(request):

    FILE_DIR = os.path.dirname(os.path.abspath(__file__))
    try:
        version = subprocess.check_output(['git', 'describe', '--tags'], cwd=FILE_DIR).decode('utf-8').strip()
    except Exception:
        version = '?'

    context = {'app_version': version}
    return render(request, 'index.html', context)


def about(request):
    context = {}
    return render(request, 'about.html', context)


def contact(request):
    context = {}
    return render(request, 'contact.html', context)


def collaborators(request):
    context = {}
    return render(request, 'collaborators.html', context)


def adopters(request):
    context = {}
    return render(request, 'adopters.html', context)


def faq(request):
    context = {}
    return render(request, 'faq.html', context)


def implementers(request):
    context = {}
    return render(request, 'implementers.html', context)


def practitioners(request):
    context = {}
    return render(request, 'practitioners.html', context)


def auditors(request):
    context = {}
    return render(request, 'auditors.html', context)


def tools(request):
    context = {}
    return render(request, 'tools.html', context)


def releases(request):

    releases = []
    for schema in Schema.objects.all().order_by('-version'):
        github_version = GITHUB_VERSION_MAP.get(schema.version, f'v{schema.version}')

        releases.append({
            'github_version': github_version,
            'version': schema.version,
            'docs_url': f'/documentation/{schema.version}',
            'tag_url': GITHUB_RELEASE_TAG_URL.format(version=github_version),
            'xsd_url': GITHUB_RELEASE_DOWNLOAD_URL.format(version=github_version, resource='BuildingSync.xsd'),
            'data_dict_xlsx_url': GITHUB_RELEASE_DOWNLOAD_URL.format(version=github_version, resource='DataDictionary.xlsx'),
        })

    context = {
        'releases': releases
    }

    return render(request, 'releases.html', context)


def onboarding(request):
    context = {}
    return render(request, 'onboarding.html', context)


def technical_resources(request):
    context = {}
    return render(request, 'technical_resources.html', context)


def references(request):
    context = {}
    return render(request, 'references.html', context)


def mlod(request):
    context = {}
    return render(request, 'mlod.html', context)


def case_study(request):
    context = {}
    return render(request, 'case_study.html', context)


def use_cases(request):
    user_usecases = {}
    if request.user.is_authenticated:
        user_usecases = UseCase.objects.filter(owner=request.user).order_by('schema')

    cases = {}
    schemas = Schema.objects.values_list('version', flat=True)

    # sort according to versioning scheme
    sorted_versions = sorted(schemas, key=lambda x: semantic_version.Version(x), reverse=True)

    for s in sorted_versions:
        schema = Schema.objects.filter(version=s).first()
        ucs = list(UseCase.objects.filter(make_public=True, schema=schema).order_by('name').values())
        cases[s] = ucs

    context = {
        'user_usecases': user_usecases,
        'sorted_public_cases': cases
    }
    return render(request, 'use_cases.html', context)


def redirect_data_dictionary(request):
    return redirect(reverse('dictionaryversion', args=[DEFAULT_SCHEMA_VERSION]))


def dictionary(request, version):

    versions = []

    # find schema matching version
    try:
        schema = Schema.objects.get(version=version)

        github_version = GITHUB_VERSION_MAP.get(schema.version, f'v{schema.version}')

        release = {
            'github_version': github_version,
            'version': schema.version,
            'docs_url': f'/documentation/{schema.version}',
            'tag_url': GITHUB_RELEASE_TAG_URL.format(version=github_version),
            'xsd_url': GITHUB_RELEASE_DOWNLOAD_URL.format(version=github_version, resource='BuildingSync.xsd'),
            'data_dict_xlsx_url': GITHUB_RELEASE_DOWNLOAD_URL.format(version=github_version, resource='DataDictionary.xlsx'),
        }

    except BaseException:
        raise Http404('Schema version provided does not exist.')

    for version_obj in Schema.objects.all().order_by('-version'):
        versions.append({
            'name': version_obj.version,
            'is_current': version_obj.version == version,
            'link': reverse('dictionaryversion', args=[version_obj.version])
        })

    context = {
        'schema_version': version,
        'schema_tree_data': json.dumps(get_schema_jstree_data(version)),
        'versions': versions,
        'release': release
    }

    return render(request, 'dictionary.html', context)


def retrieve_additional_dictionary_data(request):
    element_id = request.GET.get('element_id', None)

    # print("ELEMENT ID TO RETRIEVE: {}".format(element_id))

    # get Bedes mappings
    bedes_terms = []
    bedes_mappings = BedesMapping.objects.filter(attribute_id=element_id)
    # print('ELEMENT ID: {}'.format(element_id))
    if bedes_mappings.count() > 0:
        for item in bedes_mappings:
            bedes_term = model_to_dict(BedesTerm.objects.get(pk=item.bedesTerm_id))
            # print("BEDES TERM: {}".format(bedes_term))
            bedes_terms.append(bedes_term)

    # GET ENUMS
    has_enum = False
    enums = []
    # first get enumeration class id from the attributeEnumeration relationship table
    enum_ids = AttributeEnumerationClass.objects.filter(attribute_id=element_id)

    if enum_ids.count() > 0:
        # if found, means that this attribute has enums. Retrieve the actual enum values
        # print('enum class id: {}'.format(enum_ids[0].enumeration_class_id))
        has_enum = True
        enum_results = Enumeration.objects.filter(
            enumeration_class_id=enum_ids[0].enumeration_class_id).only('name').order_by('pk')

        for item in enum_results:
            # print('ENUM Found: {}, {}'.format(item.name, item.id))
            enum_list = {}
            enum_list['name'] = item.name
            enum_list['bedes_term'] = None
            bedes_mappings = BedesEnumerationMapping.objects.filter(enumeration_id=item.id)
            if bedes_mappings.count() > 0:
                # take first
                bedes_enum = model_to_dict(BedesEnumeration.objects.get(pk=bedes_mappings[0].bedesEnumeration_id))
                # print("BEDES ENUM: {}".format(bedes_enum))
                enum_list['bedes_term'] = bedes_enum
            enums.append(enum_list)
        # print("ENUMS: {}".format(enums))

    data = {
        'bedes_terms': bedes_terms,
        'has_enum': has_enum,
        'enums': enums
    }
    return JsonResponse(data)


def enumerations(request, version):
    try:
        schema = Schema.objects.get(version=version)
    except BaseException:
        raise Http404('Schema version provided does not exist.')

    if not schema.enumerations_file:
        return HttpResponseRedirect(reverse_lazy('enumerations', args=[DEFAULT_SCHEMA_VERSION]))

    enumerations_data = json.load(schema.enumerations_file)
    # remove measures
    enumerations_data = [term for term in enumerations_data if term['name'] != 'MeasureName']

    versions = []
    for version_obj in Schema.objects.all().order_by('-version'):
        versions.append({
            'name': version_obj.version,
            'is_current': version_obj.version == version,
            'link': reverse('dictionaryversion', args=[version_obj.version])
        })

    context = {
        'version': version,
        'enumerations_data': enumerations_data,
        'versions': versions,
        'enumerations_type': 'data_dictionary'
    }

    return render(request, 'enumerations.html', context)


def measures(request, version):
    try:
        schema = Schema.objects.get(version=version)
    except BaseException:
        raise Http404('Schema version provided does not exist.')

    if not schema.enumerations_file:
        return HttpResponseRedirect(reverse_lazy('measures', args=[DEFAULT_SCHEMA_VERSION]))

    enumerations_data = json.load(schema.enumerations_file)
    # find measures
    enumerations_data = [term for term in enumerations_data if term['name'] == 'MeasureName']

    versions = []
    for version_obj in Schema.objects.all().order_by('-version'):
        versions.append({
            'name': version_obj.version,
            'is_current': version_obj.version == version,
            'link': reverse('dictionaryversion', args=[version_obj.version])
        })

    context = {
        'version': version,
        'enumerations_data': enumerations_data,
        'versions': versions,
        'enumerations_type': 'measures'
    }

    return render(request, 'enumerations.html', context)


def get_schema_to_examples() -> Dict[str, List[pathlib.Path]]:
    """
    Create schema examples dictionary.

    Create a dictionary were the keys are the schemas versions
    and the values are a list of example files for that schema version

    :return: dict
    """
    validator_dir = pathlib.Path(__file__).parent / 'lib' / 'validator' / 'examples'

    schema_to_examples = {}
    for schema_dir in validator_dir.glob("*"):
        schema_to_examples[schema_dir.name.replace("schema", "", 1)] = [(p.name, str(p)) for p in schema_dir.glob("*.xml")]

    return schema_to_examples


def validator(request):
    context = {
        'load_xml_file_form': forms.LoadXMLFile(),
        'load_xml_example_form': forms.LoadXMLExample(),
        'schema_to_examples': get_schema_to_examples(),
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

    validated = False
    if form_type == 'example':
        # workaround for files list by schema_version
        errors = form.errors

        file_errs = errors.get('file_name')
        if file_errs is None or len(file_errs) == 0:
            # no errors - validated
            validated = True

    elif form.is_valid():
        validated = True

    if validated:
        if form_type == 'file':
            f = request.FILES['file']
            filename = f.name

            # save tmp file
            tmp_file = tempfile.NamedTemporaryFile(delete=False)
            filepath = tmp_file.name
            # print('tmp file at: {}'.format(filepath))
            for chunk in f.chunks():
                tmp_file.write(chunk)
            tmp_file.close()

        else:
            if 'download' not in request.POST:
                # validate file
                filename = os.path.basename(request.POST['file_name'])
                # get file in the correct folder (by schema version)
                filepath = os.path.join(
                    os.path.abspath(os.path.dirname(__file__)), 'lib', 'validator', 'examples', 'schema' + request.POST['schema_version'], filename
                )

                f = open(filepath, 'r')

        if 'download' in request.POST:
            file_path = os.path.join(
                os.path.abspath(os.path.dirname(__file__)), 'lib', 'validator', 'examples', 'schema' + request.POST['schema_version'], 'example_files.zip'
            )

            if os.path.exists(file_path):
                with open(file_path, 'rb') as fh:
                    response = HttpResponse(fh.read(), content_type='application/force-download')
                    response['Content-Disposition'] = 'attachment; filename="%s"' % os.path.basename(
                        file_path)
                    return response
            raise Http404

        else:

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


def download_examples(request):
    file_path = os.path.join(
        os.path.abspath(os.path.dirname(__file__)), 'lib', 'validator', 'examples', 'example_files.zip'
    )

    if os.path.exists(file_path):
        with open(file_path, 'rb') as fh:
            response = HttpResponse(fh.read(), content_type='application/force-download')
            response['Content-Disposition'] = 'attachment; filename="%s"' % os.path.basename(
                file_path)
            return response
    raise Http404


def download_usecase_example(request):
    file_path = os.path.join(
        os.path.abspath(os.path.dirname(__file__)), 'lib', 'use_cases', 'example_usecase_definitions.sch'
    )

    if os.path.exists(file_path):
        with open(file_path, 'rb') as fh:
            response = HttpResponse(fh.read(), content_type='application/force-download')
            response['Content-Disposition'] = 'attachment; filename="%s"' % os.path.basename(
                file_path)
            return response
    raise Http404


def download_usecase_file(request, pk):
    use_case = UseCase.objects.get(pk=pk)
    the_file = use_case.import_file

    if os.path.exists(the_file.path):
        with open(the_file.path, 'rb') as fh:
            response = HttpResponse(fh.read(), content_type='application/force-download')
            response['Content-Disposition'] = 'attachment; filename="%s"' % os.path.basename(
                the_file.path)
            return response
    raise Http404


@login_required
def profile(request):
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
        return render(request, 'registration/updateuser.html',
                      {'update_user_form': update_user_form})


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


def emailView(request):
    if request.method == 'GET':
        form = forms.ContactForm()
    else:
        form = forms.ContactForm(request.POST)
        if form.is_valid():
            subject = form.cleaned_data['subject']
            email = form.cleaned_data['email']
            message = form.cleaned_data['message']
            try:
                send_mail(subject, message, email, ['info@buildingsync.net'])
            except BadHeaderError:
                return HttpResponse('Invalid header found.')
            return redirect('success')
    return render(request, "email.html", {'form': form})


def successView(request):
    # return HttpResponse('Success! Thank you for your message.')
    messages.add_message(request, messages.SUCCESS, 'Email Sent! Thank you for your message.')
    return HttpResponseRedirect(reverse_lazy('index'))


def documentation(request, version):
    """
    NOTE: Only use this for local development! you should use nginx to serve
    these files normally
    """
    return FileResponse(open(get_docs_path(version), 'rb'))


class UseCaseCreate(LoginRequiredMixin, CreateView):
    model = UseCase
    fields = ['name', 'description', 'schema', 'import_file']
    success_url = reverse_lazy('cases')

    def form_valid(self, form):
        form.instance.owner = self.request.user
        return super().form_valid(form)


class UseCaseUpdate(LoginRequiredMixin, UpdateView):
    model = UseCase
    fields = ['name', 'description', 'schema', 'import_file']
    success_url = reverse_lazy('cases')


class UseCaseDelete(LoginRequiredMixin, DeleteView):
    model = UseCase
    success_url = reverse_lazy('cases')
