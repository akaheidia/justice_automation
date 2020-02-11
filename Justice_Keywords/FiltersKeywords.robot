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
