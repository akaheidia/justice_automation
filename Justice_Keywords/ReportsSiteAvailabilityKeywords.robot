*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Site Availability Report page.

*** Keywords ***

Confirm Site Availability Report Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='availability']

    Page Should Contain Element  ${reports_site_availability_page_title}

    Unselect Frame
    Unselect Frame

Confirm Site Availability Report Contains Value
    [Arguments]  ${value}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='availability']

    Page Should Contain Element  xpath://span[contains(text(), '${value}')]

    Unselect Frame
    Unselect Frame


Site Availability Drill Into Site
    [Arguments]  ${site}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='availability']

    Click Element  xpath://span[contains(text(), '${site}')]/..

    Unselect Frame
    Unselect Frame
