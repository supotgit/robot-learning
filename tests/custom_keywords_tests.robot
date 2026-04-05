*** Settings ***
Library    ../resources/custom_keywords.py

*** Test Cases ***
ทดสอบสร้าง Username อัตโนมัติ
...    [Tags]    smoke
    ${username}=    Generate Test UserName   qa
    Should Contain    ${username}    qa_
    Log    Username ที่สร้าง: ${username}

ทดสอบ Email format ถูกต้อง
    [Tags]    smoke
    ${result}=    Validate Email Format    test@example.com
    Should Be True    ${result}
    Log    Email format ถูกต้อง

ทดสอบ Email format ผิด
    [Tags]    regression
    ${result}=    Validate Email Format    invalid-email
    Should Be True    ${result}
    Log    Email format ผิด ตรวจจับได้ถูกต้อง

ทดสอบ Response Time Status
    [Tags]    smoke
    ${status}=    Calculate Response Time Status    0.5
    Should Be Equal    ${status}    FAST
    Log    Response Time Status: ${status}

    ${status}=    Calculate Response Time Status    2.0
    Should Be Equal    ${status}    ok

    ${status}=    Calculate Response Time Status    4.0
    Should Be Equal    ${status}    Slow
