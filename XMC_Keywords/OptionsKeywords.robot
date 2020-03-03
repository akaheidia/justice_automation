*** Settings ***
Library    SeleniumLibrary
Variables  ../XMC_Variables/PageLocators.py

Documentation    Keywords specific to the Administration> Options tab in XMC.

*** Keywords ***

XMC Select Tree Node
    [Arguments]  ${nodename}
    Page Should Contain Element  xpath://span[contains(@class,'x-tree-node-text')]//span[contains(text(),'${nodename}')]
    Click Element  xpath://span[contains(@class,'x-tree-node-text')]//span[contains(text(),'${nodename}')]

