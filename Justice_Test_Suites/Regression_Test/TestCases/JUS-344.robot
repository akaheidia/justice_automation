*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-344: Usability: LOGI Application needs breadcrumbs.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${site_1}    Level 1 Site
${site_2}    Level 2 Site
${site_3}    Level 3 Site

*** Test Cases ***
Confirm Breadcrumb Functionality
    Navigate to Site Availability Report
    sleep  2 seconds
    Change Report Time Range to Last Hour
    sleep  2 seconds
    Site Availability Drill Into Site  ${site_1}
    Site Availability Drill Into Site  ${site_2}
    Site Availability Drill Into Site  ${site_3}
    Click Breadcrumb  ${site_1}
    sleep  2 seconds
    Site Availability Drill Into Site  ${site_2}
    Click Breadcrumb  Site Availability
    sleep  2 seconds
    Confirm Site Availability Reports Page Title
