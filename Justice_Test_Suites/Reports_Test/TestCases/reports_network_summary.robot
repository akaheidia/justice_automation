*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Reports Network Summary page.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

Test Setup       Navigate to Network Summary Report

*** Test Cases ***
Confirm Page Loads
    Confirm Network Summary Reports Page Title

Confirm Device Availability Drilldown
    Click Device Availability Drilldown
    Confirm Top N Top Device Availability Reports Page Title

Confirm Site Availability Drilldown
    Click Site Availability Drilldown
    Confirm Top N Top Site Availability Reports Page Title

Confirm Top APs by Clients Drilldown
    Click Top APs by Clients Drilldown
    Confirm Top N Top APs by Clients Reports Page Title

Confirm Top APs by Bandwidth Drilldown
    Click Top APs by Bandwidth Drilldown
    Confirm Top N Top APs by Bandwidth Reports Page Title

Confirm Port Utilization Drilldown
    Click Port Utilization Drilldown
    Confirm Top N Top Port Utilization Reports Page Title

Confirm Port Error Drilldown
    Click Port Error Drilldown
    Confirm Top N Top Port Error Reports Page Title

Confirm CPU Utilization Drilldown
    Click CPU Utilization Drilldown
    Confirm Top N Top CPU Utilization Reports Page Title

Confirm Memory Utilization Drilldown
    Click Memory Utilization Drilldown
    Confirm Top N Top Memory Utilization Reports Page Title
