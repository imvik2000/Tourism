from django.conf import settings
from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.utils import timezone
from cloudinary.models import CloudinaryField
from ckeditor.fields import RichTextField
from django.contrib.auth.base_user import BaseUserManager
from django.contrib.auth.base_user import AbstractBaseUser
from django.contrib.auth.models import PermissionsMixin,Group
from rest_framework.authtoken.models import Token

class UserManager(BaseUserManager):

    use_in_migrations = True

    def _create_user(self, email, password, **extra_fields):
        if not email:
            raise ValueError('The given email must be set')

        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', False)
        extra_fields.setdefault('is_superuser', False)
        return self._create_user(email, password, **extra_fields)

    def create_superuser(self, email, password, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_active', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError(
                'Superuser must have is_staff=True.'
            )
        if extra_fields.get('is_superuser') is not True:
            raise ValueError(
                'Superuser must have is_superuser=True.'
            )

        return self._create_user(email, password, **extra_fields)



class User(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(unique=True,max_length=255,blank=False)
    first_name = models.CharField('first name',max_length=150,blank=True)
    last_name = models.CharField('last name',max_length=150,blank=True)
    is_staff = models.BooleanField('staff status',default=False)
    is_active = models.BooleanField('active',default=True)
    is_superuser = models.BooleanField('superuser',default=False)
    date_joined = models.DateTimeField('date joined',default=timezone.now)
    usergroup = models.ForeignKey(Group,related_name="groups",on_delete=models.SET_NULL,null=True,blank=True)
  
    USERNAME_FIELD = 'email'
    objects = UserManager()

    def __str__(self):
        return self.email

    def full_name(self):
        return self.first_name+" "+self.last_name
        
class Location(models.Model):
    location = models.TextField()
    
    def __str__(self):
        return self.location
    
    class Meta:
        verbose_name = "Location"
        verbose_name_plural = "Locations" 

class Famous(models.Model):
    CATEGORY_CHOICES = (
        (0, 'Places'),
        (1, 'Food'),
        (2, 'Collectibles'),
    )
    item = models.TextField()
    images = CloudinaryField('images',blank=True,null=True)
    description = RichTextField(blank=True,null=True)
    location = models.ForeignKey("tourism.location", on_delete=models.CASCADE,null=True)
    category = models.IntegerField(choices=CATEGORY_CHOICES, default=0)
    like = models.ManyToManyField(settings.AUTH_USER_MODEL,related_name="likes",blank=True)
    dislike = models.ManyToManyField(settings.AUTH_USER_MODEL,related_name="dislikes",blank=True)
    likeint = models.IntegerField(default=0)
    dislikeint = models.IntegerField(default=0)
    class Meta:
        verbose_name = "Famous"
        verbose_name_plural = "Famous"
    def __str__(self):
        return self.item

@receiver(post_save, sender=settings.AUTH_USER_MODEL)
def create_auth_token(sender, instance=None, created=False, **kwargs):
    if created:
        Token.objects.create(user=instance)
