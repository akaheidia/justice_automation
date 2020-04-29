*** Settings ***
Library  Collections
Library  RequestsLibrary
Resource  ../Resources/AllResources.robot

Documentation   Regression test for JUS-478: Usergroups -> permissions apis need to be updated to use strings for siteIds.

Suite Setup    Set Access Token

*** Variables ***
&{headers}=       Content-Type=application/json

*** Test Cases ***
Confirm Get User Groups API Success
    &{auth}=  Create Dictionary  Authorization  Bearer ${access_token}
    Set Suite Variable  ${auth}

    Create Session  alias=justice  url=${JUS_URL}
    ${resp}=  Get Request  justice  /v1/api/settings/userGroups  ${auth}
    Should Be Equal As Strings  ${resp.status_code}  200

    # Extract the Group ID for the next test
    ${jsondata}=  To Json  ${resp.content}
    Log  ${jsondata}
    ${firstentry}=  Get From List  ${jsondata}  0
    Log  First Entry: ${firstentry}
    ${group_id}=  Collections.Get From Dictionary  ${firstentry}  userGroupId
    Log  Group ID: ${group_id}
    Set Suite Variable  ${group_id}

Confirm Get User Groups Permissions Success
    ${resp}=  Get Request  justice  /v1/api/settings/userGroups/${group_id}/permissions  ${auth}
    Log  ${resp.content}
    Log  ${resp.status_code}
    Should Be Equal As Strings  ${resp.status_code}  200
