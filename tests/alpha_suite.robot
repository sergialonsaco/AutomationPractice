*** Settings ***
Documentation     *Purpose*: automate the purchase process of a product using http://automationpractice.com, which is a site for practicing QA automation over an e-commerce page
Test Setup        Test Setup
Test Teardown     Test Teardown
Resource          variables.tsv
Resource          keywords.tsv

*** Test Cases ***
When the website is open and products are found Then it will be purchased
    [Documentation]    *Purpose*: Check that a full purchase process of diferent items can be performed in the automationpractice website.
    ...    The user sergi.alonso@alphatest.com is already registred for this TCs
    ...
    ...    *Acceptance Criteria*: elements shall be purchased.
    [Tags]    NOMINAL
    Sign in with ${USER} and ${PASSWD} in the website
    Add @{products} list in the cart
    Go to Check out section from purchase view
    Proceed to purchase the cart
    Check new order has been added

When user has not sign in Then it can sign in during the purchase process
    [Documentation]    *Purpose*: Check that purchase process can be performe if sign in is performed in the middle of the process
    ...
    ...    *Acceptance Criteria*: During the purchase sign in option shall appear, and purchase of products must be performed correctly.
    [Tags]    NOMINAL
    Add ${products} list in the cart
    Go to Check out section from purchase view
    Check cart is not empty and continue purchase
    Sign in and continue purchase process
    Check new order has been added

When the sign in options are wrong Then authentication message shall appear
    [Documentation]    *Purpose*: Check that website do not allow to sign in with a wrong user or password
    ...
    ...    *Acceptance Criteria*: Authentication failed should appear when the wrong user data is submitted in the viewport of the website.
    [Tags]    ABNORMAL
    Sign in with ${FAKE_USER} and ${PASSWD} in the website
    Check Authentication Failed message appears
    Close Browser
    Open Browser To automation practice Website
    Sign in with ${USER} and ${FAKE_PASSWD} in the website
    Check Authentication Failed message appears

When searched product do not exist Then website alert user
    [Documentation]    *Purpose*: Check that website shows correctly an alert when searched product do not exist
    ...
    ...    *Acceptance Criteria*: Alert with searching product do not exist shall appear in the viewport of the website
    [Tags]    ABNORMAL
    Search For Non Existing Product
    Check Search Failed message appears

When cart is empty Then purchase process can not be perform
    [Documentation]    *Purpose*: Check that website do not allow to proceed with the purchase process if the cart is empty
    ...
    ...    *Acceptance Criteria*: Alert showing that cart is empty shall appear in the viewport of the website. Also, purchase process can not be continued.
    [Tags]    ABNORMAL
    Sign in with ${USER} and ${PASSWD} in the website
    Click on Cart button
    Check Cart Empty alert appears

When terms of service checkbox is not selected Then purchase process can not be continued
    [Documentation]    *Purpose*: Check that terms of service checkbox shall be selected in order to be able to perform the purchase of the products in the cart
    ...
    ...
    ...    *Acceptance Criteria*: Prompt showing that the terms of service must be selected shall appear
    [Tags]    ABNORMAL
    Sign in with ${USER} and ${PASSWD} in the website
    Add @{products} list in the cart
    Go to Check out section from purchase view
    Process purchase without checking terms and conditions checkbox
    Check promt appears with alert message
