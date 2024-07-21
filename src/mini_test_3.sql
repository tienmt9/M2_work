create database mini_test_3;
use mini_test_3;

CREATE TABLE VatTu
(
    id          INT PRIMARY KEY,
    ma_vat_tu   VARCHAR(50)  NOT NULL,
    ten_vat_tu  VARCHAR(100) NOT NULL,
    don_vi_tinh VARCHAR(50),
    gia_tien    DECIMAL(10, 2)
);

CREATE TABLE TonKho
(
    id                 INT PRIMARY KEY,
    vat_tu_id          INT,
    so_luong_dau       INT,
    tong_so_luong_nhap INT,
    tong_so_luong_xuat INT,
    FOREIGN KEY (vat_tu_id) REFERENCES VatTu (id)
);

CREATE TABLE NhaCungCap
(
    id               INT PRIMARY KEY,
    ma_nha_cung_cap  VARCHAR(50)  NOT NULL,
    ten_nha_cung_cap VARCHAR(100) NOT NULL,
    dia_chi          VARCHAR(200),
    so_dien_thoai    VARCHAR(20)
);

CREATE TABLE DonDatHang
(
    id              INT PRIMARY KEY,
    ma_don          VARCHAR(50) NOT NULL,
    ngay_dat_hang   DATETIME,
    nha_cung_cap_id INT,
    FOREIGN KEY (nha_cung_cap_id) REFERENCES NhaCungCap (id)
);

CREATE TABLE PhieuNhap
(
    id            INT PRIMARY KEY,
    so_phieu_nhap VARCHAR(50) NOT NULL,
    ngay_nhap     DATETIME,
    don_hang_id   INT,
    FOREIGN KEY (don_hang_id) REFERENCES DonDatHang (id)
);

CREATE TABLE PhieuXuat
(
    id             INT PRIMARY KEY,
    ngay_xuat      DATETIME,
    ten_khach_hang VARCHAR(100)
);

CREATE TABLE CT_DonHang
(
    id           INT PRIMARY KEY,
    don_hang_id  INT,
    vat_tu_id    INT,
    so_luong_dat INT,
    FOREIGN KEY (don_hang_id) REFERENCES DonDatHang (id),
    FOREIGN KEY (vat_tu_id) REFERENCES VatTu (id)
);

CREATE TABLE CT_PhieuNhap
(
    id            INT PRIMARY KEY,
    phieu_nhap_id INT,
    vat_tu_id     INT,
    so_luong_nhap INT,
    don_gia_nhap  DECIMAL(10, 2),
    ghi_chu       VARCHAR(200),
    FOREIGN KEY (phieu_nhap_id) REFERENCES PhieuNhap (id),
    FOREIGN KEY (vat_tu_id) REFERENCES VatTu (id)
);

CREATE TABLE CT_PhieuXuat
(
    id            INT PRIMARY KEY,
    phieu_xuat_id INT,
    vat_tu_id     INT,
    so_luong_xuat INT,
    don_gia_xuat  DECIMAL(10, 2),
    ghi_chu       VARCHAR(200),
    FOREIGN KEY (phieu_xuat_id) REFERENCES PhieuXuat (id),
    FOREIGN KEY (vat_tu_id) REFERENCES VatTu (id)
);

INSERT INTO VatTu (id, ma_vat_tu, ten_vat_tu, don_vi_tinh, gia_tien)
VALUES (1, 'VT001', 'Vật tư A', 'Cái', 1000.00),
       (2, 'VT002', 'Vật tư B', 'Bộ', 2000.00),
       (3, 'VT003', 'Vật tư C', 'Kg', 1500.00),
       (4, 'VT004', 'Vật tư D', 'Hộp', 2500.00),
       (5, 'VT005', 'Vật tư E', 'Cái', 3000.00);

INSERT INTO TonKho (id, vat_tu_id, so_luong_dau, tong_so_luong_nhap, tong_so_luong_xuat)
VALUES (1, 1, 50, 100, 30),
       (2, 2, 20, 50, 10),
       (3, 3, 70, 200, 150),
       (4, 4, 30, 60, 20),
       (5, 5, 40, 80, 25),
       (6, 1, 25, 75, 35),
       (7, 2, 15, 65, 25),
       (8, 3, 55, 155, 95),
       (9, 4, 35, 85, 45),
       (10, 5, 45, 95, 50);

INSERT INTO NhaCungCap (id, ma_nha_cung_cap, ten_nha_cung_cap, dia_chi, so_dien_thoai)
VALUES (1, 'NCC001', 'Nhà cung cấp A', 'Địa chỉ A', '0123456789'),
       (2, 'NCC002', 'Nhà cung cấp B', 'Địa chỉ B', '0987654321'),
       (3, 'NCC003', 'Nhà cung cấp C', 'Địa chỉ C', '0112233445');

INSERT INTO DonDatHang (id, ma_don, ngay_dat_hang, nha_cung_cap_id)
VALUES (1, 'DH001', '2024-07-01', 1),
       (2, 'DH002', '2024-07-05', 2),
       (3, 'DH003', '2024-07-10', 3);

INSERT INTO PhieuNhap (id, so_phieu_nhap, ngay_nhap, don_hang_id)
VALUES (1, 'PN001', '2024-07-02', 1),
       (2, 'PN002', '2024-07-06', 2),
       (3, 'PN003', '2024-07-11', 3);

INSERT INTO PhieuXuat (id, ngay_xuat, ten_khach_hang)
VALUES (1, '2024-07-03', 'Khách hàng A'),
       (2, '2024-07-07', 'Khách hàng B'),
       (3, '2024-07-12', 'Khách hàng C');

INSERT INTO CT_DonHang (id, don_hang_id, vat_tu_id, so_luong_dat)
VALUES (1, 1, 1, 30),
       (2, 1, 2, 40),
       (3, 2, 3, 50),
       (4, 2, 4, 60),
       (5, 3, 5, 70),
       (6, 3, 1, 20);

INSERT INTO CT_PhieuNhap (id, phieu_nhap_id, vat_tu_id, so_luong_nhap, don_gia_nhap, ghi_chu)
VALUES (1, 1, 1, 30, 950.00, 'Ghi chú 1'),
       (2, 1, 2, 20, 1900.00, 'Ghi chú 2'),
       (3, 2, 3, 50, 1450.00, 'Ghi chú 3'),
       (4, 2, 4, 60, 2400.00, 'Ghi chú 4'),
       (5, 3, 5, 70, 2900.00, 'Ghi chú 5'),
       (6, 3, 1, 25, 1050.00, 'Ghi chú 6');

INSERT INTO CT_PhieuXuat (id, phieu_xuat_id, vat_tu_id, so_luong_xuat, don_gia_xuat, ghi_chu)
VALUES (1, 1, 1, 15, 1100.00, 'Ghi chú 1'),
       (2, 1, 2, 10, 2100.00, 'Ghi chú 2'),
       (3, 2, 3, 25, 1600.00, 'Ghi chú 3'),
       (4, 2, 4, 30, 2600.00, 'Ghi chú 4'),
       (5, 3, 5, 35, 3100.00, 'Ghi chú 5'),
       (6, 3, 1, 20, 1200.00, 'Ghi chú 6');

CREATE VIEW vw_CTPNHAP AS
SELECT pn.so_phieu_nhap,
       vt.ma_vat_tu,
       ctpn.so_luong_nhap,
       ctpn.don_gia_nhap,
       (ctpn.so_luong_nhap * ctpn.don_gia_nhap) AS thanh_tien_nhap
FROM CT_PhieuNhap ctpn
         JOIN
     PhieuNhap pn ON ctpn.phieu_nhap_id = pn.id
         JOIN
     VatTu vt ON ctpn.vat_tu_id = vt.id;

CREATE VIEW vw_CTPNHAP_VT AS
SELECT pn.so_phieu_nhap,
       vt.ma_vat_tu,
       vt.ten_vat_tu,
       ctpn.so_luong_nhap,
       ctpn.don_gia_nhap,
       (ctpn.so_luong_nhap * ctpn.don_gia_nhap) AS thanh_tien_nhap
FROM CT_PhieuNhap ctpn
         JOIN
     PhieuNhap pn ON ctpn.phieu_nhap_id = pn.id
         JOIN
     VatTu vt ON ctpn.vat_tu_id = vt.id;

CREATE VIEW vw_CTPNHAP_VT_PN AS
SELECT pn.so_phieu_nhap,
       pn.ngay_nhap,
       dh.ma_don,
       vt.ma_vat_tu,
       vt.ten_vat_tu,
       ctpn.so_luong_nhap,
       ctpn.don_gia_nhap,
       (ctpn.so_luong_nhap * ctpn.don_gia_nhap) AS thanh_tien_nhap
FROM CT_PhieuNhap ctpn
         JOIN
     PhieuNhap pn ON ctpn.phieu_nhap_id = pn.id
         JOIN
     DonDatHang dh ON pn.don_hang_id = dh.id
         JOIN
     VatTu vt ON ctpn.vat_tu_id = vt.id;

CREATE VIEW vw_CTPNHAP_VT_PN_DH AS
SELECT pn.so_phieu_nhap,
       pn.ngay_nhap,
       dh.ma_don,
       ncc.ma_nha_cung_cap,
       vt.ma_vat_tu,
       vt.ten_vat_tu,
       ctpn.so_luong_nhap,
       ctpn.don_gia_nhap,
       (ctpn.so_luong_nhap * ctpn.don_gia_nhap) AS thanh_tien_nhap
FROM CT_PhieuNhap ctpn
         JOIN
     PhieuNhap pn ON ctpn.phieu_nhap_id = pn.id
         JOIN
     DonDatHang dh ON pn.don_hang_id = dh.id
         JOIN
     NhaCungCap ncc ON dh.nha_cung_cap_id = ncc.id
         JOIN
     VatTu vt ON ctpn.vat_tu_id = vt.id;

CREATE VIEW vw_CTPNHAP_loc AS
SELECT pn.so_phieu_nhap,
       vt.ma_vat_tu,
       ctpn.so_luong_nhap,
       ctpn.don_gia_nhap,
       (ctpn.so_luong_nhap * ctpn.don_gia_nhap) AS thanh_tien_nhap
FROM CT_PhieuNhap ctpn
         JOIN
     PhieuNhap pn ON ctpn.phieu_nhap_id = pn.id
         JOIN
     VatTu vt ON ctpn.vat_tu_id = vt.id
WHERE ctpn.so_luong_nhap > 5;

CREATE VIEW vw_CTPNHAP_VT_loc AS
SELECT pn.so_phieu_nhap,
       vt.ma_vat_tu,
       vt.ten_vat_tu,
       ctpn.so_luong_nhap,
       ctpn.don_gia_nhap,
       (ctpn.so_luong_nhap * ctpn.don_gia_nhap) AS thanh_tien_nhap
FROM CT_PhieuNhap ctpn
         JOIN
     PhieuNhap pn ON ctpn.phieu_nhap_id = pn.id
         JOIN
     VatTu vt ON ctpn.vat_tu_id = vt.id
WHERE vt.don_vi_tinh = 'Bộ';

CREATE VIEW vw_CTPXUAT AS
SELECT px.id                                    AS so_phieu_xuat,
       vt.ma_vat_tu,
       ctpn.so_luong_xuat,
       ctpn.don_gia_xuat,
       (ctpn.so_luong_xuat * ctpn.don_gia_xuat) AS thanh_tien_xuat
FROM CT_PhieuXuat ctpn
         JOIN
     PhieuXuat px ON ctpn.phieu_xuat_id = px.id
         JOIN
     VatTu vt ON ctpn.vat_tu_id = vt.id;

CREATE VIEW vw_CTPXUAT_VT AS
SELECT px.id AS so_phieu_xuat,
       vt.ma_vat_tu,
       vt.ten_vat_tu,
       ctpn.so_luong_xuat,
       ctpn.don_gia_xuat
FROM CT_PhieuXuat ctpn
         JOIN
     PhieuXuat px ON ctpn.phieu_xuat_id = px.id
         JOIN
     VatTu vt ON ctpn.vat_tu_id = vt.id;

CREATE VIEW vw_CTPXUAT_VT_PX AS
SELECT px.id AS so_phieu_xuat,
       px.ten_khach_hang,
       vt.ma_vat_tu,
       vt.ten_vat_tu,
       ctpn.so_luong_xuat,
       ctpn.don_gia_xuat
FROM CT_PhieuXuat ctpn
         JOIN
     PhieuXuat px ON ctpn.phieu_xuat_id = px.id
         JOIN
     VatTu vt ON ctpn.vat_tu_id = vt.id;

DELIMITER //

CREATE PROCEDURE SP_TongSoLuongCuoiVatTu(IN ma_vat_tu VARCHAR(50))
BEGIN
    DECLARE tong_so_luong_cuoi INT;

    SELECT SUM(so_luong_dau + tong_so_luong_nhap - tong_so_luong_xuat)
    INTO tong_so_luong_cuoi
    FROM TonKho tk
             JOIN VatTu vt ON tk.vat_tu_id = vt.id
    WHERE vt.ma_vat_tu = ma_vat_tu;

    SELECT tong_so_luong_cuoi AS TongSoLuongCuoi;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE SP_TongTienXuatVatTu(IN ma_vat_tu VARCHAR(50))
BEGIN
    DECLARE tong_tien_xuat DECIMAL(10, 2);

    SELECT SUM(ctpx.so_luong_xuat * ctpx.don_gia_xuat)
    INTO tong_tien_xuat
    FROM CT_PhieuXuat ctpx
             JOIN VatTu vt ON ctpx.vat_tu_id = vt.id
    WHERE vt.ma_vat_tu = ma_vat_tu;

    SELECT tong_tien_xuat AS TongTienXuat;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE SP_TongSoLuongDat(IN so_don_hang VARCHAR(50))
BEGIN
    DECLARE tong_so_luong_dat INT;

    SELECT SUM(ctdh.so_luong_dat)
    INTO tong_so_luong_dat
    FROM CT_DonHang ctdh
             JOIN DonDatHang ddh ON ctdh.don_hang_id = ddh.id
    WHERE ddh.ma_don = so_don_hang;

    SELECT tong_so_luong_dat AS TongSoLuongDat;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE SP_ThemDonDatHang(
    IN ma_don VARCHAR(50),
    IN ngay_dat_hang DATE,
    IN nha_cung_cap_id INT
)
BEGIN
    INSERT INTO DonDatHang (ma_don, ngay_dat_hang, nha_cung_cap_id)
    VALUES (ma_don, ngay_dat_hang, nha_cung_cap_id);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE SP_ThemChiTietDonHang(
    IN don_hang_id INT,
    IN vat_tu_id INT,
    IN so_luong_dat INT
)
BEGIN
    INSERT INTO CT_DonHang (don_hang_id, vat_tu_id, so_luong_dat)
    VALUES (don_hang_id, vat_tu_id, so_luong_dat);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE SP_XoaNhaCungCap(IN nha_cung_cap_id INT)
BEGIN
    UPDATE DonDatHang
    SET nha_cung_cap_id = NULL
    WHERE nha_cung_cap_id = nha_cung_cap_id;

    DELETE
    FROM NhaCungCap
    WHERE id = nha_cung_cap_id;
END //

DELIMITER ;

