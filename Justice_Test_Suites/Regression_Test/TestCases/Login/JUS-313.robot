*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for JUS-313: Cannot log in to Justice UI on Firefox.

Test Teardown    Log Out and Close Browser
Test Template    Confirm Browser Login Successful

*** Test Cases ***              BROWSER
Log In With Firefox             Firefox
Log In With Chrome              Chrome

*** Keywords ***
Confirm Browser Login Successful
    [Arguments]  ${browser}
    Open and Maximize Browser  ${JUS_URL}  ${browser}
    Log In  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Confirm Successful Login
