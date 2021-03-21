#!/bin/bash

# ~~ INTENDED FOR BEGINNERS, TEST DEVELOPMENT AND/OR LEARNING PURPOSES ONLY ~~

# Tested as working in Raspbian Buster with: python 3.7.3 ; django 3.1.7 ; pylogix 0.7.10.
# All the commands run under the assumption that 'django', 'python3' and 'pylogix' are already installed on your computer.
# All the commands reflect the Linux bash way of automated creation of web pages.
# When required, the escape character used here is "\".

# Copy this script file to the folder of your choice.
# Open terminal and navigate to that folder.
# Make the script executable with command: chmod +x pylogix.sh.
# To start the process below, type the following comand: ./pylogix.sh

# ~ FIRST RUN WILL ATTEMPT TO CREATE THE PROJECT, DIRECTORY STRUCTURE, SETUP DATABASE, CREATE ADMIN ACCOUNT AND RUN THE SERVER
# ~ SUBSEQUENT RUNS WILL ATTEMPT TO RUN THE SERVER (if mysite folder is detected)

set +v #do not echo the following commands

if [ -d "pylogixsite" ];
then
  echo -----------------------------------
  echo  pylogixsite folder already exists
  echo  attempting to run the server
  echo -----------------------------------

  cd pylogixsite
  if [ -e manage.py ]
  then
    python3 manage.py runserver
  fi
else
  echo ------------------------------------------
  echo  attempting to create pylogix web project
  echo ------------------------------------------

  django-admin startproject pylogixsite

  cd pylogixsite

  python3 manage.py startapp pylogix1

  # -------------------------------------------------------------------------------------------------------------------------
  # This section can be used as a template to add a new page (so pylogix1 would become pylogix2 or similar).

  cd pylogix1

  echo >> views.py
  echo from django.http import HttpResponseRedirect >> views.py
  echo from django.views import generic >> views.py
  echo from django.urls import reverse >> views.py
  echo from django.shortcuts import get_object_or_404 >> views.py
  echo from .models import Address, Values >> views.py
  echo import sys >> views.py
  echo sys.path.append\(\'..\'\) >> views.py
  echo from pylogix import PLC >> views.py
  echo >> views.py
  echo comm = None >> views.py
  echo >> views.py
  echo class IndexView\(generic.ListView\): >> views.py
  echo '    'template_name = \'pylogix1/index.html\' >> views.py
  echo '    'context_object_name = \'latest_address_list\' >> views.py
  echo >> views.py
  echo '    'def get_queryset\(self\): >> views.py
  echo '         'global comm >> views.py
  echo >> views.py
  echo '         'comm = PLC\(\) >> views.py
  echo '         'comm.IPAddress = \'192.168.1.15\' >> views.py
  echo '         'comm.ProcessorSlot = 3 >> views.py
  echo '         'comm.Micro800 = False >> views.py
  echo >> views.py
  echo '         'plcTime = comm.GetPLCTime\(\) >> views.py
  echo >> views.py
  echo '         'if not plcTime.Value is None: >> views.py
  echo '             'for obj in Address.objects.order_by\(\'-id\'\): >> views.py
  echo '                 'pylogix1_refresh_values\(obj.id\) >> views.py
  echo '         'else: >> views.py
  echo '             'for obj in Address.objects.order_by\(\'-id\'\): >> views.py
  echo '                 'plcAddress = str\(get_object_or_404\(Address, pk=obj.id\)\) >> views.py
  echo '                 'currentValues = Values.objects.filter\(plc_address_id=obj.id\) >> views.py
  echo >> views.py
  echo '                 'if currentValues.count\(\) \> 0: >> views.py
  echo '                     'if currentValues[0].plc_address_value == \'\': >> views.py
  echo '                         'b = Values\(plc_address_id=obj.id, plc_address_value=\'~ not communicating ~\'\) >> views.py
  echo '                         'b.save\(\) >> views.py
  echo '                     'else: >> views.py
  echo '                         'Values.objects.filter\(plc_address_id=obj.id\).update\(plc_address_value=\'~ not communicating ~\'\) >> views.py
  echo '                 'else: >> views.py
  echo '                     'b = Values\(plc_address_id=obj.id, plc_address_value=\'~ not communicating ~\'\) >> views.py
  echo '                     'b.save\(\) >> views.py
  echo >> views.py
  echo '         'comm.Close\(\) >> views.py
  echo '         'comm = None >> views.py
  echo >> views.py
  echo '         '\"\"\" Return the last 50 plc addresses \"\"\" >> views.py
  echo '         'return Address.objects.order_by\(\'-id\'\)[:50] >> views.py
  echo >> views.py
  echo def pylogix1_refresh_values\(id\): >> views.py
  echo '    'plcAddress = str\(get_object_or_404\(Address, pk=id\)\) >> views.py
  echo '    'currentValues = Values.objects.filter\(plc_address_id=id\) >> views.py
  echo '    'readArray = False >> views.py
  echo '    'arrayElementCount = 0 >> views.py
  echo >> views.py
  echo '    'if plcAddress.endswith\(\'}\'\) and \'{\' in plcAddress: >> views.py
  echo '        'try: >> views.py
  echo '            'arrayElementCount = int\(plcAddress[plcAddress.index\(\'{\'\) + 1:plcAddress.index\(\'}\'\)]\) >> views.py
  echo '            'readArray = True >> views.py
  echo '            'plcAddress = plcAddress[:plcAddress.index\(\'{\'\)] >> views.py
  echo '        'except: >> views.py
  echo '            'pass >> views.py
  echo >> views.py
  echo '    'if readArray and arrayElementCount \> 0: >> views.py
  echo '        'newValue = comm.Read\(plcAddress, arrayElementCount\).Value >> views.py
  echo '    'else: >> views.py
  echo '        'newValue = comm.Read\(plcAddress\).Value >> views.py
  echo >> views.py
  echo '    'if currentValues.count\(\) \> 0: >> views.py
  echo '        'if currentValues[0].plc_address_value == \'\': >> views.py
  echo '            'b = Values\(plc_address_id=id, plc_address_value=newValue\) >> views.py
  echo '            'b.save\(\) >> views.py
  echo '        'else: >> views.py
  echo '            'Values.objects.filter\(plc_address_id=id\).update\(plc_address_value=newValue\) >> views.py
  echo '    'else: >> views.py
  echo '        'b = Values\(plc_address_id=id, plc_address_value=newValue\) >> views.py
  echo '        'b.save\(\) >> views.py

  echo from django.urls import path > urls.py
  echo from . import views >> urls.py
  echo >> urls.py
  echo app_name = \'pylogix1\' >> urls.py
  echo urlpatterns = [ >> urls.py
  echo '    'path\(\'\', views.IndexView.as_view\(\), name=\'index\'\), >> urls.py
  echo '    'path\(\'\<int:pk\>/pylogix1_refresh_values/\', views.pylogix1_refresh_values, name=\'pylgx1_refresh\'\), >> urls.py
  echo ] >> urls.py

  echo >> models.py
  echo class Address\(models.Model\): >> models.py
  echo '    'plc_address = models.CharField\(max_length=200\) >> models.py
  echo >> models.py
  echo '    'def __str__\(self\): >> models.py
  echo '        'return self.plc_address >> models.py
  echo >> models.py
  echo class Values\(models.Model\): >> models.py
  echo '    'plc_address = models.ForeignKey\(Address, on_delete=models.CASCADE\) >> models.py
  echo '    'plc_address_value = models.CharField\(max_length=2500\) >> models.py
  echo >> models.py
  echo '    'def __str__\(self\): >> models.py
  echo '        'return self.plc_address_value >> models.py

  echo from django.contrib import admin >> admin.py
  echo from .models import Address, Values >> admin.py
  echo >> admin.py
  echo class ValueInline\(admin.TabularInline\): >> admin.py
  echo '    'model = Values >> admin.py
  echo '    'extra = 1 >> admin.py
  echo >> admin.py
  echo class AddressAdmin\(admin.ModelAdmin\): >> admin.py
  echo '    'fieldsets = [ >> admin.py
  echo '        '\(None,               {\'fields\': [\'plc_address\']}\), >> admin.py
  echo '    '] >> admin.py
  echo '    'inlines = [ValueInline] >> admin.py
  echo '    'list_display = [\'plc_address\'] >> admin.py
  echo '    'search_fields = [\'plc_address\'] >> admin.py
  echo >> admin.py
  echo admin.site.register\(Address, AddressAdmin\) >> admin.py

  mkdir templates
  cd templates
  mkdir pylogix1
  cd pylogix1

  echo \<\!DOCTYPE html\> > index.html
  echo \<html\> >> index.html
  echo ''\<head\> >> index.html
  echo '  '{% load static %} >> index.html
  echo '  '\<link rel=\"stylesheet\" type=\"text/css\" href=\"{% static \'pylogix1/style.css\' %}\"\> >> index.html
  echo '  '\<meta http-equiv=\"refresh\" content=\"30\" charset=\"utf-8\"\> >> index.html
  echo '  '\<title\>Pylogix Tags \& Values\</title\> >> index.html
  echo ''\</head\> >> index.html
  echo ''\<body\> >> index.html
  echo '  '\<p\>\<h3 style=\"color:seagreen\;\"\>Tags \& Values\</h3\>\</p\> >> index.html
  echo '  '\<table\> >> index.html
  echo '    '\<thead\>\<tr\>\<th\>Tag Name\</th\>\<th\>Value\</th\>\</tr\>\</thead\> >> index.html
  echo '    '\<tbody\> >> index.html
  echo '      '{% if latest_address_list %} >> index.html
  echo '          '{% for plcAddress in latest_address_list %} >> index.html
  echo '              '\<tr\> >> index.html
  echo '                '\<td\> >> index.html
  echo '                  '{{ plcAddress.plc_address }} >> index.html
  echo '                '\</td\> >> index.html
  echo '                '\<td\> >> index.html
  echo '                  '\<h3 style=\"color:blue\;\"\>{{ plcAddress.values_set.first }}\</h3\> >> index.html
  echo '                '\</td\> >> index.html
  echo '              '\</tr\> >> index.html
  echo '          '{% endfor %} >> index.html
  echo '      '{% else %} >> index.html
  echo '          '\<tr\> >> index.html
  echo '            '\<td\>No plc address available\</td\> >> index.html
  echo '            '\<td\>  ------  \</td\> >> index.html
  echo '          '\</tr\> >> index.html
  echo '      '{% endif %} >> index.html
  echo '    '\<tbody\> >> index.html
  echo '  '\</table\> >> index.html
  echo ''\</body\> >> index.html
  echo \</html\> >> index.html

  cd ..
  cd ..

  mkdir static
  cd static
  mkdir pylogix1
  cd pylogix1

  echo table { border: 1\; padding: 2px\; background-color: black\; } > style.css
  echo th, td { padding: 5px\; background-color: gainsboro\; font-size: 120%\; } >> style.css
  echo li a { color: navy\; text-decoration: none\; font-size: 120%\; } >> style.css
  echo body { background-color: honeydew\; } >> style.css

  cd ..
  cd ..

  # -------------------------------------------------------------------------------------------------------------------------
  # Add a path for any subsequently added page here (so pylogix1 would become pylogix2 or similar).

  cd ..
  cd pylogixsite

  echo from django.urls import include >> urls.py
  echo urlpatterns = [path\(\'pylogix1/\', include\(\'pylogix1.urls\'\)\),path\(\'admin/\', admin.site.urls\),] >> urls.py

  # -------------------------------------------------------------------------------------------------------------------------
  # Add a line for any subsequently added page to the INSTALLED_APPS section (so pylogix1 would become pylogix2 or similar).
  # Optionally change the TIME_ZONE value.

  echo > temp.txt

  cat settings.py | while IFS= read -r line; #preserve spaces in strings
  do
    if [ "$line" = "TIME_ZONE = 'UTC'" ];
    then
      echo TIME_ZONE = \'EST\' >> temp.txt
    elif [ "$line" = "INSTALLED_APPS = [" ];
    then
      echo "$line" >> temp.txt
      echo '    '\'pylogix1.apps.Pylogix1Config\', >> temp.txt
    else
      echo "$line" >> temp.txt
    fi
  done

  cat temp.txt > settings.py
  rm temp.txt

  # -------------------------------------------------------------------------------------------------------------------------
  # Add any subsequently added page to this section (so pylogix1 would become pylogix2 or similar).

  cd ..

  python3 manage.py migrate

  python3 manage.py makemigrations pylogix1

  python3 manage.py sqlmigrate pylogix1 0001

  python3 manage.py migrate

  # -------------------------------------------------------------------------------------------------------------------------

  echo --------------------------------------------------------------------------
  echo Create superuser as the admin for the site http://127.0.0.1:8000/admin/
  echo --------------------------------------------------------------------------

  python3 manage.py createsuperuser

  # -------------------------------------------------------------------------------------------------------------------------
  # Show usage messages. Add a link for any additional pages when created.

  echo ----------------------------------------------------------------------------
  echo You can access the following pages from your browser:
  echo ' 'http://127.0.0.1:8000/admin/  - use the admin account you just created
  echo ' 'http://127.0.0.1:8000/pylogix1/
  echo ----------------------------------------------------------------------------
  echo To restart the server, just run this batch file again.
  echo
  echo Alternatively, navigate to the outer pylogixsite by typing \"cd pylogixsite\".
  echo Run the server by typing \"python3 manage.py runserver\".
  echo ----------------------------------------------------------------------------

  python3 manage.py runserver
fi
