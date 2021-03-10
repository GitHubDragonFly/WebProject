# WebProject
Simple Windows DOS based Web project that uses browser page to show values fetched from a programmable logic controller (PLC).
Besides for Windows based computer, it requires that python, django and pylogix be installed on it as well.

INTENDED FOR BEGINNERS, TEST DEVELOPMENT AND/OR LEARNING PURPOSES ONLY.

This is a Windows DOS batch file that performs automated steps of creating web pages and running the server.

Tested as working in Windows 10 with: python 3.6.8 ; django 3.1.7 ; pylogix 0.7.10.

It is highly recommended that you perform the following steps:

- Read the django intro tutorial: https://docs.djangoproject.com/en/3.1/intro/tutorial01/
- Check that same tutorial captured in a batch file: https://github.com/GitHubDragonFly/django/blob/main/extras/polls.bat
- Install all the required software as mentioned above.
- Make sure to set the correct IP Address/Processor Slot/Micro800 for your PLC (edit the pylogix.bat file and search for comm.IPAddress)
- Run the pylogix.bat file and make sure to create the admin/superuser account when prompted (which you will use to enter tags).

# Functionality
- PLC tags are entered via the admin page at http://127.0.0.1:8000/admin/.
- PLC tags and their values are shown on the pylogix1 page at http://127.0.0.1:8000/pylogix1/.
- The web page is set to refresh every 10 seconds and attempt to re-read the tag values from the PLC.
- As stated above, make sure to set correct PLC parameters.
- There is no "Write" functionality included.

There might be bugs in the app.

Screenshots folder has pictures of this app running inside the Firefox browser.

# Usage
All it takes is to:
- Download and install python, django and pylogix to your Windows based computer.
- Download and extract the zip file of this project.
- Use this download location or copy the pylogix.bat file to the folder of your choice.
- Open command prompt, navigate to the folder where you have the pylogix.bat file and run it by simply typing pylogix.bat
- Create admin/superuser account when prompted.
- Make sure to read everything that's in this description, in the batch file itself and in the screen output.

# Licensing
This is licensed under BSD License.

# Trademarks
Any and all trademarks, either directly or indirectly mentioned in this project, belong to their respective owners.
