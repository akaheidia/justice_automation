*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation   This test suite verifies the login button remains disabled with missing credentials.
...             NOTE: the valid credentials are defined in TestEnvironmentVariables.robot.

Suite Setup     Open and Maximize Browser  ${URL}  ${BROWSER}
Suite Teardown  Close Browser
Test Setup      Clear Credentials
Test Template   Login Should Be Disabled When Missing Credentials

*** Test Cases ***              USER NAME       PASSWORD
Missing User Name               ${EMPTY}        ${PASSWORD}
Missing Password                ${USERNAME}     ${EMPTY}
Missing User Name and Password  ${EMPTY}        ${EMPTY}

*** Keywords ***
Login Should Be Disabled When Missing Credentials
    [Arguments]  ${user}  ${pwd}
    Enter User Name  ${user}
    Enter Password   ${pwd}
    Verify Missing Credentials

