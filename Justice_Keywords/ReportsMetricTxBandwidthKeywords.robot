*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Tx Bandwidth Metric Report page.

*** Keywords ***

Confirm Tx Bandwidth Metric Report Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    sleep  1 second
    Wait Until Page Contains Element  ${reports_tx_bandwidth_page_title}

    Unselect Frame
    Unselect Frame
