*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation   This test suite verifies a valid login scenario.
...             NOTE: the valid credentials are defined in TestEnvironmentVariables.robot.

Suite Setup     Open and Maximize Browser  ${URL}  ${BROWSER}
Suite Teardown  Close Browser

*** Test Cases ***
Valid Login and Logout
    Log In  ${USERNAME}  ${PASSWORD}
    Verify Successful Login
    Log Out
    Verify Successful Logout
