*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Device Overview Report page.

*** Keywords ***
Confirm End Systems Report Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    sleep  1 second
    Wait Until Page Contains Element  ${reports_endsystems_page_title}

    Unselect Frame
    Unselect Frame

Confirm End Systems Report Table Contains Value
    [Arguments]  ${value}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    sleep  1 second
    Page Should Contain Element  xpath://td//span[contains(text(), '${value}')]

    Unselect Frame
    Unselect Frame

Confirm End Systems Report Table Does Not Contain Value
    [Arguments]  ${value}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  xpath://td//span[contains(text(), '${value}')]
    Set Selenium Implicit Wait  ${orig_wait}
    Unselect Frame
    Unselect Frame

Confirm End Systems Report Table Contains Column
    [Arguments]  ${col}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']
    Page Should Contain Element  xpath://a[contains(text(),'${col}')]
    Unselect Frame
    Unselect Frame

Confirm End Systems Report Table Does Not Contain Column
    [Arguments]  ${col}
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  xpath://a[contains(text(),'${col}')]
    Set Selenium Implicit Wait  ${orig_wait}
    Unselect Frame
    Unselect Frame
