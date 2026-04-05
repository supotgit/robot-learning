*** Settings *** 
Library    SeleniumLibrary
Test Teardown    ถ่าย Screenshot เมื่อ Fail

*** Variables ***
${URL}    https://practicetestautomation.com/practice-test-login/
${BROWSER}    Chrome
${USERNAME}    student
${PASSWORD}    Password123


*** Test Cases ***
ทดสอบ Login สำเร็จ
    [Tags]    smoke    web
    เปิด Browser และไปที่หน้า Login
    กรอกข้อมูล Login    ${USERNAME}    ${PASSWORD}
    ตรวจสอบ Login สำเร็จ
    ปิด Browser

ทดสอบ Login ล้มเหลว
    [Tags]    smoke    web
    เปิด Browser และไปที่หน้า Login
    กรอกข้อมูล Login    wrong_user    wrong_password 
    ตรวจสอบ Login ล้มเหลว
    ปิด Browser

ทดสอบด้วย XPath
    [Tags]    smoke    web    xpath
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text      xpath=//input[@id='username']    ${USERNAME}
    Input Text      xpath=//input[@id='password']    ${PASSWORD}
    Click Button    xpath=//button[@id='submit']
    Page Should Contain    Logged In Successfully
    Log    ✅ XPath ทำงานถูกต้อง
    Close Browser

ทดสอบหาปุ่มด้วย Text
    [Tags]    web    xpath
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text      xpath=//input[@id='username']    ${USERNAME}
    Input Text      xpath=//input[@id='password']    ${PASSWORD}
    Click Button    xpath=//button[text()='Submit']
    Page Should Contain    Logged In Successfully
    Log    ✅ หาปุ่มด้วย Text สำเร็จ
    Close Browser

ทดสอบที่จะ Fail เพื่อดู Screenshot
    [Tags]    web
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Page Should Contain    ข้อความที่ไม่มีบนหน้าเว็บ
    Close Browser

*** keywords ***
เปิด Browser และไปที่หน้า Login
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    Test Login | Practice Test Automation

กรอกข้อมูล Login
    [Arguments]    ${username}    ${password}
    Input Text    id=username    ${username}
    Input Text    id=password    ${password}
    Click Button    id=submit

ตรวจสอบ Login สำเร็จ
    Page Should Contain    Logged In Successfully
    Log    Login สำเร็จ

ตรวจสอบ Login ล้มเหลว
    Page Should Contain    Your username is invalid!
    Log    ตรวจสอบ Error Message ถูกต้อง

ปิด Browser
    Close Browser

ถ่าย Screenshot เมื่อ Fail
    Run Keyword If Test Failed
    ...    Capture Page Screenshot
    ...    filename=EMBED

