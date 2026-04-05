*** Settings ***
Resource    ../resources/keywords.robot

*** Test Cases ***
Login สำเร็จ
    [Tags]    smoke    login
    ตรวจสอบ Login    qa_tester    Test1234    สำเร็จ

Login ล้มเหลว
    [Tags]    regression    login
    ตรวจสอบ Login    wrong_user    wrong_pass    ล้มเหลว
    