*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Port Utilization Metric Report page.

*** Keywords ***

Confirm Port Utilization Metric Report Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    Page Should Contain Element  ${reports_port_utilization_page_title}

    Unselect Frame
    Unselect Frame