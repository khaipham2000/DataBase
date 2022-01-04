CREATE DATABASE school

CREATE TABLE teacher(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    mobile VARCHAR NOT NULL,
    address TEXT NOT NULL
)

INSERT INTO teacher(id, name, email, mobile, address) VALUES (11, 'Marmaduke Lorimer', 'mlorimer0@ftc.gov', '408-157-9150', 'San Jose');
INSERT INTO teacher(id, name, email, mobile, address) VALUES (22, 'Francine Stranieri', 'fstranieri1@msn.com', '953-342-0625', 'Isnos');
INSERT INTO teacher(id, name, email, mobile, address) VALUES (33, 'Jody Gloyens', 'jgloyens2@soundcloud.com', '654-492-1666', 'Billère');

CREATE TABLE class (
id INT PRIMARY KEY,
name TEXT NOT NULL,
id_teacher INT NOT NULL,
FOREIGN KEY (id_teacher) REFERENCES teacher(id)
)

INSERT INTO class(id, name, id_teacher) VALUES (1,'Lớp A2',11);
INSERT INTO class(id, name, id_teacher) VALUES (2,'Lớp A3',22);
INSERT INTO class(id, name, id_teacher) VALUES (3,'Lớp A4',33);
Tạo bảng student

CREATE TABLE student(
id INT PRIMARY KEY,
name TEXT NOT NULL,
birth DATE NOT NULL,
address TEXT NOT NULL,
mobile VARCHAR(11) NOT NULL,
email TEXT NOT NULL,
id_class INT NOT NULL,
FOREIGN KEY (id_class) REFERENCES class(id)
)

INSERT INTO student(id, name, birth, address, mobile, email, id_class) VALUES (1111,'Alayne Feare', '1/28/2001', 'Taber', '113-3741-8010', 'afeare0@soup.io',1);
INSERT INTO student(id, name, birth, address, mobile, email, id_class) VALUES (2222,'Nomi Feige', '11/16/1996', 'Berbérati', '273-1608-9831', 'nfeige1@sun.com',2);
INSERT INTO student(id, name, birth, address, mobile, email, id_class) VALUES (3333,'Mart Sailor', '9/11/2001', 'Camacupa', '672-1406-9025', 'msailor2@intel.com',2);
INSERT INTO student(id, name, birth, address, mobile, email, id_class) VALUES (4444,'Hans Crowson', '12/20/1997', 'Dąbie', '411-1552-2489', 'hcrowson3@sourceforge.net',1);
INSERT INTO student(id, name, birth, address, mobile, email, id_class) VALUES (5555,'Wilmette Slemming', '2/19/1999', 'Manjo', '874-1363-8170', 'wslemming4@shop-pro.jp',3);
Tạo bảng subject

CREATE TABLE subject(
id INT PRIMARY KEY,
name TEXT NOT NULL
)

INSERT INTO subject(id, name) VALUES (111,'Math');
INSERT INTO subject(id, name) VALUES (222,'English');
INSERT INTO subject(id, name) VALUES (333,'Physical');
Tạo bảng point

CREATE TABLE point(
id INT PRIMARY KEY AUTO_INCREMENT,
id_subject INT NOT NULL,
FOREIGN KEY (id_subject) REFERENCES subject(id),
id_student INT NOT NULL,
FOREIGN KEY (id_student) REFERENCES student(id),
point FLOAT NOT NULL
)

INSERT INTO point(id, id_subject, id_student, point) VALUES (null,111,1111,8.5);
INSERT INTO point(id, id_subject, id_student, point) VALUES (null,222,1111,6.2);
INSERT INTO point(id, id_subject, id_student, point) VALUES (null,333,1111,8.7);
INSERT INTO point(id, id_subject, id_student, point) VALUES (null,111,2222,9.5);
INSERT INTO point(id, id_subject, id_student, point) VALUES (null,222,2222,7.4);
INSERT INTO point(id, id_subject, id_student, point) VALUES (null,333,2222,9.0);
INSERT INTO point(id, id_subject, id_student, point) VALUES (null,111,3333,7.1);
INSERT INTO point(id, id_subject, id_student, point) VALUES (null,222,3333,6.6);
INSERT INTO point(id, id_subject, id_student, point) VALUES (null,333,3333,6.4);
INSERT INTO point(id, id_subject, id_student, point) VALUES (null,111,4444,9.3);
INSERT INTO point(id, id_subject, id_student, point) VALUES (null,222,4444,7.2);
INSERT INTO point(id, id_subject, id_student, point) VALUES (null,333,4444,8.0);
INSERT INTO point(id, id_subject, id_student, point) VALUES (null,111,5555,6.9);
INSERT INTO point(id, id_subject, id_student, point) VALUES (null,222,5555,6.7);
INSERT INTO point(id, id_subject, id_student, point) VALUES (null,333,5555,7.3);