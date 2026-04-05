*** Settings ***
Library    DatabaseLibrary
Library    Collections

*** Variables ***
${DB_FILE}    C:/robot_learning/test_db.sqlite

*** Test Cases ***
เชื่อมต่อ DataBase สำเร็จ
    [Tags]    smoke    database
    connect to Database    sqlite3    ${DB_FILE}
    ${result}=    Query    Select * FROM users WHERE username='qa_tester'
    Should Not Be Empty    ${result}
    Log    พบข้อมูล User: ${result}
    Disconnect From Database

ตรวจสอบจำนวน User ทั้งหมด
    [tags]    smoke    database
    Connect to Database    sqlite3    ${DB_FILE}
    ${result}=    Query    SELECT COUNT(*) FROM users
    Should Be Equal As Numbers    ${result[0][0]}    3
    Log    จำนวน user ทั้งหมด: ${result[0][0]}
    Disconnect From Database

ตรวจอบ User ทีมีสถานะ active
    [Tags]    regression    database
    Connect to Database    sqlite3    ${DB_FILE}
    ${result}=    Query    SELECT * FROM users WHERE status='active'
    Length Should Be     ${result}    2
    Log    พบ User ที่ Active: ${result}
    Disconnect From Database

ตรวจอบ User ที่ไม่มีอยู่
    [Tags]    regression    database
    Connect to Database    sqlite3    ${DB_FILE}
    ${result}=    Query    SELECT * FROM users WHERE username='unknown_user'
    Should Be Empty    ${result}
    Log    ไม่พบ User ที่ไม่มีอยู่จริง:
    Disconnect From Database
