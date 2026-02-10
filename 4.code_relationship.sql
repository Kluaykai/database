USE tammy;
GO

SELECT TOP 13 
    L.log_id, 
    S.name AS [ชื่อนิสิต], 
    A.activity_name AS [ประเภทกิจกรรม], 
    L.duration
FROM EXERCISE_LOG L
JOIN STUDENT S ON L.student_id = S.student_id
JOIN ACTIVITY A ON L.activity_id = A.activity_id;