*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to testing APIs.

*** Variables ***
&{headers}=         Content-Type=application/json

*** Keywords ***
Set Access Token
    &{header}=  Create Dictionary  Content-Type=application/json
    Create Session  alias=justice   url=${URL}:${AUTH_PORT}  headers=${header}
    &{data}=    Create Dictionary   userId=${USERNAME}  password=${PASSWORD}  grant_type=password  scope=Extreme Networks
    ${resp}=     Post Request  justice  /auth/api/login    json=${data}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${jsondata}=  To Json  ${resp.content}
    ${access_token}=  Collections.Get From Dictionary  ${jsondata}  access_token
    Set Suite Variable  ${access_token}

Confirm Get Request Successful
    [Arguments]    ${api}
    &{auth}=  Create Dictionary  Authorization  Bearer ${access_token}
    Create Session  alias=justice  url=${URL}:${SAAS_ONE_FUNC_PORT}
    ${resp}=  Get Request  justice  ${api}  ${auth}
    Should Be Equal As Strings  ${resp.status_code}  200

Confirm Post Request Successful
    [Arguments]    ${api}  ${json_string}
    &{postheader}=  Create Dictionary  Content-Type=application/json  Authorization=Bearer ${access_token}
    Create Session  alias=justice  url=${URL}:${SAAS_ONE_FUNC_PORT}
    ${body}=  To Json    ${json_string}
    ${resp}=  Post Request  justice  ${api}  json=${body}  headers=${postheader}
    Should Be Equal As Strings  ${resp.status_code}  200


Get All Sites
    &{auth}=  Create Dictionary  Authorization  Bearer ${access_token}
    Create Session  alias=justice  url=${URL}:${SAAS_ONE_FUNC_PORT}
    ${resp}=  Get Request  justice  /v1/api/allSites  ${auth}
    Should Be Equal As Strings  ${resp.status_code}  200

Get Alarms Summary
    &{auth}=  Create Dictionary  Authorization  Bearer ${access_token}
    Create Session  alias=justice  url=${URL}:${SAAS_ONE_FUNC_PORT}
    ${resp}=  Get Request  justice  /v1/api/alarms/summary  ${auth}
    Should Be Equal As Strings  ${resp.status_code}  200

Get All Domain Nodes
    &{auth}=  Create Dictionary  Authorization  Bearer ${access_token}
    Create Session  alias=justice  url=${URL}:${SAAS_ONE_FUNC_PORT}
    ${resp}=  Get Request  justice  /v1/api/domainNodes  ${auth}
    Should Be Equal As Strings  ${resp.status_code}  200

Get Database Password
    &{auth}=  Create Dictionary  Authorization  Bearer ${access_token}
    Create Session  alias=justice  url=${URL}:${SAAS_ONE_FUNC_PORT}
    ${resp}=  Get Request  justice  /v1/api/settings/security  ${auth}
    Should Be Equal As Strings  ${resp.status_code}  200

Get All Tags
    &{auth}=  Create Dictionary  Authorization  Bearer ${access_token}
    Create Session  alias=justice  url=${URL}:${SAAS_ONE_FUNC_PORT}
    ${resp}=  Get Request  justice  /v1/api/tags  ${auth}

    # Validations
    Should Be Equal As Strings  ${resp.status_code}  200
    ${resp_body}=  Convert To String  ${resp.content}
    Should Contain  ${resp_body}  tagId

Get Devices
    &{postheader}=  Create Dictionary  Content-Type=application/json  Authorization=Bearer ${access_token}
    Create Session  alias=justice  url=${URL}:${SAAS_ONE_FUNC_PORT}
    ${json_string}=  catenate
    ...  {
    ...    "paginator": {
    ...      "size": 20,
    ...      "page": 0
    ...    }
    ...  }
    ${body}=  To Json    ${json_string}
    ${resp}=  Post Request  justice  /v1/api/devices  json=${body}  headers=${postheader}
    Should Be Equal As Strings  ${resp.status_code}  200

Get Endpoints
    &{postheader}=  Create Dictionary  Content-Type=application/json  Authorization=Bearer ${access_token}
    Create Session  alias=justice  url=${URL}:${SAAS_ONE_FUNC_PORT}
    ${json_string}=  catenate
    ...  {
    ...    "paginator": {
    ...      "size": 20,
    ...      "page": 0
    ...    }
    ...  }
    ${body}=  To Json    ${json_string}
    ${resp}=  Post Request  justice  /v1/api/endpoints  json=${body}  headers=${postheader}
    Should Be Equal As Strings  ${resp.status_code}  200

Get Events
    &{postheader}=  Create Dictionary  Content-Type=application/json  Authorization=Bearer ${access_token}
    Create Session  alias=justice  url=${URL}:${SAAS_ONE_FUNC_PORT}
    ${json_string}=  catenate
    ...  {
    ...    "paginator": {
    ...      "size": 20,
    ...      "page": 0
    ...    }
    ...  }
    ${body}=  To Json    ${json_string}
    ${resp}=  Post Request  justice  /v1/api/events  json=${body}  headers=${postheader}
    Should Be Equal As Strings  ${resp.status_code}  200

Get Map
    &{postheader}=  Create Dictionary  Content-Type=application/json  Authorization=Bearer ${access_token}
    Create Session  alias=justice  url=${URL}:${SAAS_ONE_FUNC_PORT}
    ${json_string}=  catenate
    ...  {
    ...    "paginator": {
    ...      "size": 20,
    ...      "page": 0
    ...    }
    ...  }
    ${body}=  To Json    ${json_string}
    ${resp}=  Post Request  justice  /v1/api/map  json=${body}  headers=${postheader}
    Should Be Equal As Strings  ${resp.status_code}  200
