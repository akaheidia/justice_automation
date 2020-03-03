*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Filters Panel.

*** Keywords ***

Expand Servers and Sites Filter
    ${need_to_expand}=  Run Keyword And Return Status  Element Should Be Visible  ${filters_servers_and_sites_panel_expand_icon}
    Run Keyword If  ${need_to_expand}  Click Element  ${filters_servers_and_sites_panel_expand_icon}

Collapse Servers and Sites Filter
    ${need_to_collapse}=  Run Keyword And Return Status  Element Should Be Visible  ${filters_servers_and_sites_panel_collapse_icon}
    Run Keyword If  ${need_to_collapse}  Click Element  ${filters_servers_and_sites_panel_collapse_icon}

Expand Alarm Severity Filter
    ${need_to_expand}=  Run Keyword And Return Status  Element Should Be Visible  ${filters_alarm_severity_panel_expand_icon}
    Run Keyword If  ${need_to_expand}  Click Element  ${filters_alarm_severity_panel_expand_icon}

Collapse Alarm Severity Filter
    ${need_to_collapse}=  Run Keyword And Return Status  Element Should Be Visible  ${filters_alarm_severity_panel_collapse_icon}
    Run Keyword If  ${need_to_collapse}  Click Element  ${filters_alarm_severity_panel_collapse_icon}

Expand Site Availability Filter
    ${need_to_expand}=  Run Keyword And Return Status  Element Should Be Visible  ${filters_site_availability_panel_expand_icon}
    Run Keyword If  ${need_to_expand}  Click Element  ${filters_site_availability_panel_expand_icon}

Collapse Site Availability Filter
    ${need_to_collapse}=  Run Keyword And Return Status  Element Should Be Visible  ${filters_site_availability_panel_collapse_icon}
    Run Keyword If  ${need_to_collapse}  Click Element  ${filters_site_availability_panel_collapse_icon}

Clear All Filters
    Click Element  ${filters_clear_all_icon}

Confirm Servers and Sites Filter Expanded
    Element Should Be Visible  ${filters_servers_and_sites_panel_collapse_icon}

Confirm Servers and Sites Filter Collapsed
    Element Should Be Visible  ${filters_servers_and_sites_panel_expand_icon}

Confirm Alarm Severity Filter Expanded
    Element Should Be Visible  ${filters_alarm_severity_panel_collapse_icon}

Confirm Alarm Severity Filter Collapsed
    Element Should Be Visible  ${filters_alarm_severity_panel_expand_icon}

Confirm Site Availability Filter Expanded
    Element Should Be Visible  ${filters_site_availability_panel_collapse_icon}

Confirm Site Availability Filter Collapsed
    Element Should Be Visible  ${filters_site_availability_panel_expand_icon}


Select Servers and Sites Server Tree Node
    [Arguments]  ${node_name}
    Page Should Contain Element  xpath://span[@class='ui-treenode-label ui-corner-all']/span[contains(text(), '${node_name}')]/../..//div[contains(@class, 'ui-chkbox-box')]/span[@class='ui-chkbox-icon ui-clickable pi']/..
    Click Element  xpath://span[@class='ui-treenode-label ui-corner-all']/span[contains(text(), '${node_name}')]/../..//div[contains(@class, 'ui-chkbox-box')]/span[@class='ui-chkbox-icon ui-clickable pi']/..

Deselect Servers and Sites Server Tree Node
    [Arguments]  ${node_name}
    Page Should Contain Element  xpath://span[@class='ui-treenode-label ui-corner-all ui-state-highlight']/span[contains(text(), '${nodename}')]/../..//div[contains(@class, 'ui-chkbox-box')]/span[@class='ui-chkbox-icon ui-clickable pi pi-check']/..
    Click Element  xpath://span[@class='ui-treenode-label ui-corner-all ui-state-highlight']/span[contains(text(), '${node_name}')]/../..//div[contains(@class, 'ui-chkbox-box')]/span[@class='ui-chkbox-icon ui-clickable pi pi-check']/..

Select Servers and Sites Site Tree Node
    [Arguments]  ${node_name}
    Page Should Contain Element  xpath://span[@class='ui-treenode-label ui-corner-all']/span[contains(text(), '${node_name}')]/../..//div[contains(@class, 'ui-chkbox-box')]/span[@class='ui-chkbox-icon ui-clickable pi']/..
    Click Element  xpath://span[@class='ui-treenode-label ui-corner-all']/span[contains(text(), '${node_name}')]/../..//div[contains(@class, 'ui-chkbox-box')]/span[@class='ui-chkbox-icon ui-clickable pi']/..

Deselect Servers and Sites Site Tree Node
    [Arguments]  ${node_name}
    Page Should Contain Element  xpath://span[@class='ui-treenode-label ui-corner-all ui-state-highlight']/span[contains(text(), '${nodename}')]/../..//div[contains(@class, 'ui-chkbox-box')]/span[@class='ui-chkbox-icon ui-clickable pi pi-check']/..
    Click Element  xpath://span[@class='ui-treenode-label ui-corner-all ui-state-highlight']/span[contains(text(), '${node_name}')]/../..//div[contains(@class, 'ui-chkbox-box')]/span[@class='ui-chkbox-icon ui-clickable pi pi-check']/..

Expand Servers and Sites Tree Node
    [Arguments]  ${node_name}
    Page Should Contain Element  xpath://span[@class='ui-treenode-label ui-corner-all']/span[contains(text(), '${node_name}')]/../../span[contains(@class, 'caret-right')]
    Click Element  xpath://span[@class='ui-treenode-label ui-corner-all']/span[contains(text(), '${node_name}')]/../../span[contains(@class, 'caret-right')]

Collapse Servers and Sites Tree Node
    [Arguments]  ${node_name}
    Page Should Contain Element  xpath://span[@class='ui-treenode-label ui-corner-all']/span[contains(text(), '${node_name}')]/../../span[contains(@class, 'caret-down')]
    Click Element  xpath://span[@class='ui-treenode-label ui-corner-all']/span[contains(text(), '${noden_ame}')]/../../span[contains(@class, 'caret-down')]

Confirm Filters Panel Contains Site
    [Arguments]  ${site_name}
    Page Should Contain Element  xpath://span[@class='ui-treenode-label ui-corner-all']/span[contains(text(), '${site_name}')]

Confirm Filters Panel Does Not Contain Site
    [Arguments]  ${site_name}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  xpath://span[@class='ui-treenode-label ui-corner-all']/span[contains(text(), '${site_name}')]
    Set Selenium Implicit Wait  ${orig_wait}

Confirm Filters Panel Contains Server
    [Arguments]  ${server_name}
    Page Should Contain Element  xpath://span[@class='ui-treenode-label ui-corner-all']/span[contains(text(), '${server_name}')]

Confirm Filters Panel Does Not Contain Server
    [Arguments]  ${server_name}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  xpath://span[@class='ui-treenode-label ui-corner-all']/span[contains(text(), '${server_name}')]
    Set Selenium Implicit Wait  ${orig_wait}

Confirm Site Selected
    [Arguments]  ${node_name}
    Page Should Contain Element  xpath://span[@class='ui-chkbox-icon ui-clickable pi pi-check']/../../../span[contains(@class, 'ui-treenode-label')]/span[text()='${node_name}']

Confirm Site Not Selected
    [Arguments]  ${node_name}
    Page Should Contain Element  xpath://span[@class='ui-chkbox-icon ui-clickable pi']/../../../span[contains(@class, 'ui-treenode-label')]/span[text()='${node_name}']
