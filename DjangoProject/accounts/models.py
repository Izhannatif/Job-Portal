
import email
from statistics import mode
from django.db import models
from django.contrib.auth.models import User
# Create your models here.


class Employee(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    usertype = models.CharField(max_length=20)
    username= models.CharField(max_length=20,unique=True,default="")
    password=models.CharField(max_length=30,default="")
    email= models.EmailField(default="")
    fname= models.CharField(max_length=10)
    lname= models.CharField(max_length=10)
    age= models.IntegerField(null=True)
    gender = models.CharField(choices=[('Male', 'Male') ,( 'Female' , 'Female'), ('Other', 'other')],max_length=10)
    address= models.CharField(max_length=255)
    phoneNo=models.BigIntegerField(null=True)
    Degree= models.CharField(max_length=20)
    Majors= models.CharField(max_length=20)
    yearOfGraduation=models.DateField(null=True)
    skills=models.CharField(max_length=255,help_text='minimum 5',null=True)
    
    def __str__(self):
        return self.user.username + "," + self.user.email + ","+ self.usertype
    
class Company(models.Model):
        user= models.ForeignKey(User,on_delete=models.CASCADE)
        username = models.CharField(max_length=32,unique=True) # user name 
        password = models.CharField(max_length=32) # password 
        email = models.CharField(max_length=50) # mailbox 
        companyName= models.CharField(max_length=50,null=True)
        contactNo = models.BigIntegerField(null=True)
        companyAddress= models.CharField(max_length=255)
        companyInfo= models.CharField(max_length=255)
        status = models.CharField(choices=[('Pending','Pending'),('Rejected','Rejected'),('Verified','Verified')],max_length=20,default='Pending')
        usertype=models.CharField(max_length=20)
        def __str__(self):
            return self.companyName+ "," + self.username + ', ' + self.status
        
class JobData(models.Model):
    company = models.ForeignKey(Company, on_delete=models.CASCADE)
    start_date = models.DateField()
    end_date = models.DateField()
    title = models.CharField(max_length=200)
    salary = models.FloatField()
    description = models.TextField(max_length=400)
    experience = models.CharField(max_length=100)
    location = models.CharField(max_length=100)
    skills = models.CharField(max_length=200)
    creation_date = models.DateField()
 
    def __str__ (self):
        return self.title
    
 
class JobApplication(models.Model):
    company = models.CharField(max_length=200, default="")
    jobData = models.ForeignKey(JobData, on_delete=models.CASCADE)
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE)
    resume = models.FileField(upload_to="")
    apply_date = models.DateField()
 
    def __str__ (self):
        return str(self.company + ", "  + self.employee.fname)