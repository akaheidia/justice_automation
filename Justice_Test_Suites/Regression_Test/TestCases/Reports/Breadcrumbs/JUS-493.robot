*** Settings ***
Library   SeleniumLibrary
Resource  ../../../Resources/AllResources.robot

Documentation    Regression test for JUS-493: Update Logi reports to support breadcrumb.
...              This test assumes the devices have already been created which are collecting/reporting port statistics.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${device_ip}    10.54.142.32
${site}         Port Test Site

*** Test Cases ***
Confirm Breadrumbs Contain Correct Information
    Navigate to Reports
    Confirm Breadcrumb Contains Text  Home
    Navigate to Site Availability Report
    Confirm Site Availability Reports Page Title
    Confirm Breadcrumb Contains Text  Site Availability
    sleep  2 seconds
    Change Report Time Range to Last Hour
    sleep  2 seconds
    Site Availability Drill Into Site  ${site}
    Confirm Device Availability Report Page Title
    Confirm Breadcrumb Contains Text  ${site}
    Device Availability Drill Into Device  ${device_ip}
    Confirm Device Overview Report Page Title
    Confirm Breadcrumb Contains Text  Device Overview ${device_ip}
    Device Overview Drill Into Metric  Rx Bandwidth
    Confirm Rx Bandwidth Metric Report Page Title
    Confirm Breadcrumb Contains Text  Rx Bandwidth ${device_ip}

Confirm Clicking Breadcrumb Goes To Correct Page
    Click Breadcrumb  Rx Bandwidth ${device_ip}
    Confirm Rx Bandwidth Metric Report Page Title
    Click Breadcrumb  Device Overview ${device_ip}
    Confirm Device Overview Report Page Title
    Click Breadcrumb  ${site}
    Confirm Device Availability Report Page Title
    Click Breadcrumb  Site Availability
    Confirm Site Availability Reports Page Title
    Click Breadcrumb  Home
    Confirm Reports Page Loaded
    Confirm Network Scorecard Reports Page Title
