*** Settings ***
Library    SeleniumLibrary
Variables  ../XMC_Variables/PageLocators.py

Documentation    Keywords specific to the Administration> Diagnostics tab in XMC.

*** Keywords ***

XMC Confirm Diagnostics Tab Loaded
    Page Should Contain Element  ${xmc_diagnostics_level_selector}

XMC Expand Diagnostics Tree Node
    [Arguments]  ${nodename}
#
#    ${need_to_expand}=  Run Keyword And Return Status  Element Should Be Visible  ${filter_servers_and_sites_panel_expand_icon}
#    Run Keyword If  ${need_to_expand}  Click Element  ${filter_servers_and_sites_panel_expand_icon}
#
    Page Should Contain Element  xpath://span[contains(@class,'x-tree-node-text')][span[contains(text(),'${nodename}')]
    Click Element  xpath://span[contains(@class,'x-tree-node-text')][span[contains(text(),'${nodename}')]

XMC Select Diagnostics Tree Node
    [Arguments]  ${nodename}
    Page Should Contain Element  xpath://span[contains(@class,'x-tree-node-text')][span[contains(text(),'${nodename}')]
    Click Element  xpath://span[contains(@class,'x-tree-node-text')][span[contains(text(),'${nodename}')]
