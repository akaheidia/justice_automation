*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Search field on the Monitor page (using the List> Devices view).

Suite Setup      Log In and Navigate to Devices Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${device_ip}  10.54.142.10

*** Test Cases ***
Search Field Show and Hide Functionality
    Show Search Field
    Confirm Search Field Visible
    Hide Search Field
    Confirm Search Field Not Visible

Search Field Search Functionality
    Show Search Field
    Search Field Enter Text  ${device_ip}
    Confirm Device In Table  ${device_ip}
    Search Field Clear Text
    Hide Search Field
