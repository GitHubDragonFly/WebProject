# Reality Check
Just for those of you who might be concerned about the Climate Change, here are couple of sobering insights:
- Neil deGrasse Tyson's perspective on climate change: [YouTube Video](https://www.youtube.com/watch?v=tRA2SfSk2Tc)
- My perspective, with statements from two AI entities: [Climate Change](https://githubdragonfly.github.io/viewers/templates/Climate%20Change.txt)

# WebProject
Simple Web project that uses a web browser page to show values fetched from Allen Bradley programmable logic controller (PLC).
It requires that [python](https://www.python.org), [django](https://www.djangoproject.com/) and [pylogix](https://github.com/dmroeder/pylogix) be installed on the computer.
These are Windows DOS batch file and Linux bash file (shell script).

INTENDED FOR BEGINNERS, TEST DEVELOPMENT AND/OR LEARNING PURPOSES ONLY.

These files perform automated steps of creating web pages and running the server.
Currently setup to run on local network and using the built-in lightweight django server with SQLite database.

Tested as working in:
  - Windows 10 with python 3.6.8 ; django 3.1.7 ; pylogix 0.7.10
  - Raspbian Buster with python 3.7.3 ; django 3.1.7 ; pylogix 0.7.10 .

In order to understand certain django interface/database options, it is highly recommended that you perform the following steps:
- Read the django intro tutorial at `https://docs.djangoproject.com/en/3.1/intro/tutorial01/`
- Check that same tutorial captured in batch/bash files at `https://github.com/GitHubDragonFly/django/blob/main/extras/`
- Install all the required software as mentioned above.
- Make sure to set the correct IP Address/Processor Slot/Micro800 values for your PLC. Since all these options are in the same section then just edit the pylogix.bat / pylogix.sh file and search for `comm.IPAddress`.
- Run the pylogix.bat / pylogix.sh file and make sure to create the admin/superuser account when prompted.

# Screenshots

Admin Page
![Admin Page](screenshots/Pylogix%20Django%20Admin%20Page.png?raw=true)

Tags Page
![Tags Page](screenshots/Pylogix%20Django%20Tags%20Page.png?raw=true)

# Functionality
- PLC tags are entered via the admin page at `http://127.0.0.1:8000/admin/` in your browser (this requires the admin account mentioned previously).
- To read bits or elements of an array, add startIndex and `{elementCount}`, where for arrays the startIndex can be either of `x` or `x,y` or `x,y,z`. Example: CT_DINT.0{15} or CT_STRINGArray[2]{3} or CT_DINTArray_3D[0,1,0]{15}.
- Only the first tag value is ever used. Entering the initial value on the admin page is unnecessary. Values are setup as strings and if there is no communication then a message `~ not communicating ~` will show. Once a value is fetched from the PLC then it will overwrite that value.
- PLC tags and their values are shown on the pylogix1 page at `http://127.0.0.1:8000/pylogix1/` in your browser.
- A single Value is set to max 2500 characters, so change it if you need more or less.
- The web page is set to refresh every 30 seconds and attempt to re-read the tag values from the PLC. This refresh value can be changed in the file itself.
- As stated above, make sure to set the correct PLC parameters.
- There is no `Write` functionality included.
- It is possible to add additional pages, just check the other batch/bash files mentioned above (django intro tutorial).

There might be bugs in the app (not that I noticed any but one never knows).

Screenshots folder has pictures of this project running inside the Firefox browser.

# Usage
All it takes is to:
- Download and install [python](https://www.python.org), [django](https://www.djangoproject.com/) and [pylogix](https://github.com/dmroeder/pylogix) to your computer.
- Download and extract the zip file of this project.
- Use that download location or copy the pylogix.bat / pylogix.sh file to the folder of your choice.
- Open command prompt / terminal, navigate to the folder where you have the script file and run it by simply typing `pylogix.bat` or `./pylogix.sh` (Linux note: before running this shell script you will have to make it executable by typing `chmod +x pylogix.sh`)
- Create admin/superuser account when prompted.
- Make sure to read everything that's in this description, in the script file itself and in the screen output when running the script file.

# Licensing
This is licensed under BSD License.

# Trademarks
Any and all trademarks, either directly or indirectly mentioned in this project, belong to their respective owners.

# Useful Resources
Another somewhat similar project, which is using Flask and has both json and html version: [pylogix-api](https://github.com/TheFern2/pylogix-api).
