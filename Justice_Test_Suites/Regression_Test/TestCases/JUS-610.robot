*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-610: Sync up with the new XMC port data.

Suite Setup      Log In and Navigate to Devices Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${test_device}  10.54.142.32

*** Test Cases ***
Confirm Port Table Columns
    Set Server Filter  ${XMC_HOSTNAME}
    Search Field Enter Text  ${test_device}
    sleep  2 seconds
    Click Device Details Arrow  ${test_device}
    Confirm Device Details Page Loaded  ${test_device}
    Confirm Device Details Dashboard Page Loaded
    Device Details Click Ports Link
    Confirm Device Details Ports Page Loaded
    Confirm Port Table Contains Column  STATUS
    Confirm Port Table Contains Column  NAME
    Confirm Port Table Contains Column  ALIAS
    Confirm Port Table Contains Column  TEMPLATE
    Confirm Port Table Contains Column  SPEED
    Confirm Port Table Contains Column  NEIGHBOR
    Confirm Port Table Contains Column  DESCRIPTION
    Confirm Port Table Does Not Contain Column  POLICY ROLE
    Confirm Port Table Does Not Contain Column  PVID
    Confirm Port Table Does Not Contain Column  COLLECTING
