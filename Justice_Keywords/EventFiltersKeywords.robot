*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Filter Panel related to Events.

*** Keywords ***
Set Event Type Filter
    [Arguments]  ${value}
    Show Filter Panel
    Confirm Filter Panel Visible
    Select Event Type Filter  ${value}

Select Event Type Filter
    [Arguments]  ${value}
    Page Should Contain Element  xpath://span[contains(text(),'${value}')]
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  xpath://span[contains(text(),'${value}')]/../div[contains(@class,'mat-checkbox-inner-container')]/input[@type='checkbox'][@aria-checked='false']
    Run Keyword If  ${need_to_click}  Click Element  xpath://span[contains(text(),'${value}')]
    ...    ELSE     Log  Check button '${value}' already selected

Deselect Event Type Filter
    [Arguments]  ${value}
    Page Should Contain Element  xpath://span[contains(text(),'${value}')]
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  xpath://span[contains(text(),'${value}')]/../div[contains(@class,'mat-checkbox-inner-container')]/input[@type='checkbox'][not(@aria-checked='false')]
    Run Keyword If  ${need_to_click}  Click Element  xpath://span[contains(text(),'${value}')]
    ...    ELSE     Log  Check button '${value}' already deselected
