*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Network Summary Report page.

*** Keywords ***

Click Device Availability Drilldown
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='device_availability']

    Page Should Contain Element  ${reports_device_availability_drilldown}
    Click Element  ${reports_device_availability_drilldown}

    Unselect Frame
    Unselect Frame
