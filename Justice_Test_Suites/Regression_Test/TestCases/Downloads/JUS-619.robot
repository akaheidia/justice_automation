*** Settings ***
Library   SeleniumLibrary
Library   OperatingSystem
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for JUS-619: CSV Download for End-Systems has Undefined for Username column.

Suite Setup      Log In and Navigate to End-Systems Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm CSV Download Has Valid User Name Data
    Download CSV All Rows
    Wait Until Download Completes
    Confirm File Contents  ${csv_endsystems_all}
    Remove File  ${DOWNLOADS_DIR}  ${csv_endsystems_all}
    sleep  1 second

*** Keywords ***
Confirm File Contents
    [Arguments]  ${filename}
    Wait Until Created  ${DOWNLOADS_DIR}/${filename}
    OperatingSystem.File Should Exist  ${DOWNLOADS_DIR}/${filename}
    ${file_contents}=  OperatingSystem.Get File  ${DOWNLOADS_DIR}/${filename}
    Should Not Contain  ${file_contents}  undefined
    Should Contain  ${file_contents}  Joseph Goldsberry
