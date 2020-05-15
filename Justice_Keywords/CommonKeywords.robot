*** Settings ***
Library    SeleniumLibrary
Library    SSHLibrary
Library    OperatingSystem
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
    Open Browser  ${url}  ${browser}  options=add_argument("--ignore-certificate-errors")  ff_profile_dir=${FF_PROFILE}
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

Confirm Page Does Not Contain Text
    [Arguments]  ${text}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain  ${text}
    Set Selenium Implicit Wait  ${orig_wait}


Open SSH Connection and Log In
    [Arguments]  ${host}  ${user}  ${pwd}
    Open Connection   ${host}
    ${login_output}=  SSHLibrary.Login   ${user}  ${pwd}
    Log               ${login_output}
    [return]  ${login_output}

Close SSH Connection
    Close All Connections

Write Command and Log Output
    [Arguments]  ${prompt}  ${command}
    Set Client Configuration  prompt=${prompt}
    Write  ${command}
    ${output}=  Read Until Prompt
    Log To Console  ${output}


SSH To Justice Server
    [Arguments]  ${host}  ${user}  ${pwd}
    ${login_output}=  Open SSH Connection and Log In  ${host}  ${user}  ${pwd}
    Should Contain    ${login_output}  Justice Server Appliance

Disconnect From RabbitMQ
    [Arguments]  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
    SSH To Justice Server  ${jus_ip}  ${jus_user}  ${jus_pwd}

    Write Command and Log Output  ${prompt}  iptables -I FORWARD -s ${xmc_ip} -j DROP
    Write Command and Log Output  ${prompt}  iptables --list

    Write Command and Log Output  ${prompt}  docker exec -i -t justice_rabbitmq_1 rabbitmqctl close_connection "`docker exec -i -t justice_rabbitmq_1 rabbitmqctl list_connections pid peer_host | grep ${xmc_ip} | awk '{print $1}'`" closing

    Write Command and Log Output  ${prompt}  echo "IP Tables set to block XMC, and XMC disconnected from RabbitMQ; sleeping 60 seconds."
    sleep  60 seconds
    Close SSH Connection

Reconnect To RabbitMQ
    [Arguments]  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${xmc_ip}  ${prompt}
    SSH To Justice Server  ${jus_ip}  ${jus_user}  ${jus_pwd}

    Write Command and Log Output  ${prompt}  iptables -D FORWARD -s ${xmc_ip} -j DROP
    Write Command and Log Output  ${prompt}  iptables --list

    Close SSH Connection


Wait Until Download Completes
    FOR  ${index}  IN RANGE  1  100
        ${download_complete}=  Run Keyword And Return Status  Page Should Contain Text  Download Complete
        Exit For Loop If  ${download_complete} == True
    END


Confirm File Exists
    [Arguments]  ${dir}  ${filename}
    Wait Until Created  ${dir}${/}${filename}
    OperatingSystem.File Should Exist   ${dir}${/}${filename}

Remove File
    [Arguments]  ${dir}  ${filename}
    OperatingSystem.File Should Exist      ${dir}${/}${filename}
    OperatingSystem.Remove File            ${dir}${/}${filename}
    Wait Until Removed                     ${dir}${/}${filename}
    OperatingSystem.File Should Not Exist  ${dir}${/}${filename}


Confirm File Contains Value
    [Arguments]  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${file}  ${value}
    SSH To Justice Server  ${jus_ip}  ${jus_user}  ${jus_pwd}

    ${output}=  Execute Command  grep ${value} ${file}
    Log  ${output}
    Should Contain  ${output}  ${value}

    Close SSH Connection

Confirm File Does Not Contain Value
    [Arguments]  ${jus_ip}  ${jus_user}  ${jus_pwd}  ${file}  ${value}
    SSH To Justice Server  ${jus_ip}  ${jus_user}  ${jus_pwd}

    ${output}=  Execute Command  grep ${value} ${file}
    Log  ${output}
    Should Not Contain  ${output}  ${value}

    Close SSH Connection
