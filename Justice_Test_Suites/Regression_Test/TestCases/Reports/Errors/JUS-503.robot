*** Settings ***
Library   SeleniumLibrary
Resource  ../../../Resources/AllResources.robot

Documentation    Regression test for JUS-503: Reports - Breadcrumbs: Navigating to level 5 site causes error: 414 Request - URI Too Large.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${site_1}    Level 1 Site
${site_2}    Level 2 Site
${site_3}    Level 3 Site
${site_4}    Level 4 Site
${site_5}    Level 5 Site

*** Test Cases ***
Confirm Multi-Level Site Drilldowns Function
    Navigate to Site Availability Report
    sleep  2 seconds
    Change Report Time Range to Last Hour
    sleep  2 seconds
    Site Availability Drill Into Site  ${site_1}
    Site Availability Drill Into Site  ${site_2}
    Site Availability Drill Into Site  ${site_3}
    Site Availability Drill Into Site  ${site_4}
    Site Availability Drill Into Site  ${site_5}
    Confirm Page Does Not Contain Text  414 Request-URI Too Large
