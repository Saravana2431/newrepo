
from django.urls import path

path('blogs/', BlogListView, name='blogs'),
path('blog/<int:_id>', BlogDetailView, name='blog'),