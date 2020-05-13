*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-555: Top Sites Charts in Analytics summary should be displayed differently.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Analytics Summary Top Sites Labels Display Optimally
    Navigate to Analytics Summary Report
    Confirm Analytics Summary Reports Page Title
    Show Reports Filter Panel
    Confirm Reports Filter Panel Visible
    Set Reports Filter Time Range  Last 3 Days
    Apply Reports Filter
    Hide Reports Filter Panel
    sleep  2 seconds
    Confirm Top Sites by Clients Site Label  ${site_child_2}
    Confirm Top Sites by Volume Site Label  ${site_child_2}

Confirm Network Summary Site Availability Labels Display Optimally
    Navigate to Network Summary Report
    Confirm Network Summary Reports Page Title
    Show Reports Filter Panel
    Confirm Reports Filter Panel Visible
    Set Reports Filter Time Range  Last 3 Days
    Apply Reports Filter
    Hide Reports Filter Panel
    sleep  2 seconds
    Confirm Site Availability Panel Has Data
    Confirm Site Availability Site Label  ${site_device_down}
    Confirm Site Availability Site Label  justice-XMC-201.extr...
