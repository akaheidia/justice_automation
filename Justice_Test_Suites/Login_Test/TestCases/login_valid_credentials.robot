*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation   This test suite verifies a valid login scenario on both Chrome and Firefox.
...             NOTE: the valid credentials are defined in TestEnvironmentVariables.robot.

Test Teardown  Close Browser
Test Template  Login With Valid Credentials Should Succeed

*** Test Cases ***              BROWSER
Login On Chrome                 chrome
Login on Firefox                firefox

*** Keywords ***
Login With Valid Credentials Should Succeed
    [Arguments]  ${browser}
    Open and Maximize Browser  ${JUS_URL}  ${browser}
    Log In  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Confirm Successful Login
    Log Out
    Confirm Successful Logout
