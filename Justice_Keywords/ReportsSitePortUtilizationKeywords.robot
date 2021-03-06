*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Site Port Utilization Report page.

*** Keywords ***

Confirm Site Port Utilization Report Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='statistic']

    Page Should Contain Element  ${reports_site_port_utilization_page_title}

    Unselect Frame
    Unselect Frame

Site Port Utilization Drill Into Site
    [Arguments]  ${site}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='statistic']

    Click Element  xpath://span[contains(text(), '${site}')]/../a[contains(@href, 'Utilization')]/span[not(@class='hidden')]/..

    Unselect Frame
    Unselect Frame

Site Port Utilization Drill Into Device
    [Arguments]  ${ip}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='statistic']

    sleep  1 second
    Click Element  xpath://a//span[contains(text(), '${ip}')]
    Unselect Frame
    Unselect Frame

Site Port Utilization Drill Into Port
    [Arguments]  ${port}
    sleep  2 seconds
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='statistic']

    sleep  1 second
    Click Element  xpath://a//span[contains(text(), '${port}')]
    Unselect Frame
    Unselect Frame
