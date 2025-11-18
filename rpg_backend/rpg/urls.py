from django.urls import path, include
from rest_framework.routers import DefaultRouter

# Import ViewSets
from rpg.views import (
    UserViewSet, GuildViewSet, InventoryViewSet, ItemViewSet,
    NPCViewSet, SkillViewSet, BattleViewSet, QuestViewSet,
    CharacterViewSet, TransactionViewSet
)

# Import Authentication Views
from rpg.views.auth_views import (
    LoginView, LogoutView, JWTLoginView, JWTRefreshView
)

router = DefaultRouter()
router.register(r'users', UserViewSet, basename='users')
router.register(r'guilds', GuildViewSet)
router.register(r'inventories', InventoryViewSet)
router.register(r'items', ItemViewSet)
router.register(r'npcs', NPCViewSet)
router.register(r'skills', SkillViewSet)
router.register(r'battles', BattleViewSet)
router.register(r'quests', QuestViewSet)
router.register(r'characters', CharacterViewSet)
router.register(r'transactions', TransactionViewSet)

# By registering all these ViewSets, Django automatically creates an endpoint for each similar to /api/users/.
# meaning every model now supports CRUD operations
urlpatterns = [
    # All CRUD ViewSets
    path('', include(router.urls)),

    # TOKEN AUTH
    path('auth/login/', LoginView.as_view(), name='token-login'),
    path('auth/logout/', LogoutView.as_view(), name='token-logout'),

    # JWT AUTH
    path('auth/jwt/login/', JWTLoginView.as_view(), name='jwt-login'),
    path('auth/jwt/refresh/', JWTRefreshView.as_view(), name='jwt-refresh'),
]
