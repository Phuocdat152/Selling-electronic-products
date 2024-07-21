USE [master]
GO
/****** Object:  Database [WebsiteBanHang]    Script Date: 11/11/2023 11:28:33 AM ******/
CREATE DATABASE [WebsiteBanHang]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebsiteBanHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebsiteBanHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebsiteBanHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebsiteBanHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebsiteBanHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebsiteBanHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET RECOVERY FULL 
GO
ALTER DATABASE [WebsiteBanHang] SET  MULTI_USER 
GO
ALTER DATABASE [WebsiteBanHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebsiteBanHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebsiteBanHang] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebsiteBanHang] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebsiteBanHang', N'ON'
GO
ALTER DATABASE [WebsiteBanHang] SET QUERY_STORE = ON
GO
ALTER DATABASE [WebsiteBanHang] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200)
GO
USE [WebsiteBanHang]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 11/11/2023 11:28:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Avatar] [varchar](100) NULL,
	[Slug] [varchar](100) NULL,
	[ShowOnHomePage] [bit] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/11/2023 11:28:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avatar] [nchar](100) NULL,
	[Slug] [varchar](100) NULL,
	[ShowOnHomePage] [bit] NULL,
	[Deleted] [bit] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 11/11/2023 11:28:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credential](
	[ID] [int] NOT NULL,
	[GroupId] [int] NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_Credential] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 11/11/2023 11:28:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 11/11/2023 11:28:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Avatar] [nvarchar](50) NULL,
	[LoginName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [int] NULL,
	[GroupId] [int] NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 11/11/2023 11:28:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Avatar] [nvarchar](50) NULL,
	[Description] [nvarchar](4000) NULL,
	[Author] [nvarchar](50) NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/11/2023 11:28:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[UserId] [int] NULL,
	[Status] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipMobile] [nvarchar](50) NULL,
	[ShipAddress] [nvarchar](50) NULL,
	[ShipEmail] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/11/2023 11:28:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/11/2023 11:28:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avatar] [nchar](100) NULL,
	[CategoryId] [int] NULL,
	[ShortDes] [nvarchar](100) NULL,
	[FullDescription] [nvarchar](500) NULL,
	[Price] [float] NULL,
	[PriceDiscount] [float] NULL,
	[TypeId] [int] NULL,
	[Slug] [varchar](50) NULL,
	[BrandId] [int] NULL,
	[Deleted] [bit] NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/11/2023 11:28:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[GroupName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/11/2023 11:28:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsAdmin] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([ID], [Name], [Avatar], [Slug], [ShowOnHomePage], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (1, N'ABECO', NULL, N'abeco', 1, NULL, NULL, 0)
INSERT [dbo].[Brand] ([ID], [Name], [Avatar], [Slug], [ShowOnHomePage], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (2, N'DAEWOO', NULL, N'daewoo', 1, NULL, NULL, 0)
INSERT [dbo].[Brand] ([ID], [Name], [Avatar], [Slug], [ShowOnHomePage], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (3, N'GENESISTEK', NULL, N'genesistek', 1, NULL, NULL, 0)
INSERT [dbo].[Brand] ([ID], [Name], [Avatar], [Slug], [ShowOnHomePage], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (4, N'Jing Gong', NULL, N'jinggong', 1, NULL, NULL, 0)
INSERT [dbo].[Brand] ([ID], [Name], [Avatar], [Slug], [ShowOnHomePage], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (5, N'SEI', NULL, N'sei', 1, NULL, NULL, 0)
INSERT [dbo].[Brand] ([ID], [Name], [Avatar], [Slug], [ShowOnHomePage], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (6, N'Partron', NULL, N'partron', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [Avatar], [Slug], [ShowOnHomePage], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'Arduino', N'arduino.jpg                                                                                         ', N'arduino', 1, 0, NULL, NULL)
INSERT [dbo].[Category] ([ID], [Name], [Avatar], [Slug], [ShowOnHomePage], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'Cảm biến', N'cambien.jpg                                                                                         ', N'cam-bien', 1, 0, NULL, NULL)
INSERT [dbo].[Category] ([ID], [Name], [Avatar], [Slug], [ShowOnHomePage], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (7, N'Đèn LED', NULL, N'den-led', 0, 0, NULL, NULL)
INSERT [dbo].[Category] ([ID], [Name], [Avatar], [Slug], [ShowOnHomePage], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (8, N'Module', N'module.jpg                                                                                          ', N'module', 1, NULL, NULL, NULL)
INSERT [dbo].[Category] ([ID], [Name], [Avatar], [Slug], [ShowOnHomePage], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (9, N'Dụng cụ, Phụ kiện điện tử', NULL, N'dung-cu-phu-kien', 0, NULL, NULL, NULL)
INSERT [dbo].[Category] ([ID], [Name], [Avatar], [Slug], [ShowOnHomePage], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (10, N'PIN', NULL, N'pin', 0, NULL, NULL, NULL)
INSERT [dbo].[Category] ([ID], [Name], [Avatar], [Slug], [ShowOnHomePage], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (11, N'Nguồn adapter', NULL, N'nguon-adapter', 0, NULL, NULL, NULL)
INSERT [dbo].[Category] ([ID], [Name], [Avatar], [Slug], [ShowOnHomePage], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (13, N'Màn hình LCD', NULL, N'man-hinh-lcd', 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[Credential] ([ID], [GroupId], [RoleId]) VALUES (1, 10, 10)
INSERT [dbo].[Credential] ([ID], [GroupId], [RoleId]) VALUES (2, 20, 20)
GO
INSERT [dbo].[Group] ([ID], [Name]) VALUES (10, N'Quản trị viên')
INSERT [dbo].[Group] ([ID], [Name]) VALUES (20, N'Thành viên')
INSERT [dbo].[Group] ([ID], [Name]) VALUES (30, N'Checker')
GO
INSERT [dbo].[Member] ([ID], [Name], [Avatar], [LoginName], [Password], [CreatedDate], [Status], [GroupId]) VALUES (1, N'Phước Đạt', N'avatar3.jpg', N'phuocdat.203@gmail.com', N'827ccb0eea8a706c4c34a16891f84e7b', CAST(N'2023-11-05T00:00:00.000' AS DateTime), NULL, 10)
INSERT [dbo].[Member] ([ID], [Name], [Avatar], [LoginName], [Password], [CreatedDate], [Status], [GroupId]) VALUES (2, N'Đặng Phước Đạt', N'avatar1.jpg', N'phuocdat.2033@gmail.com', N'827ccb0eea8a706c4c34a16891f84e7b', CAST(N'2023-11-07T00:00:00.000' AS DateTime), NULL, 10)
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([ID], [Title], [Avatar], [Description], [Author], [CreatedDate]) VALUES (1, N'Elon musk và anh Facebook', N'musk zac.jpg', N'Threads, mạng xã hội đối đầu Elon Musk của Mark Zuckerberg, được ví như kỳ quan tại Meta khi hình thành chỉ trong 7 tháng bởi nhóm 60 người.  Khi đang đi nghỉ cùng gia đình ở Italy vào tháng 11/2022, Adam Mosseri nhận lệnh họp từ xa với ban lãnh đạo Meta để làm gì đó cạnh tranh trực tiếp với Elon Musk, người vừa tiếp quản Twitter được vài tuần.', N'Đạt', CAST(N'2023-11-02' AS Date))
INSERT [dbo].[News] ([ID], [Title], [Avatar], [Description], [Author], [CreatedDate]) VALUES (2, N'Nỗi đau ngành chip - khan hiếm hóa dư thừa', N'chip news.png', N'Khủng hoảng thiếu hụt chip thời Covid-19 hiện chuyển sang thừa thãi, khiến nhiều hãng chip hàng đầu thế giới gánh chịu hậu quả.  Đại dịch từng gây gián đoạn nặng nề với chuỗi cung ứng và tăng gánh nặng cho các dây chuyền sản xuất bán dẫn khi nhiều người phải làm việc ở nhà và cần mua sắm thiết bị điện tử. Điều đó dẫn tới nhu cầu tăng vọt với các hãng sản xuất chip nhớ như Samsung, SK Hynix, Micron. Tình trạng khan hiếm chip nói riêng và sản phẩm tiêu dùng nói chung kéo dài đến nửa đầu 2022. Thiếu hụt chip cũng ảnh hưởng tới dây chuyền sản xuất ôtô và nhiều hãng lớn phải cắt giảm đáng kể sản lượng.  Nguồn cung và cầu với một số loại chip dần cân bằng trong hơn một năm qua, nhưng nhiều lĩnh vực đang chứng kiến tình trạng khan hiếm hóa thành dư thừa.', N'Đạt', CAST(N'2003-11-02' AS Date))
INSERT [dbo].[News] ([ID], [Title], [Avatar], [Description], [Author], [CreatedDate]) VALUES (3, N'Tiến sĩ AI chỉ cách thành kỹ sư prompt', N'ai news.jpg', N'Theo tiến sĩ Đinh Viết Sang, prompt không cần kiến thức lập trình chuyên sâu nhưng cần khả năng diễn đạt tốt, ngoại ngữ và kiến thức nền tảng trong lĩnh vực của mình.  Prompt engineer - kỹ sư ra lệnh - là nghề mới, được săn đón khi các mô hình AI tạo sinh trở nên phổ biến trong cộng đồng. Điểm đặc biệt của kỹ sư prompt là không yêu cầu bằng cấp về máy tính hay kỹ năng lập trình, nhưng cần một số yếu tố nhất định.  Ngoại ngữ  Theo tiến sĩ Đinh Viết Sang, Trưởng phòng thí nghiệm Foundation Models, Phó Giám đốc Trung tâm BKAI - Đại học Bách khoa Hà Nội, điểm mạnh của mô hình ngôn ngữ lớn là có thể cho ra câu trả lời nhanh dựa trên việc tổng hợp lượng thông tin lớn. Tuy nhiên, một hạn chế của chúng là dễ cho ra câu trả lời "ảo giác" nếu người dùng không hỏi đúng cách. Công việc của kỹ sư prompt là đặt câu hỏi đúng để AI có thể đưa ra các câu trả lời theo ý muốn.', N'Đạt', CAST(N'2023-11-02' AS Date))
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [Name], [UserId], [Status], [CreatedOnUtc], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail]) VALUES (57, N'DonHang-20230727084436', 1, 1, CAST(N'2023-07-27T08:44:36.877' AS DateTime), N'huynh phuc loi', N'03854854854', N'long binh', N'hophuthuong@yahoo.com')
INSERT [dbo].[Order] ([ID], [Name], [UserId], [Status], [CreatedOnUtc], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail]) VALUES (58, N'DonHang-20230727084442', 1, 1, CAST(N'2023-07-27T08:44:42.220' AS DateTime), N'huynh phuc loi', N'03854854854', N'long binh', N'hophuthuong@yahoo.com')
INSERT [dbo].[Order] ([ID], [Name], [UserId], [Status], [CreatedOnUtc], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail]) VALUES (59, N'DonHang-20230728192902', 1, 1, CAST(N'2023-07-28T19:29:02.063' AS DateTime), N'minh trung pham', N'03854854854', N'long binh', N'hophuthuong@yahoo.com')
INSERT [dbo].[Order] ([ID], [Name], [UserId], [Status], [CreatedOnUtc], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail]) VALUES (75, N'DonHang-20231019173136', 21, 1, CAST(N'2023-10-19T17:31:36.957' AS DateTime), N'DAT', N'0993284374', N'Long An', N'phuocdat.203@gmail.com')
INSERT [dbo].[Order] ([ID], [Name], [UserId], [Status], [CreatedOnUtc], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail]) VALUES (76, N'DonHang-20231019173549', 21, 1, CAST(N'2023-10-19T17:35:49.180' AS DateTime), N'DAT', N'0993284374', N'Long An', N'phuocdat.203@gmail.com')
INSERT [dbo].[Order] ([ID], [Name], [UserId], [Status], [CreatedOnUtc], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail]) VALUES (77, N'DonHang-20231019173637', 21, 1, CAST(N'2023-10-19T17:36:37.857' AS DateTime), N'DAT', N'0993284374', N'Long An', N'phuocdat.203@gmail.com')
INSERT [dbo].[Order] ([ID], [Name], [UserId], [Status], [CreatedOnUtc], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail]) VALUES (78, N'DonHang-20231019174548', 21, 1, CAST(N'2023-10-19T17:45:48.507' AS DateTime), N'DAT', N'0993284374', N'Long An', N'phuocdat.203@gmail.com')
INSERT [dbo].[Order] ([ID], [Name], [UserId], [Status], [CreatedOnUtc], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail]) VALUES (79, N'DonHang-20231021073309', 21, 1, CAST(N'2023-10-21T07:33:09.227' AS DateTime), N'DAT', N'0993284374', N'Long An', N'phuocdat.203@gmail.com')
INSERT [dbo].[Order] ([ID], [Name], [UserId], [Status], [CreatedOnUtc], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail]) VALUES (80, N'DonHang-20231107115021', 24, 1, CAST(N'2023-11-07T11:50:21.987' AS DateTime), N'DAT', N'0993284374', N'Long An', N'phuocdat.203@gmail.com')
INSERT [dbo].[Order] ([ID], [Name], [UserId], [Status], [CreatedOnUtc], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail]) VALUES (81, N'DonHang-20231110110644', 24, 1, CAST(N'2023-11-10T11:06:44.700' AS DateTime), N'DAT', N'0993284379', N'Long An', N'handang.4122001@gmail.com')
INSERT [dbo].[Order] ([ID], [Name], [UserId], [Status], [CreatedOnUtc], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail]) VALUES (82, N'DonHang-20231110114834', 24, 1, CAST(N'2023-11-10T11:48:34.063' AS DateTime), N'DAT', N'0993284374', N'Long An', N'20088@hufi.edu.vn')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (1, 1, 1, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (2, 2, 1, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (3, 3, 1, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (4, 28, 45, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (5, 28, 45, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (6, 29, 42, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (7, 30, 1, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (8, 31, 48, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (9, 32, 45, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (10, 33, 47, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (11, 34, 47, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (12, 35, 47, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (13, 36, 47, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (14, 37, 47, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (15, 38, 47, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (16, 39, 47, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (17, 40, 47, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (18, 40, 42, 10)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (19, 41, 47, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (20, 41, 42, 10)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (21, 42, 47, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (22, 42, 42, 10)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (23, 43, 47, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (24, 44, 43, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (25, 44, 47, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (26, 44, 46, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (27, 45, 43, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (28, 45, 47, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (29, 45, 46, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (30, 45, 42, 10)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (31, 46, 47, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (32, 47, 47, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (33, 48, 47, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (34, 49, 47, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (35, 50, 47, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (36, 51, 47, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (37, 52, 47, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (38, 53, 1, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (39, 54, 43, 2)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (40, 54, 1, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (41, 55, 43, 2)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (42, 55, 1, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (43, 56, 43, 2)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (44, 56, 1, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (45, 57, 43, 2)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (46, 57, 1, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (47, 58, 43, 2)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (48, 58, 1, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (49, 59, 42, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (50, 60, 45, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (51, 61, 45, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (52, 62, 1, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (53, 63, 50, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (54, 64, 45, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (55, 65, 45, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (56, 66, 45, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (57, 67, 50, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (58, 68, 50, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (59, 69, 45, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (60, 70, 45, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (61, 71, 45, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (62, 72, 50, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (63, 73, 50, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (64, 74, 45, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (65, 75, 91, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (66, 76, 50, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (67, 77, 58, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (68, 78, 50, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (69, 79, 50, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (70, 80, 43, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (71, 81, 45, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (72, 82, 41, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (73, 83, 58, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (74, 84, 58, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (75, 85, 58, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (76, 86, 58, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (77, 87, 58, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (78, 88, 58, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderId], [ProductId], [Quantity]) VALUES (79, 89, 50, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'Board Arduino Nano 3.0 ATmega328P', N'arduino1.jpg                                                                                        ', 2, NULL, N'Board Arduino Nano 3.0 ATmega328P Type-C có tính năng giống Arduino Nano V3.0 cổng MINI USB là phiên bản thu nhỏ của ARDUINO UNO có thiết kế chưa ra chân header nên có kích thước nhỏ gọn linh hoạt sử dụng đa dạng cho các project', 105000, 100000, 1, N'24', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (41, N'Arduino UNO R3 LGT8F328P SMD', N'arduino2.jpg                                                                                        ', 2, NULL, N'Arduino LGT8F328P có đầy đủ các tính năng của arduino bản gốc như I2C, UART, SPI, PWM,… có thể sử dụng hầu hết các thư viện hiện nay, Sơ đồ, code, thao tác nạp không thay đổi nhiều', 140000, 135000, 2, N'36', 1, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (42, N'Board Arduino Nano V3.1 LGT8F328P', N'arduino3.jpg                                                                                        ', 2, NULL, N'Board mạch này có đầy đủ các chức năng chính trong thế giới arduino vì vậy có thể thoải mái sử dụng các thư viện được thiết kế cho nền tảng arduino. Sơ đồ, code, giao diện lập trình giống nhau không thay đổi nhiều.', 100000, 95000, 2, N'24', 1, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (43, N'Arduino Promini LGT328P SSOP20', N'arduino4.jpg                                                                                        ', 2, NULL, N' Arduino Promini LGT328P SSOP20 có bảng điều khiển nhỏ và sử dụng một bộ tương tự của vi điều khiển ATmega328 từ LogicGreen Technologies. Bộ vi điều khiển LGT8F328P có một số tính năng tuyệt vời so với ATmega328.', 43000, 41500, 2, N'57', 2, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (44, N'Arduino Nano 3.0 LGT8F328P', N'arduino5.jpg                                                                                        ', 2, NULL, N'Arduino Nano 3.0 LGT8F328P có một số tính năng tuyệt vời so với ATmega328. Để lập trình bộ điều khiển, bạn có thể sử dụng môi trường phát triển Arduino IDE với thư viện hỗ trợ tùy chọn.', 56000, 55000, NULL, N'86', 1, NULL, NULL, 43, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (45, N'Arduino Wifi WeMos D1 R32 ESP32 BLE', N'arduino6.jpg                                                                                        ', 2, NULL, N'Module Wifi WeMos D1 R32 với công nghệ Wifi, BLE và nhân ARM SoC tích hợp mới nhất hiện nay, kit có cách sử dụng, lập trình tương tự như Kit RF thu phát wifi bluetooth esp32, là sự lựa chọn rất tốt cho việc nghiên cứu, ứng dụng về Wifi, BLE vào IoT.', 157000, 156500, 1, N'4', 1, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (46, N'Mạch Arduino UNO R3 ATmega328P', N'arduino7.jpg                                                                                        ', 2, NULL, N'Mạch arduino uno tích hợp đầy đủ trên một bo mạch: Uno R3 ATmega 328 và WiFi ESP8266 với bộ nhớ 32Mb (MegaByte). Tất cả các module có thể làm việc cùng nhau hoặc riêng rẽ. Giải pháp tiện lợi cho việc phát triển các dự án mới yêu cầu Uno và WiFi. ', 230000, 229000, NULL, N'567', 2, NULL, NULL, 456, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (47, N'Arduino NodeMcu Lua WIFI V3 CH340', N'arduino8.jpg                                                                                        ', 2, NULL, N'Arduino NodeMCU Lua V3 CH340 được dùng cho các ứng dụng cần kết nối, thu thập dữ liệu và điều khiển qua sóng Wifi, đặc biệt là các ứng dụng liên quan đến IoT.', 68000, 67000, NULL, N'25', 4, NULL, NULL, 12, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (48, N'Arduino MP3 shield VS1053', N'arduino9.jpg                                                                                        ', 2, NULL, N'Arduino MP3 Shield VS1053 là Shield cho Arduino sử dụng IC giải mã chuyên dụng VS1053, hỗ trợ giãi mã các định dạng như : MP3, AAC, Ogg Vorbis, WMA, MIDI, FLAC, WAV (PCM and ADPCM)…', 115000, 113000, NULL, N'83', 5, NULL, NULL, 32, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (49, N'Cảm biến âm thanh KY-03977', N'cambien1.jpg                                                                                        ', 3, NULL, N'Cảm biến âm thanh KY-037 được thiết kế gồm 1 micro, 1 bộ so sánh và 2 ngõ ra', 50000, 49000, NULL, N'456', 4, NULL, NULL, 234, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (50, N'Cảm biến ánh sáng UV GUVA-S12SD', N'cambien2.jpg                                                                                        ', 3, NULL, N'Cảm biến ánh sáng UV GUVA-S12SD là một bộ chuyển đổi ánh sáng UV thành điện áp tương tự để đo cường độ của tia UV. GUVA-S12SD là một máy dò UV thực sự, chỉ phát hiện ánh sáng từ 240nm đến 370nm là UV-B và hầu hết phổ UV-A. Nó cũng chọn đầu trên của UV-C.', 90000, 88500, 1, N'78', 4, NULL, NULL, 21, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (51, N'Cảm biến cân nặng Loadcell 200Kg', N'cambien3.jpg                                                                                        ', 3, NULL, N'Cảm biến cân nặng Loadcell hay còn gọi là cảm biến lực Loadcell có tác dụng chuyển một khối lượng hoặc một lực thành tín hiệu điện áp tương ứng với lực tác động.', 153000, 152000, NULL, N'36', 4, NULL, NULL, 23, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (53, N'Cảm biến dò line đơn KY-033', N'cambien4.jpg                                                                                        ', 3, NULL, N'Cảm biến dò line đơn có thể dùng để phát hiện line trắng và đen. Mạch sử dụng cảm biến hồng ngoại TCRT5000 với khoảng cách phát hiện từ 1~25mm giúp dễ dàng trong quá trình cài đặt module lên thiết bị.', 17500, 17000, NULL, N'67', 2, NULL, NULL, 56, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (54, N'Cảm biến dòng điện DC/AC WCS1800', N'cambien5.jpg                                                                                        ', 3, NULL, N'Cảm biến dòng điện Hall 35A WCS1800 là một cảm biến dòng hoạt động dựa trên hiệu ứng Hall. Hiệu ứng Hall nhạy cảm với từ trường, mà từ trường được sinh ra từ một dòng điện bất kỳ, do đó có thể đo cường độ dòng chạy qua một dây điện khi đưa dây này gần thiết bị đo.', 230000, 22900, NULL, N'18', 2, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (55, N'Cảm biến tốc độ gió 3 đầu xoay', N'cambien6.jpg                                                                                        ', 3, NULL, N'Cảm biến tốc độ gió bao gồm một vỏ, bộ nhận gió 3 cánh và 1 cáp đầu ra 4 dây, được làm bằng vật liệu hợp kim nhôm.Toàn bộ cảm biến có độ bền cao, chống chịu thời tiết tốt, chống ăn mòn và khả năng chịu nước, sẽ được để đảm bảo sử dụng lâu dài.', 1557000, 1550000, NULL, N'3', 2, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (56, N'Cảm biến màu RGB TCS34725', N'cambien7.jpg                                                                                        ', 3, NULL, N'Cảm biến màu RGB TCS34725 giao tiếp I2C và UART là phiên bản nâng cấp của cảm biến màu TCS3200, được sử dụng để nhận biết màu sắc bằng cách đo phản xạ 3 màu sắc cơ bản từ vật thể là đỏ, xanh lá và xanh dương sau đó xử lý và truyền thông số đo được của các màu này qua giao tiếp I2C hoặc UART.', 158000, 157000, NULL, N'57', 2, NULL, NULL, 45, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (57, N'Đèn báo AD16-22DS đỏ 220VDC/AC', N'denled1.jpg                                                                                         ', 7, NULL, N'Đèn báo AD16-22DS thường được sử dụng để báo trạng thái trong các mạch điện, tủ điện và trạng thái vận hành của máy móc trong công nghiệp. Đèn có thiết kế nhỏ gọn, đẹp mắt, tuổi thọ cao, dễ dàng sử dụng.', 8000, 7500, NULL, N'8', 1, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (58, N'Đèn báo có còi AD16-22SM màu xanh lá', N'denled2.jpg                                                                                         ', 7, NULL, N'Đèn báo có còi AD16-22SM bên trong tích hợp đèn led và còi báo khi được cấp nguồn sẽ tạo ra hiệu ứng âm thanh ánh sáng ngắt quãng thích hợp làm sản phẩm thông báo trạng thái.', 18000, 17000, 1, N'4', 2, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (59, N'Led dây 2835 12V ánh sáng trắng', N'denled3.jpg                                                                                         ', 7, NULL, N'Led dây 2835 12V ánh sáng trắng 6000K 1 mét 120 bóng không phủ epoxy và Led dây 2835 12V ánh sáng trắng 4000K 1 mét 120 bóng không phủ epoxy là loại đèn led dây thích hợp để trang trí các khung viền tường, cột trần nhà hay tủ bán hàng. Với thiết kế nhỏ gọn, dễ dàng lắp đặt theo ý muốn, ánh sáng đẹp mắt khiến cho không gian trở nên sang trọng đẹp hơn trong mắt người nhìn.', 36000, 35000, NULL, N'7', 3, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (60, N'Chip Led siêu sáng 4 lõi 6000 - 6500K 5W', N'denled4.jpg                                                                                         ', 7, NULL, N'Chip LED siêu sáng 5W (6-7V) có màu ánh sáng trắng 6000 – 6500K là loại chip LED 4 lõi được thiết kế để hoạt động với điện áp từ 6 ~ 7V. Nó là lựa chọn tốt cho các dự án DIY như đèn pin hoặc chiếu sáng trong không gian làm việc và không gian sống.', 15000, 14000, NULL, N'3', 4, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (61, N'Led UV 3W cực tím màu trắng', N'denled5.jpg                                                                                         ', 7, NULL, N'Led UV 3W cực tím dùng để soi rọi tiền giả, tạo tia cực tím UV khử trùng , …', 12000, 10000, NULL, N'8', 5, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (62, N'Bộ led nháy theo nhạc RGB 5050', N'denled6.jpg                                                                                         ', 7, NULL, N'Bộ led nháy theo nhạc RGB 5050 phủ epoxy 44 phím kèm nguồn hay còn được gọi là đèn led tiktok được sử dụng để trang trí decor không gian làm việc, setup phòng gaming, phòng quay video tiktok sống ảo cực chất, tranng trí quán cafe karaoke.', 229000, 228000, NULL, N'4', 6, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (64, N'Module phát hiện điện áp 220V AC', N'module1.jpg                                                                                         ', 8, NULL, N'Module phát hiện điện áp 220V AC với Optocoupler cách ly (loại 1 kênh và loại 3 kênh) dùng để phát hiện sự có mặt của điện AC thông qua mức logic cao hoặc thấp, với giải điện áp từ 3.3v đến 24v thích hợp cho các MCU & PLC , module cách ly tín hiệu AC với tín hiệu TLL bằng Opto cách ly quang.', 150000, 149000, NULL, N'2', 6, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (65, N'Module quét mã vạch MH-ET LIVE Scanner', N'module2.jpg                                                                                         ', 8, NULL, N'Module quét mã vạch MH-ET LIVE Scanner v3.0 là mô-đun nhận dạng quét mã vạch và mã QR. Nó thông qua một chip xử lý hình ảnh chuyên nghiệp để nhận dạng mã vạch.', 555000, 500000, NULL, N'2', 5, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (66, N'Module cảm biến khói MCU-30105', N'module3.jpg                                                                                         ', 8, NULL, N'Module cảm biến khói MCU-30105 MAX30105 là một mô-đun cảm biến hạt tích hợp. Nó bao gồm đèn LED bên trong, bộ tách sóng quang, phần tử quang học, với khả năng loại bỏ nhiễu sáng xung quanh. MAX30105 cung cấp một giải pháp dễ dàng cho quá trình thiết kế ứng dụng phát hiện khói, kể cả thiết bị báo cháy.', 480000, 479000, NULL, N'4', 4, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (67, N'Module lọc nhiễu tín hiệu âm thanh AUX', N'module4.jpg                                                                                         ', 8, NULL, N'Module lọc nhiễu tín hiệu âm thanh AUX sử dụng 2 biến áp hoạt động độc lập cách ly âm thanh đầu vào, với chức năng giảm tiếng ồn, lọc nhiễu tín hiệu âm thanh, không để hệ thống âm thanh bị hiện tượng mạch vòng, Tín hiệu âm thanh không bị suy hao, rất thích hợp sử dụng cho thiết bị trên ô tô.', 99000, 98000, NULL, N'5', 2, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (68, N'Module tạo xung PWM 2 kênh', N'module5.jpg                                                                                         ', 8, NULL, N'Module tạo xung PWM 2 kênh thường được dùng để phát xung vuông để thí nghiệm, phát xung cho driver động cơ bước hoặc tạo xung cho các ứng dụng dimmer LED, PWM động cơ', 44000, 43000, NULL, N'8', 1, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (69, N'Module lọc nhiễu điện từ EMI 220VAC', N'module6.jpg                                                                                         ', 8, NULL, N'Module lọc nhiễu điện từ EMI 220VAC 3A được sử dụng với các thiết bị 220VAC giúp lọc nhiễu điện từ EMI ( nhiễu điện từ là nhiễu có tín hiệu cao hoặc thấp có tín hiệu liên tục).', 50000, 49000, NULL, N'5', 6, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (71, N'Công tắc bập bênh tròn có đèn KCD2-202', N'phukien1.jpg                                                                                        ', 9, NULL, N'Công tắc bập bênh tròn có đèn KCD2-202 là loại công tắc 2 vị trí có đèn led báo trạng thái nguồn, điện áp sử dụng để sáng đèn công tắc là từ 3V đến 12V', 7000, 6000, NULL, N'3', 4, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (72, N'Công tắc DIP Switch đỏ 3PP', N'phukien2.jpg                                                                                        ', 9, NULL, N'Công tắc Dip Switch đỏ là loại công tắc cấu trúc trượt, kích thước nhỏ gọn dạng chân cắm PCB được sử dụng rộng rãi trong các mạch điện tử giúp cấu hình chế độ, chuyển trạng thái mạch điện sử dụng với mức điện áp và dòng điện nhỏ.', 2000, 1500, NULL, N'8', 2, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (73, N'Đế ra chân USB Type C 12 Pin', N'phukien3.jpg                                                                                        ', 9, NULL, N'Sản phẩm được sử dụng làm các sản phẩm DIY như adapter sạc pin, cấp nguồn hoặc lấy nguồn từ USB Type C, truyền dữ liệu giữa các thiết bị sử dụng chuẩn Type C hoặc giữa các thiết bị Type C với các module vi điều khiển', 5000, 4300, NULL, N'3', 4, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (74, N'Dây Bus IDC 2.54mm 2 chấu', N'phukien4.jpg                                                                                        ', 9, NULL, N'Dây Bus IDC 2.54mm cho phép kết nối nhanh chóng và dễ dàng, không cần hàn hoặc đấu nối. Chúng thường được sử dụng trong việc kết nối các linh kiện như module, đế cắm, bộ chuyển đổi và các thiết bị điện tử khác nhau như điện tử cá nhân, viễn thông, máy tính và tự động hóa.', 11000, 10000, NULL, N'7', 2, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (75, N'Dây cáp sạc dữ liệu USB Type-C', N'phukien5.jpg                                                                                        ', 9, NULL, N'Dây cáp sạc dữ liệu USB Type-C có lõi bên trong dây đồng vỏ bện dây câu chắc chắn, rất thích hợp để sạc truyền dữ liệu cho điện thoại hoặc nạp code cho các module có cổng Type-C.', 28000, 27000, NULL, N'9', 5, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (76, N'Dây điện đôi Lion VCmd 0.75', N'phukien6.jpg                                                                                        ', 9, NULL, N'Dây điện đôi Lion VCmd 0.75 là loại dây điện thường được sử dụng để kết nối các thiết bị, module, mạch với nhau… Dây điện này có khả năng chịu tải tốt, chất liệu lõi đồng với độ dẫn điện tốt, độ bền cao, dễ dàng sử dụng. Vỏ bọc cách điện PVC độ dai, độ bền cao', 7000, 6500, NULL, N'1', 1, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (77, N'Dây Bus Cái VH3.96 dài 20cm 3 pin', N'phukien7.jpg                                                                                        ', 9, NULL, N'Dây Bus Cái VH3.96 thường được sử dụng để kết nối các linh kiện và mạch điện với nhau, cũng như các module, bo mạch, bộ điều khiển, và các thành phần khác trong các thiết bị điện tử, máy tính, đèn LED, và các ứng dụng công nghiệp khác.', 4000, 3000, NULL, N'6', 4, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (78, N'Hộp nhựa PLC 145x91x41mm', N'phukien8.jpg                                                                                        ', 9, NULL, N'Hộp nhựa PLC 145x91x41mm, hiệu Wanchi, mã PLC-01, thích hợp với các bộ PLC với kích thước tương ứng', 22000, 21000, NULL, N'7', 3, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (79, N'Đế pin 18650 hàn PCB 4 cell', N'phukien9.jpg                                                                                        ', 9, NULL, N'Đế Pin 18650 này là loại đế pin có chân hàn dùng để hàn lên board mạch PCB, có nhiều loại đế từ 1 pin tới 4 pin lắp song song với nhau, có thiết kế nhiều lỗ ∅ 3 mm để cố định đế pin vào PCB thêm phần chắc chắn. Thiết kế tổng thể chắc chắn gọn nhẹ phù hợp với nhiều ứng dụng DIY, phục vụ sản xuất.', 14000, 13000, NULL, N'4', 6, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (80, N'Nút nguồn kim loại 12mm', N'phukien10.jpg                                                                                       ', 9, NULL, N'Nút nguồn kim loại 12mm là nút nhấn biểu tượng POWER có khả năng tự giữ trạng thái (NC) khi được nhấn vào và trả trạng thái ban đầu (NO) khi nhấn một lần nữa', 37000, 36000, NULL, N'6', 2, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (81, N'Pin Alkaline 12V 23A', N'pin1.jpg                                                                                            ', 10, NULL, N'Pin Alkaline 12V 23A và Pin Alkaline 12V 27A có thiết kế nhỏ gọn, là loại pin có công suất cao được ùng cho các thiết bị báo động, chuông điện không dây, remote điều khiển từ xa, bật lửa, …', 6000, 5500, NULL, N'36', 6, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (82, N'Pin 18650 3S 12.6V', N'pin2.jpg                                                                                            ', 10, NULL, N'Pin 18650 3S 12.6V 2600mAh tích hợp mạch bảo vệ sử dụng pin cell Lishen xám với dung lượng lên tới 2600 mAh, cell pin này với 3 viên mắc nối tiếp cho dung lượng thực lên tới 2600mah, tích hợp sẵn mạch sạc xả bảo vệ pin 3s 20A', 264000, 263000, 2, N'57', 2, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (83, N'Pin Lipo 11.1V 30C', N'pin3.jpg                                                                                            ', 10, NULL, N'Pin Lipo 11.1V 30C 1800mAh / 2000mAh thường được dùng cho các loại súng dùng điện, súng phun nước, súng bắn thạch, máy bay, thuyền xe điều khiển từ xa.', 237000, 236000, NULL, N'543', 3, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (84, N'Pin lipo 3.7V 750mAh', N'pin4.jpg                                                                                            ', 10, NULL, N'Pin lipo 3.7v 750mAh cho máy bay mô hình máy bay lớn được sử dụng trong các máy bay điều khiển từ xa và máy bay bốn trục khác nhau, có thể phóng điện với hiệu suất cao.', 95000, 94000, NULL, N'56', 1, NULL, NULL, 9, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (85, N'Pin sạc Ni-MH 1.2V 40mAh', N'pin5.jpg                                                                                            ', 10, NULL, N'Pin sạc Ni-MH 1.2V 40mAh có khả năng sạc xả thường được sử dụng cho các thiết bị Timer, Hệ thống hẹn giờ, Hệ thống báo động, Thiết bị y tế, trong PLC, Camera, Cân điện tử, Lịch vạn niên …', 15000, 14000, NULL, N'87', 4, NULL, NULL, 9, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (86, N'Pin cúc áo CR2016 3Volt', N'pin6.jpg                                                                                            ', 10, NULL, N'Pin cúc áo CR2016 3Volt thường được sử dụng trong tay remote điều khiển từ xa,  các đồng hồ điện tử, các mạch điện tử có thiết kế nguồn pin cúc áo…', 4000, 3600, NULL, N'123', 5, NULL, NULL, 9, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (87, N'Nguồn Adapter 12V 5A', N'adapter1.jpg                                                                                        ', 11, NULL, N'Nguồn Adapter 12V 5A Sunshine là module nguồn một chiều chất lượng cao của nhà sản xuất Sunshine, có chức năng chuyển điện áp xoay chiều 220VAC sang điện áp một chiều 12V công suất 60W.', 215000, 21000, NULL, N'46', 2, NULL, NULL, 9, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (88, N'Nguồn USB 5V 1A', N'adapter2.jpg                                                                                        ', 11, NULL, N'Nguồn USB 5V 1A sử dụng bảng mạch và linh kiện mới 100% đã qua quá trình kiểm tra nghiêm ngặt.', 19000, 18500, NULL, N'66', 5, NULL, NULL, 9, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (89, N'Dây nguồn AC đuôi số 8', N'adapter3.jpg                                                                                        ', 11, NULL, N'Dây nguồn AC đuôi số 8 (phích cắm tiêu chuẩn Châu Âu) thường được sử dụng cho: Máy tính lớn, màn hình LCD, thiết bị điện tử, máy in, máy tính xách tay và các loại thiết bị gia dụng.', 8000, 7500, NULL, N'6', 6, NULL, NULL, 9, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (90, N'Nguồn adapter LITEON 15V', N'adapter4.jpg                                                                                        ', 11, NULL, N'Nguồn adapter LITEON 15V 5A hay còn gọi là bộ nguồn một chiều 15 volt được thiết kế để chuyển đổi điện áp từ nguồn xoay chiều 110/220VAC thành nguồn một chiều 15VDC để cung cấp cho các thiết bị hoạt động. Nguồn adapter 15V 5A sử dụng cấp nguồn cho camera, hdd box, hdd docking, thiết bị điện tử khác…', 149000, 147000, NULL, N'67', 3, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (91, N'Adapter Sạc Pin 5S 21V 3A', N'adapter5.jpg                                                                                        ', 11, NULL, N'Adapter Sạc Pin 5S 21V 3A cục sạc pin 5s Pin 18650, với điện áp sạc đầy lên tới 21V, dòng sạc 3A', 162000, 161000, 1, N'9', 3, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (92, N'Màn hình LCD 2004', N'manhinh1.jpg                                                                                        ', 13, NULL, N'Màn hình LCD 2004 cho máy CNC, in 3D được thiết kế để sử dụng với Board Ramps có chức năng làm bảng hiển thị và điều khiển cho máy in 3D.', 165000, 164000, NULL, N'6', 3, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (93, N'Màn hình LCD 12864', N'manhinh2.jpg                                                                                        ', 13, NULL, N'Graphic LCD12864 Driver ST7920 xanh lá sử dụng IC Driver ST7920 là loại phổ phiến trên thị trường hiện nay, LCD 12864 Xanh Lá có chức năng hiển thị như một màn hình đơn sắc với độ phân giải 128 x 64 Pixels, màn hình hiển thị rõ nét chữ và hình ảnh đơn sắc, thiết kế và gia công tốt, độ bền cao.', 167000, 166000, NULL, N'56', 2, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (94, N'Màn hình cảm ứng Nextion', N'manhinh3.jpg                                                                                        ', 13, NULL, N'Màn hình cảm ứng Nextion 7.0 inch mã số NX8048T070, là một giải pháp giao diện người và máy liền mạch (HMI) cung cấp giao diện điều khiển và trực quan giữa con người và quy trình, máy, ứng dụng hoặc thiết bị.', 2185000, 2185000, NULL, N'5', 1, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (95, N'LCD 1602 kèm module I2C', N'manhinh4.jpg                                                                                        ', 13, NULL, N'Màn hình text LCD 1602 kèm module I2C sử dụng driver HD44780, có khả năng hiển thị 2 dòng với mỗi dòng 16 ký tự, màn hình có độ bền cao, rất phổ biến, nhiều code mẫu và dễ sử dụng thích hợp cho những người mới học và làm dự án.', 56000, 55000, NULL, N'4', 2, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (96, N'Màn hình cảm ứng TFT', N'manhinh5.jpg                                                                                        ', 13, NULL, N'Màn hình cảm ứng TFT Arduino Shield 3.5 inch H896 1-7 có kích thước màn hình 3.5 inch, với độ phân giải 320 x 480 cho ra những hình ảnh sắc nét sinh động, là shield màn hình cảm ứng được thiết kế dùng cho Aruino Uno, MEGA 2560. Dễ dàng thực hiện chức năng hiển thị và điều khiển qua cảm ứng trên màn hình.', 298000, 297000, NULL, N'4', 2, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (99, N'Nguồn tổ ong 12V 10A', N'adapter6.jpg                                                                                        ', 11, NULL, N'Nguồn tổ ong 12V 10A Power Supply được thiết kế để chuyển đổi điện áp từ nguồn xoay chiều 180/240VAC thành nguồn một chiều 12VDC để cung cấp cho các thiết bị hoạt động. Nguồn tổ ong này được sử dụng rộng rãi trong các thiết bị công nghiệp và dân dụng.', 160000, 150000, NULL, N'5', 6, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (100, N'Màn Hình Oled 0.91 Inch', N'manhinh6.jpg                                                                                        ', 13, NULL, N'Màn hình Oled 0.96 inch giao tiếp I2C 2 màu cho khả năng hiển thị đẹp, sang trọng, rõ nét vào ban ngày và khả năng tiết kiệm năng lượng tối đa với mức chi phí phù hợp, màn hình Oled 0.96inch sử dụng giao tiếp I2C cho chất lượng đường truyền ổn định và rất dễ giao tiếp chỉ với 2 chân GPIO.', 90000, 82000, NULL, N'11', 1, NULL, NULL, 7, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[Role] ([Id], [Code], [Name], [GroupName]) VALUES (10, N'view-add-edit-delete', N'xem/thêm/sửa/xóa', N'Sản phẩm')
INSERT [dbo].[Role] ([Id], [Code], [Name], [GroupName]) VALUES (20, N'view', N'xem', N'Sản phẩm')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (23, N'dat', N'dang', N'phuocdat.2035@gmail.com', N'827ccb0eea8a706c4c34a16891f84e7b', NULL)
INSERT [dbo].[User] ([ID], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (24, N'Dang', N'Dat', N'phuocdat.203@gmail.com', N'827ccb0eea8a706c4c34a16891f84e7b', NULL)
INSERT [dbo].[User] ([ID], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (25, N'Nguyen', N'Han', N'han124@gmail.com', N'827ccb0eea8a706c4c34a16891f84e7b', NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Giảm giá sốc 2:Đề xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
USE [master]
GO
ALTER DATABASE [WebsiteBanHang] SET  READ_WRITE 
GO
