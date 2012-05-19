-- lecturer by weekday & auditorium
SELECT lecturers.id, lecturers.first_name, lecturers.middle_name, lecturers.last_name, lectures.start_time, lectures.end_time
FROM lecturers
  JOIN courses ON lecturers.id = courses.lecturer_id
  JOIN lectures ON courses.id = lectures.course_id
  JOIN auditoria ON auditoria.id = lectures.auditorium_id
WHERE lectures.weekday = 'Mo' AND auditoria.auditorium_number = 1;


-- lecturers free on Monday & Tuesday
SELECT lecturers.first_name, lecturers.middle_name, lecturers.last_name
FROM lecturers
  LEFT JOIN courses  ON lecturers.id = courses.lecturer_id
  LEFT JOIN lectures ON courses.id = lectures.course_id
GROUP BY lecturers.id, lecturers.first_name, lecturers.middle_name, lecturers.last_name
HAVING SUM(CASE WHEN lectures.id IS NULL OR lectures.weekday NOT IN ('Mo','Tu','We','Th') THEN 0 ELSE 1 END) = 0;


-- days with smallest number of auditoriums used
SELECT t1.weekday, COUNT(*) AS auditoria_count
FROM (SELECT lectures.auditorium_id, lectures.weekday FROM lectures GROUP BY lectures.auditorium_id, lectures.weekday) t1
WHERE
  (SELECT COUNT(*) FROM (SELECT lectures.auditorium_id, lectures.weekday FROM lectures GROUP BY lectures.auditorium_id, lectures.weekday) t3 WHERE t3.weekday = t1.weekday)
  =
  (SELECT MIN(t6.auditoria_count)
    FROM (
      SELECT COUNT(*) AS auditoria_count
      FROM (SELECT t5.auditorium_id, t5.weekday FROM lectures t5 GROUP BY t5.auditorium_id, t5.weekday) t4
      GROUP BY t4.weekday
    ) t6
  )
GROUP BY t1.weekday;
