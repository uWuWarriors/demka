USE [master]
GO
/****** Object:  Database [pracktica31]    Script Date: 20.03.2024 13:03:42 ******/
CREATE DATABASE [pracktica31]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pracktica31', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\pracktica31.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pracktica31_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\pracktica31_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [pracktica31] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pracktica31].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pracktica31] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pracktica31] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pracktica31] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pracktica31] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pracktica31] SET ARITHABORT OFF 
GO
ALTER DATABASE [pracktica31] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pracktica31] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pracktica31] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pracktica31] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pracktica31] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pracktica31] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pracktica31] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pracktica31] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pracktica31] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pracktica31] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pracktica31] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pracktica31] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pracktica31] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pracktica31] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pracktica31] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pracktica31] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pracktica31] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pracktica31] SET RECOVERY FULL 
GO
ALTER DATABASE [pracktica31] SET  MULTI_USER 
GO
ALTER DATABASE [pracktica31] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pracktica31] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pracktica31] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pracktica31] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pracktica31] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [pracktica31] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'pracktica31', N'ON'
GO
ALTER DATABASE [pracktica31] SET QUERY_STORE = ON
GO
ALTER DATABASE [pracktica31] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [pracktica31]
GO
/****** Object:  Table [dbo].[activity]    Script Date: 20.03.2024 13:03:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[activity](
	[id_activity] [int] NOT NULL,
	[name] [text] NOT NULL,
 CONSTRAINT [PK_activity] PRIMARY KEY CLUSTERED 
(
	[id_activity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[city]    Script Date: 20.03.2024 13:03:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[id_city] [int] NOT NULL,
	[name] [text] NOT NULL,
	[flag] [binary](50) NOT NULL,
	[id_country] [int] NOT NULL,
 CONSTRAINT [PK_city] PRIMARY KEY CLUSTERED 
(
	[id_city] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country]    Script Date: 20.03.2024 13:03:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[id_country] [int] NOT NULL,
	[name] [text] NOT NULL,
	[name_eng] [text] NOT NULL,
	[country_code1] [varchar](3) NOT NULL,
	[country_code2] [int] NOT NULL,
	[flag] [binary](50) NOT NULL,
 CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED 
(
	[id_country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[event]    Script Date: 20.03.2024 13:03:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[event](
	[id_event] [int] NOT NULL,
	[name] [text] NOT NULL,
	[date] [date] NOT NULL,
	[city_id] [int] NOT NULL,
	[number_days] [int] NOT NULL,
	[id_activity] [int] NOT NULL,
 CONSTRAINT [PK_event] PRIMARY KEY CLUSTERED 
(
	[id_event] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[event_user]    Script Date: 20.03.2024 13:03:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[event_user](
	[id] [int] NOT NULL,
	[id_event] [int] NOT NULL,
	[id_user] [int] NOT NULL,
 CONSTRAINT [PK_event_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[event_user_8]    Script Date: 20.03.2024 13:03:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[event_user_8](
	[id] [int] NOT NULL,
	[id_event] [int] NULL,
	[id_user] [int] NOT NULL,
 CONSTRAINT [PK_event_user_8] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test]    Script Date: 20.03.2024 13:03:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test](
	[ФИО] [nvarchar](50) NOT NULL,
	[Почта] [nvarchar](50) NOT NULL,
	[дата_рождения] [date] NOT NULL,
	[страна] [tinyint] NOT NULL,
	[телефон] [nvarchar](50) NOT NULL,
	[пароль] [nvarchar](50) NOT NULL,
	[direction] [nvarchar](50) NULL,
	[пол] [nvarchar](50) NOT NULL,
	[фото] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test12]    Script Date: 20.03.2024 13:03:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test12](
	[ФИО] [nvarchar](50) NOT NULL,
	[Почта] [nvarchar](50) NOT NULL,
	[дата_рождения] [date] NOT NULL,
	[страна] [tinyint] NOT NULL,
	[телефон] [nvarchar](50) NOT NULL,
	[пароль] [nvarchar](50) NOT NULL,
	[direction] [nvarchar](50) NULL,
	[пол] [nvarchar](50) NOT NULL,
	[фото] [nvarchar](50) NOT NULL,
	[id_user] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 20.03.2024 13:03:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id_user] [int] NOT NULL,
	[email] [text] NOT NULL,
	[password] [text] NOT NULL,
	[phone_number] [numeric](10, 0) NOT NULL,
	[gender] [char](1) NOT NULL,
	[country_code] [int] NOT NULL,
	[date_birth] [date] NOT NULL,
	[role] [text] NOT NULL,
	[name] [text] NOT NULL,
	[direction] [text] NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_8]    Script Date: 20.03.2024 13:03:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_8](
	[id] [int] NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[date_birth] [date] NULL,
	[country_code] [int] NULL,
	[phone_number] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[direction] [nvarchar](50) NULL,
	[gender] [nvarchar](50) NULL,
	[photo] [binary](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_test]    Script Date: 20.03.2024 13:03:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_test](
	[id] [tinyint] NULL,
	[ФИО] [nvarchar](50) NULL,
	[Почта] [nvarchar](50) NULL,
	[дата_рождения] [date] NULL,
	[страна] [tinyint] NULL,
	[телефон] [nvarchar](50) NULL,
	[пароль] [nvarchar](50) NULL,
	[direction] [nvarchar](50) NULL,
	[пол] [nvarchar](50) NULL,
	[фото] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_test12]    Script Date: 20.03.2024 13:03:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_test12](
	[id] [tinyint] NULL,
	[ФИО] [nvarchar](50) NULL,
	[Почта] [nvarchar](50) NULL,
	[дата_рождения] [date] NULL,
	[страна] [tinyint] NULL,
	[телефон] [nvarchar](50) NULL,
	[пароль] [nvarchar](50) NULL,
	[direction] [nvarchar](50) NULL,
	[пол] [nvarchar](50) NULL,
	[фото] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_test32]    Script Date: 20.03.2024 13:03:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_test32](
	[id] [tinyint] NOT NULL,
	[ФИО] [nvarchar](50) NOT NULL,
	[Почта] [nvarchar](50) NOT NULL,
	[дата_рождения] [date] NOT NULL,
	[страна] [tinyint] NOT NULL,
	[телефон] [nvarchar](50) NOT NULL,
	[пароль] [nvarchar](50) NOT NULL,
	[direction] [nvarchar](50) NULL,
	[пол] [nvarchar](50) NOT NULL,
	[фото] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_user_test32] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (1, 1, 1)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (2, 2, 2)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (3, 3, 3)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (4, 4, 4)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (5, 5, 5)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (6, 6, 6)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (7, 7, 7)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (8, 8, 8)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (9, 9, 9)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (10, 10, 10)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (11, 11, 11)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (12, 12, 12)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (13, 13, 13)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (14, 14, 14)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (15, 15, 15)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (16, 16, 16)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (17, 17, 17)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (18, 18, 18)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (19, 19, 19)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (20, 20, 20)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (21, NULL, 21)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (22, NULL, 22)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (23, NULL, 23)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (24, NULL, 24)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (25, NULL, 25)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (26, NULL, 26)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (27, NULL, 27)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (28, NULL, 28)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (29, NULL, 29)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (30, NULL, 30)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (31, NULL, 31)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (32, NULL, 32)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (33, NULL, 33)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (34, NULL, 34)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (35, NULL, 35)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (36, NULL, 36)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (37, NULL, 37)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (38, NULL, 38)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (39, NULL, 39)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (40, NULL, 40)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (41, NULL, 41)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (42, NULL, 42)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (43, NULL, 43)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (44, NULL, 44)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (45, NULL, 45)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (46, NULL, 46)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (47, NULL, 47)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (48, NULL, 48)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (49, NULL, 49)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (50, NULL, 50)
GO
INSERT [dbo].[event_user_8] ([id], [id_event], [id_user]) VALUES (51, NULL, 51)
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Ершова Нора Федотовна', N'techie@outlook.com', CAST(N'1987-03-26' AS Date), 71, N'+7 (960) 424-07-11', N'tKKevv8%', NULL, N'женский', N'foto60.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Афанасьева Жанна Валентиновна', N'agapow@yahoo.com', CAST(N'1988-01-04' AS Date), 34, N'+7 (930) 661-69-31', N'huSfHm4$', NULL, N'ж', N'foto61.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Крылова Рая Всеволодовна', N'chaikin@yahoo.ca', CAST(N'1988-04-05' AS Date), 73, N'+7 (957) 265-60-68', N'TlUwMw77%', NULL, N'жен', N'foto62.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Попова Вида Тимофеевна', N'lbecchi@yahoo.ca', CAST(N'1989-10-25' AS Date), 64, N'+7 (911) 744-03-14', N'%afF#@6', NULL, N'жен', N'foto63.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Давыдова Сандра Богуславовна', N'bbirth@gmail.com', CAST(N'1989-12-27' AS Date), 55, N'+7 (984) 877-87-64', N'SU4Jpw"', NULL, N'жен', N'foto64.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Прохорова Сабина Созоновна', N'library@sbcglobal.net', CAST(N'1990-01-16' AS Date), 77, N'+7 (940) 500-20-72', N'wL#O0V', NULL, N'жен', N'foto65.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Громова Сильва Адольфовна', N'sisyphus@live.com', CAST(N'1990-06-13' AS Date), 52, N'+7 (956) 056-75-21', N'p5r{zY', NULL, N'ж', N'foto66.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Боброва Джема Феликсовна', N'msroth@hotmail.com', CAST(N'1990-07-03' AS Date), 28, N'+7 (965) 493-39-66', N'wTVK~M1', NULL, N'женский', N'foto67.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Фокина Алия Юлиановна', N'dodong@yahoo.com', CAST(N'1990-11-27' AS Date), 53, N'+7 (997) 329-69-78', N'8*Zfaj', NULL, N'ж', N'foto68.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Калинина Маргарита Анатольевна', N'bcevc@hotmail.com', CAST(N'1991-06-08' AS Date), 74, N'+7 (964) 571-56-50', N'4sBGr*', NULL, N'ж', N'foto69.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Горшкова Дина Тарасовна', N'sethbrown@aol.com', CAST(N'1991-08-13' AS Date), 7, N'+7 (918) 418-80-73', N'BpC8e8]', NULL, N'женский', N'foto70.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Гуляева Ирэна Юрьевна', N'ftgvh2xbdaps@tutanota.com', CAST(N'1992-10-03' AS Date), 38, N'+7 (91) 841-39-39', N'cI1CTd', NULL, N'женский', N'foto1.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Бурова Келен Натановна', N'ervbd91pfcoi@mail.com', CAST(N'1990-09-19' AS Date), 54, N'+7 (918) 418-10-29', N'MPmfYk', NULL, N'женский', N'foto2.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Королёва Лаура Пётровна', N'p3y4b981xwdl@outlook.com', CAST(N'1995-07-31' AS Date), 24, N'+7 (9184) 188-29-42', N'omtSW3', NULL, N'женский', N'foto3.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Степанова Розалия Евсеевна', N'8e9kvxq6z70o@mail.com', CAST(N'1994-11-02' AS Date), 24, N'+7 (918) 418-01-29', N'cErGgC', NULL, N'женский', N'foto4.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Тимофеева Евгения Викторовна', N'obnk82vzpg34@yahoo.com', CAST(N'1982-01-02' AS Date), 11, N'+7 (918) 418-12-03', N'q2se3v', NULL, N'женский', N'foto5.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Дроздова Винетта Германовна', N'wl652rgtk9js@gmail.com', CAST(N'1996-06-17' AS Date), 1, N'+7 (918) 418-10-35', N'KnqfAk', NULL, N'женский', N'foto6.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Лукина Ксения Романовна', N'23rgct5v1myx@gmail.com', CAST(N'1990-09-18' AS Date), 2, N'+7 (918) 418-10-38', N'6YxPwE', NULL, N'женский', N'foto7.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Мышкина Триана Геннадьевна', N'i4fs8e6mlk5p@yahoo.com', CAST(N'1981-12-30' AS Date), 54, N'+7 (918) 418-91-37', N'pBQpPx', NULL, N'женский', N'foto8.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Михеева Аделия Авксентьевна', N'4hu6f8dxvngq@tutanota.com', CAST(N'1989-06-11' AS Date), 64, N'+7 (918) 239-45-82', N'FkX6Ms', NULL, N'женский', N'foto9.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Царева Виктория Давидовна', N'iunhxq41tgr5@tutanota.com', CAST(N'1988-07-03' AS Date), 33, N'7(567)103-73-32', N'FYi396Dd5u', N'ИТ', N'женский', N'foto9.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Зорин Дмитрий Маркович', N'ofdt4z1bijq0@tutanota.com', CAST(N'1993-09-07' AS Date), 57, N'7(79)644-01-06', N'7gi7E8K4Ng', N'ИТ', N'мужской', N'foto10.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Зотова Анна Тимуровна', N'ac6yxzg7rl5k@mail.com', CAST(N'1990-09-21' AS Date), 11, N'7(488)643-19-98', N'3L3eA5eEg3', N'Биг Дата', N'женский', N'foto8.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Соловьев Тимур Константинович', N'b1p4ur8nsedj@yahoo.com', CAST(N'1992-09-03' AS Date), 45, N'7(1828)504-39-49', N'Si8S5kS83v', N'Дизайн', N'мужской', N'foto11.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Малахов Александр Фёдорович', N'wyo6k9emv1j5@mail.com', CAST(N'1957-05-18' AS Date), 78, N'7(905)793-68-23', N'T83vfX2Z3b', N'Биг Дата', N'мужской', N'foto12.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Зорин Марк Ярославович', N'g7kwp8lu65xi@tutanota.com', CAST(N'1961-03-09' AS Date), 82, N'7(54)522-60-54', N'25cPn58HxV', N'Аналитика', N'мужской', N'foto13.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Егорова Ева Михайловна', N'doj5r1m8xnky@gmail.com', CAST(N'1987-06-15' AS Date), 80, N'7(05)441-48-14', N'3z86YDzaX8', N'ИТ', N'женский', N'foto14.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Гущина Кристина Львовна', N'bxk06h5touyr@mail.com', CAST(N'1966-06-28' AS Date), 47, N'7(023)826-25-26', N't8F9hZXp89', N'Информационная безопасность', N'женский', N'foto16.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Кудрявцева Виктория Романовна', N'26yf8xbcntgp@gmail.com', CAST(N'1953-01-27' AS Date), 30, N'7(7804)582-64-90', N'92mARR3gu4', N'Биг Дата', N'женский', N'foto17.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Новикова Александра Александровна', N'0z4fvq65c7tg@gmail.com', CAST(N'1982-09-02' AS Date), 76, N'7(1472)122-56-07', N'Kf64Y6rhZ3', N'Аналитика', N'женский', N'foto18.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Масленников Родион Филиппович', N'3kma18t5furi@gmail.com', CAST(N'1952-06-09' AS Date), 24, N'7(23)912-71-67', N's7iAYE9d38', N'Аналитика', N'мужской', N'foto19.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Иванов Тимур Иванович', N'ws7nxyhd6g1o@yahoo.com', CAST(N'1955-08-30' AS Date), 6, N'7(5939)489-85-18', N'3Ga9jfT9D2', N'Информационная безопасность', N'мужской', N'foto20.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Иванов Сергей Степанович', N'oitzvs1mylj2@gmail.com', CAST(N'1993-09-01' AS Date), 83, N'7(4020)034-48-35', N'N6598CFsgi', N'Дизайн', N'мужской', N'foto21.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Спиридонов Ярослав Сергеевич', N'las6pufjkv45@outlook.com', CAST(N'1969-04-22' AS Date), 64, N'7(17)843-77-26', N'DV5625Zfmj', N'Дизайн', N'мужской', N'foto22.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Виноградова Эмилия Валерьевна', N'nl81b9i7s0ka@gmail.com', CAST(N'1991-10-25' AS Date), 90, N'7(16)788-42-97', N'22YyD83dMg', N'Дизайн', N'женский', N'foto23.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Мартынова Ева Семёновна', N'ma87ser3gkj9@yahoo.com', CAST(N'1984-03-24' AS Date), 54, N'7(087)267-87-85', N'522EmkEmA6', N'Информационная безопасность', N'женский', N'foto24.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Яковлева Анисия Григорьевна', N'dfmygtwpecj9@tutanota.com', CAST(N'1997-09-13' AS Date), 53, N'7(798)711-92-89', N'uf9u227NYU', N'Информационная безопасность', N'женский', N'foto25.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Свиридов Тимофей Александрович', N'82zju4yritwo@mail.com', CAST(N'1991-07-22' AS Date), 84, N'7(68)882-28-10', N'4UDk9p76mD', N'Биг Дата', N'мужской', N'foto26.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Медведев Захар Даниилович', N'zo6nye42s87t@yahoo.com', CAST(N'1960-04-11' AS Date), 63, N'7(36)230-79-77', N'cK49u3JU4n', N'Аналитика', N'мужской', N'foto27.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Тихонова Елизавета Александровна', N'0cejwmnpqtb6@gmail.com', CAST(N'1955-01-07' AS Date), 34, N'7(2594)224-28-37', N'b2JHb32S8i', N'Информационная безопасность', N'женский', N'foto28.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Рыжов Роман Константинович', N'42thql96cwe5@yahoo.com', CAST(N'1981-12-30' AS Date), 67, N'7(1009)025-64-70', N'uASc9446eF', N'Биг Дата', N'мужской', N'foto29.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Васильев Всеволод Давидович', N'6z92wongmash@tutanota.com', CAST(N'1988-10-16' AS Date), 51, N'7(354)903-53-67', N'Ke22Yh8Pp7', NULL, N'мужской', N'foto1.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Новиков Фёдор Макарович', N'jkp23vlzsqei@gmail.com', CAST(N'1980-08-03' AS Date), 33, N'7(6562)925-01-77', N'Tj78jXeH68', NULL, N'мужской', N'foto2.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Фролова Владислава Савельевна', N'dncmxp1vqr4t@tutanota.com', CAST(N'1999-07-13' AS Date), 43, N'7(12)981-33-56', N'DF9a8cJf82', NULL, N'женский', N'foto3.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Кузнецов Елисей Александрович', N'sn4xvg8wyb0h@outlook.com', CAST(N'1983-12-19' AS Date), 3, N'7(698)667-22-45', N'B2bdk8FD27', NULL, N'мужской', N'foto4.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Рябова София Матвеевна', N'9zaecohlw2xy@tutanota.com', CAST(N'1998-08-10' AS Date), 33, N'7(38)393-11-43', N'58vMHdK4g5', NULL, N'женский', N'foto5.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Власов Арсений Львович', N'sohzld6c52mv@gmail.com', CAST(N'1980-05-28' AS Date), 31, N'7(4297)539-13-81', N'T3uhc34E9Z', NULL, N'мужской', N'foto6.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Маслова Екатерина Макаровна', N'a1v0lgxsz3qb@mail.com', CAST(N'1983-10-26' AS Date), 40, N'7(49)638-66-62', N'dj8PN3b4M9', NULL, N'женский', N'foto7.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Агафонов Давид Артёмович', N'lry2ko5t031w@gmail.com', CAST(N'1995-10-14' AS Date), 27, N'7(65)706-55-85', N'uy69Pp8DY6', NULL, N'мужской', N'foto8.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Федотова Варвара Сергеевна', N'omrjzf0pc8n6@outlook.com', CAST(N'1996-12-05' AS Date), 2, N'7(40)420-24-06', N'Sp3k6Ax86E', NULL, N'женский', N'foto9.jpg')
GO
INSERT [dbo].[test] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (N'Кудряшова Виктория Дмитриевна', N't1wpou7merxi@yahoo.com', CAST(N'1999-02-13' AS Date), 16, N'7(427)939-24-67', N'fvm774FV3R', NULL, N'женский', N'foto10.jpg')
GO
SET IDENTITY_INSERT [dbo].[test12] ON 
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Ершова Нора Федотовна', N'techie@outlook.com', CAST(N'1987-03-26' AS Date), 71, N'+7 (960) 424-07-11', N'tKKevv8%', NULL, N'женский', N'foto60.jpg', 1)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Афанасьева Жанна Валентиновна', N'agapow@yahoo.com', CAST(N'1988-01-04' AS Date), 34, N'+7 (930) 661-69-31', N'huSfHm4$', NULL, N'ж', N'foto61.jpg', 2)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Крылова Рая Всеволодовна', N'chaikin@yahoo.ca', CAST(N'1988-04-05' AS Date), 73, N'+7 (957) 265-60-68', N'TlUwMw77%', NULL, N'жен', N'foto62.jpg', 3)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Попова Вида Тимофеевна', N'lbecchi@yahoo.ca', CAST(N'1989-10-25' AS Date), 64, N'+7 (911) 744-03-14', N'%afF#@6', NULL, N'жен', N'foto63.jpg', 4)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Давыдова Сандра Богуславовна', N'bbirth@gmail.com', CAST(N'1989-12-27' AS Date), 55, N'+7 (984) 877-87-64', N'SU4Jpw"', NULL, N'жен', N'foto64.jpg', 5)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Прохорова Сабина Созоновна', N'library@sbcglobal.net', CAST(N'1990-01-16' AS Date), 77, N'+7 (940) 500-20-72', N'wL#O0V', NULL, N'жен', N'foto65.jpg', 6)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Громова Сильва Адольфовна', N'sisyphus@live.com', CAST(N'1990-06-13' AS Date), 52, N'+7 (956) 056-75-21', N'p5r{zY', NULL, N'ж', N'foto66.jpg', 7)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Боброва Джема Феликсовна', N'msroth@hotmail.com', CAST(N'1990-07-03' AS Date), 28, N'+7 (965) 493-39-66', N'wTVK~M1', NULL, N'женский', N'foto67.jpg', 8)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Фокина Алия Юлиановна', N'dodong@yahoo.com', CAST(N'1990-11-27' AS Date), 53, N'+7 (997) 329-69-78', N'8*Zfaj', NULL, N'ж', N'foto68.jpg', 9)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Калинина Маргарита Анатольевна', N'bcevc@hotmail.com', CAST(N'1991-06-08' AS Date), 74, N'+7 (964) 571-56-50', N'4sBGr*', NULL, N'ж', N'foto69.jpg', 10)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Горшкова Дина Тарасовна', N'sethbrown@aol.com', CAST(N'1991-08-13' AS Date), 7, N'+7 (918) 418-80-73', N'BpC8e8]', NULL, N'женский', N'foto70.jpg', 11)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Гуляева Ирэна Юрьевна', N'ftgvh2xbdaps@tutanota.com', CAST(N'1992-10-03' AS Date), 38, N'+7 (91) 841-39-39', N'cI1CTd', NULL, N'женский', N'foto1.jpg', 12)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Бурова Келен Натановна', N'ervbd91pfcoi@mail.com', CAST(N'1990-09-19' AS Date), 54, N'+7 (918) 418-10-29', N'MPmfYk', NULL, N'женский', N'foto2.jpg', 13)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Королёва Лаура Пётровна', N'p3y4b981xwdl@outlook.com', CAST(N'1995-07-31' AS Date), 24, N'+7 (9184) 188-29-42', N'omtSW3', NULL, N'женский', N'foto3.jpg', 14)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Степанова Розалия Евсеевна', N'8e9kvxq6z70o@mail.com', CAST(N'1994-11-02' AS Date), 24, N'+7 (918) 418-01-29', N'cErGgC', NULL, N'женский', N'foto4.jpg', 15)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Тимофеева Евгения Викторовна', N'obnk82vzpg34@yahoo.com', CAST(N'1982-01-02' AS Date), 11, N'+7 (918) 418-12-03', N'q2se3v', NULL, N'женский', N'foto5.jpg', 16)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Дроздова Винетта Германовна', N'wl652rgtk9js@gmail.com', CAST(N'1996-06-17' AS Date), 1, N'+7 (918) 418-10-35', N'KnqfAk', NULL, N'женский', N'foto6.jpg', 17)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Лукина Ксения Романовна', N'23rgct5v1myx@gmail.com', CAST(N'1990-09-18' AS Date), 2, N'+7 (918) 418-10-38', N'6YxPwE', NULL, N'женский', N'foto7.jpg', 18)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Мышкина Триана Геннадьевна', N'i4fs8e6mlk5p@yahoo.com', CAST(N'1981-12-30' AS Date), 54, N'+7 (918) 418-91-37', N'pBQpPx', NULL, N'женский', N'foto8.jpg', 19)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Михеева Аделия Авксентьевна', N'4hu6f8dxvngq@tutanota.com', CAST(N'1989-06-11' AS Date), 64, N'+7 (918) 239-45-82', N'FkX6Ms', NULL, N'женский', N'foto9.jpg', 20)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Царева Виктория Давидовна', N'iunhxq41tgr5@tutanota.com', CAST(N'1988-07-03' AS Date), 33, N'7(567)103-73-32', N'FYi396Dd5u', N'ИТ', N'женский', N'foto9.jpg', 21)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Зорин Дмитрий Маркович', N'ofdt4z1bijq0@tutanota.com', CAST(N'1993-09-07' AS Date), 57, N'7(79)644-01-06', N'7gi7E8K4Ng', N'ИТ', N'мужской', N'foto10.jpg', 22)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Зотова Анна Тимуровна', N'ac6yxzg7rl5k@mail.com', CAST(N'1990-09-21' AS Date), 11, N'7(488)643-19-98', N'3L3eA5eEg3', N'Биг Дата', N'женский', N'foto8.jpg', 23)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Соловьев Тимур Константинович', N'b1p4ur8nsedj@yahoo.com', CAST(N'1992-09-03' AS Date), 45, N'7(1828)504-39-49', N'Si8S5kS83v', N'Дизайн', N'мужской', N'foto11.jpg', 24)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Малахов Александр Фёдорович', N'wyo6k9emv1j5@mail.com', CAST(N'1957-05-18' AS Date), 78, N'7(905)793-68-23', N'T83vfX2Z3b', N'Биг Дата', N'мужской', N'foto12.jpg', 25)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Зорин Марк Ярославович', N'g7kwp8lu65xi@tutanota.com', CAST(N'1961-03-09' AS Date), 82, N'7(54)522-60-54', N'25cPn58HxV', N'Аналитика', N'мужской', N'foto13.jpg', 26)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Егорова Ева Михайловна', N'doj5r1m8xnky@gmail.com', CAST(N'1987-06-15' AS Date), 80, N'7(05)441-48-14', N'3z86YDzaX8', N'ИТ', N'женский', N'foto14.jpg', 27)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Гущина Кристина Львовна', N'bxk06h5touyr@mail.com', CAST(N'1966-06-28' AS Date), 47, N'7(023)826-25-26', N't8F9hZXp89', N'Информационная безопасность', N'женский', N'foto16.jpg', 28)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Кудрявцева Виктория Романовна', N'26yf8xbcntgp@gmail.com', CAST(N'1953-01-27' AS Date), 30, N'7(7804)582-64-90', N'92mARR3gu4', N'Биг Дата', N'женский', N'foto17.jpg', 29)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Новикова Александра Александровна', N'0z4fvq65c7tg@gmail.com', CAST(N'1982-09-02' AS Date), 76, N'7(1472)122-56-07', N'Kf64Y6rhZ3', N'Аналитика', N'женский', N'foto18.jpg', 30)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Масленников Родион Филиппович', N'3kma18t5furi@gmail.com', CAST(N'1952-06-09' AS Date), 24, N'7(23)912-71-67', N's7iAYE9d38', N'Аналитика', N'мужской', N'foto19.jpg', 31)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Иванов Тимур Иванович', N'ws7nxyhd6g1o@yahoo.com', CAST(N'1955-08-30' AS Date), 6, N'7(5939)489-85-18', N'3Ga9jfT9D2', N'Информационная безопасность', N'мужской', N'foto20.jpg', 32)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Иванов Сергей Степанович', N'oitzvs1mylj2@gmail.com', CAST(N'1993-09-01' AS Date), 83, N'7(4020)034-48-35', N'N6598CFsgi', N'Дизайн', N'мужской', N'foto21.jpg', 33)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Спиридонов Ярослав Сергеевич', N'las6pufjkv45@outlook.com', CAST(N'1969-04-22' AS Date), 64, N'7(17)843-77-26', N'DV5625Zfmj', N'Дизайн', N'мужской', N'foto22.jpg', 34)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Виноградова Эмилия Валерьевна', N'nl81b9i7s0ka@gmail.com', CAST(N'1991-10-25' AS Date), 90, N'7(16)788-42-97', N'22YyD83dMg', N'Дизайн', N'женский', N'foto23.jpg', 35)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Мартынова Ева Семёновна', N'ma87ser3gkj9@yahoo.com', CAST(N'1984-03-24' AS Date), 54, N'7(087)267-87-85', N'522EmkEmA6', N'Информационная безопасность', N'женский', N'foto24.jpg', 36)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Яковлева Анисия Григорьевна', N'dfmygtwpecj9@tutanota.com', CAST(N'1997-09-13' AS Date), 53, N'7(798)711-92-89', N'uf9u227NYU', N'Информационная безопасность', N'женский', N'foto25.jpg', 37)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Свиридов Тимофей Александрович', N'82zju4yritwo@mail.com', CAST(N'1991-07-22' AS Date), 84, N'7(68)882-28-10', N'4UDk9p76mD', N'Биг Дата', N'мужской', N'foto26.jpg', 38)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Медведев Захар Даниилович', N'zo6nye42s87t@yahoo.com', CAST(N'1960-04-11' AS Date), 63, N'7(36)230-79-77', N'cK49u3JU4n', N'Аналитика', N'мужской', N'foto27.jpg', 39)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Тихонова Елизавета Александровна', N'0cejwmnpqtb6@gmail.com', CAST(N'1955-01-07' AS Date), 34, N'7(2594)224-28-37', N'b2JHb32S8i', N'Информационная безопасность', N'женский', N'foto28.jpg', 40)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Рыжов Роман Константинович', N'42thql96cwe5@yahoo.com', CAST(N'1981-12-30' AS Date), 67, N'7(1009)025-64-70', N'uASc9446eF', N'Биг Дата', N'мужской', N'foto29.jpg', 41)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Васильев Всеволод Давидович', N'6z92wongmash@tutanota.com', CAST(N'1988-10-16' AS Date), 51, N'7(354)903-53-67', N'Ke22Yh8Pp7', NULL, N'мужской', N'foto1.jpg', 42)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Новиков Фёдор Макарович', N'jkp23vlzsqei@gmail.com', CAST(N'1980-08-03' AS Date), 33, N'7(6562)925-01-77', N'Tj78jXeH68', NULL, N'мужской', N'foto2.jpg', 43)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Фролова Владислава Савельевна', N'dncmxp1vqr4t@tutanota.com', CAST(N'1999-07-13' AS Date), 43, N'7(12)981-33-56', N'DF9a8cJf82', NULL, N'женский', N'foto3.jpg', 44)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Кузнецов Елисей Александрович', N'sn4xvg8wyb0h@outlook.com', CAST(N'1983-12-19' AS Date), 3, N'7(698)667-22-45', N'B2bdk8FD27', NULL, N'мужской', N'foto4.jpg', 45)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Рябова София Матвеевна', N'9zaecohlw2xy@tutanota.com', CAST(N'1998-08-10' AS Date), 33, N'7(38)393-11-43', N'58vMHdK4g5', NULL, N'женский', N'foto5.jpg', 46)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Власов Арсений Львович', N'sohzld6c52mv@gmail.com', CAST(N'1980-05-28' AS Date), 31, N'7(4297)539-13-81', N'T3uhc34E9Z', NULL, N'мужской', N'foto6.jpg', 47)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Маслова Екатерина Макаровна', N'a1v0lgxsz3qb@mail.com', CAST(N'1983-10-26' AS Date), 40, N'7(49)638-66-62', N'dj8PN3b4M9', NULL, N'женский', N'foto7.jpg', 48)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Агафонов Давид Артёмович', N'lry2ko5t031w@gmail.com', CAST(N'1995-10-14' AS Date), 27, N'7(65)706-55-85', N'uy69Pp8DY6', NULL, N'мужской', N'foto8.jpg', 49)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Федотова Варвара Сергеевна', N'omrjzf0pc8n6@outlook.com', CAST(N'1996-12-05' AS Date), 2, N'7(40)420-24-06', N'Sp3k6Ax86E', NULL, N'женский', N'foto9.jpg', 50)
GO
INSERT [dbo].[test12] ([ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото], [id_user]) VALUES (N'Кудряшова Виктория Дмитриевна', N't1wpou7merxi@yahoo.com', CAST(N'1999-02-13' AS Date), 16, N'7(427)939-24-67', N'fvm774FV3R', NULL, N'женский', N'foto10.jpg', 51)
GO
SET IDENTITY_INSERT [dbo].[test12] OFF
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (1, N'Ершова Нора Федотовна', N'techie@outlook.com', CAST(N'1987-03-26' AS Date), 71, N'+7 (960) 424-07-11', N'tKKevv8%', NULL, N'женский', 0x66006F0074006F00360030002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (2, N'Афанасьева Жанна Валентиновна', N'agapow@yahoo.com', CAST(N'1988-01-04' AS Date), 34, N'+7 (930) 661-69-31', N'huSfHm4$', NULL, N'ж', 0x66006F0074006F00360031002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (3, N'Крылова Рая Всеволодовна', N'chaikin@yahoo.ca', CAST(N'1988-04-05' AS Date), 73, N'+7 (957) 265-60-68', N'TlUwMw77%', NULL, N'жен', 0x66006F0074006F00360032002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (4, N'Попова Вида Тимофеевна', N'lbecchi@yahoo.ca', CAST(N'1989-10-25' AS Date), 64, N'+7 (911) 744-03-14', N'%afF#@6', NULL, N'жен', 0x66006F0074006F00360033002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (5, N'Давыдова Сандра Богуславовна', N'bbirth@gmail.com', CAST(N'1989-12-27' AS Date), 55, N'+7 (984) 877-87-64', N'SU4Jpw"', NULL, N'жен', 0x66006F0074006F00360034002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (6, N'Прохорова Сабина Созоновна', N'library@sbcglobal.net', CAST(N'1990-01-16' AS Date), 77, N'+7 (940) 500-20-72', N'wL#O0V', NULL, N'жен', 0x66006F0074006F00360035002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (7, N'Громова Сильва Адольфовна', N'sisyphus@live.com', CAST(N'1990-06-13' AS Date), 52, N'+7 (956) 056-75-21', N'p5r{zY', NULL, N'ж', 0x66006F0074006F00360036002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (8, N'Боброва Джема Феликсовна', N'msroth@hotmail.com', CAST(N'1990-07-03' AS Date), 28, N'+7 (965) 493-39-66', N'wTVK~M1', NULL, N'женский', 0x66006F0074006F00360037002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (9, N'Фокина Алия Юлиановна', N'dodong@yahoo.com', CAST(N'1990-11-27' AS Date), 53, N'+7 (997) 329-69-78', N'8*Zfaj', NULL, N'ж', 0x66006F0074006F00360038002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (10, N'Калинина Маргарита Анатольевна', N'bcevc@hotmail.com', CAST(N'1991-06-08' AS Date), 74, N'+7 (964) 571-56-50', N'4sBGr*', NULL, N'ж', 0x66006F0074006F00360039002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (11, N'Горшкова Дина Тарасовна', N'sethbrown@aol.com', CAST(N'1991-08-13' AS Date), 7, N'+7 (918) 418-80-73', N'BpC8e8]', NULL, N'женский', 0x66006F0074006F00370030002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (12, N'Гуляева Ирэна Юрьевна', N'ftgvh2xbdaps@tutanota.com', CAST(N'1992-10-03' AS Date), 38, N'+7 (91) 841-39-39', N'cI1CTd', NULL, N'женский', 0x66006F0074006F0031002E006A00700067000000000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (13, N'Бурова Келен Натановна', N'ervbd91pfcoi@mail.com', CAST(N'1990-09-19' AS Date), 54, N'+7 (918) 418-10-29', N'MPmfYk', NULL, N'женский', 0x66006F0074006F0032002E006A00700067000000000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (14, N'Королёва Лаура Пётровна', N'p3y4b981xwdl@outlook.com', CAST(N'1995-07-31' AS Date), 24, N'+7 (9184) 188-29-42', N'omtSW3', NULL, N'женский', 0x66006F0074006F0033002E006A00700067000000000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (15, N'Степанова Розалия Евсеевна', N'8e9kvxq6z70o@mail.com', CAST(N'1994-11-02' AS Date), 24, N'+7 (918) 418-01-29', N'cErGgC', NULL, N'женский', 0x66006F0074006F0034002E006A00700067000000000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (16, N'Тимофеева Евгения Викторовна', N'obnk82vzpg34@yahoo.com', CAST(N'1982-01-02' AS Date), 11, N'+7 (918) 418-12-03', N'q2se3v', NULL, N'женский', 0x66006F0074006F0035002E006A00700067000000000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (17, N'Дроздова Винетта Германовна', N'wl652rgtk9js@gmail.com', CAST(N'1996-06-17' AS Date), 1, N'+7 (918) 418-10-35', N'KnqfAk', NULL, N'женский', 0x66006F0074006F0036002E006A00700067000000000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (18, N'Лукина Ксения Романовна', N'23rgct5v1myx@gmail.com', CAST(N'1990-09-18' AS Date), 2, N'+7 (918) 418-10-38', N'6YxPwE', NULL, N'женский', 0x66006F0074006F0037002E006A00700067000000000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (19, N'Мышкина Триана Геннадьевна', N'i4fs8e6mlk5p@yahoo.com', CAST(N'1981-12-30' AS Date), 54, N'+7 (918) 418-91-37', N'pBQpPx', NULL, N'женский', 0x66006F0074006F0038002E006A00700067000000000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (20, N'Михеева Аделия Авксентьевна', N'4hu6f8dxvngq@tutanota.com', CAST(N'1989-06-11' AS Date), 64, N'+7 (918) 239-45-82', N'FkX6Ms', NULL, N'женский', 0x66006F0074006F0039002E006A00700067000000000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (21, N'Царева Виктория Давидовна', N'iunhxq41tgr5@tutanota.com', CAST(N'1988-07-03' AS Date), 33, N'7(567)103-73-32', N'FYi396Dd5u', N'ИТ', N'женский', 0x66006F0074006F0039002E006A00700067000000000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (22, N'Зорин Дмитрий Маркович', N'ofdt4z1bijq0@tutanota.com', CAST(N'1993-09-07' AS Date), 57, N'7(79)644-01-06', N'7gi7E8K4Ng', N'ИТ', N'мужской', 0x66006F0074006F00310030002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (23, N'Зотова Анна Тимуровна', N'ac6yxzg7rl5k@mail.com', CAST(N'1990-09-21' AS Date), 11, N'7(488)643-19-98', N'3L3eA5eEg3', N'Биг Дата', N'женский', 0x66006F0074006F0038002E006A00700067000000000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (24, N'Соловьев Тимур Константинович', N'b1p4ur8nsedj@yahoo.com', CAST(N'1992-09-03' AS Date), 45, N'7(1828)504-39-49', N'Si8S5kS83v', N'Дизайн', N'мужской', 0x66006F0074006F00310031002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (25, N'Малахов Александр Фёдорович', N'wyo6k9emv1j5@mail.com', CAST(N'1957-05-18' AS Date), 78, N'7(905)793-68-23', N'T83vfX2Z3b', N'Биг Дата', N'мужской', 0x66006F0074006F00310032002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (26, N'Зорин Марк Ярославович', N'g7kwp8lu65xi@tutanota.com', CAST(N'1961-03-09' AS Date), 82, N'7(54)522-60-54', N'25cPn58HxV', N'Аналитика', N'мужской', 0x66006F0074006F00310033002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (27, N'Егорова Ева Михайловна', N'doj5r1m8xnky@gmail.com', CAST(N'1987-06-15' AS Date), 80, N'7(05)441-48-14', N'3z86YDzaX8', N'ИТ', N'женский', 0x66006F0074006F00310034002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (28, N'Гущина Кристина Львовна', N'bxk06h5touyr@mail.com', CAST(N'1966-06-28' AS Date), 47, N'7(023)826-25-26', N't8F9hZXp89', N'Информационная безопасность', N'женский', 0x66006F0074006F00310036002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (29, N'Кудрявцева Виктория Романовна', N'26yf8xbcntgp@gmail.com', CAST(N'1953-01-27' AS Date), 30, N'7(7804)582-64-90', N'92mARR3gu4', N'Биг Дата', N'женский', 0x66006F0074006F00310037002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (30, N'Новикова Александра Александровна', N'0z4fvq65c7tg@gmail.com', CAST(N'1982-09-02' AS Date), 76, N'7(1472)122-56-07', N'Kf64Y6rhZ3', N'Аналитика', N'женский', 0x66006F0074006F00310038002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (31, N'Масленников Родион Филиппович', N'3kma18t5furi@gmail.com', CAST(N'1952-06-09' AS Date), 24, N'7(23)912-71-67', N's7iAYE9d38', N'Аналитика', N'мужской', 0x66006F0074006F00310039002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (32, N'Иванов Тимур Иванович', N'ws7nxyhd6g1o@yahoo.com', CAST(N'1955-08-30' AS Date), 6, N'7(5939)489-85-18', N'3Ga9jfT9D2', N'Информационная безопасность', N'мужской', 0x66006F0074006F00320030002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (33, N'Иванов Сергей Степанович', N'oitzvs1mylj2@gmail.com', CAST(N'1993-09-01' AS Date), 83, N'7(4020)034-48-35', N'N6598CFsgi', N'Дизайн', N'мужской', 0x66006F0074006F00320031002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (34, N'Спиридонов Ярослав Сергеевич', N'las6pufjkv45@outlook.com', CAST(N'1969-04-22' AS Date), 64, N'7(17)843-77-26', N'DV5625Zfmj', N'Дизайн', N'мужской', 0x66006F0074006F00320032002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (35, N'Виноградова Эмилия Валерьевна', N'nl81b9i7s0ka@gmail.com', CAST(N'1991-10-25' AS Date), 90, N'7(16)788-42-97', N'22YyD83dMg', N'Дизайн', N'женский', 0x66006F0074006F00320033002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (36, N'Мартынова Ева Семёновна', N'ma87ser3gkj9@yahoo.com', CAST(N'1984-03-24' AS Date), 54, N'7(087)267-87-85', N'522EmkEmA6', N'Информационная безопасность', N'женский', 0x66006F0074006F00320034002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (37, N'Яковлева Анисия Григорьевна', N'dfmygtwpecj9@tutanota.com', CAST(N'1997-09-13' AS Date), 53, N'7(798)711-92-89', N'uf9u227NYU', N'Информационная безопасность', N'женский', 0x66006F0074006F00320035002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (38, N'Свиридов Тимофей Александрович', N'82zju4yritwo@mail.com', CAST(N'1991-07-22' AS Date), 84, N'7(68)882-28-10', N'4UDk9p76mD', N'Биг Дата', N'мужской', 0x66006F0074006F00320036002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (39, N'Медведев Захар Даниилович', N'zo6nye42s87t@yahoo.com', CAST(N'1960-04-11' AS Date), 63, N'7(36)230-79-77', N'cK49u3JU4n', N'Аналитика', N'мужской', 0x66006F0074006F00320037002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (40, N'Тихонова Елизавета Александровна', N'0cejwmnpqtb6@gmail.com', CAST(N'1955-01-07' AS Date), 34, N'7(2594)224-28-37', N'b2JHb32S8i', N'Информационная безопасность', N'женский', 0x66006F0074006F00320038002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (41, N'Рыжов Роман Константинович', N'42thql96cwe5@yahoo.com', CAST(N'1981-12-30' AS Date), 67, N'7(1009)025-64-70', N'uASc9446eF', N'Биг Дата', N'мужской', 0x66006F0074006F00320039002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (42, N'Васильев Всеволод Давидович', N'6z92wongmash@tutanota.com', CAST(N'1988-10-16' AS Date), 51, N'7(354)903-53-67', N'Ke22Yh8Pp7', NULL, N'мужской', 0x66006F0074006F0031002E006A00700067000000000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (43, N'Новиков Фёдор Макарович', N'jkp23vlzsqei@gmail.com', CAST(N'1980-08-03' AS Date), 33, N'7(6562)925-01-77', N'Tj78jXeH68', NULL, N'мужской', 0x66006F0074006F0032002E006A00700067000000000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (44, N'Фролова Владислава Савельевна', N'dncmxp1vqr4t@tutanota.com', CAST(N'1999-07-13' AS Date), 43, N'7(12)981-33-56', N'DF9a8cJf82', NULL, N'женский', 0x66006F0074006F0033002E006A00700067000000000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (45, N'Кузнецов Елисей Александрович', N'sn4xvg8wyb0h@outlook.com', CAST(N'1983-12-19' AS Date), 3, N'7(698)667-22-45', N'B2bdk8FD27', NULL, N'мужской', 0x66006F0074006F0034002E006A00700067000000000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (46, N'Рябова София Матвеевна', N'9zaecohlw2xy@tutanota.com', CAST(N'1998-08-10' AS Date), 33, N'7(38)393-11-43', N'58vMHdK4g5', NULL, N'женский', 0x66006F0074006F0035002E006A00700067000000000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (47, N'Власов Арсений Львович', N'sohzld6c52mv@gmail.com', CAST(N'1980-05-28' AS Date), 31, N'7(4297)539-13-81', N'T3uhc34E9Z', NULL, N'мужской', 0x66006F0074006F0036002E006A00700067000000000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (48, N'Маслова Екатерина Макаровна', N'a1v0lgxsz3qb@mail.com', CAST(N'1983-10-26' AS Date), 40, N'7(49)638-66-62', N'dj8PN3b4M9', NULL, N'женский', 0x66006F0074006F0037002E006A00700067000000000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (49, N'Агафонов Давид Артёмович', N'lry2ko5t031w@gmail.com', CAST(N'1995-10-14' AS Date), 27, N'7(65)706-55-85', N'uy69Pp8DY6', NULL, N'мужской', 0x66006F0074006F0038002E006A00700067000000000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (50, N'Федотова Варвара Сергеевна', N'omrjzf0pc8n6@outlook.com', CAST(N'1996-12-05' AS Date), 2, N'7(40)420-24-06', N'Sp3k6Ax86E', NULL, N'женский', 0x66006F0074006F0039002E006A00700067000000000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (51, N'Кудряшова Виктория Дмитриевна', N't1wpou7merxi@yahoo.com', CAST(N'1999-02-13' AS Date), 16, N'7(427)939-24-67', N'fvm774FV3R', NULL, N'женский', 0x66006F0074006F00310030002E006A0070006700000000000000000000000000000000000000000000000000000000000000)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_8] ([id], [name], [email], [date_birth], [country_code], [phone_number], [password], [direction], [gender], [photo]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (1, N'Ершова Нора Федотовна', N'techie@outlook.com', CAST(N'1987-03-26' AS Date), 71, N'+7 (960) 424-07-11', N'tKKevv8%', NULL, N'женский', N'foto60.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (2, N'Афанасьева Жанна Валентиновна', N'agapow@yahoo.com', CAST(N'1988-01-04' AS Date), 34, N'+7 (930) 661-69-31', N'huSfHm4$', NULL, N'ж', N'foto61.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (3, N'Крылова Рая Всеволодовна', N'chaikin@yahoo.ca', CAST(N'1988-04-05' AS Date), 73, N'+7 (957) 265-60-68', N'TlUwMw77%', NULL, N'жен', N'foto62.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (4, N'Попова Вида Тимофеевна', N'lbecchi@yahoo.ca', CAST(N'1989-10-25' AS Date), 64, N'+7 (911) 744-03-14', N'%afF#@6', NULL, N'жен', N'foto63.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (5, N'Давыдова Сандра Богуславовна', N'bbirth@gmail.com', CAST(N'1989-12-27' AS Date), 55, N'+7 (984) 877-87-64', N'SU4Jpw"', NULL, N'жен', N'foto64.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (6, N'Прохорова Сабина Созоновна', N'library@sbcglobal.net', CAST(N'1990-01-16' AS Date), 77, N'+7 (940) 500-20-72', N'wL#O0V', NULL, N'жен', N'foto65.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (7, N'Громова Сильва Адольфовна', N'sisyphus@live.com', CAST(N'1990-06-13' AS Date), 52, N'+7 (956) 056-75-21', N'p5r{zY', NULL, N'ж', N'foto66.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (8, N'Боброва Джема Феликсовна', N'msroth@hotmail.com', CAST(N'1990-07-03' AS Date), 28, N'+7 (965) 493-39-66', N'wTVK~M1', NULL, N'женский', N'foto67.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (9, N'Фокина Алия Юлиановна', N'dodong@yahoo.com', CAST(N'1990-11-27' AS Date), 53, N'+7 (997) 329-69-78', N'8*Zfaj', NULL, N'ж', N'foto68.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (10, N'Калинина Маргарита Анатольевна', N'bcevc@hotmail.com', CAST(N'1991-06-08' AS Date), 74, N'+7 (964) 571-56-50', N'4sBGr*', NULL, N'ж', N'foto69.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (11, N'Горшкова Дина Тарасовна', N'sethbrown@aol.com', CAST(N'1991-08-13' AS Date), 7, N'+7 (918) 418-80-73', N'BpC8e8]', NULL, N'женский', N'foto70.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (12, N'Гуляева Ирэна Юрьевна', N'ftgvh2xbdaps@tutanota.com', CAST(N'1992-10-03' AS Date), 38, N'+7 (91) 841-39-39', N'cI1CTd', NULL, N'женский', N'foto1.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (13, N'Бурова Келен Натановна', N'ervbd91pfcoi@mail.com', CAST(N'1990-09-19' AS Date), 54, N'+7 (918) 418-10-29', N'MPmfYk', NULL, N'женский', N'foto2.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (14, N'Королёва Лаура Пётровна', N'p3y4b981xwdl@outlook.com', CAST(N'1995-07-31' AS Date), 24, N'+7 (9184) 188-29-42', N'omtSW3', NULL, N'женский', N'foto3.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (15, N'Степанова Розалия Евсеевна', N'8e9kvxq6z70o@mail.com', CAST(N'1994-11-02' AS Date), 24, N'+7 (918) 418-01-29', N'cErGgC', NULL, N'женский', N'foto4.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (16, N'Тимофеева Евгения Викторовна', N'obnk82vzpg34@yahoo.com', CAST(N'1982-01-02' AS Date), 11, N'+7 (918) 418-12-03', N'q2se3v', NULL, N'женский', N'foto5.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (17, N'Дроздова Винетта Германовна', N'wl652rgtk9js@gmail.com', CAST(N'1996-06-17' AS Date), 1, N'+7 (918) 418-10-35', N'KnqfAk', NULL, N'женский', N'foto6.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (18, N'Лукина Ксения Романовна', N'23rgct5v1myx@gmail.com', CAST(N'1990-09-18' AS Date), 2, N'+7 (918) 418-10-38', N'6YxPwE', NULL, N'женский', N'foto7.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (19, N'Мышкина Триана Геннадьевна', N'i4fs8e6mlk5p@yahoo.com', CAST(N'1981-12-30' AS Date), 54, N'+7 (918) 418-91-37', N'pBQpPx', NULL, N'женский', N'foto8.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (20, N'Михеева Аделия Авксентьевна', N'4hu6f8dxvngq@tutanota.com', CAST(N'1989-06-11' AS Date), 64, N'+7 (918) 239-45-82', N'FkX6Ms', NULL, N'женский', N'foto9.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (21, N'Царева Виктория Давидовна', N'iunhxq41tgr5@tutanota.com', CAST(N'1988-07-03' AS Date), 33, N'7(567)103-73-32', N'FYi396Dd5u', N'ИТ', N'женский', N'foto9.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (22, N'Зорин Дмитрий Маркович', N'ofdt4z1bijq0@tutanota.com', CAST(N'1993-09-07' AS Date), 57, N'7(79)644-01-06', N'7gi7E8K4Ng', N'ИТ', N'мужской', N'foto10.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (23, N'Зотова Анна Тимуровна', N'ac6yxzg7rl5k@mail.com', CAST(N'1990-09-21' AS Date), 11, N'7(488)643-19-98', N'3L3eA5eEg3', N'Биг Дата', N'женский', N'foto8.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (24, N'Соловьев Тимур Константинович', N'b1p4ur8nsedj@yahoo.com', CAST(N'1992-09-03' AS Date), 45, N'7(1828)504-39-49', N'Si8S5kS83v', N'Дизайн', N'мужской', N'foto11.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (25, N'Малахов Александр Фёдорович', N'wyo6k9emv1j5@mail.com', CAST(N'1957-05-18' AS Date), 78, N'7(905)793-68-23', N'T83vfX2Z3b', N'Биг Дата', N'мужской', N'foto12.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (26, N'Зорин Марк Ярославович', N'g7kwp8lu65xi@tutanota.com', CAST(N'1961-03-09' AS Date), 82, N'7(54)522-60-54', N'25cPn58HxV', N'Аналитика', N'мужской', N'foto13.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (27, N'Егорова Ева Михайловна', N'doj5r1m8xnky@gmail.com', CAST(N'1987-06-15' AS Date), 80, N'7(05)441-48-14', N'3z86YDzaX8', N'ИТ', N'женский', N'foto14.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (28, N'Гущина Кристина Львовна', N'bxk06h5touyr@mail.com', CAST(N'1966-06-28' AS Date), 47, N'7(023)826-25-26', N't8F9hZXp89', N'Информационная безопасность', N'женский', N'foto16.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (29, N'Кудрявцева Виктория Романовна', N'26yf8xbcntgp@gmail.com', CAST(N'1953-01-27' AS Date), 30, N'7(7804)582-64-90', N'92mARR3gu4', N'Биг Дата', N'женский', N'foto17.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (30, N'Новикова Александра Александровна', N'0z4fvq65c7tg@gmail.com', CAST(N'1982-09-02' AS Date), 76, N'7(1472)122-56-07', N'Kf64Y6rhZ3', N'Аналитика', N'женский', N'foto18.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (31, N'Масленников Родион Филиппович', N'3kma18t5furi@gmail.com', CAST(N'1952-06-09' AS Date), 24, N'7(23)912-71-67', N's7iAYE9d38', N'Аналитика', N'мужской', N'foto19.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (32, N'Иванов Тимур Иванович', N'ws7nxyhd6g1o@yahoo.com', CAST(N'1955-08-30' AS Date), 6, N'7(5939)489-85-18', N'3Ga9jfT9D2', N'Информационная безопасность', N'мужской', N'foto20.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (33, N'Иванов Сергей Степанович', N'oitzvs1mylj2@gmail.com', CAST(N'1993-09-01' AS Date), 83, N'7(4020)034-48-35', N'N6598CFsgi', N'Дизайн', N'мужской', N'foto21.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (34, N'Спиридонов Ярослав Сергеевич', N'las6pufjkv45@outlook.com', CAST(N'1969-04-22' AS Date), 64, N'7(17)843-77-26', N'DV5625Zfmj', N'Дизайн', N'мужской', N'foto22.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (35, N'Виноградова Эмилия Валерьевна', N'nl81b9i7s0ka@gmail.com', CAST(N'1991-10-25' AS Date), 90, N'7(16)788-42-97', N'22YyD83dMg', N'Дизайн', N'женский', N'foto23.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (36, N'Мартынова Ева Семёновна', N'ma87ser3gkj9@yahoo.com', CAST(N'1984-03-24' AS Date), 54, N'7(087)267-87-85', N'522EmkEmA6', N'Информационная безопасность', N'женский', N'foto24.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (37, N'Яковлева Анисия Григорьевна', N'dfmygtwpecj9@tutanota.com', CAST(N'1997-09-13' AS Date), 53, N'7(798)711-92-89', N'uf9u227NYU', N'Информационная безопасность', N'женский', N'foto25.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (38, N'Свиридов Тимофей Александрович', N'82zju4yritwo@mail.com', CAST(N'1991-07-22' AS Date), 84, N'7(68)882-28-10', N'4UDk9p76mD', N'Биг Дата', N'мужской', N'foto26.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (39, N'Медведев Захар Даниилович', N'zo6nye42s87t@yahoo.com', CAST(N'1960-04-11' AS Date), 63, N'7(36)230-79-77', N'cK49u3JU4n', N'Аналитика', N'мужской', N'foto27.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (40, N'Тихонова Елизавета Александровна', N'0cejwmnpqtb6@gmail.com', CAST(N'1955-01-07' AS Date), 34, N'7(2594)224-28-37', N'b2JHb32S8i', N'Информационная безопасность', N'женский', N'foto28.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (41, N'Рыжов Роман Константинович', N'42thql96cwe5@yahoo.com', CAST(N'1981-12-30' AS Date), 67, N'7(1009)025-64-70', N'uASc9446eF', N'Биг Дата', N'мужской', N'foto29.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (42, N'Васильев Всеволод Давидович', N'6z92wongmash@tutanota.com', CAST(N'1988-10-16' AS Date), 51, N'7(354)903-53-67', N'Ke22Yh8Pp7', NULL, N'мужской', N'foto1.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (43, N'Новиков Фёдор Макарович', N'jkp23vlzsqei@gmail.com', CAST(N'1980-08-03' AS Date), 33, N'7(6562)925-01-77', N'Tj78jXeH68', NULL, N'мужской', N'foto2.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (44, N'Фролова Владислава Савельевна', N'dncmxp1vqr4t@tutanota.com', CAST(N'1999-07-13' AS Date), 43, N'7(12)981-33-56', N'DF9a8cJf82', NULL, N'женский', N'foto3.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (45, N'Кузнецов Елисей Александрович', N'sn4xvg8wyb0h@outlook.com', CAST(N'1983-12-19' AS Date), 3, N'7(698)667-22-45', N'B2bdk8FD27', NULL, N'мужской', N'foto4.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (46, N'Рябова София Матвеевна', N'9zaecohlw2xy@tutanota.com', CAST(N'1998-08-10' AS Date), 33, N'7(38)393-11-43', N'58vMHdK4g5', NULL, N'женский', N'foto5.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (47, N'Власов Арсений Львович', N'sohzld6c52mv@gmail.com', CAST(N'1980-05-28' AS Date), 31, N'7(4297)539-13-81', N'T3uhc34E9Z', NULL, N'мужской', N'foto6.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (48, N'Маслова Екатерина Макаровна', N'a1v0lgxsz3qb@mail.com', CAST(N'1983-10-26' AS Date), 40, N'7(49)638-66-62', N'dj8PN3b4M9', NULL, N'женский', N'foto7.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (49, N'Агафонов Давид Артёмович', N'lry2ko5t031w@gmail.com', CAST(N'1995-10-14' AS Date), 27, N'7(65)706-55-85', N'uy69Pp8DY6', NULL, N'мужской', N'foto8.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (50, N'Федотова Варвара Сергеевна', N'omrjzf0pc8n6@outlook.com', CAST(N'1996-12-05' AS Date), 2, N'7(40)420-24-06', N'Sp3k6Ax86E', NULL, N'женский', N'foto9.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (51, N'Кудряшова Виктория Дмитриевна', N't1wpou7merxi@yahoo.com', CAST(N'1999-02-13' AS Date), 16, N'7(427)939-24-67', N'fvm774FV3R', NULL, N'женский', N'foto10.jpg')
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (1, N'Ершова Нора Федотовна', N'techie@outlook.com', CAST(N'1987-03-26' AS Date), 71, N'+7 (960) 424-07-11', N'tKKevv8%', NULL, N'женский', N'foto60.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (2, N'Афанасьева Жанна Валентиновна', N'agapow@yahoo.com', CAST(N'1988-01-04' AS Date), 34, N'+7 (930) 661-69-31', N'huSfHm4$', NULL, N'ж', N'foto61.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (3, N'Крылова Рая Всеволодовна', N'chaikin@yahoo.ca', CAST(N'1988-04-05' AS Date), 73, N'+7 (957) 265-60-68', N'TlUwMw77%', NULL, N'жен', N'foto62.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (4, N'Попова Вида Тимофеевна', N'lbecchi@yahoo.ca', CAST(N'1989-10-25' AS Date), 64, N'+7 (911) 744-03-14', N'%afF#@6', NULL, N'жен', N'foto63.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (5, N'Давыдова Сандра Богуславовна', N'bbirth@gmail.com', CAST(N'1989-12-27' AS Date), 55, N'+7 (984) 877-87-64', N'SU4Jpw"', NULL, N'жен', N'foto64.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (6, N'Прохорова Сабина Созоновна', N'library@sbcglobal.net', CAST(N'1990-01-16' AS Date), 77, N'+7 (940) 500-20-72', N'wL#O0V', NULL, N'жен', N'foto65.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (7, N'Громова Сильва Адольфовна', N'sisyphus@live.com', CAST(N'1990-06-13' AS Date), 52, N'+7 (956) 056-75-21', N'p5r{zY', NULL, N'ж', N'foto66.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (8, N'Боброва Джема Феликсовна', N'msroth@hotmail.com', CAST(N'1990-07-03' AS Date), 28, N'+7 (965) 493-39-66', N'wTVK~M1', NULL, N'женский', N'foto67.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (9, N'Фокина Алия Юлиановна', N'dodong@yahoo.com', CAST(N'1990-11-27' AS Date), 53, N'+7 (997) 329-69-78', N'8*Zfaj', NULL, N'ж', N'foto68.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (10, N'Калинина Маргарита Анатольевна', N'bcevc@hotmail.com', CAST(N'1991-06-08' AS Date), 74, N'+7 (964) 571-56-50', N'4sBGr*', NULL, N'ж', N'foto69.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (11, N'Горшкова Дина Тарасовна', N'sethbrown@aol.com', CAST(N'1991-08-13' AS Date), 7, N'+7 (918) 418-80-73', N'BpC8e8]', NULL, N'женский', N'foto70.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (12, N'Гуляева Ирэна Юрьевна', N'ftgvh2xbdaps@tutanota.com', CAST(N'1992-10-03' AS Date), 38, N'+7 (91) 841-39-39', N'cI1CTd', NULL, N'женский', N'foto1.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (13, N'Бурова Келен Натановна', N'ervbd91pfcoi@mail.com', CAST(N'1990-09-19' AS Date), 54, N'+7 (918) 418-10-29', N'MPmfYk', NULL, N'женский', N'foto2.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (14, N'Королёва Лаура Пётровна', N'p3y4b981xwdl@outlook.com', CAST(N'1995-07-31' AS Date), 24, N'+7 (9184) 188-29-42', N'omtSW3', NULL, N'женский', N'foto3.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (15, N'Степанова Розалия Евсеевна', N'8e9kvxq6z70o@mail.com', CAST(N'1994-11-02' AS Date), 24, N'+7 (918) 418-01-29', N'cErGgC', NULL, N'женский', N'foto4.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (16, N'Тимофеева Евгения Викторовна', N'obnk82vzpg34@yahoo.com', CAST(N'1982-01-02' AS Date), 11, N'+7 (918) 418-12-03', N'q2se3v', NULL, N'женский', N'foto5.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (17, N'Дроздова Винетта Германовна', N'wl652rgtk9js@gmail.com', CAST(N'1996-06-17' AS Date), 1, N'+7 (918) 418-10-35', N'KnqfAk', NULL, N'женский', N'foto6.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (18, N'Лукина Ксения Романовна', N'23rgct5v1myx@gmail.com', CAST(N'1990-09-18' AS Date), 2, N'+7 (918) 418-10-38', N'6YxPwE', NULL, N'женский', N'foto7.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (19, N'Мышкина Триана Геннадьевна', N'i4fs8e6mlk5p@yahoo.com', CAST(N'1981-12-30' AS Date), 54, N'+7 (918) 418-91-37', N'pBQpPx', NULL, N'женский', N'foto8.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (20, N'Михеева Аделия Авксентьевна', N'4hu6f8dxvngq@tutanota.com', CAST(N'1989-06-11' AS Date), 64, N'+7 (918) 239-45-82', N'FkX6Ms', NULL, N'женский', N'foto9.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (21, N'Царева Виктория Давидовна', N'iunhxq41tgr5@tutanota.com', CAST(N'1988-07-03' AS Date), 33, N'7(567)103-73-32', N'FYi396Dd5u', N'ИТ', N'женский', N'foto9.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (22, N'Зорин Дмитрий Маркович', N'ofdt4z1bijq0@tutanota.com', CAST(N'1993-09-07' AS Date), 57, N'7(79)644-01-06', N'7gi7E8K4Ng', N'ИТ', N'мужской', N'foto10.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (23, N'Зотова Анна Тимуровна', N'ac6yxzg7rl5k@mail.com', CAST(N'1990-09-21' AS Date), 11, N'7(488)643-19-98', N'3L3eA5eEg3', N'Биг Дата', N'женский', N'foto8.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (24, N'Соловьев Тимур Константинович', N'b1p4ur8nsedj@yahoo.com', CAST(N'1992-09-03' AS Date), 45, N'7(1828)504-39-49', N'Si8S5kS83v', N'Дизайн', N'мужской', N'foto11.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (25, N'Малахов Александр Фёдорович', N'wyo6k9emv1j5@mail.com', CAST(N'1957-05-18' AS Date), 78, N'7(905)793-68-23', N'T83vfX2Z3b', N'Биг Дата', N'мужской', N'foto12.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (26, N'Зорин Марк Ярославович', N'g7kwp8lu65xi@tutanota.com', CAST(N'1961-03-09' AS Date), 82, N'7(54)522-60-54', N'25cPn58HxV', N'Аналитика', N'мужской', N'foto13.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (27, N'Егорова Ева Михайловна', N'doj5r1m8xnky@gmail.com', CAST(N'1987-06-15' AS Date), 80, N'7(05)441-48-14', N'3z86YDzaX8', N'ИТ', N'женский', N'foto14.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (28, N'Гущина Кристина Львовна', N'bxk06h5touyr@mail.com', CAST(N'1966-06-28' AS Date), 47, N'7(023)826-25-26', N't8F9hZXp89', N'Информационная безопасность', N'женский', N'foto16.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (29, N'Кудрявцева Виктория Романовна', N'26yf8xbcntgp@gmail.com', CAST(N'1953-01-27' AS Date), 30, N'7(7804)582-64-90', N'92mARR3gu4', N'Биг Дата', N'женский', N'foto17.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (30, N'Новикова Александра Александровна', N'0z4fvq65c7tg@gmail.com', CAST(N'1982-09-02' AS Date), 76, N'7(1472)122-56-07', N'Kf64Y6rhZ3', N'Аналитика', N'женский', N'foto18.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (31, N'Масленников Родион Филиппович', N'3kma18t5furi@gmail.com', CAST(N'1952-06-09' AS Date), 24, N'7(23)912-71-67', N's7iAYE9d38', N'Аналитика', N'мужской', N'foto19.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (32, N'Иванов Тимур Иванович', N'ws7nxyhd6g1o@yahoo.com', CAST(N'1955-08-30' AS Date), 6, N'7(5939)489-85-18', N'3Ga9jfT9D2', N'Информационная безопасность', N'мужской', N'foto20.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (33, N'Иванов Сергей Степанович', N'oitzvs1mylj2@gmail.com', CAST(N'1993-09-01' AS Date), 83, N'7(4020)034-48-35', N'N6598CFsgi', N'Дизайн', N'мужской', N'foto21.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (34, N'Спиридонов Ярослав Сергеевич', N'las6pufjkv45@outlook.com', CAST(N'1969-04-22' AS Date), 64, N'7(17)843-77-26', N'DV5625Zfmj', N'Дизайн', N'мужской', N'foto22.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (35, N'Виноградова Эмилия Валерьевна', N'nl81b9i7s0ka@gmail.com', CAST(N'1991-10-25' AS Date), 90, N'7(16)788-42-97', N'22YyD83dMg', N'Дизайн', N'женский', N'foto23.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (36, N'Мартынова Ева Семёновна', N'ma87ser3gkj9@yahoo.com', CAST(N'1984-03-24' AS Date), 54, N'7(087)267-87-85', N'522EmkEmA6', N'Информационная безопасность', N'женский', N'foto24.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (37, N'Яковлева Анисия Григорьевна', N'dfmygtwpecj9@tutanota.com', CAST(N'1997-09-13' AS Date), 53, N'7(798)711-92-89', N'uf9u227NYU', N'Информационная безопасность', N'женский', N'foto25.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (38, N'Свиридов Тимофей Александрович', N'82zju4yritwo@mail.com', CAST(N'1991-07-22' AS Date), 84, N'7(68)882-28-10', N'4UDk9p76mD', N'Биг Дата', N'мужской', N'foto26.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (39, N'Медведев Захар Даниилович', N'zo6nye42s87t@yahoo.com', CAST(N'1960-04-11' AS Date), 63, N'7(36)230-79-77', N'cK49u3JU4n', N'Аналитика', N'мужской', N'foto27.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (40, N'Тихонова Елизавета Александровна', N'0cejwmnpqtb6@gmail.com', CAST(N'1955-01-07' AS Date), 34, N'7(2594)224-28-37', N'b2JHb32S8i', N'Информационная безопасность', N'женский', N'foto28.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (41, N'Рыжов Роман Константинович', N'42thql96cwe5@yahoo.com', CAST(N'1981-12-30' AS Date), 67, N'7(1009)025-64-70', N'uASc9446eF', N'Биг Дата', N'мужской', N'foto29.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (42, N'Васильев Всеволод Давидович', N'6z92wongmash@tutanota.com', CAST(N'1988-10-16' AS Date), 51, N'7(354)903-53-67', N'Ke22Yh8Pp7', NULL, N'мужской', N'foto1.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (43, N'Новиков Фёдор Макарович', N'jkp23vlzsqei@gmail.com', CAST(N'1980-08-03' AS Date), 33, N'7(6562)925-01-77', N'Tj78jXeH68', NULL, N'мужской', N'foto2.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (44, N'Фролова Владислава Савельевна', N'dncmxp1vqr4t@tutanota.com', CAST(N'1999-07-13' AS Date), 43, N'7(12)981-33-56', N'DF9a8cJf82', NULL, N'женский', N'foto3.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (45, N'Кузнецов Елисей Александрович', N'sn4xvg8wyb0h@outlook.com', CAST(N'1983-12-19' AS Date), 3, N'7(698)667-22-45', N'B2bdk8FD27', NULL, N'мужской', N'foto4.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (46, N'Рябова София Матвеевна', N'9zaecohlw2xy@tutanota.com', CAST(N'1998-08-10' AS Date), 33, N'7(38)393-11-43', N'58vMHdK4g5', NULL, N'женский', N'foto5.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (47, N'Власов Арсений Львович', N'sohzld6c52mv@gmail.com', CAST(N'1980-05-28' AS Date), 31, N'7(4297)539-13-81', N'T3uhc34E9Z', NULL, N'мужской', N'foto6.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (48, N'Маслова Екатерина Макаровна', N'a1v0lgxsz3qb@mail.com', CAST(N'1983-10-26' AS Date), 40, N'7(49)638-66-62', N'dj8PN3b4M9', NULL, N'женский', N'foto7.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (49, N'Агафонов Давид Артёмович', N'lry2ko5t031w@gmail.com', CAST(N'1995-10-14' AS Date), 27, N'7(65)706-55-85', N'uy69Pp8DY6', NULL, N'мужской', N'foto8.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (50, N'Федотова Варвара Сергеевна', N'omrjzf0pc8n6@outlook.com', CAST(N'1996-12-05' AS Date), 2, N'7(40)420-24-06', N'Sp3k6Ax86E', NULL, N'женский', N'foto9.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (51, N'Кудряшова Виктория Дмитриевна', N't1wpou7merxi@yahoo.com', CAST(N'1999-02-13' AS Date), 16, N'7(427)939-24-67', N'fvm774FV3R', NULL, N'женский', N'foto10.jpg')
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test12] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (1, N'Ершова Нора Федотовна', N'techie@outlook.com', CAST(N'1987-03-26' AS Date), 71, N'+7 (960) 424-07-11', N'tKKevv8%', NULL, N'женский', N'foto60.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (2, N'Афанасьева Жанна Валентиновна', N'agapow@yahoo.com', CAST(N'1988-01-04' AS Date), 34, N'+7 (930) 661-69-31', N'huSfHm4$', NULL, N'ж', N'foto61.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (3, N'Крылова Рая Всеволодовна', N'chaikin@yahoo.ca', CAST(N'1988-04-05' AS Date), 73, N'+7 (957) 265-60-68', N'TlUwMw77%', NULL, N'жен', N'foto62.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (4, N'Попова Вида Тимофеевна', N'lbecchi@yahoo.ca', CAST(N'1989-10-25' AS Date), 64, N'+7 (911) 744-03-14', N'%afF#@6', NULL, N'жен', N'foto63.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (5, N'Давыдова Сандра Богуславовна', N'bbirth@gmail.com', CAST(N'1989-12-27' AS Date), 55, N'+7 (984) 877-87-64', N'SU4Jpw"', NULL, N'жен', N'foto64.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (6, N'Прохорова Сабина Созоновна', N'library@sbcglobal.net', CAST(N'1990-01-16' AS Date), 77, N'+7 (940) 500-20-72', N'wL#O0V', NULL, N'жен', N'foto65.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (7, N'Громова Сильва Адольфовна', N'sisyphus@live.com', CAST(N'1990-06-13' AS Date), 52, N'+7 (956) 056-75-21', N'p5r{zY', NULL, N'ж', N'foto66.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (8, N'Боброва Джема Феликсовна', N'msroth@hotmail.com', CAST(N'1990-07-03' AS Date), 28, N'+7 (965) 493-39-66', N'wTVK~M1', NULL, N'женский', N'foto67.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (9, N'Фокина Алия Юлиановна', N'dodong@yahoo.com', CAST(N'1990-11-27' AS Date), 53, N'+7 (997) 329-69-78', N'8*Zfaj', NULL, N'ж', N'foto68.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (10, N'Калинина Маргарита Анатольевна', N'bcevc@hotmail.com', CAST(N'1991-06-08' AS Date), 74, N'+7 (964) 571-56-50', N'4sBGr*', NULL, N'ж', N'foto69.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (11, N'Горшкова Дина Тарасовна', N'sethbrown@aol.com', CAST(N'1991-08-13' AS Date), 7, N'+7 (918) 418-80-73', N'BpC8e8]', NULL, N'женский', N'foto70.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (12, N'Гуляева Ирэна Юрьевна', N'ftgvh2xbdaps@tutanota.com', CAST(N'1992-10-03' AS Date), 38, N'+7 (91) 841-39-39', N'cI1CTd', NULL, N'женский', N'foto1.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (13, N'Бурова Келен Натановна', N'ervbd91pfcoi@mail.com', CAST(N'1990-09-19' AS Date), 54, N'+7 (918) 418-10-29', N'MPmfYk', NULL, N'женский', N'foto2.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (14, N'Королёва Лаура Пётровна', N'p3y4b981xwdl@outlook.com', CAST(N'1995-07-31' AS Date), 24, N'+7 (9184) 188-29-42', N'omtSW3', NULL, N'женский', N'foto3.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (15, N'Степанова Розалия Евсеевна', N'8e9kvxq6z70o@mail.com', CAST(N'1994-11-02' AS Date), 24, N'+7 (918) 418-01-29', N'cErGgC', NULL, N'женский', N'foto4.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (16, N'Тимофеева Евгения Викторовна', N'obnk82vzpg34@yahoo.com', CAST(N'1982-01-02' AS Date), 11, N'+7 (918) 418-12-03', N'q2se3v', NULL, N'женский', N'foto5.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (17, N'Дроздова Винетта Германовна', N'wl652rgtk9js@gmail.com', CAST(N'1996-06-17' AS Date), 1, N'+7 (918) 418-10-35', N'KnqfAk', NULL, N'женский', N'foto6.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (18, N'Лукина Ксения Романовна', N'23rgct5v1myx@gmail.com', CAST(N'1990-09-18' AS Date), 2, N'+7 (918) 418-10-38', N'6YxPwE', NULL, N'женский', N'foto7.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (19, N'Мышкина Триана Геннадьевна', N'i4fs8e6mlk5p@yahoo.com', CAST(N'1981-12-30' AS Date), 54, N'+7 (918) 418-91-37', N'pBQpPx', NULL, N'женский', N'foto8.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (20, N'Михеева Аделия Авксентьевна', N'4hu6f8dxvngq@tutanota.com', CAST(N'1989-06-11' AS Date), 64, N'+7 (918) 239-45-82', N'FkX6Ms', NULL, N'женский', N'foto9.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (21, N'Царева Виктория Давидовна', N'iunhxq41tgr5@tutanota.com', CAST(N'1988-07-03' AS Date), 33, N'7(567)103-73-32', N'FYi396Dd5u', N'ИТ', N'женский', N'foto9.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (22, N'Зорин Дмитрий Маркович', N'ofdt4z1bijq0@tutanota.com', CAST(N'1993-09-07' AS Date), 57, N'7(79)644-01-06', N'7gi7E8K4Ng', N'ИТ', N'мужской', N'foto10.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (23, N'Зотова Анна Тимуровна', N'ac6yxzg7rl5k@mail.com', CAST(N'1990-09-21' AS Date), 11, N'7(488)643-19-98', N'3L3eA5eEg3', N'Биг Дата', N'женский', N'foto8.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (24, N'Соловьев Тимур Константинович', N'b1p4ur8nsedj@yahoo.com', CAST(N'1992-09-03' AS Date), 45, N'7(1828)504-39-49', N'Si8S5kS83v', N'Дизайн', N'мужской', N'foto11.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (25, N'Малахов Александр Фёдорович', N'wyo6k9emv1j5@mail.com', CAST(N'1957-05-18' AS Date), 78, N'7(905)793-68-23', N'T83vfX2Z3b', N'Биг Дата', N'мужской', N'foto12.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (26, N'Зорин Марк Ярославович', N'g7kwp8lu65xi@tutanota.com', CAST(N'1961-03-09' AS Date), 82, N'7(54)522-60-54', N'25cPn58HxV', N'Аналитика', N'мужской', N'foto13.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (27, N'Егорова Ева Михайловна', N'doj5r1m8xnky@gmail.com', CAST(N'1987-06-15' AS Date), 80, N'7(05)441-48-14', N'3z86YDzaX8', N'ИТ', N'женский', N'foto14.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (28, N'Гущина Кристина Львовна', N'bxk06h5touyr@mail.com', CAST(N'1966-06-28' AS Date), 47, N'7(023)826-25-26', N't8F9hZXp89', N'Информационная безопасность', N'женский', N'foto16.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (29, N'Кудрявцева Виктория Романовна', N'26yf8xbcntgp@gmail.com', CAST(N'1953-01-27' AS Date), 30, N'7(7804)582-64-90', N'92mARR3gu4', N'Биг Дата', N'женский', N'foto17.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (30, N'Новикова Александра Александровна', N'0z4fvq65c7tg@gmail.com', CAST(N'1982-09-02' AS Date), 76, N'7(1472)122-56-07', N'Kf64Y6rhZ3', N'Аналитика', N'женский', N'foto18.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (31, N'Масленников Родион Филиппович', N'3kma18t5furi@gmail.com', CAST(N'1952-06-09' AS Date), 24, N'7(23)912-71-67', N's7iAYE9d38', N'Аналитика', N'мужской', N'foto19.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (32, N'Иванов Тимур Иванович', N'ws7nxyhd6g1o@yahoo.com', CAST(N'1955-08-30' AS Date), 6, N'7(5939)489-85-18', N'3Ga9jfT9D2', N'Информационная безопасность', N'мужской', N'foto20.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (33, N'Иванов Сергей Степанович', N'oitzvs1mylj2@gmail.com', CAST(N'1993-09-01' AS Date), 83, N'7(4020)034-48-35', N'N6598CFsgi', N'Дизайн', N'мужской', N'foto21.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (34, N'Спиридонов Ярослав Сергеевич', N'las6pufjkv45@outlook.com', CAST(N'1969-04-22' AS Date), 64, N'7(17)843-77-26', N'DV5625Zfmj', N'Дизайн', N'мужской', N'foto22.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (35, N'Виноградова Эмилия Валерьевна', N'nl81b9i7s0ka@gmail.com', CAST(N'1991-10-25' AS Date), 90, N'7(16)788-42-97', N'22YyD83dMg', N'Дизайн', N'женский', N'foto23.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (36, N'Мартынова Ева Семёновна', N'ma87ser3gkj9@yahoo.com', CAST(N'1984-03-24' AS Date), 54, N'7(087)267-87-85', N'522EmkEmA6', N'Информационная безопасность', N'женский', N'foto24.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (37, N'Яковлева Анисия Григорьевна', N'dfmygtwpecj9@tutanota.com', CAST(N'1997-09-13' AS Date), 53, N'7(798)711-92-89', N'uf9u227NYU', N'Информационная безопасность', N'женский', N'foto25.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (38, N'Свиридов Тимофей Александрович', N'82zju4yritwo@mail.com', CAST(N'1991-07-22' AS Date), 84, N'7(68)882-28-10', N'4UDk9p76mD', N'Биг Дата', N'мужской', N'foto26.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (39, N'Медведев Захар Даниилович', N'zo6nye42s87t@yahoo.com', CAST(N'1960-04-11' AS Date), 63, N'7(36)230-79-77', N'cK49u3JU4n', N'Аналитика', N'мужской', N'foto27.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (40, N'Тихонова Елизавета Александровна', N'0cejwmnpqtb6@gmail.com', CAST(N'1955-01-07' AS Date), 34, N'7(2594)224-28-37', N'b2JHb32S8i', N'Информационная безопасность', N'женский', N'foto28.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (41, N'Рыжов Роман Константинович', N'42thql96cwe5@yahoo.com', CAST(N'1981-12-30' AS Date), 67, N'7(1009)025-64-70', N'uASc9446eF', N'Биг Дата', N'мужской', N'foto29.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (42, N'Васильев Всеволод Давидович', N'6z92wongmash@tutanota.com', CAST(N'1988-10-16' AS Date), 51, N'7(354)903-53-67', N'Ke22Yh8Pp7', NULL, N'мужской', N'foto1.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (43, N'Новиков Фёдор Макарович', N'jkp23vlzsqei@gmail.com', CAST(N'1980-08-03' AS Date), 33, N'7(6562)925-01-77', N'Tj78jXeH68', NULL, N'мужской', N'foto2.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (44, N'Фролова Владислава Савельевна', N'dncmxp1vqr4t@tutanota.com', CAST(N'1999-07-13' AS Date), 43, N'7(12)981-33-56', N'DF9a8cJf82', NULL, N'женский', N'foto3.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (45, N'Кузнецов Елисей Александрович', N'sn4xvg8wyb0h@outlook.com', CAST(N'1983-12-19' AS Date), 3, N'7(698)667-22-45', N'B2bdk8FD27', NULL, N'мужской', N'foto4.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (46, N'Рябова София Матвеевна', N'9zaecohlw2xy@tutanota.com', CAST(N'1998-08-10' AS Date), 33, N'7(38)393-11-43', N'58vMHdK4g5', NULL, N'женский', N'foto5.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (47, N'Власов Арсений Львович', N'sohzld6c52mv@gmail.com', CAST(N'1980-05-28' AS Date), 31, N'7(4297)539-13-81', N'T3uhc34E9Z', NULL, N'мужской', N'foto6.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (48, N'Маслова Екатерина Макаровна', N'a1v0lgxsz3qb@mail.com', CAST(N'1983-10-26' AS Date), 40, N'7(49)638-66-62', N'dj8PN3b4M9', NULL, N'женский', N'foto7.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (49, N'Агафонов Давид Артёмович', N'lry2ko5t031w@gmail.com', CAST(N'1995-10-14' AS Date), 27, N'7(65)706-55-85', N'uy69Pp8DY6', NULL, N'мужской', N'foto8.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (50, N'Федотова Варвара Сергеевна', N'omrjzf0pc8n6@outlook.com', CAST(N'1996-12-05' AS Date), 2, N'7(40)420-24-06', N'Sp3k6Ax86E', NULL, N'женский', N'foto9.jpg')
GO
INSERT [dbo].[user_test32] ([id], [ФИО], [Почта], [дата_рождения], [страна], [телефон], [пароль], [direction], [пол], [фото]) VALUES (51, N'Кудряшова Виктория Дмитриевна', N't1wpou7merxi@yahoo.com', CAST(N'1999-02-13' AS Date), 16, N'7(427)939-24-67', N'fvm774FV3R', NULL, N'женский', N'foto10.jpg')
GO
ALTER TABLE [dbo].[city]  WITH CHECK ADD  CONSTRAINT [FK_city_country] FOREIGN KEY([id_country])
REFERENCES [dbo].[country] ([id_country])
GO
ALTER TABLE [dbo].[city] CHECK CONSTRAINT [FK_city_country]
GO
ALTER TABLE [dbo].[event]  WITH CHECK ADD  CONSTRAINT [FK_event_activity] FOREIGN KEY([id_activity])
REFERENCES [dbo].[activity] ([id_activity])
GO
ALTER TABLE [dbo].[event] CHECK CONSTRAINT [FK_event_activity]
GO
ALTER TABLE [dbo].[event]  WITH CHECK ADD  CONSTRAINT [FK_event_city] FOREIGN KEY([city_id])
REFERENCES [dbo].[city] ([id_city])
GO
ALTER TABLE [dbo].[event] CHECK CONSTRAINT [FK_event_city]
GO
ALTER TABLE [dbo].[event_user]  WITH CHECK ADD  CONSTRAINT [FK_event_user_event] FOREIGN KEY([id_event])
REFERENCES [dbo].[event] ([id_event])
GO
ALTER TABLE [dbo].[event_user] CHECK CONSTRAINT [FK_event_user_event]
GO
ALTER TABLE [dbo].[event_user]  WITH CHECK ADD  CONSTRAINT [FK_event_user_user] FOREIGN KEY([id_user])
REFERENCES [dbo].[user] ([id_user])
GO
ALTER TABLE [dbo].[event_user] CHECK CONSTRAINT [FK_event_user_user]
GO
USE [master]
GO
ALTER DATABASE [pracktica31] SET  READ_WRITE 
GO
