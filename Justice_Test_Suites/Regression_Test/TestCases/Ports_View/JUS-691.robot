*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for JUS-691: Remove Add Port/Ports to Tag button in Port View.

Suite Setup      Log In and Navigate to Devices Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${test_device}  10.54.142.10

*** Test Cases ***
Confirm Assign Port To Tag Functionality Is Not Available
    Search Field Enter Text  ${test_device}
    Click Device Details Arrow  ${test_device}
    Confirm Device Details Page Loaded  ${test_device}
    Confirm Device Details Dashboard Page Loaded
    Device Details Click Ports Link
    Confirm Device Details Ports Page Loaded
    Confirm Device Details Ports Page Does Not Support Assigning Tags
