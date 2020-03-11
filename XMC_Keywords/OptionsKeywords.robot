*** Settings ***
Library    SeleniumLibrary
Variables  ../XMC_Variables/PageLocators.py

Documentation    Keywords specific to the Administration> Options tab in XMC.

*** Keywords ***

XMC Confirm Options Tab Loaded
    Page Should Contain Element  ${xmc_options_tree_title}

XMC Select Options Tree Node
    [Arguments]  ${nodename}
    Page Should Contain Element  xpath://span[contains(text(),'${nodename}')]
    Click Element  xpath://span[contains(text(),'${nodename}')]

XMC Confirm Option Value XMC Data Pump Domain Node Type
    [Arguments]  ${value}
    ${elem_value}=  Get Element Attribute  ${xmc_options_xmcdatapump_domainnodetype}  value
    Should Be Equal As Integers  ${value}  ${elem_value}  XMC Data Pump: Domain Node Type option does not have expected value

XMC Confirm Option Value XMC Data Pump Password
    [Arguments]  ${value}
    Click Element  ${xmc_options_xmcdatapump_password_eye_show}
    ${elem_value}=  Get Element Attribute  ${xmc_options_xmcdatapump_password}  value
    Should Be Equal  ${value}  ${elem_value}  XMC Data Pump: Password option does not have expected value
    Click Element  ${xmc_options_xmcdatapump_password_eye_hide}
