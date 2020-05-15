*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for JUS-649: Ports: Local Search Not Working.

Suite Setup      Log In and Navigate to Ports View  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${test_device}  10.54.142.10
${test_port}    ge.1.2

*** Test Cases ***
Confirm Local Search For Port Works
    Confirm Device Details Ports Page Loaded
    Device Details Search Field Enter Text  ${test_port}
    Confirm Port In Table  ${test_port}
    Device Details Search Field Clear Text

*** Keywords ***
Log In and Navigate to Ports View
    [Arguments]  ${url}  ${browser}  ${user}  ${pwd}
    Open Browser and Log In  ${url}  ${browser}  ${user}  ${pwd}
    Click Monitor
    Click List Slider
    Click Devices Tab
    Confirm Devices Tab Selected
    Search Field Enter Text  ${test_device}
    Click Device Details Arrow  ${test_device}
    Confirm Device Details Page Loaded  ${test_device}
    Confirm Device Details Dashboard Page Loaded
    Device Details Click Ports Link
    Confirm Device Details Ports Page Loaded
