*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Filters Panel.

*** Keywords ***

Expand Servers and Sites
    ${need_to_expand}=  Run Keyword And Return Status  Element Should Be Visible  ${filters_servers_and_sites_panel_expand_icon}
    Run Keyword If  ${need_to_expand}  Click Element  ${filters_servers_and_sites_panel_expand_icon}

Collapse Servers and Sites
    ${need_to_expand}=  Run Keyword And Return Status  Element Should Be Visible  ${filters_servers_and_sites_panel_collapse_icon}
    Run Keyword If  ${need_to_expand}  Click Element  ${filters_servers_and_sites_panel_collapse_icon}


Confirm Servers and Sites Expanded
    Element Should Be Visible  ${filters_servers_and_sites_panel_collapse_icon}

Confirm Servers and Sites Collapsed
    Element Should Be Visible  ${filters_servers_and_sites_panel_expand_icon}
