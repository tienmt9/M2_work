create database mini_test;
use mini_test;

create table Classes
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(255),
    language    VARCHAR(255),
    description VARCHAR(255)
);

create table Students
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    fullname   VARCHAR(255),
    address_id VARCHAR(255),
    age        INT,
    phone      VARCHAR(255) UNIQUE,
    classes_id INT,
    FOREIGN KEY (classes_id) REFERENCES Classes (id)
);

create table Course
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(255),
    description VARCHAR(255)
);

create table Point
(
    id         INT,
    course_id  INT,
    FOREIGN KEY (course_id) REFERENCES Course (id),
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES Students (id),
    point      INT
);

create table Address
(
    id      INT,
    address VARCHAR(255)
);

INSERT INTO Address
VALUES (1, '123 Đường Lê Lợi, Quận 1, TP. Hồ Chí Minh'),
       (2, '456 Đường Nguyễn Huệ, Quận 1, TP. Hồ Chí Minh'),
       (3, '789 Đường Hoàng Diệu, Quận Ba Đình, Hà Nội'),
       (4, '101 Đường Trần Phú, Quận Hải Châu, Đà Nẵng'),
       (5, '202 Đường Lê Hồng Phong, Quận 10, TP. Hồ Chí Minh');

INSERT INTO Classes
VALUES (1, 'Toán Cao Cấp', 'Tiếng Việt', 'Lớp học về toán cao cấp cho sinh viên năm nhất'),
       (2, 'Lập Trình Java', 'Tiếng Việt', 'Lớp học lập trình Java cơ bản và nâng cao'),
       (3, 'Tiếng Anh Giao Tiếp', 'Tiếng Việt', 'Lớp học cải thiện kỹ năng giao tiếp tiếng Anh'),
       (4, 'Kinh Tế Vĩ Mô', 'Tiếng Việt', 'Lớp học về các nguyên lý kinh tế vĩ mô'),
       (5, 'Văn Học Việt Nam', 'Tiếng Việt', 'Lớp học về các tác phẩm văn học nổi tiếng của Việt Nam');

INSERT INTO Students
VALUES (1, 'Nguyễn Văn An', 1, 20, '0901234567', 1),
       (2, 'Trần Thị Bích', 2, 22, '0902345678', 2),
       (3, 'Lê Hoàng Cường', 3, 21, '0903456789', 3),
       (4, 'Phạm Thu Duyên', 4, 23, '0904567890', 4),
       (5, 'Võ Minh Em', 5, 19, '0905678901', 5),
       (6, 'Đặng Thùy Phúc', 1, 20, '0906789012', 1),
       (7, 'Hoàng Thanh Giang', 2, 22, '0907890123', 2),
       (8, 'Phan Quang Huy', 3, 21, '0908901234', 3),
       (9, 'Bùi Thị Ích', 4, 23, '0909012345', 4),
       (10, 'Ngô Văn Quyền', 5, 19, '0910123456', 5);

INSERT INTO Course
VALUES (1, 'Toán Đại Số', 'Khóa học về các nguyên lý và ứng dụng của đại số'),
       (2, 'Lập Trình Python', 'Khóa học về lập trình căn bản và nâng cao với Python'),
       (3, 'Tiếng Anh Thương Mại', 'Khóa học cải thiện tiếng Anh trong môi trường kinh doanh'),
       (4, 'Kỹ Năng Thuyết Trình', 'Khóa học về cách thuyết trình hiệu quả và ấn tượng'),
       (5, 'Vật Lý Cơ Bản', 'Khóa học về các nguyên lý cơ bản của vật lý'),
       (6, 'Phân Tích Dữ Liệu', 'Khóa học về các phương pháp phân tích và xử lý dữ liệu'),
       (7, 'Quản Trị Kinh Doanh', 'Khóa học về các nguyên lý quản trị kinh doanh'),
       (8, 'Lịch Sử Việt Nam', 'Khóa học về lịch sử và văn hóa Việt Nam qua các thời kỳ'),
       (9, 'Hóa Học Hữu Cơ', 'Khóa học về các hợp chất hữu cơ và phản ứng hóa học'),
       (10, 'Tiếng Nhật Sơ Cấp', 'Khóa học nhập môn tiếng Nhật cho người mới bắt đầu'),
       (11, 'Phát Triển Web', 'Khóa học về thiết kế và phát triển web'),
       (12, 'Kỹ Năng Giao Tiếp', 'Khóa học cải thiện kỹ năng giao tiếp và làm việc nhóm'),
       (13, 'Toán Rời Rạc', 'Khóa học về các khái niệm và ứng dụng của toán rời rạc'),
       (14, 'Phần Cứng Máy Tính', 'Khóa học về các thành phần và nguyên lý hoạt động của phần cứng máy tính'),
       (15, 'Lập Trình C++', 'Khóa học về lập trình cơ bản và nâng cao với C++'),
       (16, 'Marketing Căn Bản', 'Khóa học về các nguyên lý và chiến lược marketing cơ bản'),
       (17, 'Kinh Tế Học', 'Khóa học về các nguyên lý kinh tế vi mô và vĩ mô'),
       (18, 'Hệ Thống Thông Tin', 'Khóa học về quản lý và phân tích hệ thống thông tin'),
       (19, 'Kỹ Thuật Điện', 'Khóa học về các nguyên lý và ứng dụng của kỹ thuật điện'),
       (20, 'Xử Lý Ảnh Số', 'Khóa học về các phương pháp và kỹ thuật xử lý ảnh số');

INSERT INTO Point
VALUES (1, 1, 1, 8.5),
       (2, 2, 2, 7.0),
       (3, 3, 3, 9.0),
       (4, 4, 4, 6.5),
       (5, 5, 5, 7.5),
       (6, 1, 6, 8.0),
       (7, 2, 7, 7.8),
       (8, 3, 8, 9.2),
       (9, 4, 9, 6.7),
       (10, 5, 10, 7.3),
       (11, 1, 2, 8.1),
       (12, 2, 3, 7.4),
       (13, 3, 4, 9.5),
       (14, 4, 5, 6.9),
       (15, 5, 6, 7.6);

SELECT *
FROM Students
WHERE fullname LIKE 'Nguyễn%';

SELECT *
FROM Students
WHERE fullname LIKE '%Anh';

SELECT *
FROM Students
WHERE age BETWEEN 18 AND 25;

SELECT *
FROM Students
WHERE id IN (2, 3);

SELECT Address.id, COUNT(address_id)
FROM Students
         JOIN Address ON address_id = Address.id
GROUP BY address_id;

SELECT MAX(point), MIN(point)
FROM Point;

SELECT UPPER(fullname)
FROM Students;

SELECT Course.name, AVG(point) AS 'Diem TB'
FROM Point
         JOIN Course ON Point.course_id = Course.id
GROUP BY Course.name
ORDER BY AVG(point)
DESC
    LIMIT 1;

#OR
# SELECT * FROM Students WHERE id = 2 OR id = 3;

#NOT
# SELECT * FROM Students WHERE NOT id IN (2, 3);

#
# SELECT * FROM Students WHERE NOT id IN (2, 3) AND NOT age = 20;
# SELECT * FROM Students WHERE NOT id IN (2, 3) AND NOT (age = 20 OR age = 22);

#JOIN
# SELECT Point.id, Course.name, Students.fullname, Point.point
# FROM Point
# JOIN Course ON Point.course_id = Course.id
# JOIN Students ON Point.student_id = Students.id;

# INNER JOIN
# SELECT Students.id, Students.fullname, Course.name
# FROM Students
# INNER JOIN Course ON Students.id = Course.id;

#LEFT JOIN & AS
# SELECT Students.id, Students.fullname, Course.name AS 'khoa hoc'
# FROM Course
# LEFT JOIN Students ON Students.id = Course.id;

#ORDER BY
# SELECT Students.fullname
# FROM Students
# ORDER BY age DESC;

#GROUP BY & HAVING
# SELECT address_id, SUM(age) AS 'so tuoi'
# FROM Students
# GROUP BY address_id
# HAVING SUM(age) > 42;






