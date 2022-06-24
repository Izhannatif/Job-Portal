
from datetime import date
from itertools import count
import re
from traceback import print_tb
from django.shortcuts import render, redirect
from .models import Company, Employee, JobApplication, JobData
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.http import FileResponse
from accounts import models

# Create your views here.


def index(request):
    return render(request, "index.html")


def userLogin(request):
    if not request.user.is_authenticated:
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username, password=password)

        if user is not None:
            emp = Employee.objects.get(user=user)
            if emp.usertype == "Employee":
                login(request, user)
                return redirect('userDashboard')
        else:
            error_name = 'User does not exist.'
            return render(request, 'login.html', {'error_name': error_name})
        return render(request, 'login.html')
    else:
        return redirect('/userDashboard')


def EmployeeRegister(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        email = request.POST.get('email')
        fname = request.POST.get('First Name')
        lname = request.POST.get('Last Name')
        age = request.POST.get('Age')
        gender = request.POST.get('Gender')
        address = request.POST.get('Address')
        phoneNo = request.POST.get('Phone Number')
        Degree = request.POST.get('Degree')
        Majors = request.POST.get('Major')
        yearOfGraduation = request.POST.get('Graduation')
        skills = request.POST.get('skills')
        user_list = User.objects.filter(username=username)
        error_name = []

        if user_list:
            error_name = 'this user already exist'
            print(error_name)
            return render(request, 'EmployeeRegister.html', {'error_name': error_name})
        else:
            user = User.objects.create_user(
                first_name=fname, last_name=lname, username=username, password=password, email=email)
            employeeData = Employee.objects.create(user=user, username=username, password=password, email=email, fname=fname, lname=lname, age=age, gender=gender,address=address, phoneNo=phoneNo, Degree=Degree, Majors=Majors, yearOfGraduation=yearOfGraduation, skills=skills, usertype="Employee")
            user.save()
            employeeData.save()
            print('ok')
            return render(request, 'login.html')
    print('bhund')
    return render(request, 'EmployeeRegister.html')


def userEditProfile(request):
    if not request.user.is_authenticated:
        return redirect('/login/')
    employee = Employee.objects.get(user=request.user)
    if request.method == "POST":
        email = request.POST.get('email')
        fname = request.POST.get('First Name')
        lname = request.POST.get('Last Name')
        age = request.POST.get('Age')
        gender = request.POST.get('Gender')
        address = request.POST.get('Address')
        phoneNo = request.POST.get('phone')
        Degree = request.POST.get('Degree')
        Majors = request.POST.get('Major')
        yearOfGraduation = request.POST.get('Graduation')
        skills = request.POST.get('skills')

        employee.user.email = email
        employee.email = email
        print(email)
        employee.user.first_name = fname
        print(fname)
        employee.user.last_name = lname
        print(lname)
        employee.age = age
        print(age)
        employee.fname = fname
        print(fname)
        employee.lname =lname
        print(lname)
        employee.phoneNo = phoneNo
        print(phoneNo)
        employee.gender = gender
        employee.address = address
        employee.Degree = Degree
        employee.Majors = Majors
        employee.yearOfGraduation = yearOfGraduation
        employee.skills = skills

        employee.save()
        employee.user.save()
        alert = True
        print(request.user.username + ',' + email)
        return render(request, "userProfile.html", {'alert': alert})
    return render(request, "userProfile.html", {'employee': employee})


def CompanyRegister(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        email = request.POST.get('email')
        password = request.POST.get('password')
        companyName = request.POST.get('Company name')
        contactNo = request.POST.get('contact no')
        companyAddress = request.POST.get('address')
        companyInfo = request.POST.get('Company info')

        user_list = models.Company.objects.filter(username=username)
        error_name = []

        if user_list:
            error_name = 'this company already exist'
            return render(request, 'companyRegister.html', {'error_name': error_name})
        else:
            user = User.objects.create_user(
                username=username, email=email, password=password, first_name=companyName)
            
            companydata = models.Company.objects.create(user=user, username=username, password=password, email=email, companyName=companyName,
                                                        contactNo=contactNo, companyAddress=companyAddress, companyInfo=companyInfo, status="pending", usertype="Company")
            user.save()
            companydata.save()
            return render(request, 'mainPage.html')
    return render(request, 'companyRegister.html')


def companyLogin(request):
    username = request.POST.get('username')
    password = request.POST.get('password')
    user = authenticate(username=username, password=password)

    if user is not None:
        cmp = Company.objects.get(user=user)
        if cmp.usertype == "Company" and cmp.status == "Verified":
            print(cmp.status)
            login(request, user)
            return redirect('/jobApplicants')
        elif cmp.status != 'Verified':
            print(cmp.status)
            return render(request,'companyStatus.html',{'company':cmp})
        else:
            alert = 'username or password is incorrect!'
            print(cmp.status)
            return render(request, 'companyLogin.html', {'alert': alert})
    return render(request, 'companyLogin.html')


def companyEditProfile(request):
    if not request.user.is_authenticated:
        return redirect("/companyLogin")
    company = Company.objects.get(user=request.user)
    if request.method == "POST":
        email = request.POST.get('email')
        password = request.POST.get('password')
        companyName = request.POST.get('Company Name')
        contactNo = request.POST.get('Contact no')
        companyAddress = request.POST.get('Address')
        companyInfo = request.POST.get('Company info')

        company.user.email = email
        company.password = password
        request.user.password = password
        company.email = email
        company.user.first_name = companyName
        company.companyName = companyName
        company.contactNo = contactNo
        company.companyInfo = companyInfo
        company.companyAddress = companyAddress
        company.save()
        company.user.save()
        print(request.user.password)
        alert = True
        return render(request, "companyProfile.html", {'alert': alert})
    return render(request, "companyProfile.html", {'company': company})


def logoutFunction(request):
    logout(request)
    return redirect('/')


def homepage(request):
    return render(request, 'homepage.html')


def userDashboard(request):
    return showAllJobs(request)


def add_job(request):
    if not request.user.is_authenticated:
        return redirect("/companyLogin")
    else:
        if request.method == "POST":
            title = request.POST.get('job_title')
            start_date = request.POST.get('start_date')
            end_date = request.POST.get('end_date')
            salary = request.POST.get('salary')
            experience = request.POST.get('experience')
            location = request.POST.get('location')
            skills = request.POST.get('skills')
            description = request.POST.get('description')
            user = request.user
            company = Company.objects.get(user=user)
            job = JobData.objects.create(company=company, title=title, start_date=start_date, end_date=end_date, salary=salary,
                                         experience=experience, location=location, skills=skills, description=description, creation_date=date.today())
            job.save()
            message = 'Job Added Successfully!'
            alert = True
            return render(request, "jobAdd.html", {'message': message})
        return render(request, "jobAdd.html")


def editJob(request, myid):
    jobData = JobData.objects.get(id=myid)
    if request.method != 'POST':
        return redirect('companyJobs')
    else:
        print('ok')
        title = request.POST.get('Jobtitle')
        salary = request.POST.get('Salary')
        experience = request.POST.get('Experience')
        location = request.POST.get('Location')
        skills = request.POST.get('Skills')
        description = request.POST.get('Description')
        print(salary)
        print(title)
        print(experience)
        print(location)
        print(skills)
        print(description)
        jobData.title = title
        jobData.salary = salary
        jobData.experience = experience
        jobData.location = location
        jobData.skills = skills
        jobData.description = description
        jobData.save()
        
        message = 'Job Updated !'
        return render(request, 'editJobDetails.html', {'jobData': jobData, 'message': message})

def showAllJobs(request):
    jobs = JobData.objects.all().order_by('-creation_date')
    employee = Employee.objects.get(user=request.user)
    apply = JobApplication.objects.filter(employee=employee)
    
    data = []
    for i in apply:
        data.append(i.jobData.id)
    return render(request, "listedJobs.html", {'jobs': jobs, 'data': data})


def jobDetails(request, myid):
    job = JobData.objects.get(id=myid)
    return render(request, "JobDetails.html", {'job': job})


def applyJob(request, myid):
    if not request.user.is_authenticated:
        return redirect("/userLogin")
    applicant = Employee.objects.get(user=request.user)
    job = JobData.objects.get(id=myid)
    date1 = date.today()

    if request.method == 'POST':
        resume = request.FILES.get('resume')
        JobApplication.objects.create(
            jobData=job, company=job.company, employee=applicant, resume=resume, apply_date=date.today())
        alert = 'Applied Successfuly'
        print(resume.name)
        print(resume.size)
        return render(request, "jobApply.html", {'alert': alert})

    return render(request, "jobApply.html",)


def companyDashboard(request):
    if not request.user.is_authenticated:
        return redirect('/companyLogin')
    else:
        company = Company.objects.get(user=request.user)
        return render(request, 'companyDashboard.html', {'company': company})


def adminLogin(request):
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)

        if user.is_superuser:
            login(request, user)
            return redirect("/ListOfCompanies")
        else:
            alert = True
            return render(request, "adminLogin.html", {"alert": alert})
    return render(request, "adminLogin.html")


def showAllCompnies(request):
    if not request.user.is_authenticated:
        return redirect("/adminLogin")
    companies = Company.objects.all()
    return render(request, "ListOfCompanies.html", {'companies': companies})


def all_applicants(request):
    if request.user.is_authenticated:
        company = Company.objects.get(user=request.user)
        application = JobApplication.objects.filter(company=company)
        return render(request, "jobApplicants.html", {'application': application})
    else:
        redirect('/companyLogin')


def companyJobs(request):
    if request.user.is_authenticated:
        company = Company.objects.get(user=request.user)
        jobs = JobData.objects.filter(company=company)
        return render(request, 'companyJobs.html', {'jobs': jobs})
    else:
        return redirect('/companyLogin')


def mainPage(request):
    emp = Employee.objects.all()
    sumemp = 0
    for employees in emp:
        sumemp = sumemp+1
    cmp = Company.objects.all()
    sumcmp = 0
    for companies in cmp:
        sumcmp = sumcmp+1
    job = JobData.objects.all()
    sumjob = 0
    for jobs in job:
        sumjob = sumjob+1
    applied = JobApplication.objects.all()
    sumapp = 0
    for apps in applied:
        sumapp = sumapp+1

    jobs = JobData.objects.all().order_by('-creation_date')[:5]
    return render(request, 'mainPage.html', {'company': sumcmp, 'employee': sumemp, 'Jobs': sumjob, 'Applied': sumapp, 'jobs': jobs})


def deleteCompany(request, id):
    company = Company.objects.get(id=id)
    company.delete()
    return redirect('/listOfCompanies')


def jobApplicantDetails(request, myid):
    if request.user.is_authenticated:
        company = Company.objects.get(user=request.user)
        application = JobApplication.objects.get(id=myid)
        return render(request, "applicantDetails.html", {'application': application})
    else:
        redirect('/companyLogin')


def deleteCompanyJob(request, id):
    if request.user.is_authenticated:
        job = JobData.objects.get(id=id)
        job.delete()
        message = 'Job Deleted Successfully.'
        return redirect('/companyJobs')


def companyStatus(request):
    if request.user.is_authenticated:
        cmp = Company.objects.get(user=request.user)
        return render(request, 'companyStatus.html')
    else:
       return companyLogin(request)