# WebProject
Simple Windows DOS based Web project that uses browser page to show values fetched from a programmable logic controller (PLC).
Besides for Windows based computer, it requires that [python](https://www.python.org), [django](https://www.djangoproject.com/) and [pylogix](https://github.com/dmroeder/pylogix) be installed on it as well.

INTENDED FOR BEGINNERS, TEST DEVELOPMENT AND/OR LEARNING PURPOSES ONLY.

This is a Windows DOS batch file that performs automated steps of creating web pages and running the server.
Currently setup to run on local network and is using the built-in lightweight django server with SQLite database.

Tested as working in Windows 10 with: python 3.6.8 ; django 3.1.7 ; pylogix 0.7.10.

In order to understand certain options, it is highly recommended that you perform the following steps:
- Read the django intro tutorial: https://docs.djangoproject.com/en/3.1/intro/tutorial01/
- Check that same tutorial captured in a batch file: https://github.com/GitHubDragonFly/django/blob/main/extras/polls.bat
- Install all the required software as mentioned above.
- Make sure to set the correct IP Address/Processor Slot/Micro800 values for your PLC (since all these options are in the same section then just edit the pylogix.bat file and search for comm.IPAddress)
- Run the pylogix.bat file and make sure to create the admin/superuser account when prompted (which you will use to enter tags).

# Functionality
- PLC tags are entered via the admin page at http://127.0.0.1:8000/admin/ in your browser (this requires the admin account mentioned previously).
- To read elements of an array, add startIndex and {elementCount}, where startIndex can be either of x or x,y or x,y,z. Example: CT_STRINGArray[2]{3} or CT_DINTArray_3D[0,1,0]{15}.
- Only the first tag value is ever used. Entering the initial value on the admin page is unnecessary. Values are setup as strings and if there is no communication then a message "~ not communicating ~" will show. Once a value is fetched from the PLC then it will overwrite that value.
- PLC tags and their values are shown on the pylogix1 page at http://127.0.0.1:8000/pylogix1/ in your browser.
- A single Value is set to max 2500 characters, so change it if you need more or less.
- The web page is set to refresh every 30 seconds and attempt to re-read the tag values from the PLC. This refresh value can be changed in the file itself.
- As stated above, make sure to set the correct PLC parameters.
- There is no "Write" functionality included.
- It is possible to add additional pages, just check the other batch file mentioned above (django intro tutorial).

There might be bugs in the app (not that I noticed any but one never knows).

Screenshots folder has pictures of this project running inside the Firefox browser.

# Usage
All it takes is to:
- Download and install python, django and pylogix to your Windows based computer.
- Download and extract the zip file of this project.
- Use this download location or copy the pylogix.bat file to the folder of your choice.
- Open command prompt, navigate to the folder where you have the pylogix.bat file and run it by simply typing pylogix.bat
- Create admin/superuser account when prompted, so you can add tags.
- Make sure to read everything that's in this description, in the batch file itself and in the screen output when running the batch file.

# Licensing
This is licensed under BSD License.

# Trademarks
Any and all trademarks, either directly or indirectly mentioned in this project, belong to their respective owners.
