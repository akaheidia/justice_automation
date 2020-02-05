*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the navigation side bar.

*** Keywords ***

Open Sidebar Menu
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  ${reports_sidebar_menu_button}
    Element Should Not Be Visible  ${reports_menu_table}
    Click Element  ${reports_sidebar_menu_button}
    Element Should Be Visible  ${reports_menu_table}
    Unselect Frame

Close Sidebar Menu
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  ${reports_sidebar_menu_button}
    Element Should Be Visible  ${reports_menu_table}
    Click Element  ${reports_sidebar_menu_button}
    Element Should Not Be Visible  ${reports_menu_table}
    Unselect Frame

Click Add Button
    Select Frame  xpath://iframe
    Click Element  ${reports_add_button}
    Unselect Frame

Expand Reports Tree Reports Node
    Select Frame  xpath://iframe
    ${need_to_expand}=  Get Element Count  ${reports_tree_expand_reports_icon}
    Run Keyword If  ${need_to_expand} > 0  Click Element  ${reports_tree_expand_reports_icon}
    Unselect Frame

Collapse Reports Tree Reports Node
    Select Frame  xpath://iframe
    ${need_to_collapse}=  Get Element Count  ${reports_tree_collapse_reports_icon}
    Run Keyword If  ${need_to_collapse} > 0  Click Element  ${reports_tree_collapse_reports_icon}
    Unselect Frame

Click Network Scorecard Reports Menu
    Select Frame  xpath://iframe
    Element Should Be Visible  ${reports_network_scorecard_menu}
    Click Element  ${reports_network_scorecard_menu}
    Unselect Frame

Click Network Summary Reports Menu
    Select Frame  xpath://iframe
    Element Should Be Visible  ${reports_network_summary_menu}
    Click Element  ${reports_network_summary_menu}
    Unselect Frame

Confirm Network Scorecard Report Page Loaded
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_network_scorecard_page_title}
    Unselect Frame

Confirm Network Summary Report Page Loaded
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_network_summary_page_title}
    Unselect Frame
