from django.shortcuts import render
from django.http import HttpResponse

from django.contrib.auth.decorators import login_required, permission_required, user_passes_test



def index(request):
    context = {}
    return render(request, 'bsviewer/index.html', context)

@login_required
def profile(request):
    if request.GET and request.GET['passwordchange'] == 'done':
        messages.add_message(request, messages.SUCCESS, 'Password changed')
    return render(request, 'registration/profile.html')


