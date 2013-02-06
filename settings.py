# -*- coding: utf-8 -*-
DATABASE_NAME = u'sphere'
PROJECT_NAME = u'sphere'
SITE_NAME = u'Сфера +'
DEFAULT_FROM_EMAIL = u'support@XXXXXXXXXXX'

from config.base import *

try:
    from config.development import *
except ImportError:
    from config.production import *

TEMPLATE_DEBUG = DEBUG

INSTALLED_APPS += (
    'apps.siteblocks',
    'apps.pages',
    'apps.products',

    'sorl.thumbnail',
    # 'south',
    #'captcha',
)

MIDDLEWARE_CLASSES += (
    'apps.pages.middleware.PageFallbackMiddleware',
)

TEMPLATE_CONTEXT_PROCESSORS += (
    'apps.pages.context_processors.meta',
    'apps.siteblocks.context_processors.settings',
)