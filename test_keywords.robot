*** Settings ***
Library    Collections

*** Variables ***
${VALID_USER}    qa_tester
${VALID_PASS}    Test1234
${STATUS_OK}    200
${STATUS_NOT_FOUND}    404

*** Test Cases ***
ทดสอบ Login สำเร็จ
    ตรวจสอบ Login    qa_tester     Test1234     สำเร็จ

ทดสอบ Login ล้มเหลว
    ตรวจสอบ Login    wrong_user    wrong_pass    ล้มเหลว

ทดสอบ API Status Code
    ตรวจสอบ Status Code    200    PASSED
    ตรวจสอบ Status Code    404    FAILED
    ตรวจสอบ Status Code    500    FAILED

*** keywords ***
ตรวจสอบ Login 
    [Arguments]      ${username}     ${password}    ${expected}
    Log    กำลัง Login ด้วย: ${username}
    IF    '${username}' == 'qa_tester' and '${password}' == 'Test1234'
        Log    Login สำเร็จ
        Should Be Equal    ${expected}    สำเร็จ
    ELSE
        Log    X Login ล้มเหลว
        Should Be Equal    ${expected}    ล้มเหลว
    END

ตรวจสอบ Status Code
    [Arguments]    ${code}    ${expected_result}
    Log    Status code ที่ได้: ${code}
    IF    '${code}' == '200'
        Log    C PASSED
        Should Be Equal    ${expected_result}    PASSED
    ELSE
        Log    C FAILED
        Should Be Equal    ${expected_result}    FAILED
    END
