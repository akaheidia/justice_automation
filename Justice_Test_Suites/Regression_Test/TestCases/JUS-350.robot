*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-350: Add New Report: shows ID for user name, clicking ID goes to "Unable to authenticate" error page.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Logout Link Removed From Add New Report Page
    Navigate to Reports
    Click Reports Add Button
    Click Add New Report
    Confirm Page Does Not Contain Text  Logout

Confirm Logout Link Removed From Add New Visual Page
    Click Go To Reports Button
    Click Reports Add Button
    Click Add New Visual
    Confirm Page Does Not Contain Text  Logout
