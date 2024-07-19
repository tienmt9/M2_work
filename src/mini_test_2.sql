create database mini_test_2;
use mini_test_2;

create table Cities
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

INSERT INTO Cities
VALUES (1, 'Hà Nội'),
       (2, 'Thành phố Hồ Chí Minh'),
       (3, 'Đà Nẵng'),
       (4, 'Hải Phòng'),
       (5, 'Cần Thơ');

create table TouristDestinations
(
    id               INT,
    destination_name VARCHAR(255) NOT NULL,
    description      VARCHAR(255) NOT NULL,
    average_price    INT          NOT NULL,
    city_id          INT,
    FOREIGN KEY (city_id) REFERENCES Cities (id)
);

INSERT INTO TouristDestinations
VALUES (1, 'Đà Nẵng', 'Thành phố biển nổi tiếng với bãi biển Mỹ Khê và ngôi chùa Linh Ứng.', 1000, 1),
       (2, 'Hạ Long', 'Vịnh Hạ Long - di sản thiên nhiên thế giới, nổi tiếng với những hòn đảo đá vôi.', 1200, 2),
       (3, 'Sapa',
        'Thị trấn nằm trong dãy núi Hoàng Liên Sơn, nổi tiếng với cảnh quan thiên nhiên và đồng bào dân tộc.', 900, 3),
       (4, 'Đà Lạt', 'Thành phố ngàn hoa, có khí hậu mát mẻ quanh năm và hồ Xuân Hương nổi tiếng.', 800, 4),
       (5, 'Phú Quốc', 'Đảo ngọc nổi tiếng với bãi biển dài, rừng nhiệt đới và các resort cao cấp.', 1500, 5);

create table Customers
(
    id                   INT PRIMARY KEY AUTO_INCREMENT,
    name                 VARCHAR(255) NOT NULL,
    identity_card_number VARCHAR(20)  NOT NULL,
    birth_year           INT          NOT NULL,
    city_id              INT,
    FOREIGN KEY (city_id) REFERENCES Cities (id)
);

INSERT INTO Customers
VALUES (1, 'Nguyễn Văn A', '123456789', 1985, 1),
       (2, 'Trần Thị B', '987654321', 1990, 2),
       (3, 'Lê Hoàng C', '456789123', 1988, 3),
       (4, 'Phạm Thị Dương', '654321789', 1995, 4),
       (5, 'Nguyễn Văn Bình', '789456123', 1980, 5),
       (6, 'Hoàng Thị Mai Anh', '321789456', 1987, 1),
       (7, 'Trần Văn Đức', '159357246', 1992, 3),
       (8, 'Nguyễn Thị Lan', '852963741', 1983, 2),
       (9, 'Phan Văn Khánh', '369852147', 1989, 4),
       (10, 'Lê Thị Hồng Nhung', '741852963', 1993, 5);

create table Tours
(
    id                INT PRIMARY KEY AUTO_INCREMENT,
    tour_code         VARCHAR(50) NOT NULL,
    tour_type_id      INT,
    destination_price INT         NOT NULL,
    start_date        datetime,
    end_date          datetime
);

INSERT INTO Tours
VALUES (1, 'TOUR001', 1, 1200, '2024-08-01', '2024-08-05'),
       (2, 'TOUR002', 2, 1500, '2024-08-10', '2024-08-15'),
       (3, 'TOUR003', 3, 1000, '2024-09-01', '2024-09-07'),
       (4, 'TOUR004', 1, 800, '2024-09-15', '2024-09-20'),
       (5, 'TOUR005', 2, 1300, '2024-10-05', '2024-10-10'),
       (6, 'TOUR006', 3, 1100, '2024-10-15', '2024-10-20'),
       (7, 'TOUR007', 1, 900, '2024-11-01', '2024-11-07'),
       (8, 'TOUR008', 2, 1400, '2024-11-10', '2024-11-15'),
       (9, 'TOUR009', 3, 950, '2024-12-01', '2024-12-07'),
       (10, 'TOUR010', 1, 850, '2024-12-15', '2024-12-20'),
       (11, 'TOUR011', 2, 1600, '2025-01-05', '2025-01-10'),
       (12, 'TOUR012', 3, 1050, '2025-01-15', '2025-01-20'),
       (13, 'TOUR013', 1, 950, '2025-02-01', '2025-02-07'),
       (14, 'TOUR014', 2, 1700, '2025-02-10', '2025-02-15'),
       (15, 'TOUR015', 3, 1100, '2025-03-01', '2025-03-07');

create table TourTypes
(
    id        INT,
    type_code VARCHAR(50)  NOT NULL,
    type_name VARCHAR(255) NOT NULL
);

insert into TourTypes
values (1, 'ADVENTURE', 'Adventure Tour'),
       (2, 'RELAX', 'Relaxation Tour');

create table BookingInvoice
(
    id          INT,
    tour_id     INT,
    FOREIGN KEY (tour_id) REFERENCES Tours (id),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers (id),
    status      VARCHAR(50) NOT NULL
);

insert into BookingInvoice
values (1, 1, 1, 'Confirmed'),
       (2, 2, 2, 'Confirmed'),
       (3, 3, 3, 'Pending'),
       (4, 4, 4, 'Confirmed'),
       (5, 5, 5, 'Pending'),
       (6, 6, 6, 'Confirmed'),
       (7, 7, 7, 'Pending'),
       (8, 8, 8, 'Confirmed'),
       (9, 9, 9, 'Pending'),
       (10, 10, 10, 'Confirmed');

SELECT Cities.name, COUNT(customer_id)
FROM Customers
         JOIN Cities ON Customers.city_id = Cities.id
         JOIN BookingInvoice ON Customers.id = BookingInvoice.customer_id
GROUP BY Cities.name;

SELECT COUNT(start_date)
FROM Tours
WHERE YEAR(start_date) = 2025
  AND MONTH(start_date) = 3;

SELECT COUNT(end_date)
FROM Tours
WHERE YEAR(end_date) = 2025
  AND MONTH(end_date) = 4;


