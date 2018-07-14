from django.urls import path

from . import views

app_name = 'hrsapp'
urlpatterns = [
    path('', views.IndexView.as_view(), name='index'),
    path('wine-list', views.WineView.as_view(), name='wine-list'),
    path('recommend-menu', views.RecommendView.as_view(), name='recommend-menu')
]
