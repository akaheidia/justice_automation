*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-405: Reports: Inconsistency in Site column information.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser


*** Test Cases ***
Confirm Site Availability Site Column Contains Server Information
    Navigate to Site Availability Report
    Confirm Site Availability Report Table Header Contains Value  SERVER:SITE
    Confirm Site Availability Report Table Contains Value  ${XMC_HOSTNAME}
