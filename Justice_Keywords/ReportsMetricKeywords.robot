*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords common to the Metric Report pages.

*** Keywords ***

Confirm Metric Report Table Column Header Contains Value
    [Arguments]  ${value}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    Page Should Contain Element  xpath://a[contains(text(), '${value}')]

    Unselect Frame
    Unselect Frame
