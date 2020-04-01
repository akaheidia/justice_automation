*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-341: UI: Reports - Menu vs Page Title Inconsistencies.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser


*** Test Cases ***
Confirm Network Scorecard Menu and Title
    Navigate to Network Scorecard Report
    Confirm Network Scorecard Reports Page Title
    Confirm Breadcrumb Contains Text  Home

Confirm Site Availability Menu and Title
    Navigate to Site Availability Report
    Confirm Site Availability Reports Page Title
    Confirm Breadcrumb Contains Text  Site Availability

Confirm Top APs By Clients Menu and Title
    Navigate to Top N Top APs By Clients Report
    Confirm Top N Top APs by Clients Reports Page Title
    Confirm Breadcrumb Contains Text  Top APs by Clients

Confirm Top APs By Bandwidth Menu and Title
    Navigate to Top N Top APs By Bandwidth Report
    Confirm Top N Top APs by Bandwidth Reports Page Title
    Confirm Breadcrumb Contains Text  Top APs by Bandwidth

Confirm Top Applications By Clients Menu and Title
    Navigate to Analytics Top Applications By Clients Report
    Confirm Analytics Top Applications by Clients Reports Page Title
    Confirm Breadcrumb Contains Text  Top Applications by Clients

Confirm Daily Analytics Usage Menu and Title
    Navigate to Analytics Daily Analytics Usage Report
    Confirm Analytics Daily Analytics Usage Reports Page Title
    Confirm Breadcrumb Contains Text  Daily Analytics Usage

Confirm Monthly Analytics Usage Menu and Title
    Navigate to Analytics Monthly Analytics Usage Report
    Confirm Analytics Monthly Analytics Usage Reports Page Title
    Confirm Breadcrumb Contains Text  Monthly Analytics Usage

Confirm Quarterly Analytics Summary Menu and Title
    Navigate to Analytics Quarterly Analytics Summary Report
    Confirm Analytics Quarterly Analytics Summary Reports Page Title
    Confirm Breadcrumb Contains Text  Quarterly Analytics Summary
