from django.urls import path

from . import views

app_name = 'hrsapp'
urlpatterns = [
    path('', views.IndexView.as_view(), name='index'),
    path('start', views.IndexView.as_view(), name='index'),
    path('grid', views.WineView.as_view(), name='grid'),
    path('detail', views.DetailView.as_view(), name='detail'),
    path('requests', views.RequestsHandler.as_view(), name='requests'),
    path('recommend-menu', views.RecommendView.as_view(), name='recommend-menu'),
    path('get-recommended', views.GetRecommendView.as_view(), name='get-recommended')
]
