from rest_framework import serializers
from django.contrib.auth.models import User

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        # Leaving out password to ceep it secret
        fields = ["id", "username", "email"]