*** Settings ***
Library  Collections
Library  RequestsLibrary
Resource  ../Resources/AllResources.robot

Documentation   Regression test for JUS-478: Usergroups -> permissions apis need to be updated to use strings for siteIds.

Suite Setup    Set Access Token

*** Variables ***
&{headers}=       Content-Type=application/json
${group_id}       -6588830668651339356

#*** Keywords ***
#Set Access Token
#    &{header}=  Create Dictionary  Content-Type=application/json
#    Create Session  alias=justice   url=${JUS_URL}  headers=${header}
#    &{data}=    Create Dictionary   userId=${JUS_USERNAME}  password=${JUS_PASSWORD}  grant_type=password  scope=Extreme Networks
#    ${resp}=     Post Request  justice  /auth/api/login    json=${data}
#    Should Be Equal As Strings  ${resp.status_code}  200
#    ${jsondata}=  To Json  ${resp.content}
#    ${access_token}=  Collections.Get From Dictionary  ${jsondata}  access_token
#    Set Suite Variable  ${access_token}

*** Test Cases ***
Confirm Get User Groups API Success
#    Confirm Get Request Successful  /v1/api/settings/userGroups
    &{auth}=  Create Dictionary  Authorization  Bearer ${access_token}
    Create Session  alias=justice  url=${JUS_URL}
    ${resp}=  Get Request  justice  /v1/api/settings/userGroups  ${auth}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${jsondata}=  To Json  ${resp.content}
    Log To Console  ${jsondata}
#    ${group_id}=  Collections.Get From Dictionary  ${jsondata}  Custom Group
    Log To Console  Group: ${group_id}
    ${resp}=  Post Request  justice  /v1/api/settings/userGroups/${group_id}/permissions  ${auth}
    Log To Console  ${resp}