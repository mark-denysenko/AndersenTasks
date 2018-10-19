--USE [master]
--GO
--/****** Object:  Database [ShopDB]    Script Date: 19.10.2018 12:31:26 ******/
--CREATE DATABASE [ShopDB]
-- CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'ShopDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ShopDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
-- LOG ON 
--( NAME = N'ShopDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ShopDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
--GO
--ALTER DATABASE [ShopDB] SET COMPATIBILITY_LEVEL = 140
--GO
--IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
--begin
--EXEC [ShopDB].[dbo].[sp_fulltext_database] @action = 'enable'
--end
--GO
--ALTER DATABASE [ShopDB] SET ANSI_NULL_DEFAULT OFF 
--GO
--ALTER DATABASE [ShopDB] SET ANSI_NULLS OFF 
--GO
--ALTER DATABASE [ShopDB] SET ANSI_PADDING OFF 
--GO
--ALTER DATABASE [ShopDB] SET ANSI_WARNINGS OFF 
--GO
--ALTER DATABASE [ShopDB] SET ARITHABORT OFF 
--GO
--ALTER DATABASE [ShopDB] SET AUTO_CLOSE OFF 
--GO
--ALTER DATABASE [ShopDB] SET AUTO_SHRINK OFF 
--GO
--ALTER DATABASE [ShopDB] SET AUTO_UPDATE_STATISTICS ON 
--GO
--ALTER DATABASE [ShopDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
--GO
--ALTER DATABASE [ShopDB] SET CURSOR_DEFAULT  GLOBAL 
--GO
--ALTER DATABASE [ShopDB] SET CONCAT_NULL_YIELDS_NULL OFF 
--GO
--ALTER DATABASE [ShopDB] SET NUMERIC_ROUNDABORT OFF 
--GO
--ALTER DATABASE [ShopDB] SET QUOTED_IDENTIFIER OFF 
--GO
--ALTER DATABASE [ShopDB] SET RECURSIVE_TRIGGERS OFF 
--GO
--ALTER DATABASE [ShopDB] SET  DISABLE_BROKER 
--GO
--ALTER DATABASE [ShopDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
--GO
--ALTER DATABASE [ShopDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
--GO
--ALTER DATABASE [ShopDB] SET TRUSTWORTHY OFF 
--GO
--ALTER DATABASE [ShopDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
--GO
--ALTER DATABASE [ShopDB] SET PARAMETERIZATION SIMPLE 
--GO
--ALTER DATABASE [ShopDB] SET READ_COMMITTED_SNAPSHOT OFF 
--GO
--ALTER DATABASE [ShopDB] SET HONOR_BROKER_PRIORITY OFF 
--GO
--ALTER DATABASE [ShopDB] SET RECOVERY SIMPLE 
--GO
--ALTER DATABASE [ShopDB] SET  MULTI_USER 
--GO
--ALTER DATABASE [ShopDB] SET PAGE_VERIFY CHECKSUM  
--GO
--ALTER DATABASE [ShopDB] SET DB_CHAINING OFF 
--GO
--ALTER DATABASE [ShopDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
--GO
--ALTER DATABASE [ShopDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
--GO
--ALTER DATABASE [ShopDB] SET DELAYED_DURABILITY = DISABLED 
--GO
--ALTER DATABASE [ShopDB] SET QUERY_STORE = OFF
--GO
--USE [ShopDB]
--GO
--/****** Object:  Table [dbo].[Categories]    Script Date: 19.10.2018 12:31:26 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[ParentId] [int] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marks]    Script Date: 19.10.2018 12:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marks](
	[MarkId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[ProductId] [int] NULL,
	[Mark] [tinyint] NULL,
 CONSTRAINT [PK_Marks] PRIMARY KEY CLUSTERED 
(
	[MarkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 19.10.2018 12:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 19.10.2018 12:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[OrderDate] [datetime] NULL,
	[ShipAddress] [nvarchar](50) NULL,
	[StateId] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 19.10.2018 12:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CategoryId] [int] NULL,
	[UnitPrice] [money] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[States]    Script Date: 19.10.2018 12:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[StateId] [int] NOT NULL,
	[Name] [nvarchar](20) NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 19.10.2018 12:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](30) NULL,
	[Address] [nvarchar](50) NULL,
	[Login] [nvarchar](50) NULL,
	[PasswordHash] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categories_ParentId]  DEFAULT ((0)) FOR [ParentId]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_OrderDetails_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_Products]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_Users]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_States] FOREIGN KEY([StateId])
REFERENCES [dbo].[States] ([StateId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_States]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
/****** Object:  StoredProcedure [dbo].[GetSumFromPreviousMonth]    Script Date: 19.10.2018 12:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetSumFromPreviousMonth]
AS
DECLARE @beginTime DATETIME
DECLARE @endTime DATETIME
SET @beginTime = DATEADD(month, DATEDIFF(month, 0, GETDATE()) - 1, 0)
SET @endTime = GETDATE()
DECLARE @result FLOAT
EXEC @result = SumForTime @beginTime, @endTime
GO
/****** Object:  StoredProcedure [dbo].[SumForTime]    Script Date: 19.10.2018 12:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SumForTime]
		@beginDate DATETIME,
		@endDate DATETIME = NULL
AS
BEGIN
	IF @endDate IS NULL
		SET @endDate = GETDATE()

	SELECT SUM(OrderDetails.Quantity * Products.UnitPrice) AS 'Total sum'
	FROM Orders
	RIGHT JOIN OrderDetails ON OrderDetails.OrderId = Orders.OrderId
	LEFT JOIN Products ON OrderDetails.ProductId = Products.ProductId
	WHERE Orders.OrderDate BETWEEN @beginDate AND @endDate
END
GO
--USE [master]
--GO
--ALTER DATABASE [ShopDB] SET  READ_WRITE 
--GO


INSERT INTO [dbo].[Users]
           ([UserId]
           ,[FirstName]
           ,[LastName]
           ,[Phone]
           ,[Email]
           ,[Address]
           ,[Login]
           ,[PasswordHash])
     VALUES
(1,	'Perviy',	'Polyzovately',	'123456789',		'email@mail.com',		'Pushkina 2A',	'qwerty',	'123456789'),
(2,	'Petro',	'Skladoviy',	'22-11-55',			'psklad@yahoo@com',		'Ukraine, Kiev, Krestovaya 12',	'petro1980',	'19801980'),
(3,	'Oleg',	    'Venzel',	    '+30731254847',		'olezka@hotmail.com',	'Kharkiv, Cetralynaya 5',	'olegvenzel',	'oleg1234'),
(4,	'Stepan',	'Krugoviy',	    '(050) 73 21 463',	's.krug@yandex.xom',	'no address',	'stepka',	'qwerty1234'),
(5,	'Kolya',	'Muzhniy',		'4324123534',		'nagibator228@bestmail.biz.ru',	'New York, Big Street 7',	'realkolya',	'228kolyaK')
GO

INSERT INTO [dbo].[States]
           ([StateId]
           ,[Name])
     VALUES
(1,	'Pre-processing'),
(2,	'Processing'),
(3,	'In transit'),
(4,	'Completed'),
(5,	'Canceled')
GO

INSERT INTO [dbo].[Categories]
           ([CategoryId]
           ,[CategoryName]
           ,[ParentId])
     VALUES
(1,	'Home',	0),
(2, 'Technics',	0),
(3,	'Garden',	0),
(4,	'Programs',	0),
(5,	'Food',	0),
(6,	'Clothes',	0),
(8,	'Beds',	1),
(9,	'Tables',	1),
(10,	'Cupboards',	1),
(11,	'Bathroom',	1),
(12,	'Baths',	11),
(13,	'Washbasins',	11),
(14,	'Computers',	2),
(15,	'Refrigerators',	2),
(16,	'Microwaves',	2),
(17,	'Gaming',	14),
(18,	'Office',	14),
(19,	'Verandas',	3),
(20,	'Benches',	3),
(21,	'Water Systems',	3),
(22,	'Antiviruses',	4),
(23,	'Games',	4),
(24,	'Vegetables',	5),
(25,	'Meat',	5),
(26,	'Drinks',	5),
(27,	'Pig',	25),
(28,	'Cow',	25),
(29,	'Outerwear',	6),
(30,	'Indoorwear',	6)
GO

INSERT INTO [dbo].[Products]
           ([ProductId]
           ,[ProductName]
           ,[Description]
           ,[CategoryId]
           ,[UnitPrice])
     VALUES
(1,	'Gamer ROG PC',	'PC for work or games',	17,	1200.0000),
(2,	'Potatoes',	'kilo potatoe, which you can eat',	24,	0.5000),
(3,	'Cola',	'american best drink',	26,	1.0000),
(4,	'Hodie (Green)',	'nice cloth',	30,	15.0000),
(5,	'Avast',	'protect your pc',	22,	50.0000),
(6,	'Bath 2x2 Premium',	'you will get relax',	12,	170.0000),
(7,	'Table 120x60',	'comfortable for work',	9,	45.0000),
(8,	'Steak Premium cow',	'taste it',	28,	17.0000),
(9,	'Far Cry 8',	'interesting gameplay',	17,	70.0000),
(10,	'Samsung Frozen',	'big and smart',	15,	315.0000),
(11,	'Wooden Veranda',	'sit with your family outdoor',	19,	500.0000),
(12,	'Samart laptop',	'take it with you',	18,	750.0000),
(13,	'Tomatoes',	'from India',	24,	1.2000),
(14,	'Mramor washbasins',	'italian handmade',	13,	370.0000),
(15,	'Red Label',	'easy morning',	26,	28.0000),
(16,	'Jack Daniels',	'old and good',	26,	32.0000),
(17,	'Canada Goose',	'hard evening',	26,	50.0000),
(18,	'Sprite',	'classic drink',	26,	1.5000),
(19,	'Carrot',	'hroom-hroom',	24,	1.5000),
(20,	'Cabbage',	'for shaverma',	24,	0.7000),
(21,	'MSI laptop',	'good and light',	17,	1500.0000),
(22,	'Apple Mac Book',	'ha-ha nothing intersting',	17,	3000.0000),
(23,	'Asus Ranger',	'can use in any work',	17,	860.0000),
(24,	'Apple Mac Book 2',	'so expensive too',	17,	3000.0000)
GO

INSERT INTO [dbo].[Orders]
           ([OrderId]
           ,[UserId]
           ,[OrderDate]
           ,[ShipAddress]
           ,[StateId])
     VALUES
(1,	2,	'2018-06-12 00:00:00.000',	'Kiev, Center',	2),
(2,	3,	'2018-07-11 00:00:00.000',	'Rivne, Center',	3),
(3,	1,	'2018-07-16 00:00:00.000',	'Kharkiv',	4),
(4,	5,	'2018-08-10 00:00:00.000',	'Odessa',	5),
(5,	1,	'2018-08-05 00:00:00.000',	'Kiev, Borshc',	3),
(6,	5,	'2018-08-20 00:00:00.000',	'Kiev, some street',	1),
(7,	3,	'2018-09-01 00:00:00.000',	'Dzen 54',	2),
(8,	1,	'2018-09-02 00:00:00.000',	'Homer 44',	1),
(9,	2,	'2018-09-12 00:00:00.000',	'Poner 11',	2),
(10,	3,	'2018-09-18 00:00:00.000',	'Kulop 4',	4),
(11,	2,	'2018-09-23 00:00:00.000',	'Azerot 12',	3),
(12,	5,	'2018-09-28 00:00:00.000',	'Revol 9',	4),
(13,	4,	'2018-10-01 00:00:00.000',	'Kupol 3',	5),
(14,	1,	'2018-10-05 00:00:00.000',	'Gerona 7',	3),
(15,	1,	'2018-10-11 00:00:00.000',	'Loker 5',	2),
(16,	4,	'2018-10-20 00:00:00.000',	'Jab 13',	3),
(17,	3,	'2018-11-04 00:00:00.000',	'Kulyova 1',	4),
(18,	5,	'2018-11-25 00:00:00.000',	'Nulob 32',	1),
(19,	4,	'2018-11-29 00:00:00.000',	'Kiev 11',	3)
GO

INSERT INTO [dbo].[Marks]
           ([UserId]
           ,[ProductId]
           ,[Mark])
     VALUES           
(1,	1,	4),
(3,	2,	5),
(2,	11,	2),
(4,	21,	3),
(5,	14,	5),
(1,	5,	5),
(3,	8,	1),
(3,	12,	2),
(2,	6,	1),
(1,	4,	4),
(5,	20,	5),
(4,	9,	4),
(4,	7,	4),
(3,	10,	3),
(2,	18,	3),
(4,	22,	5),
(1,	23,	5),
(1,	17,	3),
(1,	16,	4),
(2,	15,	4),
(2,	11,	3),
(2,	12,	2),
(3,	13	,1),
(3,	14,	2),
(3,	7,	3),
(5,	6,	5),
(4,	5,	5),
(5,	1,	5),
(5,	2,	5),
(4,	3,	4),
(2,	9,	2),
(3,	8,	3),
(3,	1,	5),
(4,	1,	5)
GO

INSERT INTO [dbo].[OrderDetails]
           ([OrderId]
           ,[ProductId]
           ,[Quantity])
     VALUES
(1,	5,	1),
(2, 3,	2),
(3,	15,	1),
(4,	17,	2),
(5,	7,	1),
(6,	8,	1),
(7,	21,	4),
(8,	19,	1),
(9,	16,	1),
(10,	1,	1),
(11,	22,	1),
(11,	23,	1),
(12,	18,	1),
(13,	13,	1),
(14,	12,	1),
(15,	2,	2),
(16,	11,	1),
(17,	10,	1),
(18,	14,	1),
(19,	5,	1),
(1,	22,	1)
GO