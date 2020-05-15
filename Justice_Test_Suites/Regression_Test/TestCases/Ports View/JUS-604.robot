*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for JUS-604: Ports: "Collecting" column does not reflect correct/current value.

Suite Setup      Log In and Navigate to Devices Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${test_device}  10.54.142.32

*** Test Cases ***
Confirm Port Table Does Not Contain Collecting Column
    Set Server Filter  ${XMC_HOSTNAME}
    Search Field Enter Text  ${test_device}
    sleep  2 seconds
    Click Device Details Arrow  ${test_device}
    Confirm Device Details Page Loaded  ${test_device}
    Confirm Device Details Dashboard Page Loaded
    Device Details Click Ports Link
    Confirm Device Details Ports Page Loaded
    Confirm Port Table Contains Column  NAME
    Confirm Port Table Does Not Contain Column  COLLECTING
