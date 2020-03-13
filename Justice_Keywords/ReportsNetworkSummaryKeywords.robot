*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Network Summary Report page.

*** Keywords ***

Click Device Availability Drilldown
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='device_availability']

    Page Should Contain Element  ${reports_device_availability_drilldown}
    Click Element  ${reports_device_availability_drilldown}

    Unselect Frame
    Unselect Frame

Click Site Availability Drilldown
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='site_availability']

    Page Should Contain Element  ${reports_site_availability_drilldown}
    Click Element  ${reports_site_availability_drilldown}

    Unselect Frame
    Unselect Frame

Click Top APs By Clients Drilldown
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='ap_clients']

    Page Should Contain Element  ${reports_top_aps_by_clients_drilldown}
    Click Element  ${reports_top_aps_by_clients_drilldown}

    Unselect Frame
    Unselect Frame

Click Top APs By Bandwidth Drilldown
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='ap_bandwidth']

    Page Should Contain Element  ${reports_top_aps_by_bandwidth_drilldown}
    Click Element  ${reports_top_aps_by_bandwidth_drilldown}

    Unselect Frame
    Unselect Frame

Click Port Utilization Drilldown
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='port_utilization']

    Page Should Contain Element  ${reports_port_utilization_drilldown}
    Click Element  ${reports_port_utilization_drilldown}

    Unselect Frame
    Unselect Frame

Click Port Error Drilldown
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='port_error']

    Page Should Contain Element  ${reports_port_error_drilldown}
    Click Element  ${reports_port_error_drilldown}

    Unselect Frame
    Unselect Frame

Click CPU Utilization Drilldown
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='cpu_utilization']

    Page Should Contain Element  ${reports_cpu_utilization_drilldown}
    Click Element  ${reports_cpu_utilization_drilldown}

    Unselect Frame
    Unselect Frame

Click Memory Utilization Drilldown
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='memory_utilization']

    Page Should Contain Element  ${reports_memory_utilization_drilldown}
    Click Element  ${reports_memory_utilization_drilldown}

    Unselect Frame
    Unselect Frame
