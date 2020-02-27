*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-343: Back button does not work in LOGI.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser


*** Test Cases ***
Confirm Back Button Works
    Click Reports
    Open Sidebar Menu
    Expand Reports Tree Reports Node
    Click Network Summary Reports Menu
    Confirm Network Summary Reports Page Title
    Click Device Availability Drilldown
    Confirm Device Availability Report Page Title
    Go Back
    Confirm Network Summary Reports Page Title
