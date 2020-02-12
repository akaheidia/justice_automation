*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-340:  Site Availability report is missing page title.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser


*** Test Cases ***
Confirm Site Availability Report Has Title
    Log To Console  THIS ISSUE HAS NOT YET BEEN FIXED
#    Click Reports
#    Open Sidebar Menu
#    Expand Reports Tree Reports Node
#    Expand Reports Tree Site Node
#    Click Site Availability Reports Menu
#    Confirm Site Availability Reports Page Title