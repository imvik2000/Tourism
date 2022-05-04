from tourism.models import *
from tourism.serializers import *
from django.contrib.auth import authenticate
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet
from rest_framework.authentication import TokenAuthentication,SessionAuthentication
from rest_framework.permissions import DjangoModelPermissionsOrAnonReadOnly, IsAuthenticated
class FamousViewSet(ModelViewSet):
    queryset = Famous.objects.all()
    serializer_class = FamousSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = [DjangoModelPermissionsOrAnonReadOnly]
    filterset_fields = ['category','location']
    search_fields = ['^item']
    ordering_fields = ['category','like','dislike']

class LocationViewSet(ModelViewSet):
    queryset = Location.objects.all()
    serializer_class = LocationSerializer
    authentication_classes = (TokenAuthentication,)
    permission_classes = [DjangoModelPermissionsOrAnonReadOnly]

class UserRegistrationView(APIView):
    def post(self,request,format=None):
        serializers = UserRegestrationSerializer(data=request.data)
        if serializers.is_valid(raise_exception=True):
            user=serializers.save()
            return Response({'msg':'Registration Success'},status=status.HTTP_201_CREATED)
        return Response(serializers.errors, status=status.HTTP_404_NOT_FOUND)

class UserLoginView(APIView):
    def post(self,request,format=None):
        serializers = UserLoginSerializer(data=request.data)
        if serializers.is_valid(raise_exception=True):
            email = serializers.data.get('email')
            password = serializers.data.get('password')
            user = authenticate(email=email, password=password)
            if user is not None:
                return Response({'msg':'Login Success'}, status=status.HTTP_200_OK)
            else:
                return Response(serializers.errors, status=status.HTTP_404_NOT_FOUND)

class UserProfileView(APIView):
    def get(self,request,format=None):
        user = request.user
        serializer = UserProfileSerializer(user)
        return Response(serializer.data)

class AddLikeView(APIView):
    authentication_classes = (SessionAuthentication,TokenAuthentication)
    permission_classes = [IsAuthenticated]
    def post(self,request,pk,format=None):
        user = request.user
        item = Famous.objects.get(id=pk)
        item.dislike.remove(user)
        item.like.add(user)
        return Response({'msg':'Like Success'},status=status.HTTP_200_OK)

class AddDislikeView(APIView):
    authentication_classes = (SessionAuthentication,TokenAuthentication)
    permission_classes = [IsAuthenticated]
    def post(self,request,pk,format=None):
        user = request.user
        item = Famous.objects.get(id=pk)
        item.like.remove(user)
        item.dislike.add(user)
        return Response({'msg':'Dislike Success'},status=status.HTTP_200_OK)
