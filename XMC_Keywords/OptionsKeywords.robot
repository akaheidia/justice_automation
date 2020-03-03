*** Settings ***
Library    SeleniumLibrary
Variables  ../XMC_Variables/PageLocators.py

Documentation    Keywords specific to the Administration> Options tab in XMC.

*** Keywords ***

XMC Select Options Tree Node
    [Arguments]  ${nodename}
    Page Should Contain Element  xpath://span[contains(text(),'${nodename}')]
    Click Element  xpath://span[contains(text(),'${nodename}')]

XMC Confirm Options Tab Loaded
    Page Should Contain Element  ${xmc_options_tree_title}

XMC Confirm Domain Node Type Option Value
    [Arguments]  ${value}
    ${elem_value}=  Get Element Attribute  xpath://input[@name='domainNodeType']  value
    Should Be Equal As Integers  ${value}  ${elem_value}  Domain Node Type option does not have expected value
