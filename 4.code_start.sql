USE tammy;
GO

-- 1. เปลี่ยนชื่อตารางที่อิมพอร์ตมาให้เป็นชื่อมาตรฐานตามที่ออกแบบไว้
EXEC sp_rename 'cleaned_students', 'STUDENT';
EXEC sp_rename 'cleaned_activities', 'ACTIVITY';
EXEC sp_rename 'cleaned_exercise_logs', 'EXERCISE_LOG';
GO

-- 2. ตั้งค่า Primary Key (PK) ให้แต่ละตาราง
-- ตารางนิสิต
ALTER TABLE STUDENT ALTER COLUMN student_id VARCHAR(15) NOT NULL;
ALTER TABLE STUDENT ADD PRIMARY KEY (student_id);

-- ตารางกิจกรรม
ALTER TABLE ACTIVITY ALTER COLUMN activity_id INT NOT NULL;
ALTER TABLE ACTIVITY ADD PRIMARY KEY (activity_id);

-- ตารางบันทึกการออกกำลังกาย
ALTER TABLE EXERCISE_LOG ALTER COLUMN log_id INT NOT NULL;
ALTER TABLE EXERCISE_LOG ADD PRIMARY KEY (log_id);
GO

-- 3. สร้างความสัมพันธ์ (Foreign Keys) เพื่อเชื่อมตารางเข้าด้วยกัน
-- เชื่อมโยงบันทึกกับนิสิต
ALTER TABLE EXERCISE_LOG 
ADD CONSTRAINT FK_Student_Log FOREIGN KEY (student_id) REFERENCES STUDENT(student_id);

-- เชื่อมโยงบันทึกกับประเภทกิจกรรม
ALTER TABLE EXERCISE_LOG 
ADD CONSTRAINT FK_Activity_Log FOREIGN KEY (activity_id) REFERENCES ACTIVITY(activity_id);
GO

PRINT 'เปลี่ยนชื่อตารางและสร้างความสัมพันธ์เสร็จสมบูรณ์!';