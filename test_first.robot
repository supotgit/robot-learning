*** Settings ***
Library    Collections

*** Variables ***
${URL}    https://www.example.com
${USERNAME}    qa_tester
${TIMEOUT}    30

*** Test Cases ***
ทดสอบตัวแปรพื้นฐาน
     Log    URL ที่จะทดสอบ: ${URL}
     Log    Username: ${USERNAME}
     Log    Timeout: ${TIMEOUT}

ทดสอบการเปรียบเทียบค่า
     ${status_code}=     Set Variable   200
     Should Be Equal    ${status_code}    200
    Log    Status Code ถูกต้อง: ${status_code}

ทดสอบ List
     ${browsers}=    Create List    Chrome    Firefox    Edge
     Length Should Be    ${browsers}    3
     Should Contain    ${browsers}    Chrome
     Log    c Browser List ถูกต้อง