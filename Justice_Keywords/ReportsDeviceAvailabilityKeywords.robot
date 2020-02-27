*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Device Availability Report page.

*** Keywords ***

Confirm Device Availability Reports Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    Page Should Contain Element  ${reports_device_availability_page_title}

    UnSelect Frame
    Unselect Frame

Confirm Device Availability Report Contains Value
    [Arguments]  ${value}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    Page Should Contain Element  xpath://span[contains(text(), '${value}')]

    UnSelect Frame
    Unselect Frame
