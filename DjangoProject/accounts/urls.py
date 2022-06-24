from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns=[
    path('login/',views.userLogin,name ='login'),
    path('index/',views.index,name = 'index'),
    path('employeeregister/',views.EmployeeRegister,name = 'employeereg'),
    path('',views.mainPage,name = 'mainPage'),
    path('userProfile/',views.userEditProfile,name='userProfile'),
    path('userDashboard/',views.userDashboard,name='userDashboard'),
    path('companyregister/',views.CompanyRegister,name='companyreg'),
    path('companyLogin/',views.companyLogin,name='companyLogin'),
    path('companyProfile/',views.companyEditProfile,name='companyProfile'),
    path('jobAdd/',views.add_job,name='jobAdd'),
    path('logout/',views.logoutFunction,name="logout"),
    path('listedJobs/',views.showAllJobs,name='listedJobs'),
    path('companyDashboard/',views.companyDashboard,name='companyDashboard'),
    path('adminLogin',views.adminLogin,name='adminLogin'),
    path('ListOfCompanies/',views.showAllCompnies,name='ListOfCompanies'),
    path('jobApplicants/',views.all_applicants,name='jobApplicants'),
    path('companyJobs/', views.companyJobs,name='companyJobs'),
    path('JobDetails/<int:myid>/',views.jobDetails,name='JobDetails'),
    path('jobApply/<int:myid>/',views.applyJob,name='jobApply'),
    path('editJob/<int:myid>/',views.editJob,name='editJob'),
    path('editJobDetails/<int:myid>/', views.editJob,name='editJobDetails'),
    path('mainPage/',views.mainPage,name='mainPage'),
    path('deleteCompany/<int:myid>/',views.deleteCompany,name='deleteCompany'),
    path('applicantDetails/<int:myid>/',views.jobApplicantDetails,name='applicantsDetails'),
    path('companyJobs/<int:id>/',views.deleteCompanyJob),
    path('companyStatus/',views.companyStatus)
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)