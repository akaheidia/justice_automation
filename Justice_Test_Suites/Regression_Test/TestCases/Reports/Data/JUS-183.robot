*** Settings ***
Library   SeleniumLibrary
Resource  ../../../Resources/AllResources.robot

Documentation    Regression test for JUS-183: Populate the device family column in the cacheddevice table.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Top Device Availability Has Device Family Data
    Navigate to Top N Top Device Availability Report
    Confirm Top N Top Device Availability Reports Page Title
    Confirm Top N Device Availability Report Contains Value  B-Series
