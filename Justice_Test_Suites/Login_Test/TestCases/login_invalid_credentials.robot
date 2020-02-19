*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation   This test suite verifies an invalid login scenario using invalid credentials.
...             NOTE: the valid credentials are defined in TestEnvironmentVariables.robot.

Suite Setup     Open and Maximize Browser  ${JUS_URL}  ${BROWSER}
Suite Teardown  Close Browser
Test Template   Login With Invalid Credentials Should Fail

*** Test Cases ***              USER NAME        PASSWORD
Invalid User Name               BAD_USER         ${JUS_PASSWORD}
Invalid Password                ${JUS_USERNAME}  BAD_PASSWORD
Invalid User Name and Password  BAD_USER         BAD_PASSWORD

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]  ${user}  ${pwd}
    Enter User Name  ${user}
    Enter Password   ${pwd}
    Click Login
    Confirm Unauthorized Login
    Close Message Box
