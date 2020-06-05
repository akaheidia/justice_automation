*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Network Summary Report page.

*** Keywords ***

Wait For Network Summary Report Page To Load
    sleep  10 seconds
    Wait Until Page Contains Element  xpath://iframe
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  xpath://iframe[@id='device_availability']
    Select Frame  xpath://iframe[@id='device_availability']

    Wait Until Page Contains Element  ${reports_device_availability_drilldown}  timeout=10 seconds

    Unselect Frame
    Unselect Frame

Click Device Availability Drilldown
    sleep  2 seconds
    Wait Until Page Contains Element  xpath://iframe
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  xpath://iframe[@id='device_availability']
    Select Frame  xpath://iframe[@id='device_availability']

    Wait Until Page Contains Element  ${reports_device_availability_drilldown}
    Click Element  ${reports_device_availability_drilldown}

    Unselect Frame
    Unselect Frame

Click Site Availability Drilldown
    sleep  2 seconds
    Wait Until Page Contains Element  xpath://iframe
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  xpath://iframe[@id='site_availability']
    Select Frame  xpath://iframe[@id='site_availability']

    Wait Until Page Contains Element  ${reports_site_availability_drilldown}
    Click Element  ${reports_site_availability_drilldown}

    Unselect Frame
    Unselect Frame

Click Top APs by Clients Drilldown
    sleep  2 seconds
    Wait Until Page Contains Element  xpath://iframe
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  xpath://iframe[@id='ap_clients']
    Select Frame  xpath://iframe[@id='ap_clients']

    Wait Until Page Contains Element  ${reports_top_aps_by_clients_drilldown}
    Click Element  ${reports_top_aps_by_clients_drilldown}

    Unselect Frame
    Unselect Frame

Click Top APs by Bandwidth Drilldown
    sleep  2 seconds
    Wait Until Page Contains Element  xpath://iframe
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  xpath://iframe[@id='ap_bandwidth']
    Select Frame  xpath://iframe[@id='ap_bandwidth']

    Wait Until Page Contains Element  ${reports_top_aps_by_bandwidth_drilldown}
    Click Element  ${reports_top_aps_by_bandwidth_drilldown}

    Unselect Frame
    Unselect Frame

Click Port Utilization Drilldown
    sleep  2 seconds
    Wait Until Page Contains Element  xpath://iframe
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  xpath://iframe[@id='port_utilization']
    Select Frame  xpath://iframe[@id='port_utilization']

    Wait Until Page Contains Element  ${reports_port_utilization_drilldown}
    Click Element  ${reports_port_utilization_drilldown}

    Unselect Frame
    Unselect Frame

Click Port Error Drilldown
    sleep  2 seconds
    Wait Until Page Contains Element  xpath://iframe
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  xpath://iframe[@id='port_error']
    Select Frame  xpath://iframe[@id='port_error']

    Wait Until Page Contains Element  ${reports_port_error_drilldown}
    Click Element  ${reports_port_error_drilldown}

    Unselect Frame
    Unselect Frame

Click End Systems Drilldown
    sleep  2 seconds
    Wait Until Page Contains Element  xpath://iframe
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  xpath://iframe[@id='endsystems']
    Select Frame  xpath://iframe[@id='endsystems']

    Wait Until Page Contains Element  ${reports_endsystems_drilldown}
    Click Element  ${reports_endsystems_drilldown}

    Unselect Frame
    Unselect Frame

Click End System Pie Slice Drilldown
    [Arguments]  ${value}
    sleep  2 seconds
    Wait Until Page Contains Element  xpath://iframe
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  xpath://iframe[@id='endsystems']
    Select Frame  xpath://iframe[@id='endsystems']

    Wait Until Page Contains Element  xpath://*[name()='tspan' and text()='${value}']
#    Scroll Element Into View  xpath://*[name()='tspan' and text()='${value}']
#    Wait Until Page Contains Element  xpath://*[name()='tspan' and text()='${value}']  timeout=5 seconds
    Click Element  xpath://*[name()='tspan' and text()='${value}']

    Unselect Frame
    Unselect Frame

Click CPU Utilization Drilldown
    sleep  2 seconds
    Wait Until Page Contains Element  xpath://iframe
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  xpath://iframe[@id='cpu_utilization']
    Select Frame  xpath://iframe[@id='cpu_utilization']

    Wait Until Page Contains Element  ${reports_cpu_utilization_drilldown}
    Click Element  ${reports_cpu_utilization_drilldown}

    Unselect Frame
    Unselect Frame

Click Memory Utilization Drilldown
    sleep  2 seconds
    Wait Until Page Contains Element  xpath://iframe
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  xpath://iframe[@id='memory_utilization']
    Select Frame  xpath://iframe[@id='memory_utilization']

    Wait Until Page Contains Element  ${reports_memory_utilization_drilldown}
    Click Element  ${reports_memory_utilization_drilldown}

    Unselect Frame
    Unselect Frame


Click Device Availability Device Drilldown
    [Arguments]  ${ip}
    sleep  2 seconds
    Wait Until Page Contains Element  xpath://iframe
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  xpath://iframe[@id='device_availability']
    Select Frame  xpath://iframe[@id='device_availability']

    Wait Until Page Contains Element  xpath://a[contains(text(),'${ip}')]
    Click Element  xpath://a[contains(text(),'${ip}')]

    Unselect Frame
    Unselect Frame

Click Site Availability Site Drilldown
    [Arguments]  ${site}
    sleep  2 seconds
    Wait Until Page Contains Element  xpath://iframe
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  xpath://iframe[@id='site_availability']
    Select Frame  xpath://iframe[@id='site_availability']

    Wait Until Page Contains Element  xpath://a[contains(text(),'${site}')]
    Click Element  xpath://a[contains(text(),'${site}')]

    Unselect Frame
    Unselect Frame


Confirm Device Availability Panel Has Data
    sleep  2 seconds
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='device_availability']

    Page Should Not Contain Element  ${reports_chart_no_data}

    Unselect Frame
    Unselect Frame
    Set Selenium Implicit Wait  ${orig_wait}

Confirm Device Availability Panel Has No Data
    sleep  2 seconds
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='device_availability']

    Page Should Contain Element  ${reports_chart_no_data}

    Unselect Frame
    Unselect Frame

Confirm Site Availability Panel Has Data
    sleep  2 seconds
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='site_availability']

    Page Should Not Contain Element  ${reports_chart_no_data}

    Unselect Frame
    Unselect Frame
    Set Selenium Implicit Wait  ${orig_wait}

Confirm Site Availability Panel Has No Data
    sleep  2 seconds
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='site_availability']

    Page Should Contain Element  ${reports_chart_no_data}

    Unselect Frame
    Unselect Frame

Confirm Top APs by Clients Panel Has Data
    sleep  2 seconds
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='ap_clients']

    Page Should Not Contain Element  ${reports_chart_no_data}

    Unselect Frame
    Unselect Frame
    Set Selenium Implicit Wait  ${orig_wait}

Confirm Top APs by Bandwidth Panel Has Data
    sleep  2 seconds
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='ap_bandwidth']

    Page Should Not Contain Element  ${reports_chart_no_data}

    Unselect Frame
    Unselect Frame
    Set Selenium Implicit Wait  ${orig_wait}

Confirm End Systems Panel Has Data
    sleep  2 seconds
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='endsystems']

    Page Should Not Contain Element  ${reports_chart_no_data}

    Unselect Frame
    Unselect Frame
    Set Selenium Implicit Wait  ${orig_wait}


Confirm Site Availability Site Label
    [Arguments]  ${site}
    sleep  2 seconds
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='site_availability']

    Page Should Contain Element  xpath://a[contains(text(),'${site}')]

    Unselect Frame
    Unselect Frame
