*** Settings ***
Library    SeleniumLibrary
Variables  ../XMC_Variables/PageLocators.py

Documentation    Keywords specific to the navigation side bar in XMC.

*** Keywords ***
XMC Navigate to Network Page
    Click Element  ${xmc_nav_network_button}

XMC Navigate to Alarms & Events Page
    Click Element  ${xmc_nav_alarmsevents_button}

XMC Navigate to Control Page
    Click Element  ${xmc_nav_control_button}

XMC Navigate to Analytics Page
    Click Element  ${xmc_nav_analytics_button}

XMC Navigate to Wireless Page
    Click Element  ${xmc_nav_wireless_button}

XMC Navigate to Compliance Page
    Click Element  ${xmc_nav_compliance_button}

XMC Navigate to Reports Page
    Click Element  ${xmc_nav_reports_button}

XMC Navigate to Tasks Page
    Click Element  ${xmc_nav_tasks_button}

XMC Navigate to Administration Page
    Click Element  ${xmc_nav_admin_button}

XMC Navigate to Connect Page
    Click Element  ${xmc_nav_connect_button}


XMC Confirm Network Page Loaded
    ${page_url}=  Get Location
    Location Should Contain  ${xmc_network_url_suffix}
    Page Should Contain Element  ${xmc_network_devices_tab}
