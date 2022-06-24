from email.mime import application
from django.contrib import admin

from .models import Company, Employee, JobApplication, JobData
#from .models import UserDb, WangUser

# Register your models here.
admin.site.register(Employee)
admin.site.register(Company)
admin.site.register(JobData)
admin.site.register(JobApplication)

admin.site.site_header = 'JOB PORTAL : ADMIN PANEL'
admin.site.site_title = 'ADMIN PANEL: JOB PORTAL'
admin.site.index_title = 'ADMINISTER MODELS'
