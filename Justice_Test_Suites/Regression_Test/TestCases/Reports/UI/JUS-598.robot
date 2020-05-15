*** Settings ***
Library   SeleniumLibrary
Resource  ../../../Resources/AllResources.robot

Documentation    Regression test for JUS-598: Add hostname and username to the end system Logi report.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${endsystem_ip}    192.168.18.106
${endsystem_mac}   00:60:94:01:03:04
${endsystem_host}  ndarrell-xp1
${endsystem_user}  Neva

*** Test Cases ***
Confirm Columns In End Systems Report Table
    Navigate to Network Summary Report
    sleep  2 seconds
    Confirm Network Summary Reports Page Title
    Show Reports Filter Panel
    Set Reports Filter Time Range  Custom
    Set Reports Filter Custom Start Date  2/26/2020
    Set Reports Filter Custom End Date    2/27/2020
    Apply Reports Filter
    sleep  3 seconds
    Click End Systems Drilldown
    sleep  2 seconds
    Confirm End Systems Report Table Contains Column  HOSTNAME
    Confirm End Systems Report Table Contains Column  USERNAME

Confirm Search Ability In End Systems Report Filter
    Show Reports Filter Panel
    Set Reports Filter Search Text  ${endsystem_user}
    Apply Reports Filter
    sleep  1 second
    Confirm End Systems Report Table Contains Value  ${endsystem_user}
    Set Reports Filter Search Text  ${endsystem_ip}
    Apply Reports Filter
    sleep  1 second
    Confirm End Systems Report Table Contains Value  ${endsystem_ip}
    Set Reports Filter Search Text  ${endsystem_mac}
    Apply Reports Filter
    sleep  1 second
    Confirm End Systems Report Table Contains Value  ${endsystem_mac}
    Set Reports Filter Search Text  ${endsystem_host}
    Apply Reports Filter
    sleep  1 second
    Confirm End Systems Report Table Contains Value  ${endsystem_host}
    Set Reports Filter Search Text  Invalid User
    Apply Reports Filter
    sleep  1 second
    Confirm End Systems Report Table Does Not Contain Value  ${endsystem_user}
    Confirm End Systems Report Table Does Not Contain Value  ${endsystem_ip}
    Confirm End Systems Report Table Does Not Contain Value  ${endsystem_mac}
    Confirm End Systems Report Table Does Not Contain Value  ${endsystem_host}
