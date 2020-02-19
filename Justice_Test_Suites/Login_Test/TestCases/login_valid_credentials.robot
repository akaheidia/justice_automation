*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation   This test suite verifies a valid login scenario.
...             NOTE: the valid credentials are defined in TestEnvironmentVariables.robot.

Suite Setup     Open and Maximize Browser  ${JUS_URL}  ${BROWSER}
Suite Teardown  Close Browser

*** Test Cases ***
Valid Login and Logout
    Log In  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Confirm Successful Login
    Log Out
    Confirm Successful Logout
