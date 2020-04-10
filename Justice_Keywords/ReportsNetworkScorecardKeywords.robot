*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Network Scorecard Report page.

*** Keywords ***

Wait For Network Scorecard Report Page To Load
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='device_availability']

    Wait Until Page Contains Element  ${reports_device_availability_drilldown}  timeout=10 seconds

    Unselect Frame
    Unselect Frame


Click Network Scorecard Site Availability Drilldown
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='availability']

    Page Should Contain Element  ${reports_site_availability_drilldown}
    Click Element  ${reports_site_availability_drilldown}

    Unselect Frame
    Unselect Frame

Click Network Scorecard Site CPU Utilization Drilldown
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='cpu']

    Page Should Contain Element  ${reports_site_cpu_util_drilldown}
    Click Element  ${reports_site_cpu_util_drilldown}

    Unselect Frame
    Unselect Frame

Click Network Scorecard Site Memory Utilization Drilldown
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='memory']

    Page Should Contain Element  ${reports_site_memory_util_drilldown}
    Click Element  ${reports_site_memory_util_drilldown}

    Unselect Frame
    Unselect Frame

Click Network Scorecard Total Clients Drilldown
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='clients']

    Page Should Contain Element  ${reports_total_clients_drilldown}
    Click Element  ${reports_total_clients_drilldown}

    Unselect Frame
    Unselect Frame

Click Network Scorecard Site Port Utilization Drilldown
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='port_utilization']

    Page Should Contain Element  ${reports_site_port_util_drilldown}
    Click Element  ${reports_site_port_util_drilldown}

    Unselect Frame
    Unselect Frame

Click Network Scorecard Site Port Error Drilldown
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='port_error']

    Page Should Contain Element  ${reports_site_port_error_drilldown}
    Click Element  ${reports_site_port_error_drilldown}

    Unselect Frame
    Unselect Frame

Click Network Scorecard Site Wireless Volume Drilldown
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='volume']

    Page Should Contain Element  ${reports_site_wireless_volume_drilldown}
    Click Element  ${reports_site_wireless_volume_drilldown}

    Unselect Frame
    Unselect Frame

Click Network Scorecard Tracked Application Response Time Drilldown
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='app_response']

    Page Should Contain Element  ${reports_tracked_app_resp_time_drilldown}
    Click Element  ${reports_tracked_app_resp_time_drilldown}

    Unselect Frame
    Unselect Frame


Click Network Scorecard Site Availability Donut
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='availability']

    Page Should Contain Element  ${reports_site_availability_donut}
    Click Element  ${reports_site_availability_donut}

    Unselect Frame
    Unselect Frame



Confirm Network Scorecard Tracked Application Response Time Has Value
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='app_response']

    Page Should Contain Element  ${reports_donut_value}
    Element Text Should Not Be  ${reports_donut_value}  ${EMPTY}

    Unselect Frame
    Unselect Frame
