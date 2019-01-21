from django.urls import path

from . import views

app_name = 'hrsapp'
urlpatterns = [
    path('', views.home, name='home'),
    path('wines/', views.wines, name='wines-view'),
    path('start/', views.home, name='home'),
    path('wines/wine/<int:wine_id>', views.details, name='wine-details'),
    path('requests/', views.requests, name='requests'),
    path('recommend/', views.recommend_navigation, name='recommend-navigation'),
    path('get-recommended/', views.recommended_view, name='recommended-view')
]
