*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Rx Bandwidth Metric Report page.

*** Keywords ***

Confirm Rx Bandwidth Metric Report Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    Page Should Contain Element  ${reports_rx_bandwidth_page_title}

    Unselect Frame
    Unselect Frame
