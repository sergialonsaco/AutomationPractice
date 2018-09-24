# Automation of a website validation using Docker RobotFramework and Selenium

This project is a practice about the automation of the validation of a website using Robotframework and Selenium as the validation tools and docker as devops tool.

There are three diferent ways to execute the test suite, please feel free to use the one you like more.

## Download Project

Please download this project from github:
> https://github.com/sergialonsobadia/AutomationPractice

Once download is finish, from a terminal move to the project folder before continue.

### Assumptions

It has been assumed that a user has been already sign up in the website in order to focus in the purchase process, even though, automation of the sign up of new users can be done.


## Execute test suite with Docker

First of all ensure docker is correctly installed and configured in your setup.
If you need help please check the oficial web for more information:
> https://www.docker.com/get-started

Note that for this scenario only docker will be need as it includes inside
the robotframework.

Once Docker is correctly installed, from a terminal in your setup please
move to the project folder:

    cd /path_where_this_located/

### Using docker run

Execute following command:

    docker pull ppodgorsek/robot-framework

For **linux** setup:

    docker run --shm-size=1g -v `pwd`/tests:/opt/robotframework/tests:Z -v `pwd`/reports:/opt/robotframework/reports:Z ppodgorsek/robot-framework:latest

For **windows** setup (using PowerShell):

    docker run --shm-size=1g -v ${PWD}/tests:/opt/robotframework/tests:Z -v ${PWD}/reports:/opt/robotframework/reports:Z ppodgorsek/robot-framework:latest


## Execute test suite without Docker

Even this exercice has been oriented to be executed with docker, test cases
are available to be run without it.

It will be needed to have Python2.7 and Pip package installed in the setup.

> https://www.python.org/

> https://pypi.org/project/pip/

Packages can be installed from requirements file:

    pip install -U -r requirements.txt

### Execute Test cases with command line

Please first of all ensure roboframework is correctly installed in your setup.

Execute the next command to run the test suite:


    robot [OPTIONS] /path_to_project/tests/alpha_suite.robot

#### OPTIONS
Options allow the user to change the test variables that will be used, for example:

-   robot --variable BROWSER:firefox ./tests/alpha_suite.robot

-    robot --outputdir /my/custom/outputdir ./test/alpha_suite.robot


### Execute in Robotframework RIDE

First of all, check that ride and all the packages from **requirements.txt** file has been installed:

    pip freeze


Open Ride and Load ./tests/alpha_suite.robot

Select tests cases to execute and play run button
If you need more information about the IDE please check:
> https://github.com/robotframework/RIDE/wiki/Installation-Instructions

### Execute Test Cases with Jenkins

Using the provide **JenkinsFile**:

> Create a new job in your jenkins environment and configureit with the JenkinsFile


## WebDriver

Please ensure that the webdrivers for the browsers you want to use (i.e. chrome)
are located in the path of your setup to allow Selenium library to be able to find
it, otherwise testcases may not work.

#### Chromium

> https://sites.google.com/a/chromium.org/chromedriver/downloads

#### Firefox
> https://github.com/mozilla/geckodriver/releases


## Test Data variables

Even robotframework allows to change inline all the variables used in the TCs,
the following resource *./tests/variables.tsv* will help also to modify the test data.

| NAME | VALUE | DESCRIPTION
|----|----|----|
|${USER} |  sergi.alonso@alphatest.com   | user name to sign in
${PASSWD}   |  sergialphatest    | password to sign in
${FAKE_USER}   |   fake@fake.com    | wrong user to sign in
${FAKE_PASSWD} |  ThisIsAWrongPwd    | wrong passwrod to sign in
${BROWSER} | chrome  | name of browser to use
@{products} | [Blouse, Shirt , Top, Hat, Not Existing] Product]    | list of product to be added in the cart. If a product is not found, it will be discarted


## Troubleshooting

### Using docker compose


-  There is a know error with the image (ppodgorsek/robot-framework) that crash the test cases due to size of logs. Please if this problem occurs use docker run command instead of docker compose commands.


Execute following command:

    docker-compose up -e --shm-size=1g robotframework

It will download a robotframework docker image to run the test.
Once the download is finish, it will execute all the suite test cases.

If you want to run the suite again please execute:

    docker-compose run -e --shm-size=1g robotframework
