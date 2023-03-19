USE [QLTour]
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 3/19/2023 11:49:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BinhLuan] [nvarchar](max) NULL,
	[NgayBinhLuan] [date] NULL,
	[NguoiDungID] [int] NULL,
	[TourID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatTour]    Script Date: 3/19/2023 11:49:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatTour](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [date] NULL,
	[SoLuong] [int] NULL,
	[NguoiDungID] [int] NULL,
	[TourID] [int] NULL,
	[ThanhToan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiaDiem]    Script Date: 3/19/2023 11:49:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiaDiem](
	[ID] [nvarchar](50) NOT NULL,
	[Ten] [nvarchar](200) NULL,
	[LoaiTourID] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiaoDich]    Script Date: 3/19/2023 11:49:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoDich](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Tien] [money] NULL,
	[NgayGiaoDich] [date] NULL,
	[TaiKhoanID] [int] NULL,
	[SoDuBanDau] [money] NULL,
	[SoDuSauGiaoDich] [money] NULL,
 CONSTRAINT [PK_GiaoDich] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiTour]    Script Date: 3/19/2023 11:49:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTour](
	[ID] [nvarchar](50) NOT NULL,
	[Ten] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NganHang]    Script Date: 3/19/2023 11:49:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NganHang](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](max) NULL,
 CONSTRAINT [PK_NganHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 3/19/2023 11:49:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](200) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[SDT] [nvarchar](50) NULL,
	[Email] [nvarchar](200) NULL,
	[Passport] [nvarchar](200) NULL,
	[ThanhPhoID] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 3/19/2023 11:49:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SoTaiKhoan] [nvarchar](50) NULL,
	[TenChuTaiKhoan] [nvarchar](max) NULL,
	[NganHangID] [int] NULL,
	[Tien] [money] NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhPho]    Script Date: 3/19/2023 11:49:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhPho](
	[ID] [nvarchar](50) NOT NULL,
	[Ten] [nvarchar](200) NULL,
 CONSTRAINT [PK_ThanhPho] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 3/19/2023 11:49:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](200) NULL,
	[Gia] [money] NULL,
	[SoLuong] [int] NULL,
	[MoTa] [nvarchar](max) NULL,
	[Hinh] [nvarchar](max) NULL,
	[NgayKhoiHanh] [date] NULL,
	[NgayKetThuc] [date] NULL,
	[DiemKhoiHanh] [nvarchar](50) NULL,
	[DiemDen] [nvarchar](50) NULL,
	[LoaiTourID] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DatTour] ON 
GO
INSERT [dbo].[DatTour] ([ID], [NgayDat], [SoLuong], [NguoiDungID], [TourID], [ThanhToan]) VALUES (1, CAST(N'2023-03-14' AS Date), 3, 2, 2, NULL)
GO
INSERT [dbo].[DatTour] ([ID], [NgayDat], [SoLuong], [NguoiDungID], [TourID], [ThanhToan]) VALUES (2, CAST(N'2023-03-14' AS Date), 3, 2, 2, NULL)
GO
INSERT [dbo].[DatTour] ([ID], [NgayDat], [SoLuong], [NguoiDungID], [TourID], [ThanhToan]) VALUES (3, CAST(N'2023-03-14' AS Date), 1, 3, 3, NULL)
GO
INSERT [dbo].[DatTour] ([ID], [NgayDat], [SoLuong], [NguoiDungID], [TourID], [ThanhToan]) VALUES (4, CAST(N'2023-03-14' AS Date), 2, 4, 3, NULL)
GO
INSERT [dbo].[DatTour] ([ID], [NgayDat], [SoLuong], [NguoiDungID], [TourID], [ThanhToan]) VALUES (1002, CAST(N'2023-03-15' AS Date), 3, 1002, 3, NULL)
GO
INSERT [dbo].[DatTour] ([ID], [NgayDat], [SoLuong], [NguoiDungID], [TourID], [ThanhToan]) VALUES (1003, CAST(N'2023-03-15' AS Date), 1, 1002, 2, NULL)
GO
INSERT [dbo].[DatTour] ([ID], [NgayDat], [SoLuong], [NguoiDungID], [TourID], [ThanhToan]) VALUES (1004, CAST(N'2023-03-15' AS Date), 2, 1002, 2, NULL)
GO
INSERT [dbo].[DatTour] ([ID], [NgayDat], [SoLuong], [NguoiDungID], [TourID], [ThanhToan]) VALUES (1005, CAST(N'2023-03-15' AS Date), 2, 1002, 1, NULL)
GO
INSERT [dbo].[DatTour] ([ID], [NgayDat], [SoLuong], [NguoiDungID], [TourID], [ThanhToan]) VALUES (1006, CAST(N'2023-03-15' AS Date), 2, 1002, 3, NULL)
GO
INSERT [dbo].[DatTour] ([ID], [NgayDat], [SoLuong], [NguoiDungID], [TourID], [ThanhToan]) VALUES (1007, CAST(N'2023-03-19' AS Date), 3, 1002, 6, NULL)
GO
INSERT [dbo].[DatTour] ([ID], [NgayDat], [SoLuong], [NguoiDungID], [TourID], [ThanhToan]) VALUES (1008, CAST(N'2023-03-19' AS Date), 2, 1002, 5, NULL)
GO
INSERT [dbo].[DatTour] ([ID], [NgayDat], [SoLuong], [NguoiDungID], [TourID], [ThanhToan]) VALUES (1009, CAST(N'2023-03-19' AS Date), 2, 1002, 5, NULL)
GO
INSERT [dbo].[DatTour] ([ID], [NgayDat], [SoLuong], [NguoiDungID], [TourID], [ThanhToan]) VALUES (1010, CAST(N'2023-03-19' AS Date), 3, 1002, 6, NULL)
GO
SET IDENTITY_INSERT [dbo].[DatTour] OFF
GO
INSERT [dbo].[DiaDiem] ([ID], [Ten], [LoaiTourID]) VALUES (N'BEL', N'Bỉ', N'EU')
GO
INSERT [dbo].[DiaDiem] ([ID], [Ten], [LoaiTourID]) VALUES (N'CAN', N'Canada', N'AME')
GO
INSERT [dbo].[DiaDiem] ([ID], [Ten], [LoaiTourID]) VALUES (N'CMR', N'Cameroon', N'AFI')
GO
INSERT [dbo].[DiaDiem] ([ID], [Ten], [LoaiTourID]) VALUES (N'DL', N'Đà Lạt', N'VNM')
GO
INSERT [dbo].[DiaDiem] ([ID], [Ten], [LoaiTourID]) VALUES (N'DN', N'Đà Nẵng', N'VNM')
GO
INSERT [dbo].[DiaDiem] ([ID], [Ten], [LoaiTourID]) VALUES (N'DNK', N'Đan Mạch', N'EU')
GO
INSERT [dbo].[DiaDiem] ([ID], [Ten], [LoaiTourID]) VALUES (N'FRA', N'Pháp', N'EU')
GO
INSERT [dbo].[DiaDiem] ([ID], [Ten], [LoaiTourID]) VALUES (N'HCM', N'Hồ Chí Minh', N'VNM')
GO
INSERT [dbo].[DiaDiem] ([ID], [Ten], [LoaiTourID]) VALUES (N'HN', N'Hà Nội', N'VNM')
GO
INSERT [dbo].[DiaDiem] ([ID], [Ten], [LoaiTourID]) VALUES (N'JPN', N'Nhật Bản', N'ASIA')
GO
INSERT [dbo].[DiaDiem] ([ID], [Ten], [LoaiTourID]) VALUES (N'KOR', N'Hàn Quốc', N'ASIA')
GO
INSERT [dbo].[DiaDiem] ([ID], [Ten], [LoaiTourID]) VALUES (N'MEX', N'Mexico', N'AME')
GO
INSERT [dbo].[DiaDiem] ([ID], [Ten], [LoaiTourID]) VALUES (N'THA', N'Thái Lan', N'ASIA')
GO
INSERT [dbo].[DiaDiem] ([ID], [Ten], [LoaiTourID]) VALUES (N'USA', N'Mỹ', N'AME')
GO
SET IDENTITY_INSERT [dbo].[GiaoDich] ON 
GO
INSERT [dbo].[GiaoDich] ([ID], [Tien], [NgayGiaoDich], [TaiKhoanID], [SoDuBanDau], [SoDuSauGiaoDich]) VALUES (1, 63000000.0000, CAST(N'2023-03-19' AS Date), NULL, 500000000.0000, 437000000.0000)
GO
INSERT [dbo].[GiaoDich] ([ID], [Tien], [NgayGiaoDich], [TaiKhoanID], [SoDuBanDau], [SoDuSauGiaoDich]) VALUES (2, 180000000.0000, CAST(N'2023-03-19' AS Date), NULL, 437000000.0000, 257000000.0000)
GO
INSERT [dbo].[GiaoDich] ([ID], [Tien], [NgayGiaoDich], [TaiKhoanID], [SoDuBanDau], [SoDuSauGiaoDich]) VALUES (3, 180000000.0000, CAST(N'2023-03-19' AS Date), NULL, 257000000.0000, 77000000.0000)
GO
INSERT [dbo].[GiaoDich] ([ID], [Tien], [NgayGiaoDich], [TaiKhoanID], [SoDuBanDau], [SoDuSauGiaoDich]) VALUES (4, 63000000.0000, CAST(N'2023-03-19' AS Date), NULL, 77000000.0000, 14000000.0000)
GO
SET IDENTITY_INSERT [dbo].[GiaoDich] OFF
GO
INSERT [dbo].[LoaiTour] ([ID], [Ten]) VALUES (N'AFI', N'Châu Phi')
GO
INSERT [dbo].[LoaiTour] ([ID], [Ten]) VALUES (N'AME', N'Châu Mỹ')
GO
INSERT [dbo].[LoaiTour] ([ID], [Ten]) VALUES (N'ASIA', N'Châu Á')
GO
INSERT [dbo].[LoaiTour] ([ID], [Ten]) VALUES (N'EU', N'Châu Âu')
GO
INSERT [dbo].[LoaiTour] ([ID], [Ten]) VALUES (N'VNM', N'Việt Nam')
GO
SET IDENTITY_INSERT [dbo].[NganHang] ON 
GO
INSERT [dbo].[NganHang] ([ID], [Ten]) VALUES (1, N'Ngân hàng Công Thương Việt Nam - Vietinbank')
GO
INSERT [dbo].[NganHang] ([ID], [Ten]) VALUES (2, N'Ngân hàng Ngoại thương Việt Nam - Vietcombank')
GO
INSERT [dbo].[NganHang] ([ID], [Ten]) VALUES (3, N'Ngân hàng Đầu tư và Phát triển - BIDV')
GO
INSERT [dbo].[NganHang] ([ID], [Ten]) VALUES (4, N'Ngân hàng nông nghiệp và phát triền nông thôn - Agribank')
GO
INSERT [dbo].[NganHang] ([ID], [Ten]) VALUES (5, N'Ngân hàng Sài Gòn Thường Tín - Sacombank')
GO
INSERT [dbo].[NganHang] ([ID], [Ten]) VALUES (6, N'Ngân hàng Kỹ Thương Việt Nam - Techcombank')
GO
INSERT [dbo].[NganHang] ([ID], [Ten]) VALUES (7, N'Ngân hàng Á Châu - ACB')
GO
INSERT [dbo].[NganHang] ([ID], [Ten]) VALUES (8, N'Ngân hàng Tiên Phong - TPBank')
GO
INSERT [dbo].[NganHang] ([ID], [Ten]) VALUES (9, N'Ngân hàng Phương Đông - OCB')
GO
INSERT [dbo].[NganHang] ([ID], [Ten]) VALUES (10, N'Ngân hàng Quốc tế Việt Nam - VIB')
GO
SET IDENTITY_INSERT [dbo].[NganHang] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 
GO
INSERT [dbo].[NguoiDung] ([ID], [Ten], [DiaChi], [SDT], [Email], [Passport], [ThanhPhoID]) VALUES (1, N'User1', N'55 Trường Chinh', N'0256356985', N'User1@gmail.com', N'B0365632', N'01')
GO
INSERT [dbo].[NguoiDung] ([ID], [Ten], [DiaChi], [SDT], [Email], [Passport], [ThanhPhoID]) VALUES (2, N'Nguyễn Thành Đạt', N'15 Nguyễn Tri Phương', N'0123456789', N'dat136@gmail.com', N'B0256325', N'03')
GO
INSERT [dbo].[NguoiDung] ([ID], [Ten], [DiaChi], [SDT], [Email], [Passport], [ThanhPhoID]) VALUES (3, N'Nguyễn Thanh Hiền', N'68 Lạc Long Quân', N'0156389657', N'hiennguyen@gmail.com', N'B0563214', N'04')
GO
INSERT [dbo].[NguoiDung] ([ID], [Ten], [DiaChi], [SDT], [Email], [Passport], [ThanhPhoID]) VALUES (4, N'Trần Hoàng Nguyên', N'12 Trường Sơn', N'0156385698', N'nguyen000@gmail.com', N'B0236589', N'02')
GO
INSERT [dbo].[NguoiDung] ([ID], [Ten], [DiaChi], [SDT], [Email], [Passport], [ThanhPhoID]) VALUES (1002, N'Trần Đức Duy', N'60 Cộng Hoà', N'0123456789', N'duy@gmail.com', N'B0563256', N'02')
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 
GO
INSERT [dbo].[TaiKhoan] ([ID], [SoTaiKhoan], [TenChuTaiKhoan], [NganHangID], [Tien]) VALUES (1, N'101234567890', N'Trần Đức Duy', 1, 1014000000.0000)
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
INSERT [dbo].[ThanhPho] ([ID], [Ten]) VALUES (N'01', N'Hà Nội')
GO
INSERT [dbo].[ThanhPho] ([ID], [Ten]) VALUES (N'02', N'Hồ Chí Minh')
GO
INSERT [dbo].[ThanhPho] ([ID], [Ten]) VALUES (N'03', N'Hải Phòng')
GO
INSERT [dbo].[ThanhPho] ([ID], [Ten]) VALUES (N'04', N'Đà Nẵng')
GO
INSERT [dbo].[ThanhPho] ([ID], [Ten]) VALUES (N'05', N'Hà Giang')
GO
INSERT [dbo].[ThanhPho] ([ID], [Ten]) VALUES (N'06', N'Cao Bằng')
GO
INSERT [dbo].[ThanhPho] ([ID], [Ten]) VALUES (N'07', N'Lai Châu')
GO
INSERT [dbo].[ThanhPho] ([ID], [Ten]) VALUES (N'08', N'Lào Cai')
GO
INSERT [dbo].[ThanhPho] ([ID], [Ten]) VALUES (N'09', N'Tuyên Quang')
GO
INSERT [dbo].[ThanhPho] ([ID], [Ten]) VALUES (N'10', N'Lạng Sơn')
GO
SET IDENTITY_INSERT [dbo].[Tour] ON 
GO
INSERT [dbo].[Tour] ([ID], [Ten], [Gia], [SoLuong], [MoTa], [Hinh], [NgayKhoiHanh], [NgayKetThuc], [DiemKhoiHanh], [DiemDen], [LoaiTourID]) VALUES (1, N'Du lịch Nhật Bản', 36000000.0000, 50, N'Tokyo - Yokohama - Núi Phú Sĩ - Odaiba - Ngắm hoa anh đào', N'images/NhatBan.jpg', CAST(N'2023-03-25' AS Date), CAST(N'2023-04-01' AS Date), N'HCM', N'JPN', N'ASIA')
GO
INSERT [dbo].[Tour] ([ID], [Ten], [Gia], [SoLuong], [MoTa], [Hinh], [NgayKhoiHanh], [NgayKetThuc], [DiemKhoiHanh], [DiemDen], [LoaiTourID]) VALUES (2, N'Du lịch Pháp', 54000000.0000, 30, N'Tháp Eiffel - Điện Invalides - Quảng trường Concorde - Quảng trường Tertre', N'images/Phap.jpg', CAST(N'2023-03-25' AS Date), CAST(N'2023-04-01' AS Date), N'HCM', N'FRA', N'EU')
GO
INSERT [dbo].[Tour] ([ID], [Ten], [Gia], [SoLuong], [MoTa], [Hinh], [NgayKhoiHanh], [NgayKetThuc], [DiemKhoiHanh], [DiemDen], [LoaiTourID]) VALUES (3, N'Du lịch Mỹ', 95000000.0000, 15, N'New York - Washington Dc - Philadelphia - Las Vegas - San Diego - Los Angeles', N'images/My.jpg', CAST(N'2023-03-23' AS Date), CAST(N'2023-04-01' AS Date), N'HN', N'USA', N'AME')
GO
INSERT [dbo].[Tour] ([ID], [Ten], [Gia], [SoLuong], [MoTa], [Hinh], [NgayKhoiHanh], [NgayKetThuc], [DiemKhoiHanh], [DiemDen], [LoaiTourID]) VALUES (4, N'Du lịch Pháp', 81000000.0000, 26, N'Tháp Eiffel - Điện Invalides - Quảng trường Concorde - Quảng trường Tertre', N'images/Phap.jpg', CAST(N'2023-03-21' AS Date), CAST(N'2023-04-01' AS Date), N'HN', N'FRA', N'EU')
GO
INSERT [dbo].[Tour] ([ID], [Ten], [Gia], [SoLuong], [MoTa], [Hinh], [NgayKhoiHanh], [NgayKetThuc], [DiemKhoiHanh], [DiemDen], [LoaiTourID]) VALUES (5, N'Du lịch Canada', 90000000.0000, NULL, N'Khám phá mùa xuân Canada màu sắc các loài hoa khoe sắc và cảm nhận hương xuân mát lạnh tại một trong những nơi đón mùa xuân đẹp nhất thế giới
- Tham quan thành phố Vancouver năng động và hiện đại vào bậc nhất thế giới, Victoria đa văn hóa, sắc tộc, nghệ thuật và thanh bình. 
- Chiêm ngưỡng  phong cảnh đẹp kỳ vỹ, những ngọn núi uy nghiêm tráng lệ xen lẫn khu miền quê thân thương.
- Thư giãn dạo bước trong không khí trong lành và chiêm ngưỡng những thảm hoa rực rỡ khoe sắc được chăm sóc bởi những người làm vườn tài hoa trong vườn Butchart.
- Trải nghiệm đi qua cầu treo Capilano dành cho người đi bộ dài 137m, bắc ngang sông Capilano hay chiêm ngưỡng ngọn núi tuyết hùng vĩ Whistler Blackcomb..', N'Images/Canada.jpg', CAST(N'2023-04-06' AS Date), CAST(N'2023-04-16' AS Date), N'HCM', N'CAN', N'AME')
GO
INSERT [dbo].[Tour] ([ID], [Ten], [Gia], [SoLuong], [MoTa], [Hinh], [NgayKhoiHanh], [NgayKetThuc], [DiemKhoiHanh], [DiemDen], [LoaiTourID]) VALUES (6, N'Du lịch Hàn Quốc', 21000000.0000, NULL, N'- Thưởng ngoạn mùa xuân xứ Hàn 
- Cảm nhận không gian thi vị của những công trình kiến trúc đẹp cổ kính như Cố cung hay dạo bước 
dưới hàng cây ngân hạnh xanh mướt trên hòn đảo Nami nổi tiếng.
- Ngắm Hoa Anh Đào tại công viên Yeouido 
- Thỏa thích mua sắm với các sản phẩm chăm sóc sức khỏe và làm đẹp nổi tiếng Hàn Quốc', N'Images/HanQuoc.jpg', CAST(N'2023-04-06' AS Date), CAST(N'2023-04-10' AS Date), N'DN', N'KOR', N'ASIA')
GO
INSERT [dbo].[Tour] ([ID], [Ten], [Gia], [SoLuong], [MoTa], [Hinh], [NgayKhoiHanh], [NgayKetThuc], [DiemKhoiHanh], [DiemDen], [LoaiTourID]) VALUES (7, N'Du lịch Thái Lan', 16000000.0000, NULL, N'- Thăm xứ sở nụ cười Thái Lan với chùa Vàng, chùa thuyền Wat Yanawa linh thiêng, du ngoạn cảnh đẹp và thưởng thức Buffet du thuyền trên dòng sông Chaopraya.
- Chiêm ngưỡng các loài hoa, cây cảnh tại Vườn hoa nhiệt đới Nong Nooch.
- Tự do tắm biển, tham gia các hoạt động nhảy dù, lướt mô tô nước, lặn ngắm san hô...hòa mình trong làn nước trong xanh màu ngọc bích ở Đảo san hô Coral...', N'Images/ThaiLan.jpg', CAST(N'2023-04-06' AS Date), CAST(N'2023-04-09' AS Date), N'DN', N'THA', N'ASIA')
GO
SET IDENTITY_INSERT [dbo].[Tour] OFF
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD FOREIGN KEY([NguoiDungID])
REFERENCES [dbo].[NguoiDung] ([ID])
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD FOREIGN KEY([NguoiDungID])
REFERENCES [dbo].[NguoiDung] ([ID])
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD FOREIGN KEY([TourID])
REFERENCES [dbo].[Tour] ([ID])
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD FOREIGN KEY([TourID])
REFERENCES [dbo].[Tour] ([ID])
GO
ALTER TABLE [dbo].[DatTour]  WITH CHECK ADD FOREIGN KEY([NguoiDungID])
REFERENCES [dbo].[NguoiDung] ([ID])
GO
ALTER TABLE [dbo].[DatTour]  WITH CHECK ADD FOREIGN KEY([NguoiDungID])
REFERENCES [dbo].[NguoiDung] ([ID])
GO
ALTER TABLE [dbo].[DatTour]  WITH CHECK ADD FOREIGN KEY([TourID])
REFERENCES [dbo].[Tour] ([ID])
GO
ALTER TABLE [dbo].[DatTour]  WITH CHECK ADD FOREIGN KEY([TourID])
REFERENCES [dbo].[Tour] ([ID])
GO
ALTER TABLE [dbo].[DiaDiem]  WITH CHECK ADD FOREIGN KEY([LoaiTourID])
REFERENCES [dbo].[LoaiTour] ([ID])
GO
ALTER TABLE [dbo].[DiaDiem]  WITH CHECK ADD FOREIGN KEY([LoaiTourID])
REFERENCES [dbo].[LoaiTour] ([ID])
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_ThanhPho] FOREIGN KEY([ThanhPhoID])
REFERENCES [dbo].[ThanhPho] ([ID])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_ThanhPho]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_TaiKhoan] FOREIGN KEY([ID])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_TaiKhoan]
GO
ALTER TABLE [dbo].[ThanhPho]  WITH CHECK ADD  CONSTRAINT [FK_ThanhPho_ThanhPho] FOREIGN KEY([ID])
REFERENCES [dbo].[ThanhPho] ([ID])
GO
ALTER TABLE [dbo].[ThanhPho] CHECK CONSTRAINT [FK_ThanhPho_ThanhPho]
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD FOREIGN KEY([DiemDen])
REFERENCES [dbo].[DiaDiem] ([ID])
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD FOREIGN KEY([DiemDen])
REFERENCES [dbo].[DiaDiem] ([ID])
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD FOREIGN KEY([DiemKhoiHanh])
REFERENCES [dbo].[DiaDiem] ([ID])
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD FOREIGN KEY([DiemKhoiHanh])
REFERENCES [dbo].[DiaDiem] ([ID])
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD FOREIGN KEY([LoaiTourID])
REFERENCES [dbo].[LoaiTour] ([ID])
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD FOREIGN KEY([LoaiTourID])
REFERENCES [dbo].[LoaiTour] ([ID])
GO
