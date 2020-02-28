*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-406: Reports: port utilization statistics display metric name instead of human-readable name.
...              This test assumes the devices have already been created which are collecting/reporting port statistics.

Suite Setup      Confirm Prerequisites

Test Setup       Log In and Navigate to Device Overview Report Page
Test Teardown    Log Out and Close Browser

*** Variables ***
${device_ip}    10.54.142.32
${site}         Port Test Site

*** Test Cases ***
Confirm Rx Bandwidth Metric Report Labels
    Device Overview Drill Into Metric  Rx Bandwidth
    Confirm Rx Bandwidth Metric Report Page Title
    Confirm Metric Report Table Column Header Contains Value  AVERAGE RX BANDWIDTH
    Confirm Metric Report Table Column Header Contains Value  MINIMUM RX BANDWIDTH
    Confirm Metric Report Table Column Header Contains Value  MAXIMUM RX BANDWIDTH

Confirm Total Bandwidth Metric Report Labels
    Device Overview Drill Into Metric  Total Bandwidth
    Confirm Total Bandwidth Metric Report Page Title
    Confirm Metric Report Table Column Header Contains Value  AVERAGE TOTAL BANDWIDTH
    Confirm Metric Report Table Column Header Contains Value  MINIMUM TOTAL BANDWIDTH
    Confirm Metric Report Table Column Header Contains Value  MAXIMUM TOTAL BANDWIDTH

Confirm Tx Bandwidth Metric Report Labels
    Device Overview Drill Into Metric  Tx Bandwidth
    Confirm Tx Bandwidth Metric Report Page Title
    Confirm Metric Report Table Column Header Contains Value  AVERAGE TX BANDWIDTH
    Confirm Metric Report Table Column Header Contains Value  MINIMUM TX BANDWIDTH
    Confirm Metric Report Table Column Header Contains Value  MAXIMUM TX BANDWIDTH

Confirm Port Utilization Metric Report Labels
    Device Overview Drill Into Metric  Port Utilization
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

Log In and Navigate to Device Overview Report Page
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Navigate to Site Port Utilization Report
    Confirm Port Utilization Report Page Title
    Port Utilization Drill Into Site  ${site}
    Port Utilization Drill Into Device  ${device_ip}
    Confirm Device Overview Report Page Title
