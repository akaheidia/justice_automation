*** Settings ***
Library    SeleniumLibrary
Library    SSHLibrary
Resource   ../Justice_Keywords/CommonKeywords.robot
Resource   ./LoginKeywords.robot
Variables  ../XMC_Variables/PageLocators.py

Documentation    Keywords useful to all XMC tests.

*** Keywords ***
XMC Open Browser and Log In
    [Arguments]  ${url}  ${browser}  ${user}  ${pwd}
    Open and Maximize Browser  ${url}  ${browser}
    XMC Log In  ${user}  ${pwd}

XMC Log Out and Close Browser
    XMC Log Out
    Close Browser

XMC Log In
    [Arguments]  ${user}  ${pwd}
    XMC Enter User Name  ${user}
    XMC Enter Password   ${pwd}
    XMC Click Login
    XMC Confirm Successful Login

XMC Log Out
    Page Should Contain Element  ${xmc_main_context_icon}
    Click Element  ${xmc_main_context_icon}
    Page Should Contain Element  ${xmc_main_context_icon_logout_menu}
    Click Element  ${xmc_main_context_icon_logout_menu}
    XMC Confirm Successful Logout

XMC Confirm Page Does Not Contain Text
    [Arguments]  ${text}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain  ${text}
    Set Selenium Implicit Wait  ${orig_wait}

XMC Confirm Page Contains Text
    [Arguments]  ${text}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Contain  ${text}
    Set Selenium Implicit Wait  ${orig_wait}


SSH To XMC Server
    [Arguments]  ${host}  ${user}  ${pwd}
    ${login_output}=  Open SSH Connection and Log In  ${host}  ${user}  ${pwd}
    Should Contain    ${login_output}  Management Center

XMC Confirm Server Log Message Output
    [Arguments]  ${ip}  ${user}  ${pwd}  ${server_log}  ${message}
    SSH To XMC Server  ${ip}  ${user}  ${pwd}

    Write  tail -n 50 -f ${server_log}
    ${output}=  Read Until  ${message}
    Should Contain  ${output}  ${message}

    Close SSH Connection

XMC Confirm Server Log Contains Message
    [Arguments]  ${ip}  ${user}  ${pwd}  ${server_log}  ${message}
    SSH To XMC Server  ${ip}  ${user}  ${pwd}

    ${output}=  Execute Command  grep ${message} ${server_log}
    Log  ${output}
    Should Contain  ${output}  ${message}

    Close SSH Connection

XMC Confirm Server Log Does Not Contain Message
    [Arguments]  ${ip}  ${user}  ${pwd}  ${server_log}  ${message}
    SSH To XMC Server  ${ip}  ${user}  ${pwd}

    ${output}=  Execute Command  grep ${message} ${server_log}
    Log  ${output}
    Should Not Contain  ${output}  ${message}

    Close SSH Connection
