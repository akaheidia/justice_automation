*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

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
    Hide Reports Filter Panel
    Site Availability Drill Into Site  ${site_1}
    Hide Reports Filter Panel
    Site Availability Drill Into Site  ${site_2}
    Hide Reports Filter Panel
    Site Availability Drill Into Site  ${site_3}
    Hide Reports Filter Panel
    Site Availability Drill Into Site  ${site_4}
    sleep  1 second
    Hide Reports Filter Panel
    sleep  2 seconds
    Site Availability Drill Into Site  ${site_5}
    Hide Reports Filter Panel
    Confirm Breadcrumb Contains Text  ${site_1}
    Confirm Breadcrumb Contains Text  ${site_2}
    Confirm Breadcrumb Contains Text  ${site_3}
    Confirm Breadcrumb Contains Text  ${site_4}
    Confirm Breadcrumb Contains Text  ${site_5}
    Confirm Breadcrumb Does Not Contain Text  ${site_1}/${site_2}/${site_3}/${site_4}/${site_5}
