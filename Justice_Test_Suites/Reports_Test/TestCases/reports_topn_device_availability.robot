*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Reports Top N Top Device Availability page.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***

Confirm Page Loads
    Navigate to Top N Top Device Availability Report
    Confirm Top N Top Device Availability Reports Page Title
