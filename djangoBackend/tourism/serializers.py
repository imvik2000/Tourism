from rest_framework import serializers
from tourism.models import *

class LocationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Location
        fields = "__all__"

class FamousSerializer(serializers.ModelSerializer):
    ''' 
        access image by concationg api response of famous[id][image] to https://res.cloudinary.com/sihau1054/
        like this: https://res.cloudinary.com/sihau1054/famous[id][image]
        https://res.cloudinary.com/sihau1054/[ image/upload/v1648112117/lkughznc7wjczxsszfsf.jpg ]
    '''
    category = serializers.ChoiceField(choices=Famous.CATEGORY_CHOICES)
    class Meta:
        model = Famous
        fields = "__all__"

class UserRegestrationSerializer(serializers.ModelSerializer):
    password2 = serializers.CharField(style={'input_type':'password'},write_only=True)
    class Meta:
        model = User
        fields = ["first_name","last_name","email","password","password2"]
        extra_kwargs = {
            'password': {'write_only': True}
        }
    def validate(self, attrs):
        password = attrs.get('password')
        password2 = attrs.get('password2')
        if password != password2:
            raise serializers.ValidationError("Passwords must match")
        return attrs
    
    def create(self, validated_data):
        user = User(
            email = validated_data['email'],
        )
        user.set_password(validated_data['password'])
        user.save()
        return user

class UserLoginSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(label='Email Address',max_length=255)
    class Meta:
        model = User
        fields = ['email','password']

class UserProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["full_name","email","date_joined"]