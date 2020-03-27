*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Reports Analytics Summary page.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***

Confirm Page Loads
    Navigate to Analytics Summary Report
    Confirm Analytics Summary Reports Page Title

Confirm Analytics Summary KPI Panels
    Confirm Analytics Summary Report Page Contains KPI Panel    Average Clients
    Confirm Analytics Summary Report Page Contains KPI Panel    Total Volume
    Confirm Analytics Summary Report Page Contains KPI Panel    Total Upload
    Confirm Analytics Summary Report Page Contains KPI Panel    Total Download
    Confirm Analytics Summary Report Page Contains KPI Panel    Application Response
    Confirm Analytics Summary Report Page Contains KPI Panel    Network Response

Confirm Analytics Summary Top N Panels
    Confirm Analytics Summary Report Page Contains Top N Panel  Top Applications by Clients
    Confirm Analytics Summary Report Page Contains Top N Panel  Top Applications by Volume
    Confirm Analytics Summary Report Page Contains Top N Panel  Slowest Responding Applications
    Confirm Analytics Summary Report Page Contains Top N Panel  Top Application Groups by Volume
    Confirm Analytics Summary Report Page Contains Top N Panel  Slowest Responding Network Services
    Confirm Analytics Summary Report Page Contains Top N Panel  Top Tracked Applications by Clients
    Confirm Analytics Summary Report Page Contains Top N Panel  Top Sites by Clients
    Confirm Analytics Summary Report Page Contains Top N Panel  Top Sites by Volume

Confirm Analytics Summary Network Panels
    Confirm Analytics Summary Report Page Contains Network Panel  Concurrent Clients
    Confirm Analytics Summary Report Page Contains Network Panel  Bandwidth
