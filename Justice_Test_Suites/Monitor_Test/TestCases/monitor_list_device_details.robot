*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Device Details page.

Suite Setup      Log In and Navigate to Devices Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${test_device}  10.54.142.10

*** Test Cases ***
Confirm Device Details Page Loads
    Search Field Enter Text  ${test_device}
    Click Device Details Arrow  ${test_device}
    Confirm Device Details Page Loaded  ${test_device}
    Confirm Device Details Dahboard Page Loaded
    Device Details Click Ports Link
    Confirm Device Details Ports Page Loaded
    Device Details Click Dashboard Link
    Confirm Device Details Dahboard Page Loaded
    Device Details Click Back Arrow
    Confirm Devices Page Loaded
