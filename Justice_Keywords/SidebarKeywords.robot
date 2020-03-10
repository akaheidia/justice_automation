*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the navigation side bar.

*** Keywords ***
Click Monitor
    Click Element  ${nav_monitor_icon}

Click Reports
    Click Element  ${nav_reports_icon}

Click Settings
    Click Element  ${nav_settings_icon}

Click User
    Click Element  ${nav_user_icon}

Confirm Monitor Page Loaded
    Page Should Contain Element  ${monitor_page_title}
    Page Should Contain Element  ${monitor_map_slider}
    Page Should Contain Element  ${monitor_list_slider}

Confirm Reports Page Loaded
    Page Should Contain Element  ${reports_page_title}
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_sidebar_menu_button}
    Page Should Contain Element  ${reports_add_button}
    Unselect Frame

Confirm Settings Page Loaded
    Page Should Contain Element  ${settings_page_title}

Confirm Monitor Page Not Loaded
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  ${monitor_page_title}
    Page Should Not Contain Element  ${monitor_map_slider}
    Page Should Not Contain Element  ${monitor_list_slider}
    Set Selenium Implicit Wait  ${orig_wait}
