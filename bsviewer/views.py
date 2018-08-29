from django.shortcuts import render
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required, permission_required, user_passes_test
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy

from .models.schema import Schema
from .models.buildingsyncattribute import BuildingSyncAttribute
from .models.usecase import UseCase


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

@login_required
def profile(request):
    if request.GET and request.GET['passwordchange'] == 'done':
        messages.add_message(request, messages.SUCCESS, 'Password changed')
    return render(request, 'registration/profile.html')


class UseCaseCreate(CreateView):
    model = UseCase
    fields = ['name', 'schema']
    success_url = reverse_lazy('bsviewer:cases')

    def form_valid(self, form):
        form.instance.owner = self.request.user
        return super().form_valid(form)

class UseCaseUpdate(UpdateView):
    model = UseCase
    fields = ['name', 'schema']
    success_url = reverse_lazy('bsviewer:cases')

class UseCaseDelete(DeleteView):
    model = UseCase
    success_url = reverse_lazy('bsviewer:cases')