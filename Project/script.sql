USE [master]
GO
/****** Object:  Database [NADLAN]    Script Date: 5/4/2021 7:12:33 PM ******/
CREATE DATABASE [NADLAN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NADLAN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NADLAN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NADLAN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NADLAN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NADLAN] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NADLAN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NADLAN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NADLAN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NADLAN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NADLAN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NADLAN] SET ARITHABORT OFF 
GO
ALTER DATABASE [NADLAN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NADLAN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NADLAN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NADLAN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NADLAN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NADLAN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NADLAN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NADLAN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NADLAN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NADLAN] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NADLAN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NADLAN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NADLAN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NADLAN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NADLAN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NADLAN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NADLAN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NADLAN] SET RECOVERY FULL 
GO
ALTER DATABASE [NADLAN] SET  MULTI_USER 
GO
ALTER DATABASE [NADLAN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NADLAN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NADLAN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NADLAN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NADLAN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NADLAN] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'NADLAN', N'ON'
GO
ALTER DATABASE [NADLAN] SET QUERY_STORE = OFF
GO
USE [NADLAN]
GO
/****** Object:  Table [dbo].[City]    Script Date: 5/4/2021 7:12:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] NOT NULL,
	[Name] [nchar](10) NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 5/4/2021 7:12:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyID] [int] NOT NULL,
	[Company Name] [nchar](10) NOT NULL,
	[Contact Name] [nchar](10) NULL,
	[Phone] [nchar](10) NULL,
	[Email] [nchar](65) NULL,
	[Postal Code] [nchar](10) NULL,
	[Website] [nchar](25) NULL,
	[Office Adress] [nchar](25) NULL,
	[City] [nchar](10) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/4/2021 7:12:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CompanyID] [int] NULL,
	[CustumerID] [int] NOT NULL,
	[First Name] [nchar](25) NULL,
	[Last Name] [nchar](25) NULL,
	[Phone] [nchar](15) NULL,
	[CellPhone] [nchar](15) NULL,
	[Email] [nchar](60) NULL,
	[Adress] [nchar](20) NULL,
	[City] [nchar](20) NULL,
	[Selling] [bit] NULL,
	[Buying] [bit] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustumerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 5/4/2021 7:12:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[CompanyID] [int] NULL,
	[First Name] [nchar](10) NULL,
	[Last Name] [nchar](10) NULL,
	[Adress] [nchar](50) NULL,
	[City] [nchar](10) NULL,
	[Phone] [nchar](10) NULL,
	[HouseTypeID] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House]    Script Date: 5/4/2021 7:12:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House](
	[HouseID] [int] NOT NULL,
	[HouseTypeID] [int] NOT NULL,
	[NeighborhoodID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Floor] [int] NULL,
	[Parking Space] [bit] NULL,
	[Price Shekels] [int] NULL,
	[Number of Bathrooms] [int] NULL,
	[Number of Bedrooms] [int] NULL,
	[Built Date Year] [datetime] NULL,
	[Square Meters] [int] NULL,
	[Current Owner ID] [int] NULL,
	[PreviousOwner ID] [int] NULL,
 CONSTRAINT [PK_House] PRIMARY KEY CLUSTERED 
(
	[HouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House Type]    Script Date: 5/4/2021 7:12:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House Type](
	[HouseTypeID] [int] NOT NULL,
	[Type] [nchar](20) NULL,
	[Notes] [nchar](255) NULL,
 CONSTRAINT [PK_House Type] PRIMARY KEY CLUSTERED 
(
	[HouseTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Neighborhood]    Script Date: 5/4/2021 7:12:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Neighborhood](
	[NeighborhoodID] [int] NOT NULL,
	[Neighborhood] [nchar](10) NULL,
	[CityID] [int] NULL,
 CONSTRAINT [PK_Neighborhood] PRIMARY KEY CLUSTERED 
(
	[NeighborhoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 5/4/2021 7:12:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[HouseID] [int] NULL,
	[Seller] [int] NULL,
	[Buyer] [int] NULL,
	[Date of Sale] [date] NULL,
	[Company Cut %] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[City] ([CityID], [Name]) VALUES (1, N'Hedera    ')
INSERT [dbo].[City] ([CityID], [Name]) VALUES (2, N'Akko      ')
INSERT [dbo].[City] ([CityID], [Name]) VALUES (3, N'Arad      ')
INSERT [dbo].[City] ([CityID], [Name]) VALUES (4, N'Ramat Gan ')
INSERT [dbo].[City] ([CityID], [Name]) VALUES (5, N'Ashdod    ')
INSERT [dbo].[City] ([CityID], [Name]) VALUES (6, N'Ashkelon  ')
INSERT [dbo].[City] ([CityID], [Name]) VALUES (7, N'Holon     ')
INSERT [dbo].[City] ([CityID], [Name]) VALUES (8, N'Beer Sheva')
INSERT [dbo].[City] ([CityID], [Name]) VALUES (9, N'Eilat     ')
INSERT [dbo].[City] ([CityID], [Name]) VALUES (10, N'Haifa     ')
INSERT [dbo].[City] ([CityID], [Name]) VALUES (11, N'Caesarea  ')
INSERT [dbo].[City] ([CityID], [Name]) VALUES (12, N'Jerusalem ')
INSERT [dbo].[City] ([CityID], [Name]) VALUES (13, N'Lod       ')
INSERT [dbo].[City] ([CityID], [Name]) VALUES (14, N'Modiin    ')
INSERT [dbo].[City] ([CityID], [Name]) VALUES (15, N'Nazareth  ')
INSERT [dbo].[City] ([CityID], [Name]) VALUES (16, N'Nesher    ')
INSERT [dbo].[City] ([CityID], [Name]) VALUES (17, N'Tel Aviv  ')
INSERT [dbo].[City] ([CityID], [Name]) VALUES (18, N'Tiberias  ')
INSERT [dbo].[City] ([CityID], [Name]) VALUES (19, N'Tira      ')
GO
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (1, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (2, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (3, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (4, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (5, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (6, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (7, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (8, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (9, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (10, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (11, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (12, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (13, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (14, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (15, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (16, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (17, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (18, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (19, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (20, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (21, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (22, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (23, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (24, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (25, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (26, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (27, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (28, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (29, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
INSERT [dbo].[Company] ([CompanyID], [Company Name], [Contact Name], [Phone], [Email], [Postal Code], [Website], [Office Adress], [City]) VALUES (30, N'Real4U    ', N'Lisa Smith', N'03-666234 ', N'Real4U@Buy.com                                                   ', N'44115     ', N'Real4U.co.il             ', N'3359  Parker Drive       ', N'Tel-Aviv  ')
GO
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 1, N'Michael                  ', N'Smiley                   ', N'618-508-0641   ', N'217-257-2966   ', N't0j73s8ff3g@temporary-mail.net                              ', N'551  Butternut Lane ', N'Tel-aviv            ', 1, 0)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 2, N'Hattie                   ', N'Pina                     ', N'612-825-7484   ', N'612-282-9446   ', N'3ysjgycax97@temporary-mail.net                              ', N'3706  Rocket Drive  ', N'Akko                ', 0, 1)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 3, N'Roderick                 ', N'Hux                      ', N'412-263-1658   ', N'412-616-1661   ', N'snxyssp24s@temporary-mail.net                               ', N'2777  wood Drive    ', N'Ashdod              ', 1, 0)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 4, N'John                     ', N'Scott                    ', N'509-429-4379   ', N'509-429-2680   ', N'72qzy5prljq@temporary-mail.net                              ', N'932  Goodwin Avenue ', N'Hedera              ', 0, 1)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 5, N'Robin                    ', N'Arango                   ', N'409-994-2161   ', N'409-571-9715   ', N'cnufiyqce2t@temporary-mail.net                              ', N'2926  Hamilton Drive', N'Arad                ', 1, 0)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 6, N'Evelyn                   ', N'English                  ', N'620-901-7725   ', N'620-363-2353   ', N'tsyhbe2g6e@temporary-mail.net                               ', N'1267  Preston Street', N'Ramat Gan           ', 0, 1)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 7, N'Eva                      ', N'Barbour                  ', N'708-423-6922   ', N'847-820-6817   ', N'vf84n7tuk3s@temporary-mail.net                              ', N'3339  Hog Camp Road ', N'Ashkelon            ', 1, 0)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 8, N'Stephen                  ', N'Hamm                     ', N'203-828-2164   ', N'203-561-3792   ', N'n3c2nr9o4sd@temporary-mail.net                              ', N'239  Caldwell Road  ', N'Holon               ', 0, 1)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 9, N'Barbara                  ', N'Perry                    ', N'585-224-5001   ', N'646-714-9724   ', N'l53td64k6xm@temporary-mail.net                              ', N'3837  Carter Street ', N'Holon               ', 1, 0)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 10, N'Mark                     ', N'Davis                    ', N'530-820-2706   ', N'916-215-1713   ', N'mrfjzj3uzs@temporary-mail.net                               ', N'2135  Byers Lane    ', N'Beer Sheva          ', 0, 1)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 11, N'Betty                    ', N'Henderson                ', N'304-570-8768   ', N'304-450-4144   ', N'so1hvq6z87@temporary-mail.net                               ', N'3425  Leroy Lane    ', N'Beer Sheva          ', 1, 0)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 12, N'Edith                    ', N'Gonzalez                 ', N'301-766-7146   ', N'240-469-2052   ', N'dbdebsy1zk@temporary-mail.net                               ', N'3445  Leroy Lane    ', N'Eilat               ', 0, 1)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 13, N'Latonya                  ', N'Ralph                    ', N'925-689-2035   ', N'530-590-3731   ', N'n5dknz151s@temporary-mail.net                               ', N'1083  Eagle Lane    ', N'Eilat               ', 1, 0)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 14, N'Carolyn                  ', N'Laing                    ', N'352-274-2425   ', N'229-337-0113   ', N'512ssaa8qz@temporary-mail.net                               ', N'1352  Apple Lane    ', N'Haifa               ', 0, 1)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 15, N'Denise                   ', N'Stallworth               ', N'781-451-1468   ', N'617-335-4980   ', N'2hg6416c0yn@temporary-mail.net                              ', N'3768  Hemlock Lane  ', N'Caesarea            ', 1, 0)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 16, N'Jimmy                    ', N'Cronin                   ', N'937-423-2026   ', N'937-673-2645   ', N'2d9xw0o4wci@temporary-mail.net                              ', N'3762  Hemlock Lane  ', N'Caesarea            ', 0, 1)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 17, N'Shelby                   ', N'Phu                      ', N'774-388-1056   ', N'508-615-5033   ', N'1tivbbqtfva@temporary-mail.net                              ', N'1905  Lewis Street  ', N'Caesarea            ', 1, 0)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 18, N'George                   ', N'Powers                   ', N'615-401-8577   ', N'406-253-7789   ', N'k7wm4ndc04@temporary-mail.net                               ', N'4317  Rardin Drive  ', N'Jerusalem           ', 0, 1)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 19, N'Frank                    ', N'Langdon                  ', N'906-451-4253   ', N'906-631-5591   ', N'yd8nrb58qqp@temporary-mail.net                              ', N'4352  Rardin Drive  ', N'Jerusalem           ', 1, 0)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 20, N'John                     ', N'Davis                    ', N'215-368-3135   ', N'413-822-5369   ', N'p69kczlnjt@temporary-mail.net                               ', N'4482  Winifred Way  ', N'Jerusalem           ', 0, 1)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 21, N'Dorothy                  ', N'Roy                      ', N'303-253-8464   ', N'720-505-4383   ', N'9odp1ci5lzr@temporary-mail.net                              ', N'3636  Gore Street   ', N'Lod                 ', 1, 0)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 22, N'Carl                     ', N'Ross                     ', N'651-757-0564   ', N'712-267-4788   ', N'6ylhibsmmsh@temporary-mail.net                              ', N'3615  Gore Street   ', N'Modiin              ', 0, 1)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 23, N'Tiffany                  ', N'Dow                      ', N'330-527-3807   ', N'513-335-7230   ', N'x1qlyh9jr5r@temporary-mail.net                              ', N'4107  Stratford Park', N'Modiin              ', 1, 0)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 24, N'Jeanette                 ', N'Spears                   ', N'707-315-5873   ', N'415-425-9514   ', N'mqwilx03e@temporary-mail.net                                ', N'992  Gladwell Street', N'Nazareth            ', 0, 1)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 25, N'Miguel                   ', N'Burroughs                ', N'312-504-4118   ', N'773-339-3719   ', N'r66v2nn7li@temporary-mail.net                               ', N'3938  Ralph Drive   ', N'Nesher              ', 1, 0)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 26, N'Lula                     ', N'Smallwood                ', N'408-881-4932   ', N'408-930-8395   ', N'ip0jznrzylk@temporary-mail.net                              ', N'3930  Ralph Drive   ', N'Tel-aviv            ', 0, 1)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 27, N'Lori                     ', N'Hamilton                 ', N'417-655-2979   ', N'417-840-5504   ', N'q2gzc6zdgn@temporary-mail.net                               ', N'1641  Briarhill Lane', N'Tel-aviv            ', 1, 0)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 28, N'Frank                    ', N'Kagan                    ', N'208-705-0812   ', N'208-244-9529   ', N'jt6un4gl3if@temporary-mail.net                              ', N'1621  Briarhill Lane', N'Tiberias            ', 0, 1)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 29, N'Frances                  ', N'Klingensmith             ', N'707-662-6287   ', N'318-521-4735   ', N'kb2ysm9qfm@temporary-mail.net                               ', N'3021  Bluff Street  ', N'Tira                ', 1, 0)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 30, N'Kristin                  ', N'Villa                    ', N'601-503-5725   ', N'601-212-0541   ', N'txn5v8t87ck@temporary-mail.net
                            ', N'2998  Bluff Street  ', N'Tira                ', 0, 1)
INSERT [dbo].[Customer] ([CompanyID], [CustumerID], [First Name], [Last Name], [Phone], [CellPhone], [Email], [Adress], [City], [Selling], [Buying]) VALUES (1, 31, N'Clark                    ', N'Cent                     ', N'05-453455      ', N'055-342664     ', N'ClarkCan@allDo.Com                                          ', N'Wolfson 123         ', N'Tel-aviv            ', 1, 1)
GO
INSERT [dbo].[Employee] ([EmployeeID], [CompanyID], [First Name], [Last Name], [Adress], [City], [Phone], [HouseTypeID]) VALUES (1, 1, N'Alex      ', N'Storm     ', N'1122  Tree Frog Lane                              ', N'Bat-yam   ', N'0504835483', 1)
INSERT [dbo].[Employee] ([EmployeeID], [CompanyID], [First Name], [Last Name], [Adress], [City], [Phone], [HouseTypeID]) VALUES (2, 1, N'Dima      ', N'Fire      ', N'667  Beechwood Drive                              ', N'Caesarea  ', N'0532423455', 2)
INSERT [dbo].[Employee] ([EmployeeID], [CompanyID], [First Name], [Last Name], [Adress], [City], [Phone], [HouseTypeID]) VALUES (3, 1, N'Ravit     ', N'Overlord  ', N'702  Beechwood Drive                              ', N'Tel-Aviv  ', N'0523213125', 3)
INSERT [dbo].[Employee] ([EmployeeID], [CompanyID], [First Name], [Last Name], [Adress], [City], [Phone], [HouseTypeID]) VALUES (4, 1, N'Noy       ', N'Twinkoe   ', N'131  Joy Lane                                     ', N'Bnei Brak ', N'0525467457', 4)
INSERT [dbo].[Employee] ([EmployeeID], [CompanyID], [First Name], [Last Name], [Adress], [City], [Phone], [HouseTypeID]) VALUES (5, 1, N'Shahar    ', N'Wisky     ', N'2263  Perry Street                                ', N'Haifa     ', N'0548872374', 5)
INSERT [dbo].[Employee] ([EmployeeID], [CompanyID], [First Name], [Last Name], [Adress], [City], [Phone], [HouseTypeID]) VALUES (6, 1, N'Ofer      ', N'Risky     ', N'4074  Queens Lane                                 ', N'Dimona    ', N'0554369346', 6)
INSERT [dbo].[Employee] ([EmployeeID], [CompanyID], [First Name], [Last Name], [Adress], [City], [Phone], [HouseTypeID]) VALUES (7, 1, N'Tamir     ', N'Kabab     ', N'4392  Cedarstone Drive                            ', N'Eilat     ', N'0524534567', 7)
INSERT [dbo].[Employee] ([EmployeeID], [CompanyID], [First Name], [Last Name], [Adress], [City], [Phone], [HouseTypeID]) VALUES (8, 1, N'Amit      ', N'Light     ', N'4418  Cedarstone Drive                            ', N'Akko      ', N'0536754778', 8)
INSERT [dbo].[Employee] ([EmployeeID], [CompanyID], [First Name], [Last Name], [Adress], [City], [Phone], [HouseTypeID]) VALUES (9, 1, N'Shira     ', N'Manly     ', N'3262  Emerson Road                                ', N'Ashdod    ', N'0535453463', 9)
INSERT [dbo].[Employee] ([EmployeeID], [CompanyID], [First Name], [Last Name], [Adress], [City], [Phone], [HouseTypeID]) VALUES (10, 1, N'Obama     ', N'Care      ', N'3261  Emerson Road                                ', N'Tiberias  ', N'0525783743', 10)
INSERT [dbo].[Employee] ([EmployeeID], [CompanyID], [First Name], [Last Name], [Adress], [City], [Phone], [HouseTypeID]) VALUES (11, 1, N'Cody      ', N'Lane      ', N'1031  Fairfax Drive                               ', N'Tel-Aviv  ', N'0546512691', 11)
INSERT [dbo].[Employee] ([EmployeeID], [CompanyID], [First Name], [Last Name], [Adress], [City], [Phone], [HouseTypeID]) VALUES (12, 1, N'Shione    ', N'Cooper    ', N'1028  Fairfax Drive                               ', N'Bat-yam   ', N'0547856995', 12)
INSERT [dbo].[Employee] ([EmployeeID], [CompanyID], [First Name], [Last Name], [Adress], [City], [Phone], [HouseTypeID]) VALUES (13, 1, N'Jone      ', N'Smith     ', N'4297  Joanne Lane                                 ', N'Caesarea  ', N'0547568443', 13)
INSERT [dbo].[Employee] ([EmployeeID], [CompanyID], [First Name], [Last Name], [Adress], [City], [Phone], [HouseTypeID]) VALUES (14, 1, N'Anna      ', N'Krusty    ', N'1860  Ferry Street                                ', N'Haifa     ', N'0525346346', 14)
INSERT [dbo].[Employee] ([EmployeeID], [CompanyID], [First Name], [Last Name], [Adress], [City], [Phone], [HouseTypeID]) VALUES (15, 1, N'May       ', N'Dark      ', N'560  Hall Place                                   ', N'Eilat     ', N'0525347638', 15)
GO
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (1, 1, 1, 1, 1, 0, 250000, 2, 4, CAST(N'1905-06-24T00:00:00.000' AS DateTime), 79, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (2, 2, 2, 2, 3, 0, 225000, 2, 3, CAST(N'1905-06-25T00:00:00.000' AS DateTime), 87, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (3, 3, 3, 3, 4, 0, 300000, 1, 4, CAST(N'1905-07-08T00:00:00.000' AS DateTime), 123, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (4, 4, 4, 4, 8, 1, 460000, 1, 4, CAST(N'1905-06-24T00:00:00.000' AS DateTime), 42, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (5, 5, 5, 5, 5, 1, 600000, 2, 5, CAST(N'1905-05-05T00:00:00.000' AS DateTime), 152, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (6, 6, 6, 6, 21, 1, 265000, 2, 4, CAST(N'1905-06-24T00:00:00.000' AS DateTime), 5, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (7, 7, 7, 7, 1, 0, 200000, 1, 3, CAST(N'1905-06-28T00:00:00.000' AS DateTime), 43, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (8, 8, 8, 8, 2, 0, 350000, 1, 2, CAST(N'1905-07-10T00:00:00.000' AS DateTime), 67, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (9, 9, 9, 9, 3, 0, 8000000, 2, 7, CAST(N'1905-07-14T00:00:00.000' AS DateTime), 88, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (10, 10, 10, 10, 2, 0, 7500000, 1, 6, CAST(N'1905-07-09T00:00:00.000' AS DateTime), 88, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (11, 11, 11, 11, 3, 1, 1000000, 2, 5, CAST(N'1905-06-24T00:00:00.000' AS DateTime), 77, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (12, 12, 12, 12, 4, 1, 750000, 2, 4, CAST(N'1905-06-27T00:00:00.000' AS DateTime), 65, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (13, 13, 13, 13, 5, 0, 400000, 2, 3, CAST(N'1905-07-04T00:00:00.000' AS DateTime), 76, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (14, 14, 14, 14, 5, 1, 550000, 3, 5, CAST(N'1905-07-09T00:00:00.000' AS DateTime), 87, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (15, 15, 15, 15, 4, 1, 6500000, 2, 7, CAST(N'1905-07-05T00:00:00.000' AS DateTime), 87, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (16, 1, 16, 16, 7, 1, 2000000, 2, 5, CAST(N'1905-07-04T00:00:00.000' AS DateTime), 65, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (17, 2, 17, 17, 8, 1, 450000, 2, 4, CAST(N'1905-07-06T00:00:00.000' AS DateTime), 76, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (18, 3, 18, 18, 4, 0, 6500000, 1, 7, CAST(N'1905-07-07T00:00:00.000' AS DateTime), 87, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (19, 5, 19, 19, 3, 0, 300000, 1, 3, CAST(N'1905-07-08T00:00:00.000' AS DateTime), 98, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (20, 6, 20, 20, 21, 1, 450000, 2, 4, CAST(N'1905-07-09T00:00:00.000' AS DateTime), 76, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (21, 7, 21, 21, 23, 1, 400000, 2, 4, CAST(N'1905-07-10T00:00:00.000' AS DateTime), 77, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (22, 8, 22, 22, 5, 0, 750000, 1, 5, CAST(N'1905-07-11T00:00:00.000' AS DateTime), 87, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (23, 9, 23, 23, 4, 0, 4500000, 1, 6, CAST(N'1905-07-12T00:00:00.000' AS DateTime), 87, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (24, 10, 24, 24, 6, 1, 450000, 1, 4, CAST(N'1905-07-13T00:00:00.000' AS DateTime), 56, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (25, 11, 25, 25, 4, 1, 7000000, 2, 7, CAST(N'1905-07-15T00:00:00.000' AS DateTime), 76, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (26, 12, 1, 26, 7, 0, 450000, 2, 4, CAST(N'1905-06-25T00:00:00.000' AS DateTime), 43, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (27, 13, 2, 27, 8, 1, 250000, 2, 3, CAST(N'1905-06-26T00:00:00.000' AS DateTime), 55, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (28, 14, 3, 28, 6, 0, 8000000, 1, 6, CAST(N'1905-06-27T00:00:00.000' AS DateTime), 66, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (29, 15, 4, 29, 4, 1, 670000, 1, 4, CAST(N'1905-06-28T00:00:00.000' AS DateTime), 87, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (30, 1, 5, 30, 5, 1, 250000, 1, 3, CAST(N'1905-06-29T00:00:00.000' AS DateTime), 98, NULL, NULL)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (31, 1, 1, 31, 4, 1, 450000, 1, 3, CAST(N'2000-01-01T00:00:00.000' AS DateTime), 98, 7, 31)
INSERT [dbo].[House] ([HouseID], [HouseTypeID], [NeighborhoodID], [CustomerID], [Floor], [Parking Space], [Price Shekels], [Number of Bathrooms], [Number of Bedrooms], [Built Date Year], [Square Meters], [Current Owner ID], [PreviousOwner ID]) VALUES (32, 2, 1, 31, 1, 1, 650000, 1, 4, CAST(N'2010-01-01T00:00:00.000' AS DateTime), 120, 31, 1)
GO
INSERT [dbo].[House Type] ([HouseTypeID], [Type], [Notes]) VALUES (1, N'Apartment           ', NULL)
INSERT [dbo].[House Type] ([HouseTypeID], [Type], [Notes]) VALUES (2, N'Condo               ', NULL)
INSERT [dbo].[House Type] ([HouseTypeID], [Type], [Notes]) VALUES (3, N'Co-Op               ', NULL)
INSERT [dbo].[House Type] ([HouseTypeID], [Type], [Notes]) VALUES (4, N'Single-Family       ', NULL)
INSERT [dbo].[House Type] ([HouseTypeID], [Type], [Notes]) VALUES (5, N'Tiny Home           ', NULL)
INSERT [dbo].[House Type] ([HouseTypeID], [Type], [Notes]) VALUES (6, N'Townhome            ', NULL)
INSERT [dbo].[House Type] ([HouseTypeID], [Type], [Notes]) VALUES (7, N'Cape Cod            ', NULL)
INSERT [dbo].[House Type] ([HouseTypeID], [Type], [Notes]) VALUES (8, N'Colonial            ', NULL)
INSERT [dbo].[House Type] ([HouseTypeID], [Type], [Notes]) VALUES (9, N'Contemporary        ', NULL)
INSERT [dbo].[House Type] ([HouseTypeID], [Type], [Notes]) VALUES (10, N'Cottage             ', NULL)
INSERT [dbo].[House Type] ([HouseTypeID], [Type], [Notes]) VALUES (11, N'Craftsman           ', NULL)
INSERT [dbo].[House Type] ([HouseTypeID], [Type], [Notes]) VALUES (12, N'Greek Revival       ', NULL)
INSERT [dbo].[House Type] ([HouseTypeID], [Type], [Notes]) VALUES (13, N'Farmhouse           ', NULL)
INSERT [dbo].[House Type] ([HouseTypeID], [Type], [Notes]) VALUES (14, N'French Country      ', NULL)
INSERT [dbo].[House Type] ([HouseTypeID], [Type], [Notes]) VALUES (15, N'Mediterranean       ', NULL)
GO
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (1, N'Afeka     ', 17)
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (2, N'Bavli     ', 17)
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (3, N'Florentin ', 17)
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (4, N'Shlomo    ', 1)
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (5, N'Bialik    ', 1)
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (6, N'Moriya    ', 2)
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (7, N'Neve Aviv ', 2)
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (8, N'Renanim   ', 3)
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (9, N'Tel Yehuda', 4)
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (10, N'Merom Nave', 4)
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (11, N'Rova 2    ', 5)
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (12, N'Rova 4    ', 5)
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (13, N'Afrida    ', 6)
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (14, N'Vatikim   ', 7)
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (15, N'Ramot D   ', 8)
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (16, N'Arava     ', 9)
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (17, N'Kababir   ', 10)
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (18, N'Hahoresh  ', 11)
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (19, N'Gonene E  ', 12)
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (20, N'Rasko     ', 13)
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (21, N'Avnei Hen ', 14)
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (22, N'Alrum     ', 15)
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (23, N'Ben Dor   ', 16)
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (24, N'Ahva      ', 18)
INSERT [dbo].[Neighborhood] ([NeighborhoodID], [Neighborhood], [CityID]) VALUES (25, N'Damo      ', 19)
GO
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (1, 1, 1, 1, 1, 0, CAST(N'2020-05-21' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (2, 1, 2, 16, 0, 1, CAST(N'2019-02-02' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (3, 1, 3, 30, 1, 0, CAST(N'2020-05-02' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (4, 2, 4, 17, 0, 1, CAST(N'2020-10-23' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (5, 2, 5, 2, 1, 0, CAST(N'2020-09-26' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (6, 3, 6, 3, 0, 1, CAST(N'2020-11-30' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (7, 3, 7, 18, 1, 0, CAST(N'2020-08-14' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (8, 4, 8, 4, 0, 1, CAST(N'2019-09-22' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (9, 5, 9, 5, 1, 0, CAST(N'2018-08-22' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (10, 6, 10, 20, 0, 1, CAST(N'2020-09-22' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (11, 6, 11, 6, 1, 0, CAST(N'2020-11-02' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (12, 7, 12, 7, 0, 1, CAST(N'2020-09-19' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (13, 7, 13, 21, 1, 0, CAST(N'2019-04-23' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (14, 8, 14, 22, 0, 1, CAST(N'2020-03-16' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (15, 8, 15, 8, 1, 0, CAST(N'2020-02-01' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (16, 9, 16, 9, 0, 1, CAST(N'2019-12-23' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (17, 9, 17, 23, 1, 0, CAST(N'2020-02-03' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (18, 10, 18, 24, 0, 1, CAST(N'2020-03-03' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (19, 10, 19, 10, 1, 0, CAST(N'2020-09-02' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (20, 11, 20, 11, 0, 1, CAST(N'2020-01-23' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (21, 11, 21, 25, 1, 0, CAST(N'2020-05-05' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (22, 12, 22, 26, 0, 1, CAST(N'2019-04-04' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (23, 13, 23, 13, 1, 0, CAST(N'2019-05-02' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (24, 13, 24, 27, 0, 1, CAST(N'2019-04-02' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (25, 14, 25, 28, 1, 0, CAST(N'2020-01-01' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (26, 14, 26, 14, 0, 1, CAST(N'2018-03-20' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (27, 15, 27, 15, 1, 0, CAST(N'2018-09-30' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (28, 15, 28, 29, 0, 1, CAST(N'2019-02-02' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (29, 5, 29, 4, 1, 0, CAST(N'2018-08-02' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (30, 12, 30, 12, 0, 1, CAST(N'2020-02-01' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (31, 2, 31, 31, 1, 0, CAST(N'2020-01-03' AS Date), 20)
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [CustomerID], [HouseID], [Seller], [Buyer], [Date of Sale], [Company Cut %]) VALUES (32, 1, 31, 32, 0, 1, CAST(N'2020-02-03' AS Date), 20)
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Company]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Company]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_HouseType] FOREIGN KEY([HouseTypeID])
REFERENCES [dbo].[House Type] ([HouseTypeID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_HouseType]
GO
ALTER TABLE [dbo].[House]  WITH CHECK ADD  CONSTRAINT [FK_House_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustumerID])
GO
ALTER TABLE [dbo].[House] CHECK CONSTRAINT [FK_House_Customer]
GO
ALTER TABLE [dbo].[House]  WITH CHECK ADD  CONSTRAINT [FK_House_House Type] FOREIGN KEY([HouseTypeID])
REFERENCES [dbo].[House Type] ([HouseTypeID])
GO
ALTER TABLE [dbo].[House] CHECK CONSTRAINT [FK_House_House Type]
GO
ALTER TABLE [dbo].[House]  WITH CHECK ADD  CONSTRAINT [FK_House_Neighborhood] FOREIGN KEY([NeighborhoodID])
REFERENCES [dbo].[Neighborhood] ([NeighborhoodID])
GO
ALTER TABLE [dbo].[House] CHECK CONSTRAINT [FK_House_Neighborhood]
GO
ALTER TABLE [dbo].[Neighborhood]  WITH CHECK ADD  CONSTRAINT [FK_Neighborhood_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Neighborhood] CHECK CONSTRAINT [FK_Neighborhood_City]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustumerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Employee]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_House] FOREIGN KEY([HouseID])
REFERENCES [dbo].[House] ([HouseID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_House]
GO
USE [master]
GO
ALTER DATABASE [NADLAN] SET  READ_WRITE 
GO
