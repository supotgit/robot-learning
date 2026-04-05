*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
ทดสอบ GET — ดึงข้อมูล User
    [Tags]    smoke    api
    Create Session    mysession    ${BASE_URL}    verify=False
    ${response}=    GET On Session    mysession    /users/1
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ✅ Status Code: ${response.status_code}

ทดสอบ GET — ดึงข้อมูลที่ไม่มี
    [Tags]    regression    api
    Create Session    mysession    ${BASE_URL}    verify=False
    ${response}=    GET On Session    mysession    /users/9999    expected_status=404
    Should Be Equal As Numbers    ${response.status_code}    404
    Log    ✅ Status Code 404 ถูกต้อง

ทดสอบ POST — สร้างข้อมูลใหม่
    [Tags]    smoke    api
    Create Session    mysession    ${BASE_URL}    verify=False
    &{body}=    Create Dictionary    title=QA Test Post    body=ทดสอบสร้างข้อมูลใหม่    userId=1
    ${response}=    POST On Session    mysession    /posts    json=${body}
    Should Be Equal As Numbers    ${response.status_code}    201
    Log    ✅ สร้างข้อมูลสำเร็จ Status: ${response.status_code}

ทดสอบตรวจสอบข้อมูลใน Response
    [Tags]    smoke    api
    Create Session    mysession    ${BASE_URL}    verify=False
    ${response}=    GET On Session    mysession    /users/1
    Should Be Equal As Numbers    ${response.status_code}    200

    ${body}=    Set Variable    ${response.json()}
    Should Be Equal    ${body}[id].__str__()    1.__str__()
    Should Be Equal    ${body}[username]    Bret
    Should Be Equal    ${body}[email]    Sincere@april.biz
    Log    ✅ ข้อมูลใน Response ถูกต้องทุกช่อง

ทดสอบ PUT — แก้ไขข้อมูล
    [Tags]    regression    api
    Create Session    mysession    ${BASE_URL}    verify=False
    &{body}=    Create Dictionary    title=Updated Title    body=Updated Body    userId=1
    ${response}=    PUT On Session    mysession    /posts/1    json=${body}
    Should Be Equal As Numbers    ${response.status_code}    200
    ${result}=    Set Variable    ${response.json()}
    Should Be Equal    ${result}[title]    Updated Title
    Log    ✅ PUT สำเร็จ แก้ไขข้อมูลถูกต้อง

ทดสอบ DELETE — ลบข้อมูล
    [Tags]    regression    api
    Create Session    mysession    ${BASE_URL}    verify=False
    ${response}=    DELETE On Session    mysession    /posts/1
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ✅ DELETE สำเร็จ Status: ${response.status_code}
