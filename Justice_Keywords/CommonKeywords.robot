*** Settings ***
Library    SeleniumLibrary
Library    SSHLibrary
Resource   ./LoginKeywords.robot
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords useful to all tests.

*** Keywords ***
Open Browser and Log In
    [Arguments]  ${url}  ${browser}  ${user}  ${pwd}
    Open and Maximize Browser  ${url}  ${browser}
    Log In  ${user}  ${pwd}

Log Out and Close Browser
    Log Out
    Close Browser

Open and Maximize Browser
    [Arguments]  ${url}  ${browser}
    Open Browser  ${url}  ${browser}  options=add_argument("--ignore-certificate-errors")
    Set Browser Implicit Wait  10
    Maximize Browser Window

Log In
    [Arguments]  ${user}  ${pwd}
    Enter User Name  ${user}
    Enter Password   ${pwd}
    Click Login

Log Out
    Page Should Contain Element  ${nav_user_icon}
    Click Element  ${nav_user_icon}
    Page Should Contain Element  ${nav_user_signout_menu}
    Click Element  ${nav_user_signout_menu}

Print Element Count
    [Arguments]  ${element}
    ${count}=  Get Element Count  ${element}
    Log To Console  Number of Elements: ${count}

Open SSH Connection and Log In
    [Arguments]  ${host}  ${user}  ${pwd}
    Open Connection   ${host}
    ${login_output}=  SSHLibrary.Login   ${user}  ${pwd}
    Log               ${login_output}
    [return]  ${login_output}

Close SSH Connection
    Close All Connections

Confirm Page Does Not Contain Text
    [Arguments]  ${text}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain  ${text}
    Set Selenium Implicit Wait  ${orig_wait}
