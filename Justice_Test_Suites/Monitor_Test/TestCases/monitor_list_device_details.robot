*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Device Details page.

Suite Setup      Log In and Navigate to Devices Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${test_device}  10.54.142.10
${test_port}    ge.1.2

*** Test Cases ***
Confirm Device Details Page Loads
    Search Field Enter Text  ${test_device}
    Click Device Details Arrow  ${test_device}
    Confirm Device Details Page Loaded  ${test_device}
    Confirm Device Details Dahboard Page Loaded

Confirm Ports Page Loads
    Device Details Click Ports Link
    Confirm Device Details Ports Page Loaded

Confirm Dashboard Page Loads
    Device Details Click Dashboard Link
    Confirm Device Details Dahboard Page Loaded

Confirm Back Arrow Works
    Device Details Click Back Arrow
    Confirm Devices Page Loaded

Confirm Port Selection Works
    Search Field Enter Text  ${test_device}
    Click Device Details Arrow  ${test_device}
    Device Details Click Ports Link
    Confirm Device Details Ports Page Loaded
    Confirm Port In Table  ${test_port}
    Select Port In Table  ${test_port}
    sleep  1 second
    Deselect Port In Table  ${test_port}

Confirm Port List Sorting Works
    Confirm Device Details Ports Page Loaded
