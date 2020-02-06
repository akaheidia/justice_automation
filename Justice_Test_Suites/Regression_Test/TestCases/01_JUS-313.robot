*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-313:  Cannot log in to Justice UI on Firefox.

Test Teardown    Log Out and Close Browser
Test Template    Confirm Browser Login Successful

*** Test Cases ***              BROWSER
Log In With Firefox             Firefox
Log In With Chrome              Chrome

*** Keywords ***
Confirm Browser Login Successful
    [Arguments]  ${browser}
    Open and Maximize Browser  ${URL}  ${browser}
    Log In  ${USERNAME}  ${PASSWORD}
    Confirm Successful Login
