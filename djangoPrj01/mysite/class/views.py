from django.shortcuts import render

# Create your views here.
def index(request):

    """
    Pybo 목록 출력
    """
    return render(request, 'class/class_list.html')
