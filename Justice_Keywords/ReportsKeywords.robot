*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Reports page.

*** Keywords ***

Navigate to Reports
    Click Reports
    Confirm Reports Page Loaded

Navigate to Reports and Open Reports Menu
    Navigate to Reports
    Open Reports Sidebar Menu
    Expand Reports Tree Reports Node

Navigate To Site Report Menu
    Navigate to Reports and Open Reports Menu
    Expand Reports Tree Site Node

Navigate To Top N Report Menu
    Navigate to Reports and Open Reports Menu
    Expand Reports Tree Top N Node

Navigate To Analytics Report Menu
    Navigate to Reports and Open Reports Menu
    Expand Reports Tree Analytics Node


Navigate to Network Scorecard Report
    Set Selenium Implicit Wait  2 seconds
    Navigate to Reports and Open Reports Menu
    Click Network Scorecard Report Menu

Navigate to Network Summary Report
    Set Selenium Implicit Wait  2 seconds
    Navigate to Reports and Open Reports Menu
    Click Network Summary Report Menu
    Wait For Network Summary Report Page To Load

Navigate to XMC Server Utilization Report
    Set Selenium Implicit Wait  2 seconds
    Navigate to Reports and Open Reports Menu
    Click XMC Server Utilization Report Menu


Navigate to Site Availability Report
    Set Selenium Implicit Wait  2 seconds
    Navigate To Site Report Menu
    Click Site Availability Report Menu

Navigate to Site CPU Utilization Report
    Set Selenium Implicit Wait  2 seconds
    Navigate To Site Report Menu
    Click Site CPU Utilization Report Menu

Navigate to Site Memory Utilization Report
    Set Selenium Implicit Wait  2 seconds
    Navigate To Site Report Menu
    Click Site Memory Utilization Report Menu

Navigate to Site Port Utilization Report
    Set Selenium Implicit Wait  2 seconds
    Navigate To Site Report Menu
    Click Site Port Utilization Report Menu

Navigate to Site Port Error Report
    Set Selenium Implicit Wait  2 seconds
    Navigate To Site Report Menu
    Click Site Port Error Report Menu


Navigate to Top N Device Availability Report
    Set Selenium Implicit Wait  2 seconds
    Navigate To Top N Report Menu
    Click Top N Device Availability Report Menu

Navigate to Top N Site Availability Report
    Set Selenium Implicit Wait  2 seconds
    Navigate To Top N Report Menu
    Click Top N Site Availability Report Menu

Navigate to Top N CPU Utilization Report
    Set Selenium Implicit Wait  2 seconds
    Navigate To Top N Report Menu
    Click Top N CPU Utilization Report Menu

Navigate to Top N Memory Utilization Report
    Set Selenium Implicit Wait  2 seconds
    Navigate To Top N Report Menu
    Click Top N Memory Utilization Report Menu

Navigate to Top N Port Utilization Report
    Set Selenium Implicit Wait  2 seconds
    Navigate To Top N Report Menu
    Click Top N Port Utilization Report Menu

Navigate to Top N Port Error Report
    Set Selenium Implicit Wait  2 seconds
    Navigate To Top N Report Menu
    Click Top N Port Error Report Menu

Navigate to Top N Top APs By Clients Report
    Set Selenium Implicit Wait  2 seconds
    Navigate To Top N Report Menu
    Click Top N Top APs By Clients Report Menu

Navigate to Top N Top APs By Bandwidth Report
    Set Selenium Implicit Wait  2 seconds
    Navigate To Top N Report Menu
    Click Top N Top APs By Bandwidth Report Menu


Navigate to Analytics Summary Report
    Set Selenium Implicit Wait  2 seconds
    Navigate To Analytics Report Menu
    Click Analytics Summary Report Menu

Navigate to Analytics Top Applications By Clients Report
    Set Selenium Implicit Wait  2 seconds
    Navigate To Analytics Report Menu
    Click Analytics Top Applications By Clients Report Menu

Navigate to Analytics Top Applications By Volume Report
    Set Selenium Implicit Wait  2 seconds
    Navigate To Analytics Report Menu
    Click Analytics Top Applications By Volume Report Menu

Navigate to Analytics Slowest Responding Applications Report
    Set Selenium Implicit Wait  2 seconds
    Navigate To Analytics Report Menu
    Click Analytics Slowest Responding Applications Report Menu

Navigate to Analytics Daily Usage Report
    Set Selenium Implicit Wait  2 seconds
    Navigate To Analytics Report Menu
    Click Analytics Daily Usage Report Menu

Navigate to Analytics Monthly Usage Report
    Set Selenium Implicit Wait  2 seconds
    Navigate To Analytics Report Menu
    Click Analytics Monthly Usage Report Menu

Navigate to Analytics Quarterly Usage Report
    Set Selenium Implicit Wait  2 seconds
    Navigate To Analytics Report Menu
    Click Analytics Quarterly Usage Report Menu


Open Reports Sidebar Menu
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  ${reports_sidebar_menu_button}  timeout=10 seconds
    ${need_to_open}=  Run Keyword And Return Status  Element Should Not Be Visible  ${reports_menu_tree}
    Run Keyword If  ${need_to_open} == True  Click Element  ${reports_sidebar_menu_button}
    Wait Until Page Contains Element  ${reports_menu_tree}  timeout=10 seconds
    Unselect Frame

Close Reports Sidebar Menu
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  ${reports_sidebar_menu_button}  timeout=10 seconds
    ${need_to_close}=  Run Keyword And Return Status  Element Should Be Visible  ${reports_menu_tree}
    Run Keyword If  ${need_to_close} == True  Click Element  ${reports_sidebar_menu_button}
    Wait Until Page Does Not Contain Element  ${reports_menu_tree}  timeout=10 seconds
    Unselect Frame

Click Reports Add Button
    Select Frame  xpath://iframe
    Click Element  ${reports_add_button}
    Unselect Frame

Click Add New Report
    Select Frame  xpath://iframe
    Click Element  ${reports_add_new_report_menu}
    Unselect Frame

Click Add New Visual
    Select Frame  xpath://iframe
    Click Element  ${reports_add_new_visual_menu}
    Unselect Frame

Click Add New Category
    Select Frame  xpath://iframe
    Click Element  ${reports_add_new_category_menu}
    Unselect Frame

Click Go To Reports Button
    Select Frame  xpath://iframe
    Click Element  ${reports_add_go_to_reports_button}
    Wait Until Page Contains Element  ${reports_add_button}  timeout=10 seconds
    Unselect Frame


Click Expand Collapse Reports Tree Node Icon
    [Arguments]  ${icon_element}
    Select Frame  xpath://iframe
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  ${icon_element}
    Run Keyword If  ${need_to_click} == True  Click Element  ${icon_element}
    Unselect Frame

Expand Reports Tree Reports Node
    Click Expand Collapse Reports Tree Node Icon  ${reports_tree_expand_reports_icon}

Collapse Reports Tree Reports Node
    Click Expand Collapse Reports Tree Node Icon  ${reports_tree_collapse_reports_icon}

Expand Reports Tree Site Node
    Click Expand Collapse Reports Tree Node Icon  ${reports_tree_expand_site_icon}

Collapse Reports Tree Site Node
    Click Expand Collapse Reports Tree Node Icon  ${reports_tree_collapse_site_icon}

Expand Reports Tree Top N Node
    Click Expand Collapse Reports Tree Node Icon  ${reports_tree_expand_topn_icon}

Collapse Reports Tree Top N Node
    Click Expand Collapse Reports Tree Node Icon  ${reports_tree_collapse_topn_icon}

Expand Reports Tree Analytics Node
    Click Expand Collapse Reports Tree Node Icon  ${reports_tree_expand_analytics_icon}

Collapse Reports Tree Analytics Node
    Click Expand Collapse Reports Tree Node Icon  ${reports_tree_collapse_analytics_icon}


Click Report Menu
    [Arguments]  ${menu}
    Select Frame  xpath://iframe
    Element Should Be Visible  ${menu}
    Click Element  ${menu}
    Unselect Frame

Click Network Scorecard Report Menu
    Click Report Menu  ${reports_network_scorecard_menu}

Click Network Summary Report Menu
    Click Report Menu  ${reports_network_summary_menu}

Click XMC Server Utilization Report Menu
    Click Report Menu  ${reports_xmc_server_utilization_menu}

Click Site Availability Report Menu
    Click Report Menu  ${reports_site_availability_menu}

Click Site CPU Utilization Report Menu
    Click Report Menu  ${reports_site_cpu_utilization_menu}

Click Site Memory Utilization Report Menu
    Click Report Menu  ${reports_site_memory_utilization_menu}

Click Site Port Utilization Report Menu
    Click Report Menu  ${reports_site_port_utilization_menu}

Click Site Port Error Report Menu
    Click Report Menu  ${reports_site_port_error_menu}

Click Top N Device Availability Report Menu
    Click Report Menu  ${reports_topn_device_availability_menu}

Click Top N Site Availability Report Menu
    Click Report Menu  ${reports_topn_site_availability_menu}

Click Top N CPU Utilization Report Menu
    Click Report Menu  ${reports_topn_cpu_utilization_menu}

Click Top N Memory Utilization Report Menu
    Click Report Menu  ${reports_topn_memory_utilization_menu}

Click Top N Port Utilization Report Menu
    Click Report Menu  ${reports_topn_port_utilization_menu}

Click Top N Port Error Report Menu
    Click Report Menu  ${reports_topn_port_error_menu}

Click Top N Top APs By Clients Report Menu
    Click Report Menu  ${reports_topn_top_aps_by_clients_menu}

Click Top N Top APs By Bandwidth Report Menu
    Click Report Menu  ${reports_topn_top_aps_by_bandwidth_menu}

Click Analytics Summary Report Menu
    Click Report Menu  ${reports_analytics_analytics_summary_menu}

Click Analytics Top Applications By Clients Report Menu
    Click Report Menu  ${reports_analytics_top_applications_by_clients_menu}

Click Analytics Top Applications By Volume Report Menu
    Click Report Menu  ${reports_analytics_top_applications_by_volume_menu}

Click Analytics Slowest Responding Applications Report Menu
    Click Report Menu  ${reports_analytics_slowest_responding_applications_menu}

Click Analytics Daily Usage Report Menu
    Click Report Menu  ${reports_analytics_daily_usage_menu}

Click Analytics Monthly Usage Report Menu
    Click Report Menu  ${reports_analytics_monthly_usage_menu}

Click Analytics Quarterly Usage Report Menu
    Click Report Menu  ${reports_analytics_quarterly_usage_menu}


Confirm Network Scorecard Reports Page Title
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_network_scorecard_page_title}
    Unselect Frame

Confirm Network Summary Reports Page Title
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_network_summary_page_title}
    Unselect Frame

Confirm XMC Server Utilization Reports Page Title
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='server_usage']

    Page Should Contain Element  ${reports_xmc_server_utilization_page_title}

    Unselect Frame
    Unselect Frame


Confirm Site Availability Reports Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='availability']

    Page Should Contain Element  ${reports_site_availability_page_title}

    UnSelect Frame
    Unselect Frame

Confirm Site CPU Utilization Reports Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='statistic']

    Page Should Contain Element  ${reports_site_cpu_utilization_page_title}

    UnSelect Frame
    Unselect Frame

Confirm Site Memory Utilization Reports Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='statistic']

    Page Should Contain Element  ${reports_site_memory_utilization_page_title}

    UnSelect Frame
    Unselect Frame

Confirm Site Port Utilization Reports Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='statistic']

    Page Should Contain Element  ${reports_site_port_utilization_page_title}

    UnSelect Frame
    Unselect Frame

Confirm Site Port Error Reports Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='statistic']

    Page Should Contain Element  ${reports_site_port_error_page_title}

    UnSelect Frame
    Unselect Frame


Confirm Top N Device Availability Reports Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    Page Should Contain Element  ${reports_topn_device_availability_page_title}

    UnSelect Frame
    Unselect Frame

Confirm Top N Site Availability Reports Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    Page Should Contain Element  ${reports_topn_site_availability_page_title}

    UnSelect Frame
    Unselect Frame

Confirm Top N CPU Utilization Reports Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    Page Should Contain Element  ${reports_topn_cpu_utilization_page_title}

    UnSelect Frame
    Unselect Frame

Confirm Top N Memory Utilization Reports Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    Page Should Contain Element  ${reports_topn_memory_utilization_page_title}

    UnSelect Frame
    Unselect Frame

Confirm Top N Port Utilization Reports Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    Page Should Contain Element  ${reports_topn_port_utilization_page_title}

    UnSelect Frame
    Unselect Frame

Confirm Top N Port Error Reports Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    Page Should Contain Element  ${reports_topn_port_error_page_title}

    UnSelect Frame
    Unselect Frame

Confirm Top N Top APs By Clients Reports Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    Page Should Contain Element  ${reports_topn_top_aps_by_clients_page_title}

    UnSelect Frame
    Unselect Frame

Confirm Top N Top APs By Bandwidth Reports Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    Page Should Contain Element  ${reports_topn_top_aps_by_bandwidth_page_title}

    UnSelect Frame
    Unselect Frame


Confirm Analytics Summary Reports Page Title
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_analytics_analytics_summary_page_title}
    Unselect Frame

Confirm Analytics Top Applications By Clients Reports Page Title
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_analytics_top_applications_by_clients_page_title}
    Unselect Frame

Confirm Analytics Top Applications By Volume Reports Page Title
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_analytics_top_applications_by_volume_page_title}
    Unselect Frame

Confirm Analytics Slowest Responding Applications Reports Page Title
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_analytics_slowest_responding_applications_page_title}
    Unselect Frame

Confirm Analytics Daily Usage Reports Page Title
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_analytics_daily_usage_page_title}
    Unselect Frame

Confirm Analytics Monthly Usage Reports Page Title
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_analytics_monthly_usage_page_title}
    Unselect Frame

Confirm Analytics Quarterly Usage Reports Page Title
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_analytics_quarterly_usage_page_title}
    Unselect Frame
