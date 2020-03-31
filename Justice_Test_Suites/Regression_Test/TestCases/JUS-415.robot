*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-415: Reports: Drilling into a site with child sites keeps site filter applied when accessing other main Site reports.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${site_1}    Level 1 Site

*** Test Cases ***
Confirm Correct Context
    Navigate to Site Availability Report
    Confirm Site Availability Reports Page Title
    Confirm Site Availability Reports Page Context Title  World
    sleep  2 seconds
    Change Report Time Range to Last Hour
    sleep  2 seconds
    Site Availability Drill Into Site  ${site_1}
    Confirm Site Availability Reports Page Title
    Confirm Site Availability Reports Page Context Title  ${site 1}
    Navigate to Site Availability Report
    Confirm Site Availability Reports Page Title
    Confirm Site Availability Reports Page Context Title  World
