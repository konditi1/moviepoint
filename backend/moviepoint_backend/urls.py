"""
moviepoint_backend URL Configuration
"""
from django.contrib import admin
from django.urls import path, include
from django.http import JsonResponse

def api_root(request):
    """API root endpoint"""
    return JsonResponse({
        'message': 'MovieMind API',
        'version': '1.0.0',
        'endpoints': {
            'search': '/api/search/',
            'movies': '/api/movies/{id}/',
            'tv': '/api/tv/{id}/',
            'trending': '/api/trending/',
            'discover': '/api/discover/',
            'watchlist': '/api/watchlist/',
        }
    })

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('api.urls')),
    path('', api_root, name='api_root'),
]
