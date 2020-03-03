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
