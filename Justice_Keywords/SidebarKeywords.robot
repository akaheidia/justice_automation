*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the navigation side bar.

*** Keywords ***
Click Monitoring
    Click Element  ${nav_monitor_icon}

Click Reports
    Click Element  ${nav_reports_icon}

Click Settings
    Click Element  ${nav_settings_icon}

Click User
    Click Element  ${nav_user_icon}

Confirm Monitoring Page Loaded
    Page Should Contain Element  ${monitor_page_title}
    Page Should Contain Element  ${selected slider}
    Page Should Contain Element  ${unselected slider}

Confirm Reports Page Loaded
    Page Should Contain Element  ${reports_page_title}

Confirm Settings Page Loaded
    Page Should Contain Element  ${settings_page_title}
