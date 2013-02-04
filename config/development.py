# -*- coding: utf-8 -*-

from settings import DATABASE_NAME
DEBUG = True
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': DATABASE_NAME,
        'USER': 'root',
        'PASSWORD': 'wrle2la5m',
        'HOST': '',
        'PORT': '',
    }
}
EMAIL_PORT = 1025
#TIME_ZONE = 'Europe/Moscow'
TIME_ZONE = 'Asia/Yakutsk'
