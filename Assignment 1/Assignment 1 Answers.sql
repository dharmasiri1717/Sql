1

MariaDB [(none)]> CREATE DATABASE Hospital;
Query OK, 1 row affected (0.001 sec)


MariaDB [(none)]> USE HOSPITAL
Database changed


MariaDB [HOSPITAL]> CREATE TABLE physician
    -> (PhysicianId INT(2) PRIMARY KEY AUTO_INCREMENT, Name VARCHAR(30), Position VARCHAR(50), DepartmentNo INT(2));
Query OK, 0 rows affected (0.023 sec)

MariaDB [hospital]> INSERT INTO physician VALUES
    -> (1, 'John Dorian', 'Staff Internist', 2),
    -> (NULL, 'Elliot Reid', 'Attending Physician', 1),
    -> (NULL, 'Christopher Turk', 'Surgical Attending Physician', 3),
    -> (NULL, 'Percival Cox', 'Senior Attending Physician', 3),
    -> (NULL, 'Keith Dudemeister', 'MD Resident', 4),
    -> (NULL, 'Molly Clock', 'Attending Psychiatrist', 1);
Query OK, 6 rows affected (0.002 sec)
Records: 6  Duplicates: 0  Warnings: 0



MariaDB [hospital]> CREATE TABLE patient
    -> (PatientId INT(9) PRIMARY KEY AUTO_INCREMENT, Name VARCHAR(30), Address VARCHAR(50), Phone varchar(8));
Query OK, 0 rows affected (0.008 sec)

MariaDB [hospital]> INSERT INTO Patient (PatientId, Name, Address, Phone) VALUES
    -> (100000001, 'John Smith', '42 Foobar Lane', '555-0256'),
    -> (100000002, 'Grace Ritchie', '37 Snafu Drive', '555-0512'),
    -> (100000003, 'Todd Quinlan', '101 Omgbbq Street', '555-1204'),
    -> (100000004, 'Dennis Doe', '1100 Foobaz Avenue', '555-2048');
Query OK, 4 rows affected (0.004 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [hospital]> CREATE TABLE prescribes(Physician int(2), Patient int(9), Medication int(1)PRIMARY KEY,
    -> Date DATETIME, Appointment int(9), Dose int(2));
Query OK, 0 rows affected (0.006 sec)


MariaDB [hospital]> INSERT INTO Prescribes (Physician, Patient, Medication, Date, Appointment, Dose)
    -> VALUES
    -> (1, 100000001, 1, '2008-04-24 10:47:00', 13216584, 5),
    -> (6, 100000004, 2, '2008-04-27 10:53:00', 86213939, 10),
    -> (6, 100000004, 3, '2008-04-30 16:53:00', NULL, 5);
Query OK, 3 rows affected (0.004 sec)
Records: 3  Duplicates: 0  Warnings: 0


MariaDB [hospital]> CREATE TABLE Appointment
    -> (AppointmentId INT(9) PRIMARY KEY, Patient INT(9), Physician int(2), Start_dt_time DATETIME, End_dt_time DATETIME, Examinationroom CHAR);
Query OK, 0 rows affected (0.006 sec)


MariaDB [hospital]> INSERT INTO Appointment VALUES
    -> (13216584, 100000001, 1, '2008-04-24 10:00:00', '2008-04-24 13:00:00', 'A'),
    -> (26548913, 100000002, 2, '2008-04-24 10:00:00', '2008-04-24 11:00:00', 'B'),
    -> (36549879, 100000001, 1, '2008-04-25 10:00:00', '2008-04-25 11:00:00', 'A'),
    -> (46846589, 100000004, 4, '2008-04-25 10:00:00', '2008-04-25 11:00:00', 'C'),
    -> (59871321, 100000004, 4, '2008-04-25 10:00:00', '2008-04-26 11:00:00', 'C'),
    -> (69879231, 100000003, 2, '2008-04-26 11:00:00', '2008-04-26 12:00:00', 'C'),
    -> (76983231, 100000001, 3, '2008-04-26 12:00:00', '2008-04-26 15:00:00', 'C'),
    -> (86213939, 100000004, 6, '2008-04-27 10:00:00', '2008-04-27 11:00:00', 'A'),
    -> (93216548, 100000002, 2, '2008-04-27 10:00:00', '2008-04-27 13:00:00', 'B');
Query OK, 9 rows affected (0.004 sec)
Records: 9  Duplicates: 0  Warnings: 0


MariaDB [hospital]> CREATE TABLE medication(Code INT(2) PRIMARY KEY AUTO_INCREMENT, Name varchar(20), Brand VARCHAR(30));
Query OK, 0 rows affected (0.006 sec)

MariaDB [hospital]> INSERT INTO Medication(Name,Brand) VALUES
    -> ('Procrastin-X', 'X'),
    -> ('Thesisin', 'Foo Labs'),
    -> ('Awakin', 'Bar Laboratories'),
    -> ('Crescavitin', 'Baz Industries'),
    -> ('Melioraurin', 'Snafu Pharmaceuticals');
Query OK, 5 rows affected (0.004 sec)
Records: 5  Duplicates: 0  Warnings: 0




2 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>



a. 

MariaDB [hospital]> DESC appointment;
+-----------------+----------+------+-----+---------+-------+
| Field           | Type     | Null | Key | Default | Extra |
+-----------------+----------+------+-----+---------+-------+
| AppointmentId   | int(9)   | NO   | PRI | NULL    |       |
| Patient         | int(9)   | YES  |     | NULL    |       |
| Physician       | int(2)   | YES  |     | NULL    |       |
| Start_dt_time   | datetime | YES  |     | NULL    |       |
| End_dt_time     | datetime | YES  |     | NULL    |       |
| Examinationroom | char(1)  | YES  |     | NULL    |       |
+-----------------+----------+------+-----+---------+-------+
6 rows in set (0.010 sec)


MariaDB [hospital]> DESC medication;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| Code  | int(3)      | NO   | PRI | NULL    | auto_increment |
| Name  | varchar(30) | YES  |     | NULL    |                |
| Brand | varchar(30) | YES  |     | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
3 rows in set (0.009 sec)

MariaDB [hospital]> DESC patient;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| PatientId | int(9)      | NO   | PRI | NULL    | auto_increment |
| Name      | varchar(30) | YES  |     | NULL    |                |
| Address   | varchar(50) | YES  |     | NULL    |                |
| Phone     | varchar(8)  | YES  |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
4 rows in set (0.009 sec)

MariaDB [hospital]> DESC physician;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| PhysicianId  | int(2)      | NO   | PRI | NULL    | auto_increment |
| Name         | varchar(30) | YES  |     | NULL    |                |
| Position     | varchar(50) | YES  |     | NULL    |                |
| DepartmentNo | int(2)      | YES  |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
4 rows in set (0.009 sec)

MariaDB [hospital]> DESC prescribes;
+-------------+----------+------+-----+---------+-------+
| Field       | Type     | Null | Key | Default | Extra |
+-------------+----------+------+-----+---------+-------+
| Physician   | int(2)   | YES  |     | NULL    |       |
| Patient     | int(9)   | YES  |     | NULL    |       |
| Medication  | int(1)   | NO   | PRI | NULL    |       |
| Date        | datetime | YES  |     | NULL    |       |
| Appointment | int(9)   | YES  |     | NULL    |       |
| Dose        | int(2)   | YES  |     | NULL    |       |
+-------------+----------+------+-----+---------+-------+
6 rows in set (0.010 sec)



b >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

MariaDB [hospital]> SELECT * FROM appointment;
+---------------+-----------+-----------+---------------------+---------------------+-----------------+
| AppointmentId | Patient   | Physician | Start_dt_time       | End_dt_time         | Examinationroom |
+---------------+-----------+-----------+---------------------+---------------------+-----------------+
|      13216584 | 100000001 |         1 | 2008-04-24 10:00:00 | 2008-04-24 13:00:00 | A               |
|      26548913 | 100000002 |         2 | 2008-04-24 10:00:00 | 2008-04-24 11:00:00 | B               |
|      36549879 | 100000001 |         1 | 2008-04-25 10:00:00 | 2008-04-25 11:00:00 | A               |
|      46846589 | 100000004 |         4 | 2008-04-25 10:00:00 | 2008-04-25 11:00:00 | C               |
|      59871321 | 100000004 |         4 | 2008-04-25 10:00:00 | 2008-04-26 11:00:00 | C               |
|      69879231 | 100000003 |         2 | 2008-04-26 11:00:00 | 2008-04-26 12:00:00 | C               |
|      76983231 | 100000001 |         3 | 2008-04-26 12:00:00 | 2008-04-26 15:00:00 | C               |
|      86213939 | 100000004 |         6 | 2008-04-27 10:00:00 | 2008-04-27 11:00:00 | A               |
|      93216548 | 100000002 |         2 | 2008-04-27 10:00:00 | 2008-04-27 13:00:00 | B               |
+---------------+-----------+-----------+---------------------+---------------------+-----------------+
9 rows in set (0.000 sec)
MariaDB [hospital]> SELECT * FROM medication;
+------+--------------+-----------------------+
| Code | Name         | Brand                 |
+------+--------------+-----------------------+
|    1 | Procrastin-X | X                     |
|    2 | Thesisin     | Foo Labs              |
|    3 | Awakin       | Bar Laboratories      |
|    4 | Crescavitin  | Baz Industries        |
|    5 | Melioraurin  | Snafu Pharmaceuticals |
+------+--------------+-----------------------+
5 rows in set (0.000 sec)



MariaDB [hospital]> SELECT * FROM patient;
+-----------+---------------+--------------------+----------+
| PatientId | Name          | Address            | Phone    |
+-----------+---------------+--------------------+----------+
| 100000001 | John Smith    | 42 Foobar Lane     | 555-0256 |
| 100000002 | Grace Ritchie | 37 Snafu Drive     | 555-0512 |
| 100000003 | Todd Quinlan  | 101 Omgbbq Street  | 555-1204 |
| 100000004 | Dennis Doe    | 1100 Foobaz Avenue | 555-2048 |
+-----------+---------------+--------------------+----------+
4 rows in set (0.000 sec)



MariaDB [hospital]> SELECT * FROM prescribes;
+-----------+-----------+------------+---------------------+-------------+------+
| Physician | Patient   | Medication | Date                | Appointment | Dose |
+-----------+-----------+------------+---------------------+-------------+------+
|         1 | 100000001 |          1 | 2008-04-24 10:47:00 |    13216584 |    5 |
|         6 | 100000004 |          2 | 2008-04-27 10:53:00 |    86213939 |   10 |
|         6 | 100000004 |          3 | 2008-04-30 16:53:00 |        NULL |    5 |
+-----------+-----------+------------+---------------------+-------------+------+
3 rows in set (0.000 sec)


MariaDB [hospital]> SELECT * FROM physician;
+-------------+-------------------+------------------------------+--------------+
| PhysicianId | Name              | Position                     | DepartmentNo |
+-------------+-------------------+------------------------------+--------------+
|           1 | John Dorian       | Staff Internist              |            2 |
|           2 | Elliot Reid       | Attending Physician          |            1 |
|           3 | Christopher Turk  | Surgical Attending Physician |            3 |
|           4 | Percival Cox      | Senior Attending Physician   |            3 |
|           5 | Keith Dudemeister | MD Resident                  |            4 |
|           6 | Molly Clock       | Attending Psychiatrist       |            1 |
+-------------+-------------------+------------------------------+--------------+
6 rows in set (0.000 sec)




c>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

MariaDB [hospital]> SELECT * FROM physician WHERE DepartmentNo = 3;
+-------------+------------------+------------------------------+--------------+
| PhysicianId | Name             | Position                     | DepartmentNo |
+-------------+------------------+------------------------------+--------------+
|           3 | Christopher Turk | Surgical Attending Physician |            3 |
|           4 | Percival Cox     | Senior Attending Physician   |            3 |
+-------------+------------------+------------------------------+--------------+
2 rows in set (0.000 sec)




d >


MariaDB [hospital]> SELECT COUNT(DISTINCT Patient) AS NOUP
    -> FROM Appointment
    -> WHERE ExaminationRoom = 'C';
+------+
| NOUP |
+------+
|    3 |
+------+
1 row in set (0.000 sec)



e>

MariaDB [hospital]> SELECT Appointment.*, Patient.name
    -> FROM Appointment
    -> INNER JOIN Patient ON Appointment.Patient = Patient.PatientId
    -> WHERE Patient.Name = 'Dennis Doe'
    -> AND DATE(Appointment.Start_dt_time) = '2008-04-25';
+---------------+-----------+-----------+---------------------+---------------------+-----------------+------------+
| AppointmentId | Patient   | Physician | Start_dt_time       | End_dt_time         | Examinationroom | name       |
+---------------+-----------+-----------+---------------------+---------------------+-----------------+------------+
|      46846589 | 100000004 |         4 | 2008-04-25 10:00:00 | 2008-04-25 11:00:00 | C               | Dennis Doe |
|      59871321 | 100000004 |         4 | 2008-04-25 10:00:00 | 2008-04-26 11:00:00 | C               | Dennis Doe |
+---------------+-----------+-----------+---------------------+---------------------+-----------------+------------+
2 rows in set (0.000 sec)


f>

MariaDB [hospital]> SELECT medication.* FROM medication
    -> INNER JOIN prescribes ON medication.code = prescribes.medication
    -> INNER JOIN physician ON physician.physicianId = prescribes.physician
    -> WHERE physician.name = 'Molly Clock';
+------+----------+------------------+
| Code | Name     | Brand            |
+------+----------+------------------+
|    2 | Thesisin | Foo Labs         |
|    3 | Awakin   | Bar Laboratories |
+------+----------+------------------+
2 rows in set (0.000 sec)


g> Cannot understand the question ?

MariaDB [hospital]> SELECT patient.Name AS PatName, patient.Address, physician.Name AS PhyName
    -> FROM patient
    -> INNER JOIN prescribes ON patient.PatientId = prescribes.Patient
    -> INNER JOIN physician ON prescribes.Physician = physician.PhysicianId
    -> WHERE prescribes.Date = (SELECT MIN(p.Date) FROM prescribes p WHERE p.Patient = prescribes.Patient);
+------------+--------------------+-------------+
| PatName    | Address            | PhyName     |
+------------+--------------------+-------------+
| John Smith | 42 Foobar Lane     | John Dorian |
| Dennis Doe | 1100 Foobaz Avenue | Molly Clock |
+------------+--------------------+-------------+
2 rows in set (0.002 sec)




h>

MariaDB [hospital]> SELECT Patient.Name, COUNT(DISTINCT Appointment.Physician)
    -> FROM Patient
    -> INNER JOIN Appointment ON Patient.PatientId = Appointment.Patient
    -> GROUP BY Patient.PatientId;
+---------------+---------------------------------------+
| Name          | COUNT(DISTINCT Appointment.Physician) |
+---------------+---------------------------------------+
| John Smith    |                                     2 |
| Grace Ritchie |                                     1 |
| Dennis Doe    |                                     2 |
+---------------+---------------------------------------+
3 rows in set (0.001 sec)

i>
MariaDB [hospital]> SELECT Prescribes.* FROM Prescribes
    -> INNER JOIN Physician ON Prescribes.Physician = Physician.PhysicianId
    -> WHERE Physician.Position = 'Staff Internist';
+-----------+-----------+------------+---------------------+-------------+------+
| Physician | Patient   | Medication | Date                | Appointment | Dose |
+-----------+-----------+------------+---------------------+-------------+------+
|         1 | 100000001 |          1 | 2008-04-24 10:47:00 |    13216584 |    5 |
+-----------+-----------+------------+---------------------+-------------+------+
1 row in set (0.000 sec)


j>

MariaDB [hospital]> DELETE FROM Appointment
    -> WHERE Patient = (SELECT PatientId FROM Patient WHERE Name = 'Todd Quinlan');
Query OK, 1 row affected (0.001 sec)














