*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the navigation side bar.

*** Keywords ***
Click Monitor
    Wait Until Page Contains Element  ${nav_monitor_icon}
    Click Element  ${nav_monitor_icon}

Click Reports
    Wait Until Page Contains Element  ${nav_reports_icon}
    Click Element  ${nav_reports_icon}

Click Settings
    Wait Until Page Contains Element  ${nav_settings_icon}
    Click Element  ${nav_settings_icon}

Click User
    Wait Until Page Contains Element  ${nav_user_icon}
    Click Element  ${nav_user_icon}

Confirm Monitor Page Loaded
    Wait Until Page Contains Element  ${monitor_page_title}
    Wait Until Page Contains Element  ${monitor_map_slider}
    Wait Until Page Contains Element  ${monitor_list_slider}

Confirm Reports Page Loaded
    Wait Until Page Contains Element  ${reports_page_title}
    sleep  1 second
    Wait Until Page Contains Element  xpath://iframe
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  ${reports_sidebar_menu_button}
    Wait Until Page Contains Element  ${reports_add_button}
    Wait Until Page Contains Element  ${reports_filter_icon}
    Unselect Frame

Confirm Settings Page Loaded
    Wait Until Page Contains Element  ${settings_page_title}  timeout=10 seconds

Confirm Monitor Page Not Loaded
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  ${monitor_page_title}
    Page Should Not Contain Element  ${monitor_map_slider}
    Page Should Not Contain Element  ${monitor_list_slider}
    Set Selenium Implicit Wait  ${orig_wait}
