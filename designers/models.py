from django.db import models
from django.contrib.auth.models import AbstractUser

class Designer(AbstractUser):

    profile_picture = models.FileField(upload_to="media/pictures/profile_pictures")