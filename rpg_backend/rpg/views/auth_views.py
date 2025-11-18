from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.permissions import IsAuthenticated
from rest_framework_simplejwt.views import (TokenObtainPairView, TokenRefreshView)


# TOKEN Login
class LoginView(ObtainAuthToken):
    # Login using the Token authentication
    def post(self, request, *args, **kwargs):
        response = super().post(request, *args, **kwargs)
        token = Token.objects.get(key=response.data["token"])
        return Response({"token": token.key, "user_id": token.user_id})
    

# TOKEN Logout
class LogoutView(APIView):
    #Logout by deleten the token
    permission_classes = [IsAuthenticated]

    def post(self, request):
        request.user.auth_token.delete()
        return Response({"message": 'User is logged out'})
    

# JWT Login
# Login using the JWT authentication
class JWTLoginView(TokenObtainPairView):
    pass # Default behavior

# JWT Refreash
# Get the new JWT access token by using a refresh token
class JWTRefreshView(TokenRefreshView):
    pass # Default behavior

