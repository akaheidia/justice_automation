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

Expand Reports Tree Site Node
    Select Frame  xpath://iframe
    ${need_to_expand}=  Get Element Count  ${reports_tree_expand_site_icon}
    Run Keyword If  ${need_to_expand} > 0  Click Element  ${reports_tree_expand_site_icon}
    Unselect Frame

Collapse Reports Tree Site Node
    Select Frame  xpath://iframe
    ${need_to_collapse}=  Get Element Count  ${reports_tree_collapse_site_icon}
    Run Keyword If  ${need_to_collapse} > 0  Click Element  ${reports_tree_collapse_site_icon}
    Unselect Frame

Expand Reports Tree Top N Node
    Select Frame  xpath://iframe
    ${need_to_expand}=  Get Element Count  ${reports_tree_expand_topn_icon}
    Run Keyword If  ${need_to_expand} > 0  Click Element  ${reports_tree_expand_topn_icon}
    Unselect Frame

Collapse Reports Tree Top N Node
    Select Frame  xpath://iframe
    ${need_to_collapse}=  Get Element Count  ${reports_tree_collapse_topn_icon}
    Run Keyword If  ${need_to_collapse} > 0  Click Element  ${reports_tree_collapse_topn_icon}
    Unselect Frame

Expand Reports Tree Analytics Node
    Select Frame  xpath://iframe
    ${need_to_expand}=  Get Element Count  ${reports_tree_expand_analytics_icon}
    Run Keyword If  ${need_to_expand} > 0  Click Element  ${reports_tree_expand_analytics_icon}
    Unselect Frame

Collapse Reports Tree Analytics Node
    Select Frame  xpath://iframe
    ${need_to_collapse}=  Get Element Count  ${reports_tree_collapse_analytics_icon}
    Run Keyword If  ${need_to_collapse} > 0  Click Element  ${reports_tree_collapse_analytics_icon}
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

Click Site Availability Reports Menu
    Select Frame  xpath://iframe
    Element Should Be Visible  ${reports_site_availability_menu}
    Click Element  ${reports_site_availability_menu}
    Unselect Frame

Click Site CPU Utilization Reports Menu
    Select Frame  xpath://iframe
    Element Should Be Visible  ${reports_site_cpu_utilization_menu}
    Click Element  ${reports_site_cpu_utilization_menu}
    Unselect Frame


Click Top N Device Availability Reports Menu
    Select Frame  xpath://iframe
    Element Should Be Visible  ${reports_topn_device_availability_menu}
    Click Element  ${reports_topn_device_availability_menu}
    Unselect Frame


Click Analytics Summary Reports Menu
    Select Frame  xpath://iframe
    Element Should Be Visible  ${reports_analytics_analytics_summary_menu}
    Click Element  ${reports_analytics_analytics_summary_menu}
    Unselect Frame

Click Analytics Top Applications Reports Menu
    Select Frame  xpath://iframe
    Element Should Be Visible  ${reports_analytics_top_applications_menu}
    Click Element  ${reports_analytics_top_applications_menu}
    Unselect Frame

Click Analytics Daily Usage Reports Menu
    Select Frame  xpath://iframe
    Element Should Be Visible  ${reports_analytics_daily_usage_menu}
    Click Element  ${reports_analytics_daily_usage_menu}
    Unselect Frame

Click Analytics Monthly Usage Reports Menu
    Select Frame  xpath://iframe
    Element Should Be Visible  ${reports_analytics_monthly_usage_menu}
    Click Element  ${reports_analytics_monthly_usage_menu}
    Unselect Frame

Click Analytics Quarterly Usage Reports Menu
    Select Frame  xpath://iframe
    Element Should Be Visible  ${reports_analytics_quarterly_usage_menu}
    Click Element  ${reports_analytics_quarterly_usage_menu}
    Unselect Frame


Confirm Network Scorecard Reports Page Loaded
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_network_scorecard_page_title}
    Unselect Frame

Confirm Network Summary Reports Page Loaded
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_network_summary_page_title}
    Unselect Frame


Confirm Site Availability Reports Page Loaded
#    ${count}=  Get Element Count  xpath://iframe
#    Log To Console  IFrame Count: ${count}
    Select Frame  xpath://iframe
#    ${count2}=  Get Element Count  xpath://iframe
#    Log To Console  IFrame 2 Count: ${count2}

    Select Frame  xpath://iframe[@name='availability']
#    ${count3}=  Get Element Count  xpath://iframe
#    Log To Console  IFrame 3 Count: ${count3}
#
#    Select Frame  xpath://iframe
#    ${count4}=  Get Element Count  xpath://iframe
#    Log To Console  IFrame 4 Count: ${count4}

    ${elem_count}=  Get Element Count  ${reports_site_availability_page_title}
    Log To Console  page title: ${elem_count}
#    Page Should Contain Element  ${reports_site_availability_page_title}
#    Unselect Frame
    UnSelect Frame
    Unselect Frame

Confirm Site CPU Utilization Reports Page Loaded
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_site_cpu_utilization_page_title}
    Unselect Frame


Confirm Top N Device Availability Reports Page Loaded
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_topn_device_availability_page_title}
    Unselect Frame


Confirm Analytics Summary Reports Page Loaded
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_analytics_analytics_summary_page_title}
    Unselect Frame

Confirm Analytics Top Applications Reports Page Loaded
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_analytics_top_applications_page_title}
    Unselect Frame

Confirm Analytics Daily Usage Reports Page Loaded
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_analytics_daily_usage_page_title}
    Unselect Frame

Confirm Analytics Monthly Usage Reports Page Loaded
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_analytics_monthly_usage_page_title}
    Unselect Frame

Confirm Analytics Quarterly Usage Reports Page Loaded
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_analytics_quarterly_usage_page_title}
    Unselect Frame
