*** Settings ***
Library    SeleniumLibrary
Variables  ../XMC_Variables/PageLocators.py

Documentation    Keywords specific to the navigation side bar in XMC.

*** Keywords ***
Navigate to XMC Network Page
    Click Element  ${xmc_nav_network_button}

Navigate to XMC Alarms & Events Page
    Click Element  ${xmc_nav_alarmsevents_button}

Navigate to XMC Control Page
    Click Element  ${xmc_nav_control_button}

Navigate to XMC Analytics Page
    Click Element  ${xmc_nav_analytics_button}

Navigate to XMC Wireless Page
    Click Element  ${xmc_nav_wireless_button}

Navigate to XMC Compliance Page
    Click Element  ${xmc_nav_compliance_button}

Navigate to XMC Reports Page
    Click Element  ${xmc_nav_reports_button}

Navigate to XMC Tasks Page
    Click Element  ${xmc_nav_tasks_button}

Navigate to XMC Administration Page
    Click Element  ${xmc_nav_admin_button}

Navigate to XMC Connect Page
    Click Element  ${xmc_nav_connect_button}


Confirm Network Page Loaded
    Log To Console  This needs to be implemented
    ${page_url}=  Get Location
    Location Should Contain  ${xmc_network_url_suffix}
    Page Should Contain Element  ${xmc_network_devices_tab}
