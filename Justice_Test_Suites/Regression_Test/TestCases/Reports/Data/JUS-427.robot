*** Settings ***
Library   SeleniumLibrary
Resource  ../../../Resources/AllResources.robot

Documentation    Regression test for JUS-427: Reports: Metric missing from title and column label when drilling into metric from Port Overview page.
...              This test assumes the devices have already been created which are collecting/reporting port statistics.

Suite Setup      Confirm Prerequisites

Test Setup       Log In and Navigate to Port Overview Report Page
Test Teardown    Log Out and Close Browser

*** Variables ***
${site}        Port Test Site
${device_ip}   10.54.142.32
${port}        ge.1.8

*** Test Cases ***
Confirm Rx Bandwidth Metric Report Labels
    Port Overview Drill Into Metric  Rx Bandwidth
    Confirm Rx Bandwidth Metric Report Page Title
    Confirm Metric Report Table Column Header Contains Value  AVERAGE RX BANDWIDTH
    Confirm Metric Report Table Column Header Contains Value  MINIMUM RX BANDWIDTH
    Confirm Metric Report Table Column Header Contains Value  MAXIMUM RX BANDWIDTH

Confirm Total Bandwidth Metric Report Labels
    Port Overview Drill Into Metric  Total Bandwidth
    Confirm Total Bandwidth Metric Report Page Title
    Confirm Metric Report Table Column Header Contains Value  AVERAGE TOTAL BANDWIDTH
    Confirm Metric Report Table Column Header Contains Value  MINIMUM TOTAL BANDWIDTH
    Confirm Metric Report Table Column Header Contains Value  MAXIMUM TOTAL BANDWIDTH

Confirm Tx Bandwidth Metric Report Labels
    Port Overview Drill Into Metric  Tx Bandwidth
    Confirm Tx Bandwidth Metric Report Page Title
    Confirm Metric Report Table Column Header Contains Value  AVERAGE TX BANDWIDTH
    Confirm Metric Report Table Column Header Contains Value  MINIMUM TX BANDWIDTH
    Confirm Metric Report Table Column Header Contains Value  MAXIMUM TX BANDWIDTH

Confirm Port Utilization Metric Report Labels
    Port Overview Drill Into Metric  Port Utilization
    Confirm Port Utilization Metric Report Page Title
    Confirm Metric Report Table Column Header Contains Value  AVERAGE PORT UTILIZATION
    Confirm Metric Report Table Column Header Contains Value  MINIMUM PORT UTILIZATION
    Confirm Metric Report Table Column Header Contains Value  MAXIMUM PORT UTILIZATION

*** Keywords ***
Confirm Prerequisites
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    ${device_present}=  Is Test Device Present  ${device_ip}
    Run Keyword If  ${device_present} == False  Fail  Test Device Is Not Present
    Log Out and Close Browser

Log In and Navigate to Port Overview Report Page
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Navigate to Site Port Utilization Report
    Confirm Site Port Utilization Report Page Title
    sleep  2 seconds
    Change Report Time Range to Last Hour
    sleep  2 seconds
    Site Port Utilization Drill Into Site  ${site}
    sleep  1 second
    Site Port Utilization Drill Into Port  ${port}
    Confirm Port Overview Report Page Title
