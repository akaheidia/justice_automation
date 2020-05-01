*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-414: Reports: Top N Site Availability and Site Availability drilldown results in empty page.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${site_name}    ${site_device_down}

*** Test Cases ***
Confirm Site Availability Drilldown Contains Data
    Navigate to Network Summary Report
    Confirm Network Summary Reports Page Title
    Show Reports Filter Panel
    Set Reports Filter Time Range  Last Hour
    Apply Reports Filter
    Click Site Availability Drilldown
    sleep  2 seconds
    Confirm Top N Top Site Availability Reports Page Title
    Confirm Top N Top Site Availability Reports Page Contains Value  ${site_name}

Confirm Top N Top Site Availability Report Contains Data
    Navigate to Top N Top Site Availability Report
    Confirm Top N Top Site Availability Reports Page Title
    Show Reports Filter Panel
    Set Reports Filter Time Range  Last Hour
    Apply Reports Filter
    Confirm Top N Top Site Availability Reports Page Contains Value  ${site_name}

Confirm Site Availability Report Contains Data
    Navigate to Site Availability Report
    Confirm Site Availability Reports Page Title
    Show Reports Filter Panel
    Set Reports Filter Time Range  Last Hour
    Apply Reports Filter
    Confirm Site Availability Report Table Contains Value  ${site_name}
