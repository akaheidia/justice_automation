*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-400: Reports: Drilling down into child sites isn't functioning correctly.
...              This test assumes there is a multi-hierarchy of sites with a device in the deepest site level.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${site_1}    Level 1 Site
${site_2}    Level 2 Site
${site_3}    Level 3 Site
${site_4}    Level 4 Site
${site_5}    Level 5 Site
${device}    10.54.142.55

*** Test Cases ***
Confirm Multi-Level Site Drilldowns Function
    Log To Console  TO DO
    Navigate to Site Availability Report
    Site Availability Drill Into Site  ${site_1}
    Site Availability Drill Into Site  ${site_2}
    Site Availability Drill Into Site  ${site_3}
    Site Availability Drill Into Site  ${site_4}
    Site Availability Drill Into Site  ${site_5}
    Confirm Device Availability Report Contains Value  ${device}
