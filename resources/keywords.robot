*** Settings ***
Library    Collections

*** Variables ***
${BASE_URL}     https://www.example.com
${VALID_USER}   qa_tester
${VALID_PASS}   Test1234

*** Keywords ***
ตรวจสอบ Status Code
    [Arguments]    ${actual}    ${expected}
    Should Be Equal    ${actual}    ${expected}
    Log    ✅ Status Code: ${actual} ถูกต้อง

ตรวจสอบ Login
    [Arguments]    ${username}    ${password}    ${expected}
    IF    '${username}' == 'qa_tester' and '${password}' == 'Test1234'
        Should Be Equal    ${expected}    สำเร็จ
        Log    ✅ Login สำเร็จ
    ELSE
        Should Be Equal    ${expected}    ล้มเหลว
        Log    ❌ Login ล้มเหลว
    END
    