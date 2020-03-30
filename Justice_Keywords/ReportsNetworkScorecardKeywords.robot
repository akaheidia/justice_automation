*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Network Scorecard Report page.

*** Keywords ***

Wait For Network Scorecard Report Page To Load
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='device_availability']

    Wait Until Page Contains Element  ${reports_device_availability_drilldown}  timeout=10 seconds

    Unselect Frame
    Unselect Frame


Click Network Scorecard Site Availability Drilldown
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='availability']

    Page Should Contain Element  ${reports_site_availability_drilldown}
    Click Element  ${reports_site_availability_drilldown}

    Unselect Frame
    Unselect Frame

Click Network Scorecard Site CPU Utilization Drilldown
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='availability']

    Page Should Contain Element  ${reports_site_cpu_util_drilldown}
    Click Element  ${reports_site_cpu_util_drilldown}

    Unselect Frame
    Unselect Frame


Click Network Scorecard Site Availability Donut
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='availability']

    Page Should Contain Element  ${reports_site_availability_donut}
    Click Element  ${reports_site_availability_donut}

    Unselect Frame
    Unselect Frame
