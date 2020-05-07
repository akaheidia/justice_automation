*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-590: Device Details: Cannot select Ports when it is located too close to bottom of browser.

Suite Setup      Log In and Navigate to Devices Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${test_device}  10.54.142.32

*** Test Cases ***
Confirm Port View Is Accessible When Window Small
    Set Server Filter  ${XMC_HOSTNAME}
    Search Field Enter Text  ${test_device}
    sleep  2 seconds
    Click Device Details Arrow  ${test_device}
    Confirm Device Details Page Loaded  ${test_device}
    Confirm Device Details Dashboard Page Loaded
    ${size}=  Get Window Size
    Log  Current Window Size: ${size}
    Set Window Size  1600  600
    sleep  1 second
    Device Details Click Ports Link
    Confirm Device Details Ports Page Loaded
