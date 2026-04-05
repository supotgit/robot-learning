*** Settings ***
Resource    ../resources/keywords.robot

*** Test Cases ***
ตรวจสอบ API Status 200
    [Tags]    smoke    api
    ตรวจสอบ Status Code    200    200

ตรวจสอบ API Status 404
    [Tags]    regression    api
    ตรวจสอบ Status Code    404    404
    