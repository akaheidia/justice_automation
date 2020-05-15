*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for JUS-516: UI - add ports to the ui under a given device.

Suite Setup      Log In and Navigate to Devices Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${test_device}  10.54.142.32
${test_port}    ge.1.8

*** Test Cases ***
Confirm Port View For Device Is Present
    Set Server Filter  ${XMC_HOSTNAME}
    Search Field Enter Text  ${test_device}
    sleep  2 seconds
    Click Device Details Arrow  ${test_device}
    Confirm Device Details Page Loaded  ${test_device}
    Confirm Device Details Dashboard Page Loaded
    Device Details Click Ports Link
    Confirm Device Details Ports Page Loaded
    Device Details Search Field Enter Text  ${test_port}
    sleep  2 seconds
    Confirm Port In Table  ${test_port}
    Select Port In Table  ${test_port}
