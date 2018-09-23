# Automation of a website validation using Docker, RobotFramework and Selenium

This project is a practice about the automation of the validation of a website using Robotframework and Selenium as the validation tools and docker as devops tool.

There are three diferent ways to execute the test suite, please feel free to use the one you like more.

### Assumptions

It has been assumed that a user has been already sign up in the website to avoid
long test cases, even though, automation of the sign up of new users can be done.

## Execute test suite with Docker

First of all ensure docker is correctly installed and configured in your setup.
If you need help please check the oficial web for more information:
> https://www.docker.com/get-started

Note that for this scenario only docker will be need as it includes inside
the robotframework.

Once Docker is correctly installed, from a terminal in your setup please
move to the project folder:

> cd /path_where_this_located/

### Using docker run

Execute following command:

> docker pull ppodgorsek/robot-framework

For linux setup:

> docker run --shm-size=1g -v `pwd`/tests:/opt/robotframework/tests:Z -v `pwd`/reports:/opt/robotframework/reports:Z ppodgorsek/robot-framework:latest

For windows setup (using PowerShell):

>docker run --shm-size=1g -v ${PWD}/tests:/opt/robotframework/tests:Z -v ${PWD}/reports:/opt/robotframework/reports:Z ppodgorsek/robot-framework:latest

### Using docker compose

Execute following command:

> docker-compose up -e --shm-size=1g robotframework

It will download a robotframework docker image to run the test.
Once the download is finish, it will execute all the suite test cases.

If you want to run the suite again please execute:

> docker-compose run -e --shm-size=1g robotframework

## Execute test suite without Docker

Even this exercice has been oriented to be executed with docker, test cases
are available to be run without it.

It will be needed to have Python2.7 and Pip package installed in the setup.

> https://www.python.org/

> https://pypi.org/project/pip/

Packages can be installed from requirements file:
> pip install -U -r requirements.txt

### Execute Test cases from command line

Please first of all ensure roboframework is correctly installed in your setup.

Execute the next command to run the test suite:
> robot [OPTIONS] /path_to_project/tests/alpha_suite.robot

#### OPTIONS
Options allow the user to change the test variables that will be used, for example:

> robot --variable BROWSER:firefox ./tests/alpha_suite.robot

> robot --outputdir /my/custom/outputdir ./test/alpha_suite.robot

### Execute in Robotframework RIDE

First of all, install ride:

 > pip install -U robotframework-ride

Also ensure the setup has installed the following packages:

> pip install robotframework
> pip install robotframework-seleniumlibrary

Open Ride and Load ./tests/alpha_suite.robot

Select tests cases to execute and play run button
If you need more information about the IDE please check:
> https://github.com/robotframework/RIDE/wiki/Installation-Instructions

### WebDriver

Please ensure that the webdrivers for the browsers you want to use (i.e. chrome)
are located in the path of your setup to allow Selenium library to be able to find
it, otherwise testcases may not work.

#####Chromium
> https://sites.google.com/a/chromium.org/chromedriver/downloads
#####Firefox
> https://github.com/mozilla/geckodriver/releases


#### Author

Sergi Alonso Badia

sergi.alonsobadia@gmail.com
