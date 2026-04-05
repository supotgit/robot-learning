import sqlite3

#สร้าง Database ชื่อ test_db.sqlite
conn = sqlite3.connect("test_db.sqlite")
cursor = conn.cursor()

#สร้างตาราง users
cursor.execute("""
    CREATE TABLE IF NOT EXISTS users (
               id INTEGER PRIMARY KEY,
               username TEXT NOT NULL,
               email TEXT NOT NULL,
               status TEXT NOT NULL
               )
""")

# เพิ่มข้อมูลตัวอย่าง
cursor.execute("INSERT INTO users VALUES (1, 'qa_tester', 'qa@example.com', 'active')")
cursor.execute("INSERT INTO users VALUES (2, 'admin', 'admin@example.com', 'active')")
cursor.execute("INSERT INTO users VALUES (3, 'inactive_user', 'old@example.com', 'inactive')")

conn.commit()
conn.close()
print("สร้าง Database สำเร็จ !")
