*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Analytics: Quarterly Analytics Summary Report page.

*** Keywords ***
Wait For Analytics Quarterly Analytics Summary Report Page To Load
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='q1']
    Select Frame  xpath://iframe[@id='top_n']

    Wait Until Page Contains Element  ${reports_top_applications_by_clients_drilldown}  timeout=10 seconds

    Unselect Frame
    Unselect Frame
    Unselect Frame


Confirm Analytics Quarterly Analytics Summary Report Page Contains KPI Panel Quarter 1
    [Arguments]  ${title}
    Confirm Analytics Quarterly Analytics Summary Report Page Contains KPI Panel  ${title}  q1

Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel Quarter 1
    [Arguments]  ${title}
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel  ${title}  q1

Confirm Analytics Quarterly Analytics Summary Report Page KPI Panel Contains Message Quarter 1
    [Arguments]  ${msg}
    Confirm Analytics Quarterly Analytics Summary Report Page KPI Panel Contains Message  ${msg}  q1

Confirm Analytics Quarterly Analytics Summary Report Page KPI Panel Does Not Contain Message Quarter 1
    [Arguments]  ${msg}
    Confirm Analytics Quarterly Analytics Summary Report Page KPI Panel Does Not Contain Message  ${msg}  q1

Confirm Analytics Quarterly Analytics Summary Report Page Top N Panel Contains Message Quarter 1
    [Arguments]  ${msg}
    Confirm Analytics Quarterly Analytics Summary Report Page Top N Panel Contains Message  ${msg}  q1

Confirm Analytics Quarterly Analytics Summary Report Page Top N Panel Does Not Contain Message Quarter 1
    [Arguments]  ${msg}
    Confirm Analytics Quarterly Analytics Summary Report Page Top N Panel Does Not Contain Message  ${msg}  q1


Confirm Analytics Quarterly Analytics Summary Report Page Contains KPI Panel Quarter 2
    [Arguments]  ${title}
    Confirm Analytics Quarterly Analytics Summary Report Page Contains KPI Panel  ${title}  q2

Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel Quarter 2
    [Arguments]  ${title}
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel  ${title}  q2

Confirm Analytics Quarterly Analytics Summary Report Page KPI Panel Contains Message Quarter 2
    [Arguments]  ${msg}
    Confirm Analytics Quarterly Analytics Summary Report Page KPI Panel Contains Message  ${msg}  q2

Confirm Analytics Quarterly Analytics Summary Report Page KPI Panel Does Not Contain Message Quarter 2
    [Arguments]  ${msg}
    Confirm Analytics Quarterly Analytics Summary Report Page KPI Panel Does Not Contain Message  ${msg}  q2

Confirm Analytics Quarterly Analytics Summary Report Page Top N Panel Contains Message Quarter 2
    [Arguments]  ${msg}
    Confirm Analytics Quarterly Analytics Summary Report Page Top N Panel Contains Message  ${msg}  q2

Confirm Analytics Quarterly Analytics Summary Report Page Top N Panel Does Not Contain Message Quarter 2
    [Arguments]  ${msg}
    Confirm Analytics Quarterly Analytics Summary Report Page Top N Panel Does Not Contain Message  ${msg}  q2


Confirm Analytics Quarterly Analytics Summary Report Page Contains KPI Panel Quarter 3
    [Arguments]  ${title}
    Confirm Analytics Quarterly Analytics Summary Report Page Contains KPI Panel  ${title}  q3

Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel Quarter 3
    [Arguments]  ${title}
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel  ${title}  q3

Confirm Analytics Quarterly Analytics Summary Report Page KPI Panel Contains Message Quarter 3
    [Arguments]  ${msg}
    Confirm Analytics Quarterly Analytics Summary Report Page KPI Panel Contains Message  ${msg}  q3

Confirm Analytics Quarterly Analytics Summary Report Page KPI Panel Does Not Contain Message Quarter 3
    [Arguments]  ${msg}
    Confirm Analytics Quarterly Analytics Summary Report Page KPI Panel Does Not Contain Message  ${msg}  q3

Confirm Analytics Quarterly Analytics Summary Report Page Top N Panel Contains Message Quarter 3
    [Arguments]  ${msg}
    Confirm Analytics Quarterly Analytics Summary Report Page Top N Panel Contains Message  ${msg}  q3

Confirm Analytics Quarterly Analytics Summary Report Page Top N Panel Does Not Contain Message Quarter 3
    [Arguments]  ${msg}
    Confirm Analytics Quarterly Analytics Summary Report Page Top N Panel Does Not Contain Message  ${msg}  q3


Confirm Analytics Quarterly Analytics Summary Report Page Contains KPI Panel Quarter 4
    [Arguments]  ${title}
    Confirm Analytics Quarterly Analytics Summary Report Page Contains KPI Panel  ${title}  q4

Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel Quarter 4
    [Arguments]  ${title}
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel  ${title}  q4

Confirm Analytics Quarterly Analytics Summary Report Page KPI Panel Contains Message Quarter 4
    [Arguments]  ${msg}
    Confirm Analytics Quarterly Analytics Summary Report Page KPI Panel Contains Message  ${msg}  q4

Confirm Analytics Quarterly Analytics Summary Report Page KPI Panel Does Not Contain Message Quarter 4
    [Arguments]  ${msg}
    Confirm Analytics Quarterly Analytics Summary Report Page KPI Panel Does Not Contain Message  ${msg}  q4

Confirm Analytics Quarterly Analytics Summary Report Page Top N Panel Contains Message Quarter 4
    [Arguments]  ${msg}
    Confirm Analytics Quarterly Analytics Summary Report Page Top N Panel Contains Message  ${msg}  q4

Confirm Analytics Quarterly Analytics Summary Report Page Top N Panel Does Not Contain Message Quarter 4
    [Arguments]  ${msg}
    Confirm Analytics Quarterly Analytics Summary Report Page Top N Panel Does Not Contain Message  ${msg}  q4


Confirm Analytics Quarterly Analytics Summary Report Page Contains KPI Panel
    [Arguments]  ${title}  ${quarter}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='${quarter}']
    Select Frame  xpath://iframe[@id='kpi']

    Page Should Contain Element  xpath://span[contains(text(), '${title}')]

    Unselect Frame
    Unselect Frame
    Unselect Frame

Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel
    [Arguments]  ${title}  ${quarter}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='${quarter}']
    Select Frame  xpath://iframe[@id='top_n']

    Page Should Contain Element  xpath://h4[contains(text(), '${title}')]

    Unselect Frame
    Unselect Frame
    Unselect Frame


Confirm Analytics Quarterly Analytics Summary Report Page KPI Panel Contains Message
    [Arguments]  ${msg}  ${quarter}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='${quarter}']
    Select Frame  xpath://iframe[@id='kpi']

    Page Should Contain Element  xpath://*[contains(text(), '${msg}')]

    Unselect Frame
    Unselect Frame
    Unselect Frame

Confirm Analytics Quarterly Analytics Summary Report Page KPI Panel Does Not Contain Message
    [Arguments]  ${msg}  ${quarter}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='${quarter}']
    Select Frame  xpath://iframe[@id='kpi']

    Page Should Not Contain  ${msg}
    Page Should Not Contain Element  xpath://*[contains(text(), '${msg}')]

    Unselect Frame
    Unselect Frame
    Unselect Frame
    Set Selenium Implicit Wait  ${orig_wait}


Confirm Analytics Quarterly Analytics Summary Report Page Top N Panel Contains Message
    [Arguments]  ${msg}  ${quarter}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='${quarter}']
    Select Frame  xpath://iframe[@id='top_n']

    Page Should Contain Element  xpath://*[contains(text(), '${msg}')]

    Unselect Frame
    Unselect Frame
    Unselect Frame

Confirm Analytics Quarterly Analytics Summary Report Page Top N Panel Does Not Contain Message
    [Arguments]  ${msg}  ${quarter}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='${quarter}']
    Select Frame  xpath://iframe[@id='top_n']

    Page Should Not Contain  ${msg}
    Page Should Not Contain Element  xpath://*[contains(text(), '${msg}')]

    Unselect Frame
    Unselect Frame
    Unselect Frame
    Set Selenium Implicit Wait  ${orig_wait}


Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    sleep  1 second
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_analytics_quarterly_summary_1st_quarter}
    Unselect Frame

Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    sleep  1 second
    Select Frame  xpath://iframe
    Page Should Not Contain Element  ${reports_analytics_quarterly_summary_1st_quarter}
    Unselect Frame
    Set Selenium Implicit Wait  ${orig_wait}


Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    sleep  1 second
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_analytics_quarterly_summary_2nd_quarter}
    Unselect Frame

Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    sleep  1 second
    Select Frame  xpath://iframe
    Page Should Not Contain Element  ${reports_analytics_quarterly_summary_2nd_quarter}
    Unselect Frame
    Set Selenium Implicit Wait  ${orig_wait}


Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    sleep  1 second
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_analytics_quarterly_summary_3rd_quarter}
    Unselect Frame

Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    sleep  1 second
    Select Frame  xpath://iframe
    Page Should Not Contain Element  ${reports_analytics_quarterly_summary_3rd_quarter}
    Unselect Frame
    Set Selenium Implicit Wait  ${orig_wait}


Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter
    sleep  1 second
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_analytics_quarterly_summary_4th_quarter}
    Unselect Frame

Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    sleep  1 second
    Select Frame  xpath://iframe
    Page Should Not Contain Element  ${reports_analytics_quarterly_summary_4th_quarter}
    Unselect Frame
    Set Selenium Implicit Wait  ${orig_wait}
