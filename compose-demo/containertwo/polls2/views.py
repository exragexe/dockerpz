from django.http import HttpResponse


def index(request):
    return HttpResponse("Container two is working!")
