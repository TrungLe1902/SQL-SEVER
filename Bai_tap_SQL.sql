USE LAYLOIHOI

GO
CREATE TABLE CHI_TIET_SU_DUNG_DV (
	MaDatPhong CHAR (10),
	MaDV CHAR (10),
	SoLuong CHAR(20),
	CONSTRAINT PK_MaDatPhong
	PRIMARY KEY (MaDatPhong)
)
GO 
CREATE TABLE DICH_VU_DI_KEM (
	MaDV CHAR (10),
	TenDV NVARCHAR (30),
	DonViTinh NVARCHAR (30),
	DonGia CHAR(15) ,
	CONSTRAINT PK_MaDV
	PRIMARY KEY (MaDV)
)
GO 
CREATE TABLE DAT_PHONG (
	MaDatPhong CHAR (10),
	MaPhong NVARCHAR (30),
	MaKH NVARCHAR (30),
	NgayDat DATE,
	GioBatDau TIME,
	GioKetThuc TIME,
	TienDatCoc INT,
	GhiChu NVARCHAR (30),
	TrangThaiDatHang NVARCHAR(20)
	CONSTRAINT PK_MaDatPhong
	PRIMARY KEY (MaDatPhong)
)

GO 
CREATE TABLE PHONG (
	MaPhong CHAR (10),
	LoaiPhong NVARCHAR (30),
	SoKhachToiDa NVARCHAR (30),
	GiaPhong INT,
	MoTa NVARCHAR(20),
	CONSTRAINT PK_MaPhong
	PRIMARY KEY (MaPhong)
)

GO 
CREATE TABLE KHACH_HANG (
	MaKH CHAR (10),
	TenKH NVARCHAR (30),
	DiaChi NVARCHAR (30),
	SoDT NVARCHAR (15),
	CONSTRAINT PK_MaKH
	PRIMARY KEY (MaKH)
)


ALTER TABLE [dbo].[CHI_TIET_SU_DUNG_DV] DROP CONSTRAINT PK_MaDatPhong;


GO
INSERT INTO [dbo].[PHONG] ([MaPhong],[LoaiPhong],[SoKhachToiDa],[GiaPhong],[MoTa])
VALUES	
		('P0001','Loai 1', '20','60,000',''),
		('P0002','Loai 1', '25','80,000',''),
		('P0003','Loai 2', '15','50,000',''),
		('P0004','Loai 3', '20','50,000','');
	

GO
INSERT INTO [dbo].[KHACH_HANG] ([MaKH],[TenKH],[DiaChi],[SoDT])
VALUES	
		('KH0001','Nguyen Van A', 'Hoa xuan','1111111111'),
		('KH0002','Nguyen Van B', 'Hoa hai','1111111112'),
		('KH0003','Phan Van A','Cam le','1111111113'),
		('KH0004','Phan Van B','Hoa xuan', '1111111114');

GO
INSERT INTO [dbo].[DICH_VU_DI_KEM] ([MaDV],[TenDV],[DonViTinh],[DonGia])
VALUES	
		('DV001','Beer','lon','10.000'),
		('DV002','Nuoc ngot','lon','8.000'),
		('DV003','Trai cay','dia','35.000'),
		('DV004','Khan uot','cai','2.000');

GO 
INSERT INTO [dbo].[DAT_PHONG]([MaDatPhong],[MaPhong],[MaKH],[NgayDat],[GioBatDau],[GioKetThuc],[TienDatCoc],[GhiChu],[TrangThaiDatHang])
VALUES	
		('DP0001','P0001','KH0002','2018/03/26','11:00','13:30','100,000','','Da dat'),
		('DP0002','P0001','KH0003','2018/03/27','17:15','19:15','50,000','','Da dhuy'),
		('DP0003','P0002','KH0002','2018/03/26','20:30','22:15','100,000','','Da dat'),
		('DP0004','P0003','KH0001','2018/04/01','19:30','21:15','200,000','','Da dat');

GO 
INSERT INTO [dbo].[CHI_TIET_SU_DUNG_DV]([MaDatPhong],[MaDV],[SoLuong])
VALUES	
		('DP0001','DV001','20'),
		('DP0001','DV003','3'),
		('DP0001','DV002','10'),
		('DP0002','DV002','10'),
		('DP0002','DV003','1'),
		('DP0003','DV003','2'),
		('DP0003','DV004','10');

--I
--Câu 1:Liệt kê MaDatPhong, MaDV, SoLuong của tất cả các dịch vụ 
--có số lượng lớn hơn 3 và nhỏ hơn 10. (1 điểm)

SELECT [MaDatPhong],[MaDV],[SoLuong]
FROM [dbo].[CHI_TIET_SU_DUNG_DV]
WHERE [SoLuong] > 3

--Câu 2: Cập nhật dữ liệu trên trường GiaPhong thuộc bảng PHONG tăng lên 10,000 VNĐ 
--so với giá phòng hiện tại, chỉ cập nhật giá phòng của những phòng có số khách tối đa lớn hơn 10. (1 điểm)
UPDATE [dbo].[PHONG]
SET [GiaPhong]= [GiaPhong] + 10000
WHERE [SoKhachToiDa] > 10000;

--Câu 3: Xóa tất cả những đơn đặt phòng (từ bảng DAT_PHONG) 
--có trạng thái đặt (TrangThaiDat) là “Da huy”. (1 điểm)

DELETE FROM [dbo].[DAT_PHONG]
WHERE  [TrangThaiDatHang] = 'Da dhuy';

--II
--Câu 4: Hiển thị TenKH của những khách hàng có tên bắt đầu là một trong các ký tự “H”, “N”, “M” 
--và có độ dài tối đa là 20 ký tự. (1 điểm)

SELECT [TenKH]
FROM [dbo].[KHACH_HANG]
WHERE [TenKH] LIKE 'H%' OR [TenKH] LIKE 'N%' OR [TenKH] LIKE 'M%' AND [TenKH] >20;

--Câu 5: Hiển thị TenKH của tất cả các khách hàng có trong hệ thống, 
--TenKH nào trùng nhau thì chỉ hiển thị một lần. Sinh viên sử dụng hai cách khác nhau để thực hiện yêu cầu trên,
--mỗi cách sẽ được 0,5 điểm. (1 điểm)

SELECT DISTINCT [TenKH]
FROM [dbo].[KHACH_HANG]


--Câu 6: Hiển thị MaDV, TenDV, DonViTinh, DonGia của những dịch vụ đi kèm có DonViTinh là “lon” và có DonGia 
--lớn hơn 10,000 VNĐ hoặc những dịch vụ đi kèm có DonViTinh là “Cai” và có DonGia nhỏ hơn 5,000 VNĐ. (1 điểm)

SELECT [MaDV],[TenDV],[DonViTinh],[DonGia]
FROM [dbo].[DICH_VU_DI_KEM]
WHERE ([DonViTinh] = 'lon' AND TRY_CONVERT (NUMERIC,[DonGia]) > 10.000 )
		OR ([DonViTinh] = 'Cai' AND TRY_CONVERT (NUMERIC, [DonGia]) < 5.000);

--Câu 7: Hiển thị MaDatPhong, MaPhong, LoaiPhong, SoKhachToiDa, GiaPhong, MaKH, TenKH, SoDT, NgayDat, GioBatDau, GioKetThuc, MaDichVu, SoLuong, DonGia 
--của những đơn đặt phòng có năm đặt phòng là “2016”, “2017” 
--và đặt những phòng có giá phòng > 50,000 VNĐ/ 1 giờ. (1 điểm)

SELECT P.*,DP.*
FROM [dbo].[PHONG] p
INNER JOIN [dbo].[DAT_PHONG] DP ON P.MaPhong =DP.MaPhong
WHERE YEAR ([NgayDat]) = '2016' OR  YEAR ([NgayDat]) = '2018' 
	AND P.GiaPhong >50000;


--Câu 8: Hiển thị MaDatPhong, MaPhong, LoaiPhong, GiaPhong, TenKH, NgayDat, TongTienHat, TongTienSuDungDichVu, TongTienThanhToan tương ứng với từng mã đặt phòng có trong bảng DAT_PHONG. 
--Những đơn đặt phòng nào không sử dụng dịch vụ đi kèm thì cũng liệt kê thông tin của đơn đặt phòng đó ra. (1 điểm)


SELECT DP.MaDatPhong,DP.MaPhong,P.LoaiPhong,P.GiaPhong,KH.TenKH,DP.NgayDat,
	--TongTienHat = GiaPhong * (GioKetThuc – GioBatDau)
		P.GiaPhong * DATEDIFF(HOUR, DP.GioBatDau, DP.GioKetThuc) AS TongTienHat,
	--TongTienSuDungDichVu = SoLuong * DonGia
		CT.SoLuong * DV.DonGia  AS TongTienSuDungDichVu,
	--TongTienThanhToan = TongTienHat + sum (TongTienSuDungDichVu)
		P.GiaPhong * DATEDIFF(HOUR, DP.GioBatDau, DP.GioKetThuc) + SUM(CT.SoLuong * DV.DonGia) AS TongTienSuDungDichVu
FROM [dbo].[DAT_PHONG] DP
		INNER JOIN 	[dbo].[PHONG]	P				ON P.MaPhong = DP.MaPhong
		INNER JOIN [dbo].[KHACH_HANG] KH			ON KH.MaKH = DP.MaKH
		INNER JOIN [dbo].[CHI_TIET_SU_DUNG_DV] CT	ON CT.MaDatPhong= DP.MaDatPhong
		INNER JOIN [dbo].[DICH_VU_DI_KEM] DV		ON DV.MaDV = CT.MaDV
		GROUP BY DP.MaDatPhong,DP.MaPhong,P.LoaiPhong,P.GiaPhong,KH.TenKH,DP.NgayDat,DP.GioBatDau,DP.GioKetThuc,CT.SoLuong,DV.DonGia ;
--Câu 9: Hiển thị MaKH, TenKH, DiaChi, SoDT của những khách hàng đã từng đặt phòng karaoke 
--có địa chỉ ở “Hoa xuan”. (1 điểm)

SELECT KH.MaKH,KH.TenKH,KH.DiaChi,KH.SoDT
FROM [dbo].[KHACH_HANG] KH
INNER JOIN [dbo].[DAT_PHONG] DP ON DP.MaKH = KH.MaKH
WHERE [TrangThaiDatHang]= 'Da dat' AND [DiaChi] = 'Hoa xuan';

--Câu 10: Hiển thị MaPhong, LoaiPhong, SoKhachToiDa, GiaPhong, SoLanDat 
--của những phòng được khách hàng đặt có số lần đặt lớn hơn 2 lần 
--và trạng thái đặt là “Da dat”. (1 điểm)

SELECT P.MaPhong,P.LoaiPhong,P.SoKhachToiDa,P.GiaPhong,CT.SoLuong
FROM [dbo].[PHONG] P
		INNER JOIN [dbo].[DAT_PHONG] DP 
		ON DP.MaPhong = P.MaPhong 
		INNER JOIN [dbo].[CHI_TIET_SU_DUNG_DV] CT 
		ON CT.MaDatPhong = DP.MaDatPhong
WHERE CT.SoLuong > 2 AND DP.TrangThaiDatHang = 'Da dat'



--Xoá dữ liệu cột dongia
ALTER TABLE [dbo].[DICH_VU_DI_KEM] 
DROP COLUMN [DonGia];
--Tao Du Lieu Cot
ALTER TABLE [dbo].[DICH_VU_DI_KEM]
ADD DonGia INT;
--UpDate 
UPDATE [dbo].[DICH_VU_DI_KEM]
SET DonGia = '10000'
WHERE [MaDV] = 'DV001' 
UPDATE [dbo].[DICH_VU_DI_KEM]
SET DonGia = '8000'
WHERE [MaDV] = 'DV002'
UPDATE [dbo].[DICH_VU_DI_KEM]
SET DonGia = '35000'
WHERE [MaDV] = 'DV003'
UPDATE [dbo].[DICH_VU_DI_KEM]
SET DonGia = '2000'
WHERE [MaDV] = 'DV004'

select [DonGia]
from DICH_VU_DI_KEM


seLECT
CONVERT(INT, REPLACE('8000', ' ', '')); -- Loại bỏ khoảng trắng từ giá trị cũ và chuyển đổi sang kiểu dữ liệu DECIMAL
