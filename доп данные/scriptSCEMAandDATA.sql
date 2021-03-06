USE [master]
GO
/****** Object:  Database [NevaTelecom1]    Script Date: 09.06.2022 10:49:29 ******/
CREATE DATABASE [NevaTelecom1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NevaTelecom1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\NevaTelecom1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NevaTelecom1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\NevaTelecom1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NevaTelecom1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NevaTelecom1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NevaTelecom1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NevaTelecom1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NevaTelecom1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NevaTelecom1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NevaTelecom1] SET ARITHABORT OFF 
GO
ALTER DATABASE [NevaTelecom1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NevaTelecom1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NevaTelecom1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NevaTelecom1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NevaTelecom1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NevaTelecom1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NevaTelecom1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NevaTelecom1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NevaTelecom1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NevaTelecom1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NevaTelecom1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NevaTelecom1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NevaTelecom1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NevaTelecom1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NevaTelecom1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NevaTelecom1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NevaTelecom1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NevaTelecom1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NevaTelecom1] SET  MULTI_USER 
GO
ALTER DATABASE [NevaTelecom1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NevaTelecom1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NevaTelecom1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NevaTelecom1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NevaTelecom1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NevaTelecom1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [NevaTelecom1] SET QUERY_STORE = OFF
GO
USE [NevaTelecom1]
GO
/****** Object:  Table [dbo].[Abonent]    Script Date: 09.06.2022 10:49:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abonent](
	[id_abon] [int] IDENTITY(1,1) NOT NULL,
	[number] [nvarchar](50) NOT NULL,
	[fio] [nvarchar](150) NOT NULL,
	[gender] [nvarchar](50) NOT NULL,
	[birth] [date] NULL,
	[phone] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[address_reg] [nvarchar](150) NOT NULL,
	[address_live] [nvarchar](150) NOT NULL,
	[pasport] [nchar](11) NOT NULL,
	[code_otdel] [nchar](7) NOT NULL,
	[department] [nvarchar](150) NOT NULL,
	[date_issue] [date] NULL,
	[num_dogovor] [nvarchar](50) NOT NULL,
	[date_dogovor] [datetime] NULL,
	[dogovor_type] [nvarchar](50) NOT NULL,
	[reason_end] [text] NULL,
	[ls] [nvarchar](50) NOT NULL,
	[servis] [nvarchar](50) NOT NULL,
	[date_end] [date] NULL,
	[num_of_oborud] [nvarchar](50) NOT NULL,
	[name_role] [nvarchar](50) NOT NULL,
	[pass] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Abonent] PRIMARY KEY CLUSTERED 
(
	[id_abon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DogovorType]    Script Date: 09.06.2022 10:49:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DogovorType](
	[dogovor_type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DogovorType] PRIMARY KEY CLUSTERED 
(
	[dogovor_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 09.06.2022 10:49:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[gender] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[gender] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 09.06.2022 10:49:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[id_manager] [int] IDENTITY(1,1) NOT NULL,
	[fio] [nvarchar](150) NOT NULL,
	[name_role] [nvarchar](50) NOT NULL,
	[manager_num] [nvarchar](50) NOT NULL,
	[phone] [nchar](11) NOT NULL,
	[pass] [nvarchar](20) NOT NULL,
	[login] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[id_manager] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oborud]    Script Date: 09.06.2022 10:49:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oborud](
	[serial_num] [nvarchar](50) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Oborud] PRIMARY KEY CLUSTERED 
(
	[serial_num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 09.06.2022 10:49:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id_order] [int] IDENTITY(1,1) NOT NULL,
	[id_abon] [int] NOT NULL,
	[num_order] [nvarchar](50) NOT NULL,
	[data_create] [date] NOT NULL,
	[name_serv] [nvarchar](50) NOT NULL,
	[name_vid] [nvarchar](50) NOT NULL,
	[name_type] [nvarchar](50) NOT NULL,
	[name_status] [nvarchar](50) NOT NULL,
	[describe] [text] NULL,
	[date_end] [date] NULL,
	[problem_type] [nvarchar](50) NOT NULL,
	[id_manager] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 09.06.2022 10:49:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[name_role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role_1] PRIMARY KEY CLUSTERED 
(
	[name_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servis]    Script Date: 09.06.2022 10:49:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servis](
	[name_serv] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Servis] PRIMARY KEY CLUSTERED 
(
	[name_serv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 09.06.2022 10:49:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[name_status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[name_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 09.06.2022 10:49:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[id_task] [int] IDENTITY(1,1) NOT NULL,
	[name_role] [nvarchar](50) NOT NULL,
	[date] [nvarchar](50) NOT NULL,
	[task] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[id_task] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeProblem]    Script Date: 09.06.2022 10:49:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeProblem](
	[problem_type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeProblem] PRIMARY KEY CLUSTERED 
(
	[problem_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeServis]    Script Date: 09.06.2022 10:49:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeServis](
	[name_type] [nvarchar](50) NOT NULL,
	[name_vid] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeServis] PRIMARY KEY CLUSTERED 
(
	[name_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VidServis]    Script Date: 09.06.2022 10:49:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VidServis](
	[name_vid] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_VidServis] PRIMARY KEY CLUSTERED 
(
	[name_vid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Abonent] ON 

INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (1, N'78А000001', N'Маслака Жанна Петровна', N'Женщина', CAST(N'1981-10-22' AS Date), N'89696817934', N'janna22101981@mail.ru', N'Россия, г. Ставрополь, ЯнкиКупалы ул., д. 16 кв.118', N'Россия, г. Ставрополь, ЯнкиКупалы ул., д. 16 кв.118', N'4282 450721', N'610-512', N'ОВД России по г. Артем', CAST(N'2017-03-19' AS Date), N'78А000001-1 - 2018', CAST(N'2018-01-01T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493417', N'Интернет', NULL, N'АО567-ТНС-11', N'Пользователь', N'janna22101981')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (2, N'78А000002', N'Гриневеца Наталия Афанасьевна', N'Женщина', CAST(N'1983-06-23' AS Date), N'89057695273', N'nataliya27@yandex.ru', N'Россия, г. Пенза, Новый пер., д. 23 кв.214', N'Россия, г. Пенза, Новый пер., д. 23 кв.214', N'4972 329168', N'470-574', N'Управление внутренних дел по г. Курган', CAST(N'2017-03-19' AS Date), N'78А000002-2 - 2018', CAST(N'2018-02-02T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493418', N'Интернет, ТВ,', NULL, N'АО567-ТНС-12', N'Пользователь', N'nataliya27')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (3, N'78А000003', N'Янов Игнатий Тимофеевич', N'Мужчина', CAST(N'1987-09-04' AS Date), N'89076759140', N'ignatiy1987@yandex.ru', N'Россия, г. Дербент, Речной пер., д. 16 кв.51', N'Россия, г. Дербент, Речной пер., д. 16 кв.51', N'4439 706015', N'200-608', N'Отделением УФМС России в г. Тольятти', CAST(N'2013-01-01' AS Date), N'78А000003-3 - 2018', CAST(N'2018-03-03T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493419', N'Интернет', NULL, N'АО567-ТНС-13', N'Пользователь', N'ignatiy1987')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (4, N'78А000004', N'Фастера Клара Герасимовна', N'Женщина', CAST(N'1964-04-21' AS Date), N'89091828 926', N'klara6712@mail.ru', N'Россия, г. Махачкала, Рабочая ул., д. 13 кв.89', N'Россия, г. Махачкала, Рабочая ул., д. 13 кв.89', N'4619 108064', N'710-647', N'Отделением УФМС России по г. Пенза', CAST(N'2013-03-01' AS Date), N'78А000004-4 - 2018', CAST(N'2018-04-04T00:00:00.000' AS DateTime), N'без пролонгации', N'Переезд', N'785493420', N'Интернет, ТВ, Видеонаблюдение', CAST(N'2020-12-16' AS Date), N'АО567-ТНС-14', N'Пользователь', N'klara6712')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (5, N'78А000005', N'Кирсанов Филипп Германович', N'Мужчина', CAST(N'1982-09-05' AS Date), N'89796319051', N'filipp7232@outlook.com', N'Россия, г. Пенза, Солнечная ул., д. 5 кв.213', N'Россия, г. Пенза, Солнечная ул., д. 5 кв.213', N'4687 731090', N'270-701', N'Отделом внутренних дел России по г. Каменск - Уральский', CAST(N'2014-09-16' AS Date), N'78А000005-5 - 2019', CAST(N'2019-05-05T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493421', N'Интернет, ТВ,', NULL, N'АО567-ТНС-11', N'Пользователь', N'filipp7232')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (6, N'78А000006', N'Быкова Ольга Герасимовна', N'Женщина', CAST(N'1971-04-28' AS Date), N'89801657286', N'olga21@yandex.ru', N'Россия, г. Люберцы, Максима Горького ул., д. 4 кв.144', N'Россия, г. Люберцы, Максима Горького ул., д. 4 кв.144', N'4774 849631', N'770-592', N'Управление внутренних дел по г. Пушкино', CAST(N'2020-08-05' AS Date), N'78А000006-6 - 2019', CAST(N'2019-06-06T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493422', N'Интернет', NULL, N'АО567-ТНС-12', N'Пользователь', N'olga21')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (7, N'78А000007', N'Осина Нонна Ростиславовна', N'Женщина', CAST(N'1963-08-23' AS Date), N'89353 224538', N'nonna.osina@gmail.com', N'Россия, г. Волжский, Новая ул., д. 7 кв.161', N'Россия, г. Волжский, Новая ул., д. 7 кв.161', N'4120 125651', N'910-770', N'Отделением УФМС России по г. Армавир', CAST(N'2015-05-23' AS Date), N'78А000007-7 - 2019', CAST(N'2019-07-07T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493423', N'Интернет, ТВ, Видеонаблюдение', NULL, N'АО567-ТНС-13', N'Пользователь', N'nonna.osina')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (8, N'78А000008', N'Илюшин Тимофей Савванович', N'Мужчина', CAST(N'1965-09-05' AS Date), N'89272211795', N'timofey05091965@yandex.ru', N'Россия, г. Щёлково, Дружбы ул., д. 17 кв.19', N'Россия, г. Щёлково, Дружбы ул., д. 17 кв.19', N'4085 748295', N'170-522', N'Отделом УФМС России по г. Брянск', CAST(N'2019-04-25' AS Date), N'78А000008-8 - 2019', CAST(N'2019-08-08T00:00:00.000' AS DateTime), N'без пролонгации', N'', N'785493424', N'Интернет', NULL, N'АО567-ТНС-14', N'Пользователь', N'timofey05091965')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (9, N'78А000009', N'Блантер Аполлинария Григориевна', N'Женщина', CAST(N'1968-05-16' AS Date), N'89121756645', N'apollinariya25@yandex.ru', N'Россия, г. Пятигорск, Вокзальная ул., д. 4 кв.95', N'Россия, г. Пятигорск, Вокзальная ул., д. 4 кв.95', N'4488 865481', N'130-277', N'Отделом УФМС России по г. Самара', CAST(N'2017-11-17' AS Date), N'78А000009-9 - 2019', CAST(N'2019-09-09T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493425', N'Интернет, ТВ,', NULL, N'АО567-ТНС-11', N'Пользователь', N'apollinariya25')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (10, N'78А000010', N'Левковича Василиса Вячеславовна', N'Женщина', CAST(N'1988-11-16' AS Date), N'89147564894', N'vasilisa1988@yandex.ru', N'Россия, г. Владимир, Чапаева ул., д. 7 кв.212', N'Россия, г. Владимир, Чапаева ул., д. 7 кв.212', N'4071 593651', N'250-758', N'Отделением УФМС России по г. Йошкар-Ола', CAST(N'2014-08-04' AS Date), N'78А000010-10 - 2019', CAST(N'2019-10-10T00:00:00.000' AS DateTime), N'с пролонгацией', N'Переезд', N'785493426', N'Интернет', CAST(N'2020-10-12' AS Date), N'АО567-ТНС-12', N'Пользователь', N'vasilisa1988')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (11, N'78А000011', N'Моренов Трофим Юлианович', N'Мужчина', CAST(N'1987-07-25' AS Date), N'89224566871', N'trofim93@outlook.com', N'Россия, г. Бийск, Зеленая ул., д. 4 кв.4', N'Россия, г. Бийск, Зеленая ул., д. 4 кв.4', N'4765 421287', N'430-219', N'ОВД России по г. Северодвинск', CAST(N'2018-08-02' AS Date), N'78А000011-11 - 2019', CAST(N'2019-11-11T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493427', N'Интернет, ТВ, Видеонаблюдение', NULL, N'АО567-ТНС-13', N'Пользователь', N'trofim93')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (12, N'78А000012', N'Зылькова Нина Нифонтовна', N'Женщина', CAST(N'1978-02-02' AS Date), N'89221454863', N'nina91@mail.ru', N'Россия, г. Каменск - Уральский, Шоссейная ул., д. 12 кв.86', N'Россия, г. Каменск - Уральский, Шоссейная ул., д. 12 кв.86', N'4973 633385', N'510-866', N'Отделением УФМС России в г. Миасс', CAST(N'2018-11-17' AS Date), N'78А000012-12 - 2019', CAST(N'2019-12-12T00:00:00.000' AS DateTime), N'без пролонгации', N'', N'785493428', N'Интернет, ТВ, Видеонаблюдение', NULL, N'АО567-ТНС-14', N'Пользователь', N'nina91')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (13, N'78А000013', N'Шеляпин Роман Викторович', N'Мужчина', CAST(N'1968-05-10' AS Date), N'89120035698', N'roman10051968@hotmail.com', N'Россия, г. Ярославль, Первомайская ул., д. 19 кв.122', N'Россия, г. Ярославль, Первомайская ул., д. 19 кв.122', N'4148 271134', N'570-755', N'Отделением УФМС России по г. Москва', CAST(N'2012-09-02' AS Date), N'78А000013-5 - 2019', CAST(N'2019-05-13T00:00:00.000' AS DateTime), N'с пролонгацией', N'Переезд', N'785493429', N'Интернет', CAST(N'2021-07-22' AS Date), N'АО567-ТНС-11', N'Пользователь', N'roman10051968hot')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (14, N'78А000014', N'Немцов Константин Викторович', N'Мужчина', CAST(N'1972-11-20' AS Date), N'89274228921', N'konstantin.nemcov@rambler.ru', N'Россия, г. Новочеркасск, Новая ул., д. 19 кв.120', N'Россия, г. Новочеркасск, Новая ул., д. 19 кв.120', N'4486 117836', N'820-772', N'Отделением УФМС России в г. Октябрьский', CAST(N'2011-11-14' AS Date), N'78А000014-6 - 2018', CAST(N'2018-06-14T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493430', N'Интернет, ТВ,', NULL, N'АО567-ТНС-12', N'Пользователь', N'konstantin.nemcov')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (15, N'78А000015', N'Хуртина Алиса Афанасьевна', N'Женщина', CAST(N'1972-03-14' AS Date), N'89207994821', N'alisa14031972@outlook.com', N'Россия, г. Вологда, Речная ул., д. 7 кв.69', N'Россия, г. Вологда, Речная ул., д. 7 кв.69', N'4154 169152', N'810-600', N'Отделением УФМС России по г. Елец', CAST(N'2011-11-06' AS Date), N'78А000015-7 - 2018', CAST(N'2018-07-15T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493431', N'Интернет, ТВ, Видеонаблюдение', NULL, N'АО567-ТНС-13', N'Пользователь', N'alisa14031972')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (16, N'78А000016', N'Стукалов Яков Ильич', N'Мужчина', CAST(N'1966-05-21' AS Date), N'89404768972', N'yakov2699@outlook.com', N'Россия, г. Пушкино, Радужная ул., д. 20 кв.100', N'Россия, г. Пушкино, Радужная ул., д. 20 кв.100', N'4098 479713', N'900-684', N'Управление внутренних дел по г. Йошкар-Ола', CAST(N'2012-05-27' AS Date), N'78А000016-8 - 2019', CAST(N'2019-08-16T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493432', N'Интернет', NULL, N'АО567-ТНС-14', N'Пользователь', N'yakov2699')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (17, N'78А000017', N'Ярилова Катерина Георгьевна', N'Женщина', CAST(N'1960-11-19' AS Date), N'89195429882', N'katerina19111960@hotmail.com', N'Россия, г. Ноябрьск, Вокзальная ул., д. 14 кв.57', N'Россия, г. Ноябрьск, Вокзальная ул., д. 14 кв.57', N'4123 170850', N'280-853', N'Отделом УФМС России по г. Коломна', CAST(N'2019-08-09' AS Date), N'78А000017-5 - 2019', CAST(N'2019-05-17T00:00:00.000' AS DateTime), N'без пролонгации', N'', N'785493433', N'Интернет, ТВ,', NULL, N'АО567-ТНС-11', N'Пользователь', N'katerina19111960hot')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (18, N'78А000018', N'Петрухин Феликс Савванович', N'Мужчина', CAST(N'1963-10-07' AS Date), N'89318348532', N'feliks07101963@mail.ru', N'Россия, г. Новокузнецк, Новый пер., д. 11 кв.113', N'Россия, г. Новокузнецк, Новый пер., д. 11 кв.113', N'4398 991681', N'220-122', N'ОВД России по г. Северск', CAST(N'2013-12-28' AS Date), N'78А000018-6 - 2019', CAST(N'2019-06-18T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493434', N'Интернет, ТВ,', NULL, N'АО567-ТНС-12', N'Пользователь', N'feliks07101963')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (19, N'78А000019', N'Ивашкина София Александровна', N'Женщина', CAST(N'1964-12-20' AS Date), N'89984016941', N'sofiya24@hotmail.com', N'Россия, г. Магнитогорск, Социалистическая ул., д. 7 кв.23', N'Россия, г. Магнитогорск, Социалистическая ул., д. 7 кв.23', N'4921 840663', N'160-827', N'ОВД России по г. Мурманск', CAST(N'2013-01-26' AS Date), N'78А000019-7 - 2018', CAST(N'2018-07-19T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493435', N'Интернет, ТВ, Видеонаблюдение', NULL, N'АО567-ТНС-13', N'Пользователь', N'sofiya24hot')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (20, N'78А000020', N'Золотова Рада Юлиановна', N'Женщина', CAST(N'1984-07-01' AS Date), N'89829139579', N'rada29@rambler.ru', N'Россия, г. Нальчик, Гагарина ул., д. 12 кв.155', N'Россия, г. Нальчик, Гагарина ул., д. 12 кв.155', N'4438 240819', N'720-540', N'ОУФМС России по г. Долгопрудный', CAST(N'2019-09-03' AS Date), N'78А000020-8 - 2018', CAST(N'2018-08-20T00:00:00.000' AS DateTime), N'с пролонгацией', N'Переезд', N'785493436', N'Интернет', CAST(N'2019-06-17' AS Date), N'АО567-ТНС-14', N'Пользователь', N'rada29')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (21, N'78А000021', N'Базарова Ольга Павловна', N'Женщина', CAST(N'1992-08-22' AS Date), N'89232309314', N'olga.bazarova@ya.ru', N'Россия, г. Йошкар-Ола, Сосновая ул., д. 10 кв.55', N'Россия, г. Йошкар-Ола, Сосновая ул., д. 10 кв.55', N'4713 580078', N'190-617', N'Отделением УФМС России в г. Муром', CAST(N'2016-05-25' AS Date), N'78А000021-1 - 2019', CAST(N'2019-01-21T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493437', N'Интернет, ТВ,', NULL, N'АО567-ТНС-11', N'Пользователь', N'olga.bazarova')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (22, N'78А000022', N'Хуснутдинов Валентин Макарович', N'Мужчина', CAST(N'1985-05-15' AS Date), N'89217834062', N'valentin1985@outlook.com', N'Россия, г. Ногинск, Зеленая ул., д. 8 кв.58', N'Россия, г. Ногинск, Зеленая ул., д. 8 кв.58', N'4269 628189', N'860-324', N'Управление внутренних дел по г. Каспийск', CAST(N'2019-07-05' AS Date), N'78А000022-2 - 2019', CAST(N'2019-02-22T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493438', N'Интернет, ТВ, Видеонаблюдение', NULL, N'АО567-ТНС-12', N'Пользователь', N'valentin1985')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (23, N'78А000023', N'Лукьянова Вера Константиновна', N'Женщина', CAST(N'1974-03-01' AS Date), N'89671437489', N'vera1974@mail.ru', N'Россия, г. Королёв, Центральная ул., д. 4 кв.150', N'Россия, г. Королёв, Центральная ул., д. 4 кв.150', N'4060 460768', N'180-948', N'Отделением УФМС России по г. Новый Уренгой', CAST(N'2016-01-20' AS Date), N'78А000023-3 - 2019', CAST(N'2019-03-23T00:00:00.000' AS DateTime), N'с пролонгацией', N'Переезд', N'785493439', N'Интернет, ТВ,', CAST(N'2021-05-03' AS Date), N'АО567-ТНС-13', N'Пользователь', N'vera1974')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (24, N'78А000024', N'Ярмоленко Ева Серафимовна', N'Женщина', CAST(N'1992-02-17' AS Date), N'89544264 681', N'eva1992@ya.ru', N'Россия, г. Екатеринбург, Октябрьский пер., д. 12 кв.21', N'Россия, г. Екатеринбург, Октябрьский пер., д. 12 кв.21', N'4677 708908', N'880-626', N'Отделением УФМС России по г. Элиста', CAST(N'2015-08-05' AS Date), N'78А000024-4 - 2020', CAST(N'2020-04-24T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493440', N'Интернет', NULL, N'АО567-ТНС-14', N'Пользователь', N'eva1992')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (25, N'78А000025', N'Федосеева Алла Прохор', N'Женщина', CAST(N'1976-04-19' AS Date), N'89438414549', N'alla7235@gmail.com', N'Россия, г. Кемерово, Победы ул., д. 1 кв.129', N'Россия, г. Кемерово, Победы ул., д. 1 кв.129', N'4989 891444', N'570-829', N'Отделением УФМС России по г. Владикавказ', CAST(N'2015-11-12' AS Date), N'78А000025-5 - 2020', CAST(N'2020-05-25T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493441', N'Интернет, ТВ, Видеонаблюдение', NULL, N'АО567-ТНС-11', N'Пользователь', N'alla7235')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (26, N'78А000026', N'Бурцова Юлия Павловна', N'Женщина', CAST(N'1996-05-05' AS Date), N'89955533563', N'yuliya1996@ya.ru', N'Россия, г. Орехово-Зуево, Почтовая ул., д. 2 кв.119', N'Россия, г. Орехово-Зуево, Почтовая ул., д. 2 кв.119', N'4723 614685', N'980-476', N'Управление внутренних дел по г. Щёлково', CAST(N'2015-09-09' AS Date), N'78А000026-1 - 2020', CAST(N'2020-01-26T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493442', N'Интернет, ТВ, Видеонаблюдение', NULL, N'АО567-ТНС-12', N'Пользователь', N'yuliya1996')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (27, N'78А000027', N'Тизенгаузена Светлана Георгьевна', N'Женщина', CAST(N'1973-02-22' AS Date), N'89 129 308 223', N'svetlana57@gmail.com', N'Россия, г. Новошахтинск, Гагарина ул., д. 21 кв.101', N'Россия, г. Новошахтинск, Гагарина ул., д. 21 кв.101', N'4321 448056', N'530-343', N'Отделом внутренних дел России по г. Брянск', CAST(N'2014-04-27' AS Date), N'78А000027-2 - 2020', CAST(N'2020-02-27T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493443', N'Интернет', NULL, N'АО567-ТНС-13', N'Пользователь', N'svetlana57')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (28, N'78А000028', N'Рыченкова Анна Степановна', N'Женщина', CAST(N'1986-02-17' AS Date), N'89 955 838 993', N'anna15@hotmail.com', N'Россия, г. Ижевск, Лесная ул., д. 16 кв.102', N'Россия, г. Ижевск, Лесная ул., д. 16 кв.102', N'4379 365579', N'170-504', N'Отделением УФМС России по г. Комсомольск-на-Амуре', CAST(N'2019-09-03' AS Date), N'78А000028-3 - 2020', CAST(N'2020-03-28T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493444', N'Интернет, ТВ, Видеонаблюдение', NULL, N'АО567-ТНС-14', N'Пользователь', N'anna15hot')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (29, N'78А000029', N'Есипова Юлиана Фадеевна', N'Женщина', CAST(N'1980-10-10' AS Date), N'89 333 848 014', N'yuliana20@gmail.com', N'Россия, г. Новомосковск, Строителей ул., д. 19 кв.121', N'Россия, г. Новомосковск, Строителей ул., д. 19 кв.121', N'4424 942158', N'670-351', N'Отделом внутренних дел России по г. Череповец', CAST(N'2014-01-06' AS Date), N'78А000029-4 - 2020', CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493445', N'Интернет, ТВ,', NULL, N'АО567-ТНС-11', N'Пользователь', N'yuliana20')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (30, N'78А000030', N'Ёжиков Валерий Давидович', N'Мужчина', CAST(N'1982-09-03' AS Date), N'89 477 869 296', N'valeriy77@yandex.ru', N'Россия, г. Коломна, Ленина В.И.ул., д. 14 кв.87', N'Россия, г. Коломна, Ленина В.И.ул., д. 14 кв.87', N'4716 277897', N'110-284', N'Отделом УФМС России по г. Орёл', CAST(N'2012-05-06' AS Date), N'78А000030-5 - 2020', CAST(N'2020-05-02T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493446', N'Интернет', NULL, N'АО567-ТНС-12', N'Пользователь', N'valeriy77')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (31, N'78П000001', N'Крюков Вячеслав Леонидович', N'Мужчина', CAST(N'1963-12-13' AS Date), N'89 443 556 920', N'vyacheslav13121963@rambler.ru', N'Россия, г. Грозный, Советская ул., д. 5 кв.32', N'Россия, г. Грозный, Советская ул., д. 5 кв.32', N'4344 547115', N'740-826', N'Управление внутренних дел по г. Ярославль', CAST(N'2017-04-03' AS Date), N'78П000001-6 - 2020', CAST(N'2020-06-03T00:00:00.000' AS DateTime), N'с пролонгацией', N'Переезд', N'785493447', N'Интернет, ТВ, Видеонаблюдение', CAST(N'2020-12-12' AS Date), N'АО567-ТНС-13', N'Пользователь', N'vyacheslav13121963')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (32, N'78П000002', N'Сазонтов Илья Панкратович', N'Мужчина', CAST(N'1968-10-01' AS Date), N'89 399 631 537', N'ilya86@hotmail.com', N'Россия, г. Тюмень, Колхозная ул., д. 16 кв.219', N'Россия, г. Тюмень, Колхозная ул., д. 16 кв.219', N'4078 955891', N'430-593', N'Отделением УФМС России по г. Улан-Удэ', CAST(N'2019-11-24' AS Date), N'78П000002-7 - 2020', CAST(N'2020-07-04T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493448', N'Интернет', NULL, N'АО567-ТНС-14', N'Пользователь', N'ilya86hot')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (33, N'78П000003', N'Ягнятев Лаврентий Ильич', N'Мужчина', CAST(N'1978-05-02' AS Date), N'89 416 254 490', N'lavrentiy4683@hotmail.com', N'Россия, г. Копейск, Мира ул., д. 9 кв.149', N'Россия, г. Копейск, Мира ул., д. 9 кв.149', N'4522 699723', N'820-880', N'Отделом УФМС России по г. Евпатория', CAST(N'2015-09-06' AS Date), N'78П000003-8 - 2020', CAST(N'2020-08-05T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493449', N'Интернет, ТВ, Видеонаблюдение', NULL, N'АО567-ТНС-11', N'Пользователь', N'lavrentiy4683hot')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (34, N'78П000004', N'Лагранский Тарас Филиппович', N'Мужчина', CAST(N'1967-02-15' AS Date), N'89 579 667 533', N'taras1967@ya.ru', N'Россия, г. Пенза, Победы ул., д. 19 кв.106', N'Россия, г. Пенза, Победы ул., д. 19 кв.106', N'4441 576025', N'100-819', N'Отделом внутренних дел России по г. Салават', CAST(N'2017-03-02' AS Date), N'78П000004-9 - 2020', CAST(N'2020-09-06T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493450', N'Интернет, ТВ,', NULL, N'АО567-ТНС-12', N'Пользователь', N'taras1967')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (35, N'78П000005', N'Корявина Екатерина Васильевна', N'Женщина', CAST(N'1968-05-07' AS Date), N'89 728 326 278', N'ekaterina2832@outlook.com', N'Россия, г. Подольск, Озерный пер., д. 3 кв.180', N'Россия, г. Подольск, Озерный пер., д. 3 кв.180', N'4674 163981', N'440-136', N'Отделом УФМС России по г. Краснодар', CAST(N'2017-11-21' AS Date), N'78П000005-10 - 2020', CAST(N'2020-10-07T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493451', N'Интернет', NULL, N'АО567-ТНС-13', N'Пользователь', N'ekaterina2832')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (36, N'78П000006', N'Анюков Илья Филиппович', N'Мужчина', CAST(N'1984-02-27' AS Date), N'89 304 738 598', N'ilya58@gmail.com', N'Россия, г. Тверь, Партизанская ул., д. 9 кв.16', N'Россия, г. Тверь, Партизанская ул., д. 9 кв.16', N'4645 165137', N'760-990', N'Отделением УФМС России по г. Владивосток', CAST(N'2017-07-22' AS Date), N'78П000006-11 - 2020', CAST(N'2020-11-08T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493452', N'Интернет, ТВ,', NULL, N'АО567-ТНС-14', N'Пользователь', N'ilya58')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (37, N'78П000007', N'Горлова Надежда Витальевна', N'Женщина', CAST(N'1960-06-08' AS Date), N'89 914 627 089', N'nadejda69@hotmail.com', N'Россия, г. Хабаровск, Приозерная ул., д. 4 кв.56', N'Россия, г. Хабаровск, Приозерная ул., д. 4 кв.56', N'4464 780862', N'350-557', N'Управление внутренних дел по г. Сызрань', CAST(N'2021-08-10' AS Date), N'78П000007-12 - 2020', CAST(N'2020-12-09T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493453', N'Интернет, ТВ,', NULL, N'АО567-ТНС-11', N'Пользователь', N'nadejda69hot')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (38, N'78П000008', N'Коровин Прохор Яковеевичевич', N'Мужчина', CAST(N'1967-06-01' AS Date), N'89 762 117 435', N'prohor7239@rambler.ru', N'Россия, г. Саратов, Октябрьская ул., д. 22 кв.205', N'Россия, г. Саратов, Октябрьская ул., д. 22 кв.205', N'4881 213142', N'560-494', N'Отделением УФМС России по г. Тула', CAST(N'2020-11-11' AS Date), N'78П000008-5 - 2020', CAST(N'2020-05-10T00:00:00.000' AS DateTime), N'с пролонгацией', N'Переезд', N'785493454', N'Интернет', CAST(N'2020-12-25' AS Date), N'АО567-ТНС-12', N'Пользователь', N'prohor7239')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (39, N'78П000009', N'Набоков Герасим Васильевич', N'Мужчина', CAST(N'1979-10-08' AS Date), N'89 054 032 897', N'gerasim1979@ya.ru', N'Россия, г. Каспийск, Ленина ул., д. 22 кв.216', N'Россия, г. Каспийск, Ленина ул., д. 22 кв.216', N'4139 649753', N'430-822', N'ОВД России по г. Салават', CAST(N'2012-03-16' AS Date), N'78П000009-6 - 2020', CAST(N'2020-06-11T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493455', N'Интернет, ТВ,', NULL, N'АО567-ТНС-13', N'Пользователь', N'gerasim1979')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (40, N'78П000010', N'Сотникова Рада Алексеевна', N'Женщина', CAST(N'1969-02-08' AS Date), N'89 612 567 885', N'rada.sotnikova@outlook.com', N'Россия, г. Петропавловск-Камчатский, Центральный пер., д. 15 кв.55', N'Россия, г. Петропавловск-Камчатский, Центральный пер., д. 15 кв.55', N'4214 784297', N'900-632', N'Отделением УФМС России в г. Первоуральск', CAST(N'2015-03-03' AS Date), N'78П000010-7 - 2020', CAST(N'2020-07-12T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493456', N'Интернет', NULL, N'АО567-ТНС-14', N'Пользователь', N'rada.sotnikova')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (41, N'78П000011', N'Аниканова Римма Вячеславовна', N'Женщина', CAST(N'1965-08-23' AS Date), N'89 174 932 950', N'rimma.anikanova@rambler.ru', N'Россия, г. Сыктывкар, Песчаная ул., д. 25 кв.169', N'Россия, г. Сыктывкар, Песчаная ул., д. 25 кв.169', N'4789 530264', N'400-698', N'Управление внутренних дел по г. Петропавловск-Камчатский', CAST(N'2014-05-04' AS Date), N'78П000011-8 - 2020', CAST(N'2020-08-13T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493457', N'Интернет, ТВ, Видеонаблюдение', NULL, N'АО567-ТНС-11', N'Пользователь', N'rimma.anikanova')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (42, N'78П000012', N'Шорин Савва Семенович', N'Мужчина', CAST(N'1990-10-11' AS Date), N'89 059 363 444', N'savva67@rambler.ru', N'Россия, г. Елец, Минская ул., д. 17 кв.97', N'Россия, г. Елец, Минская ул., д. 17 кв.97', N'4748 919067', N'980-776', N'ОУФМС России по г. Красногорск', CAST(N'2020-04-21' AS Date), N'78П000012-5 - 2020', CAST(N'2020-05-14T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493458', N'Интернет, ТВ,', NULL, N'АО567-ТНС-12', N'Пользователь', N'savva67')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (43, N'78П000013', N'Левченко Николай Яковлевич', N'Мужчина', CAST(N'1973-12-23' AS Date), N'89 631 257 419', N'nikolay23121973@outlook.com', N'Россия, г. Оренбург, Зеленый пер., д. 10 кв.155', N'Россия, г. Оренбург, Зеленый пер., д. 10 кв.155', N'4056 786676', N'370-589', N'Отделением УФМС России в г. Сочи', CAST(N'2014-11-13' AS Date), N'78П000013-6 - 2020', CAST(N'2020-06-15T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493459', N'Интернет, ТВ,', NULL, N'АО567-ТНС-13', N'Пользователь', N'nikolay23121973')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (44, N'78П000014', N'Онипченко Иван Яковлевич', N'Мужчина', CAST(N'1981-02-17' AS Date), N'89 769 192 753', N'ivan8381@hotmail.com', N'Россия, г. Шахты, Мирная ул., д. 2 кв.89', N'Россия, г. Шахты, Мирная ул., д. 2 кв.89', N'4312 568195', N'310-996', N'Отделением УФМС России по г. Петропавловск-Камчатский', CAST(N'2013-01-29' AS Date), N'78П000014-7 - 2020', CAST(N'2020-07-16T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493460', N'Интернет', NULL, N'АО567-ТНС-14', N'Пользователь', N'ivan8381hot')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (45, N'78П000015', N'Сазонтова Инна Никитьевна', N'Женщина', CAST(N'1965-01-20' AS Date), N'89 633 285 826', N'inna20011965@mail.ru', N'Россия, г. Улан-Удэ, Озерная ул., д. 22 кв.22', N'Россия, г. Улан-Удэ, Озерная ул., д. 22 кв.22', N'4066 999471', N'450-296', N'ОВД России по г. Ноябрьск', CAST(N'2020-03-17' AS Date), N'78П000015-8 - 2020', CAST(N'2020-08-17T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493461', N'Интернет', NULL, N'АО567-ТНС-11', N'Пользователь', N'inna20011965')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (46, N'78П000016', N'Подчасов Александр Викторович', N'Мужчина', CAST(N'1991-03-21' AS Date), N'89 534 101 683', N'aleksandr.podchasov@yandex.ru', N'Россия, г. Рубцовск, Совхозная ул., д. 4 кв.125', N'Россия, г. Рубцовск, Совхозная ул., д. 4 кв.125', N'4984 847790', N'320-225', N'Отделением УФМС России по г. Томск', CAST(N'2012-02-20' AS Date), N'78П000016-1 - 2020', CAST(N'2020-01-18T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493462', N'ИнтернетВидеонаблюдение', NULL, N'АО567-ТНС-12', N'Пользователь', N'aleksandr.podchasov')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (47, N'78П000017', N'Викашева Юлиана Прокловна', N'Женщина', CAST(N'1965-05-01' AS Date), N'89 866 692 171', N'yuliana01051965@outlook.com', N'Россия, г. Реутов, Цветочная ул., д. 22 кв.60', N'Россия, г. Реутов, Цветочная ул., д. 22 кв.60', N'4944 608863', N'520-843', N'Отделением УФМС России в г. Мурманск', CAST(N'2015-09-17' AS Date), N'78П000017-2 - 2018', CAST(N'2018-02-19T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493463', N'Интернет', NULL, N'АО567-ТНС-13', N'Пользователь', N'yuliana01051965')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (48, N'78П000018', N'Забирова Анастасия Ильиновна', N'Женщина', CAST(N'1988-01-20' AS Date), N'89 207 618 024', N'anastasiya5199@mail.ru', N'Россия, г. Вологда, Севернаяул., д. 23 кв.192', N'Россия, г. Вологда, Севернаяул., д. 23 кв.192', N'4977 360062', N'320-709', N'ОУФМС России по г. Королёв', CAST(N'2018-06-04' AS Date), N'78П000018-3 - 2018', CAST(N'2018-03-20T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493464', N'Интернет', NULL, N'АО567-ТНС-14', N'Пользователь', N'anastasiya5199')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (49, N'78П000019', N'Чилаев Филипп Власович', N'Мужчина', CAST(N'1974-11-08' AS Date), N'89 539 687 722', N'filipp84@ya.ru', N'Россия, г. Березники, Луговая ул., д. 22 кв.29', N'Россия, г. Березники, Луговая ул., д. 22 кв.29', N'4764 148660', N'240-212', N'Отделом УФМС России по г. Салават', CAST(N'2019-04-13' AS Date), N'78П000019-4 - 2018', CAST(N'2018-04-21T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493465', N'Интернет', NULL, N'АО567-ТНС-11', N'Пользователь', N'filipp84')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (50, N'78П000020', N'Дегтярев Максим Юринович', N'Мужчина', CAST(N'1995-10-16' AS Date), N'89 645 448 189', N'maksim.degtyarev@outlook.com', N'Россия, г. Волгоград, Белорусская ул., д. 23 кв.120', N'Россия, г. Волгоград, Белорусская ул., д. 23 кв.120', N'4120 657886', N'260-701', N'Управление внутренних дел по г. Екатеринбург', CAST(N'2017-10-16' AS Date), N'78П000020-5 - 2018', CAST(N'2018-05-22T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493466', N'Интернет, ТВ,', NULL, N'АО567-ТНС-12', N'Пользователь', N'maksim.degtyarev')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (51, N'78П000021', N'Дьяченко Александр Федорович', N'Мужчина', CAST(N'1992-12-26' AS Date), N'89 162 695 236', N'aleksandr.dyachenko@hotmail.com', N'Россия, г. Одинцово, Колхозный пер., д. 10 кв.2', N'Россия, г. Одинцово, Колхозный пер., д. 10 кв.2', N'4679 597711', N'750-817', N'ОВД России по г. Якутск', CAST(N'2015-07-03' AS Date), N'78П000021-1 - 2019', CAST(N'2019-01-23T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493467', N'Интернет, ТВ,', NULL, N'АО567-ТНС-13', N'Пользователь', N'aleksandr.dyachenkohot')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (52, N'78П000022', N'Любимцева Лариса Егоровна', N'Женщина', CAST(N'1992-09-03' AS Date), N'89 582 581 816', N'larisa.lyubimceva@hotmail.com', N'Россия, г. Астрахань, Заслонова ул., д. 10 кв.213', N'Россия, г. Астрахань, Заслонова ул., д. 10 кв.213', N'4667 209858', N'280-797', N'Отделом внутренних дел России по г. Саранск', CAST(N'2020-08-14' AS Date), N'78П000022-2 - 2019', CAST(N'2019-02-24T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493468', N'Интернет, ТВ,', NULL, N'АО567-ТНС-14', N'Пользователь', N'larisa.lyubimcevahot')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (53, N'78П000023', N'Грош Савва Дмитриевич', N'Мужчина', CAST(N'1979-11-26' AS Date), N'89 847 231 137', N'savva.grosh@gmail.com', N'Россия, г. Череповец, Луговой пер., д. 12 кв.92', N'Россия, г. Череповец, Луговой пер., д. 12 кв.92', N'4513 103714', N'880-434', N'Отделением УФМС России в г. Нижний Тагил', CAST(N'2013-05-17' AS Date), N'78П000023-3 - 2019', CAST(N'2019-03-25T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493469', N'ИнтернетВидеонаблюдение', NULL, N'АО567-ТНС-11', N'Пользователь', N'savva.grosh')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (54, N'78П000024', N'Типалова Альбина Вениаминовна', N'Женщина', CAST(N'1966-02-20' AS Date), N'89 223 577 081', N'albina1966@hotmail.com', N'Россия, г. Рыбинск, Первомайский пер., д. 11 кв.87', N'Россия, г. Рыбинск, Первомайский пер., д. 11 кв.87', N'4448 309925', N'620-263', N'Отделом внутренних дел России по г. Красноярск', CAST(N'2012-01-19' AS Date), N'78П000024-4 - 2019', CAST(N'2019-04-26T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493470', N'Интернет', NULL, N'АО567-ТНС-12', N'Пользователь', N'albina1966hot')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (55, N'78П000025', N'Дементьев Константин Николаевич', N'Мужчина', CAST(N'1967-09-19' AS Date), N'89 398 423 592', N'konstantin1967@yandex.ru', N'Россия, г. Калуга, Озерная ул., д. 22 кв.196', N'Россия, г. Калуга, Озерная ул., д. 22 кв.196', N'4889 439740', N'400-291', N'Отделом внутренних дел России по г. Королёв', CAST(N'2016-01-17' AS Date), N'78П000025-5 - 2019', CAST(N'2019-05-27T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493471', N'Интернет, ТВ,', NULL, N'АО567-ТНС-13', N'Пользователь', N'konstantin1967')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (56, N'78П000026', N'Клим Таисия Емельяновна', N'Женщина', CAST(N'1985-02-06' AS Date), N'89 817 639 693', N'taisiya8398@hotmail.com', N'Россия, г. Раменское, Зеленая ул., д. 1 кв.88', N'Россия, г. Раменское, Зеленая ул., д. 1 кв.88', N'4633 194980', N'640-292', N'ОУФМС России по г. Северск', CAST(N'2017-06-13' AS Date), N'78П000026-6 - 2019', CAST(N'2019-06-28T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493472', N'Интернет, ТВ,', NULL, N'АО567-ТНС-14', N'Пользователь', N'taisiya8398hot')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (57, N'78П000027', N'Унгерн Данила Гаврннлович', N'Мужчина', CAST(N'1964-07-09' AS Date), N'89 685 299 371', N'danila35@gmail.com', N'Россия, г. Омск, Почтовая ул., д. 13 кв.182', N'Россия, г. Омск, Почтовая ул., д. 13 кв.182', N'4558 533085', N'150-752', N'Отделением УФМС России по г. Сызрань', CAST(N'2017-04-28' AS Date), N'78П000027-7 - 2019', CAST(N'2019-07-04T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493473', N'Интернет', NULL, N'АО567-ТНС-11', N'Пользователь', N'danila35')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (58, N'78П000028', N'Грош Валерий Павлович', N'Мужчина', CAST(N'1984-05-21' AS Date), N'89 611 705 461', N'valeriy21051984@yandex.ru', N'Россия, г. Чита, Пионерская ул., д. 13 кв.192', N'Россия, г. Чита, Пионерская ул., д. 13 кв.192', N'4589 314328', N'470-665', N'ОУФМС России по г. Оренбург', CAST(N'2013-03-21' AS Date), N'78П000028-8 - 2019', CAST(N'2019-08-05T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493474', N'Интернет, ТВ,', NULL, N'АО567-ТНС-12', N'Пользователь', N'valeriy21051984')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (59, N'78П000029', N'Трохина Антонина Климентьевна', N'Женщина', CAST(N'1976-04-26' AS Date), N'89 956 415 836', N'antonina8270@mail.ru', N'Россия, г. Владикавказ, Луговой пер., д. 14 кв.211', N'Россия, г. Владикавказ, Луговой пер., д. 14 кв.211', N'4756 531306', N'790-365', N'Отделом УФМС России по г. Кемерово', CAST(N'2012-05-30' AS Date), N'78П000029-9 - 2019', CAST(N'2019-09-06T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493475', N'Интернет', NULL, N'АО567-ТНС-13', N'Пользователь', N'antonina8270')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (60, N'78П000030', N'Пестов Семен Антонович', N'Мужчина', CAST(N'1973-07-20' AS Date), N'89 398 678 686', N'semen76@gmail.com', N'Россия, г. Абакан, Мичурина ул., д. 19 кв.58', N'Россия, г. Абакан, Мичурина ул., д. 19 кв.58', N'4991 788059', N'660-555', N'ОУФМС России по г. Рубцовск', CAST(N'2017-10-11' AS Date), N'78П000030-10 - 2018', CAST(N'2018-10-07T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493476', N'Интернет, ТВ,', NULL, N'АО567-ТНС-14', N'Пользователь', N'semen76')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (61, N'78В00001', N'Хахалин Леонтий Климентович', N'Мужчина', CAST(N'1963-06-17' AS Date), N'89 446 658 832', N'leontiy17061963@hotmail.com', N'Россия, г. Санкт-Петербург, Советский пер., д. 15 кв.190', N'Россия, г. Санкт-Петербург, Советский пер., д. 15 кв.190', N'4784 622440', N'220-269', N'Отделением УФМС России по г. Ногинск', CAST(N'2012-11-06' AS Date), N'78В00001-11 - 2018', CAST(N'2018-11-08T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493477', N'Интернет, ТВ,', NULL, N'АО567-ТНС-11', N'Пользователь', N'leontiy17061963hot')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (62, N'78В00002', N'Толкачев Валерий Артемович', N'Мужчина', CAST(N'1982-08-17' AS Date), N'89 986 602 986', N'valeriy.tolkachev@ya.ru', N'Россия, г. Владивосток, Набережная ул., д. 2 кв.21', N'Россия, г. Владивосток, Набережная ул., д. 2 кв.21', N'4853 522824', N'620-789', N'Отделом внутренних дел России по г. Арзамас', CAST(N'2017-08-01' AS Date), N'78В00002-12 - 2019', CAST(N'2019-12-09T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493478', N'Интернет, ТВ,', NULL, N'АО567-ТНС-12', N'Пользователь', N'valeriy.tolkachev')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (63, N'78В00003', N'Тимиряев Юрий Ростиславович', N'Мужчина', CAST(N'1969-03-28' AS Date), N'89 532 123 758', N'yuriy1969@ya.ru', N'Россия, г. Пермь, Совхозная ул., д. 1 кв.58', N'Россия, г. Пермь, Совхозная ул., д. 1 кв.58', N'4933 815058', N'300-538', N'Отделением УФМС России по г. Нефтеюганск', CAST(N'2019-09-12' AS Date), N'78В00003-5 - 2019', CAST(N'2019-05-10T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493479', N'ИнтернетВидеонаблюдение', NULL, N'АО567-ТНС-13', N'Пользователь', N'yuriy1969')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (64, N'78В00004', N'Мутовина Алина Денисовна', N'Женщина', CAST(N'1994-09-01' AS Date), N'89 445 365 124', N'alina01091994@mail.ru', N'Россия, г. Кострома, Совхозная ул., д. 18 кв.50', N'Россия, г. Кострома, Совхозная ул., д. 18 кв.50', N'4562 774155', N'930-653', N'Отделом внутренних дел России по г. Пушкино', CAST(N'2021-01-12' AS Date), N'78В00004-6 - 2019', CAST(N'2019-06-11T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493480', N'Интернет, ТВ,', NULL, N'АО567-ТНС-14', N'Пользователь', N'alina01091994')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (65, N'78В00005', N'Сапалёва Марьямна Никандровна', N'Женщина', CAST(N'1969-10-18' AS Date), N'89 199 403 980', N'maryamna1969@ya.ru', N'Россия, г. Мурманск, Пионерская ул., д. 10 кв.126', N'Россия, г. Мурманск, Пионерская ул., д. 10 кв.126', N'4517 796000', N'790-155', N'Отделом УФМС России по г. Химки', CAST(N'2021-05-06' AS Date), N'78В00005-7 - 2018', CAST(N'2018-07-12T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493481', N'Интернет, ТВ,', NULL, N'АО567-ТНС-11', N'Пользователь', N'maryamna1969')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (66, N'78В00006', N'Панкратов Михаил Панкратович', N'Мужчина', CAST(N'1988-10-23' AS Date), N'89 112 548 788', N'mihail1988@yandex.ru', N'Россия, г. Елец, Садовая ул., д. 15 кв.36', N'Россия, г. Елец, Садовая ул., д. 15 кв.36', N'4147 123053', N'290-203', N'Управление внутренних дел по г. Ачинск', CAST(N'2021-02-24' AS Date), N'78В00006-8 - 2018', CAST(N'2018-08-13T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493482', N'Интернет, ТВ,', NULL, N'АО567-ТНС-12', N'Пользователь', N'mihail1988')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (67, N'78В00007', N'Стрелков Степан Артемович', N'Мужчина', CAST(N'1977-07-23' AS Date), N'89 998 444 882', N'stepan92@rambler.ru', N'Россия, г. Киров, Кирова ул., д. 20 кв.180', N'Россия, г. Киров, Кирова ул., д. 20 кв.180', N'4351 381116', N'300-295', N'Отделением УФМС России в г. Нижневартовск', CAST(N'2015-07-13' AS Date), N'78В00007-5 - 2019', CAST(N'2019-05-14T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493483', N'Интернет, ТВ,', NULL, N'АО567-ТНС-13', N'Пользователь', N'stepan92')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (68, N'78В00008', N'Быкова Юлиана Викторовна', N'Женщина', CAST(N'1964-01-23' AS Date), N'89 436 122 944', N'yuliana.bykova@gmail.com', N'Россия, г. Златоуст, Новый пер., д. 16 кв.160', N'Россия, г. Златоуст, Новый пер., д. 16 кв.160', N'4076 368255', N'400-500', N'ОУФМС России по г. Симферополь', CAST(N'2020-09-04' AS Date), N'78В00008-6 - 2019', CAST(N'2019-06-15T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493484', N'Интернет, ТВ,', NULL, N'АО567-ТНС-14', N'Пользователь', N'yuliana.bykova')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (69, N'78В00009', N'Созыкин Максим Максимович', N'Мужчина', CAST(N'1964-08-09' AS Date), N'89 853 734 087', N'maksim6497@gmail.com', N'Россия, г. Хабаровск, Советская ул., д. 17 кв.127', N'Россия, г. Хабаровск, Советская ул., д. 17 кв.127', N'4932 338977', N'580-112', N'Отделением УФМС России в г. Волгоград', CAST(N'2020-07-25' AS Date), N'78В00009-7 - 2019', CAST(N'2019-07-16T00:00:00.000' AS DateTime), N'без пролонгации', N'', N'785493485', N'Интернет, ТВ,', NULL, N'АО567-ТНС-11', N'Пользователь', N'maksim6497')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (70, N'78В00010', N'Островерх Елизавета Максимовна', N'Женщина', CAST(N'1984-04-20' AS Date), N'89 064 068 293', N'elizaveta32@rambler.ru', N'Россия, г. Березники, Молодежный пер., д. 6 кв.114', N'Россия, г. Березники, Молодежный пер., д. 6 кв.114', N'4314 468424', N'300-688', N'Отделением УФМС России по г. Новочеркасск', CAST(N'2018-07-19' AS Date), N'78В00010-8 - 2020', CAST(N'2020-08-17T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493486', N'Интернет, ТВ,', NULL, N'АО567-ТНС-12', N'Пользователь', N'elizaveta32')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (71, N'78В00011', N'Жванецкий Савва Феоктистович', N'Мужчина', CAST(N'1984-11-13' AS Date), N'89 075 048 673', N'savva.jvaneckiy@mail.ru', N'Россия, г. Курган, Спортивная ул., д. 18 кв.63', N'Россия, г. Курган, Спортивная ул., д. 18 кв.63', N'4315 284633', N'250-607', N'Отделом УФМС России по г. Северск', CAST(N'2019-09-29' AS Date), N'78В00011-1 - 2020', CAST(N'2020-01-18T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493487', N'Интернет', NULL, N'АО567-ТНС-13', N'Пользователь', N'savva.jvaneckiy')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (72, N'78В00012', N'Оборин Петр Нифонтович', N'Мужчина', CAST(N'1979-12-18' AS Date), N'89 688 131 451', N'petr.oborin@yandex.ru', N'Россия, г. Саранск, Парковая ул., д. 18 кв.92', N'Россия, г. Саранск, Парковая ул., д. 18 кв.92', N'4042 735498', N'160-536', N'Управление внутренних дел по г. Санкт-Петербург', CAST(N'2018-09-14' AS Date), N'78В00012-2 - 2020', CAST(N'2020-02-19T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493488', N'Интернет', NULL, N'АО567-ТНС-14', N'Пользователь', N'petr.oborin')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (73, N'78В00013', N'Мичурина Маргарита Феоктистовна', N'Женщина', CAST(N'1980-09-02' AS Date), N'89 269 678 884', N'margarita26@hotmail.com', N'Россия, г. Рыбинск, Интернациональная ул., д. 12 кв.51', N'Россия, г. Рыбинск, Интернациональная ул., д. 12 кв.51', N'4659 666209', N'770-332', N'Отделением УФМС России по г. Старый Оскол', CAST(N'2017-02-21' AS Date), N'78В00013-3 - 2020', CAST(N'2020-03-20T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493489', N'Интернет', NULL, N'АО567-ТНС-11', N'Пользователь', N'margarita26hot')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (74, N'78В00014', N'Блаженнов Алексей Севастьянович', N'Мужчина', CAST(N'1966-06-27' AS Date), N'89 919 602 240', N'aleksey.blajennov@outlook.com', N'Россия, г. Прокопьевск, Советский пер., д. 9 кв.124', N'Россия, г. Прокопьевск, Советский пер., д. 9 кв.124', N'4810 848544', N'230-356', N'ОУФМС России по г. Копейск', CAST(N'2021-02-18' AS Date), N'78В00014-4 - 2020', CAST(N'2020-04-21T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493490', N'ИнтернетВидеонаблюдение', NULL, N'АО567-ТНС-12', N'Пользователь', N'aleksey.blajennov')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (75, N'78В00015', N'Кожевин Прохор Никанорович', N'Мужчина', CAST(N'1967-01-05' AS Date), N'89 948 256 023', N'prohor1967@hotmail.com', N'Россия, г. Стерлитамак, Молодежный пер., д. 15 кв.115', N'Россия, г. Стерлитамак, Молодежный пер., д. 15 кв.115', N'4356 138139', N'990-733', N'ОВД России по г. Бердск', CAST(N'2014-05-29' AS Date), N'78В00015-5 - 2020', CAST(N'2020-05-22T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493491', N'Интернет', NULL, N'АО567-ТНС-13', N'Пользователь', N'prohor1967hot')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (76, N'78В00016', N'Саврасова Лариса Ефремовна', N'Женщина', CAST(N'1992-05-23' AS Date), N'89 729 704 138', N'larisa.savrasova@mail.ru', N'Россия, г. Альметьевск, Полевой пер., д. 8 кв.77', N'Россия, г. Альметьевск, Полевой пер., д. 8 кв.77', N'4982 966896', N'610-241', N'Отделением УФМС России по г. Батайск', CAST(N'2018-05-19' AS Date), N'78В00016-1 - 2020', CAST(N'2020-01-23T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493492', N'Интернет', NULL, N'АО567-ТНС-14', N'Пользователь', N'larisa.savrasova')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (77, N'78В00017', N'Рыбакова Вероника Филипповна', N'Женщина', CAST(N'1965-02-26' AS Date), N'89 807 937 173', N'veronika1965@hotmail.com', N'Россия, г. Тула, Первомайский пер., д. 20 кв.209', N'Россия, г. Тула, Первомайский пер., д. 20 кв.209', N'4675 570112', N'470-311', N'ОУФМС России по г. Владикавказ', CAST(N'2019-07-18' AS Date), N'78В00017-2 - 2020', CAST(N'2020-02-24T00:00:00.000' AS DateTime), N'без пролонгации', N'', N'785493493', N'Интернет', NULL, N'АО567-ТНС-11', N'Пользователь', N'veronika1965hot')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (78, N'78В00018', N'Яманова Варвара Михаиловна', N'Женщина', CAST(N'1996-05-13' AS Date), N'89 251 144 199', N'varvara8263@yandex.ru', N'Россия, г. Красногорск, 3 Марта ул., д. 1 кв.98', N'Россия, г. Красногорск, 3 Марта ул., д. 1 кв.98', N'4579 481830', N'250-625', N'Отделом внутренних дел России по г. Ижевск', CAST(N'2011-12-30' AS Date), N'78В00018-3 - 2020', CAST(N'2020-03-25T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493494', N'Интернет, ТВ, Видеонаблюдение', NULL, N'АО567-ТНС-12', N'Пользователь', N'varvara8263')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (79, N'78В00019', N'Шаповалов Давид Феоктистович', N'Мужчина', CAST(N'1991-02-02' AS Date), N'89 298 939 556', N'david.apovalov@outlook.com', N'Россия, г. Киров, Советская ул., д. 15 кв.149', N'Россия, г. Киров, Советская ул., д. 15 кв.149', N'4929 776986', N'660-447', N'Отделением УФМС России по г. Щёлково', CAST(N'2019-07-17' AS Date), N'78В00019-4 - 2020', CAST(N'2020-04-26T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493495', N'Интернет, ТВ, Видеонаблюдение', NULL, N'АО567-ТНС-13', N'Пользователь', N'david.apovalov')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (80, N'78В00020', N'Емельяненко Марина Ивановна', N'Женщина', CAST(N'1980-12-25' AS Date), N'89 319 622 015', N'marina88@yandex.ru', N'Россия, г. Волжский, Севернаяул., д. 17 кв.20', N'Россия, г. Волжский, Севернаяул., д. 17 кв.20', N'4413 882242', N'410-299', N'Отделом внутренних дел России по г. Ангарск', CAST(N'2017-01-29' AS Date), N'78В00020-5 - 2020', CAST(N'2020-05-27T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493496', N'Интернет', NULL, N'АО567-ТНС-14', N'Пользователь', N'marina88')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (81, N'78В00021', N'Калитин Юрий Трофимович', N'Мужчина', CAST(N'1974-12-19' AS Date), N'89 074 194 875', N'yuriy.kalitin@yandex.ru', N'Россия, г. Прокопьевск, Новый пер., д. 3 кв.131', N'Россия, г. Прокопьевск, Новый пер., д. 3 кв.131', N'4548 456482', N'230-621', N'ОВД России по г. Владимир', CAST(N'2013-01-10' AS Date), N'78В00021-6 - 2020', CAST(N'2020-06-28T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493497', N'Интернет, ТВ,', NULL, N'АО567-ТНС-11', N'Пользователь', N'yuriy.kalitin')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (82, N'78В00022', N'Яресько Илья Александрович', N'Мужчина', CAST(N'1993-02-14' AS Date), N'89 819 622 581', N'ilya1948@hotmail.com', N'Россия, г. Волгоград, Хуторская ул., д. 4 кв.147', N'Россия, г. Волгоград, Хуторская ул., д. 4 кв.147', N'4977 672187', N'710-497', N'Отделением УФМС России в г. Каменск - Уральский', CAST(N'2012-07-17' AS Date), N'78В00022-7 - 2020', CAST(N'2020-07-14T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493498', N'Интернет, ТВ,', NULL, N'АО567-ТНС-12', N'Пользователь', N'ilya1948hot')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (83, N'78В00023', N'Савенков Герасим Емельянович', N'Мужчина', CAST(N'1979-01-12' AS Date), N'89 612 965 028', N'gerasim1979@hotmail.com', N'Россия, г. Орехово-Зуево, Пролетарская ул., д. 12 кв.109', N'Россия, г. Орехово-Зуево, Пролетарская ул., д. 12 кв.109', N'4748 514770', N'670-637', N'Управление внутренних дел по г. Архангельск', CAST(N'2020-12-31' AS Date), N'78В00023-8 - 2020', CAST(N'2020-08-15T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493499', N'Интернет', NULL, N'АО567-ТНС-13', N'Пользователь', N'gerasim1979hot')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (84, N'78В00024', N'Аленин Константин Маркович', N'Мужчина', CAST(N'1991-06-10' AS Date), N'89 051 507 758', N'konstantin8668@mail.ru', N'Россия, г. Балашиха, Набережная ул., д. 11 кв.91', N'Россия, г. Балашиха, Набережная ул., д. 11 кв.91', N'4785 339267', N'670-101', N'Отделом внутренних дел России по г. Архангельск', CAST(N'2012-09-06' AS Date), N'78В00024-9 - 2020', CAST(N'2020-09-16T00:00:00.000' AS DateTime), N'без пролонгации', N'', N'785493500', N'Интернет, ТВ,', NULL, N'АО567-ТНС-14', N'Пользователь', N'konstantin8668')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (85, N'78В00025', N'Малахов Адам Германович', N'Мужчина', CAST(N'1974-08-19' AS Date), N'89 662 969 040', N'adam3380@rambler.ru', N'Россия, г. Электросталь, Школьная ул., д. 12 кв.212', N'Россия, г. Электросталь, Школьная ул., д. 12 кв.212', N'4038 549286', N'630-527', N'Отделением УФМС России по г. Дзержинск', CAST(N'2020-04-11' AS Date), N'78В00025-10 - 2020', CAST(N'2020-10-17T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493501', N'Интернет, ТВ,', NULL, N'АО567-ТНС-11', N'Пользователь', N'adam3380')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (86, N'78В00026', N'Цур Феликс Антонрвич', N'Мужчина', CAST(N'1990-05-14' AS Date), N'89 712 772 782', N'feliks1990@rambler.ru', N'Россия, г. Братск, Дачная ул., д. 12 кв.197', N'Россия, г. Братск, Дачная ул., д. 12 кв.197', N'4674 806377', N'360-223', N'Отделением УФМС России по г. Курган', CAST(N'2019-01-08' AS Date), N'78В00026-11 - 2020', CAST(N'2020-11-18T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493502', N'Интернет, ТВ,', NULL, N'АО567-ТНС-12', N'Пользователь', N'feliks1990')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (87, N'78В00027', N'Стожко Вероника Серафимовна', N'Женщина', CAST(N'1965-02-07' AS Date), N'89 974 917 292', N'veronika1965@mail.ru', N'Россия, г. Коломна, Заслонова ул., д. 2 кв.151', N'Россия, г. Коломна, Заслонова ул., д. 2 кв.151', N'4191 550817', N'910-534', N'ОВД России по г. Калуга', CAST(N'2011-08-26' AS Date), N'78В00027-12 - 2020', CAST(N'2020-12-19T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493503', N'Интернет, ТВ,', NULL, N'АО567-ТНС-13', N'Пользователь', N'veronika1965')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (88, N'78В00028', N'Корявова Марфа Феоктистовна', N'Женщина', CAST(N'1981-03-15' AS Date), N'89 528 355 237', N'marfa.koryavova@ya.ru', N'Россия, г. Калуга, Дачная ул., д. 6 кв.146', N'Россия, г. Калуга, Дачная ул., д. 6 кв.146', N'4465 579021', N'960-397', N'Отделом УФМС России по г. Ессентуки', CAST(N'2021-06-27' AS Date), N'78В00028-5 - 2021', CAST(N'2021-05-12T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493504', N'Интернет', NULL, N'АО567-ТНС-14', N'Пользователь', N'marfa.koryavova')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (89, N'78В00029', N'Левкин Никита Севастьянович', N'Мужчина', CAST(N'1994-06-25' AS Date), N'89 999 669 028', N'nikita.levkin@hotmail.com', N'Россия, г. Электросталь, Спортивная ул., д. 6 кв.213', N'Россия, г. Электросталь, Спортивная ул., д. 6 кв.213', N'4783 688278', N'570-750', N'ОУФМС России по г. Сургут', CAST(N'2013-07-27' AS Date), N'78В00029-6 - 2021', CAST(N'2021-06-13T00:00:00.000' AS DateTime), N'без пролонгации', N'', N'785493505', N'Интернет, ТВ, Видеонаблюдение', NULL, N'АО567-ТНС-11', N'Пользователь', N'nikita.levkinhot')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (90, N'78В00030', N'Татаров Федор Саввеевич', N'Мужчина', CAST(N'1963-12-05' AS Date), N'89 731 991 343', N'fedor1963@rambler.ru', N'Россия, г. Елец, Красноармейская ул., д. 2 кв.217', N'Россия, г. Елец, Красноармейская ул., д. 2 кв.217', N'4874 869737', N'610-648', N'Отделением УФМС России в г. Альметьевск', CAST(N'2013-11-12' AS Date), N'78В00030-7 - 2021', CAST(N'2021-07-21T00:00:00.000' AS DateTime), N'с пролонгацией', N'', N'785493506', N'Интернет, ТВ,', NULL, N'АО567-ТНС-12', N'Пользователь', N'fedor1963')
INSERT [dbo].[Abonent] ([id_abon], [number], [fio], [gender], [birth], [phone], [email], [address_reg], [address_live], [pasport], [code_otdel], [department], [date_issue], [num_dogovor], [date_dogovor], [dogovor_type], [reason_end], [ls], [servis], [date_end], [num_of_oborud], [name_role], [pass]) VALUES (93, N'78В00031', N'Костура Анастасия Владимировна', N'Женщина', CAST(N'2002-03-15' AS Date), N'89121723314', N'nastya@mail.ru', N'Россия, г. Елец, Красноармейская ул., д. 2 кв.217', N'Россия, г. Елец, Красноармейская ул., д. 2 кв.217', N'4874 867865', N'610-648', N'Отделением УФМС России в г. Альметьевск', CAST(N'2022-04-20' AS Date), N'78В00031-7 - 2021', CAST(N'2022-06-07T22:43:32.240' AS DateTime), N'без пролонгации', NULL, N'785493508', N'Интернет', NULL, N'АО567-ТНС-11', N'Пользователь', N'123')
SET IDENTITY_INSERT [dbo].[Abonent] OFF
GO
INSERT [dbo].[DogovorType] ([dogovor_type]) VALUES (N'без пролонгации')
INSERT [dbo].[DogovorType] ([dogovor_type]) VALUES (N'с пролонгацией')
GO
INSERT [dbo].[Gender] ([gender]) VALUES (N'Женщина')
INSERT [dbo].[Gender] ([gender]) VALUES (N'Мужчина')
GO
SET IDENTITY_INSERT [dbo].[Manager] ON 

INSERT [dbo].[Manager] ([id_manager], [fio], [name_role], [manager_num], [phone], [pass], [login]) VALUES (1, N'Шилов Вольдемар Степанович', N'Технический специалист', N'ID1516', N'89121723314', N'shilov', N'shilov')
INSERT [dbo].[Manager] ([id_manager], [fio], [name_role], [manager_num], [phone], [pass], [login]) VALUES (2, N'Мясников Власий Лаврентьевич', N'Директор', N'ID1517', N'89221456838', N'meat', N'meat')
INSERT [dbo].[Manager] ([id_manager], [fio], [name_role], [manager_num], [phone], [pass], [login]) VALUES (3, N'Макаров Овидий Вячеславович', N'Технический специалист', N'ID1518', N'89121756594', N'makarov', N'makarov')
INSERT [dbo].[Manager] ([id_manager], [fio], [name_role], [manager_num], [phone], [pass], [login]) VALUES (4, N'Рябов Валентин Миронович', N'Руководитель технического департамента', N'ID1519', N'89245426595', N'ryabov', N'ryabov')
INSERT [dbo].[Manager] ([id_manager], [fio], [name_role], [manager_num], [phone], [pass], [login]) VALUES (5, N'Архипов Валентин Богуславович', N'Специалист по работе с клиентами', N'ID1520', N'89121454484', N'archipov', N'archipov')
INSERT [dbo].[Manager] ([id_manager], [fio], [name_role], [manager_num], [phone], [pass], [login]) VALUES (6, N'Сидоров Арсений Богуславович', N'Технический специалист', N'ID1526', N'89121899659', N'sidorov', N'sidorov')
INSERT [dbo].[Manager] ([id_manager], [fio], [name_role], [manager_num], [phone], [pass], [login]) VALUES (7, N'Самсонов Егор Тимофеевич', N'Специалист по работе с клиентами', N'ID1527', N'89224964979', N'samsonov', N'samsonov')
INSERT [dbo].[Manager] ([id_manager], [fio], [name_role], [manager_num], [phone], [pass], [login]) VALUES (8, N'Журавлёв Панкрат Валерьянович', N'Специалист по работе с клиентами', N'ID1528', N'89121486856', N'bird', N'bird')
INSERT [dbo].[Manager] ([id_manager], [fio], [name_role], [manager_num], [phone], [pass], [login]) VALUES (9, N'Симонова Сильвия Валерьевна', N'Технический специалист', N'ID1531', N'89125874683', N'simonova', N'simonova')
INSERT [dbo].[Manager] ([id_manager], [fio], [name_role], [manager_num], [phone], [pass], [login]) VALUES (10, N'Афанасьева Дарина Львовна', N'Специалист по работе с клиентами', N'ID1534', N'89121476988', N'afanaseva', N'afanaseva')
INSERT [dbo].[Manager] ([id_manager], [fio], [name_role], [manager_num], [phone], [pass], [login]) VALUES (11, N'Шубина Мелитта Тарасовна', N'Специалист по работе с клиентами', N'ID1535', N'88005496264', N'shubin', N'shubin')
INSERT [dbo].[Manager] ([id_manager], [fio], [name_role], [manager_num], [phone], [pass], [login]) VALUES (12, N'Белякова Элла Игнатьевна', N'Руководитель отдела по работе с клиентами', N'ID1536', N'89221686963', N'belyakova', N'belyakova')
SET IDENTITY_INSERT [dbo].[Manager] OFF
GO
INSERT [dbo].[Oborud] ([serial_num], [name]) VALUES (N'АО567-ТНС-11', N'Точка доступа HP ProCurve')
INSERT [dbo].[Oborud] ([serial_num], [name]) VALUES (N'АО567-ТНС-12', N'Точка доступа TP-Link TL-WA701ND')
INSERT [dbo].[Oborud] ([serial_num], [name]) VALUES (N'АО567-ТНС-13', N'Точка доступа Sitecom WLX-2000')
INSERT [dbo].[Oborud] ([serial_num], [name]) VALUES (N'АО567-ТНС-14', N'Точка доступа Buffalo AirStation N300 Dual Band')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id_order], [id_abon], [num_order], [data_create], [name_serv], [name_vid], [name_type], [name_status], [describe], [date_end], [problem_type], [id_manager]) VALUES (1, 1, N'785493417/31.05.2022', CAST(N'2022-06-07' AS Date), N'Интернет', N'Подключение', N'Подключение услуг на существующей инфраструктуре', N'Закрыта', N'', CAST(N'2022-06-07' AS Date), N'Техническое обслуживание', 3)
INSERT [dbo].[Order] ([id_order], [id_abon], [num_order], [data_create], [name_serv], [name_vid], [name_type], [name_status], [describe], [date_end], [problem_type], [id_manager]) VALUES (2, 2, N'785493418/01.06.2022', CAST(N'2022-06-07' AS Date), N'Интернет', N'Подключение', N'Подключение услуг с новой инфраструктурой', N'Закрыта', N'Пожилой человек', CAST(N'2022-06-07' AS Date), N'Техническое обслуживание', 9)
INSERT [dbo].[Order] ([id_order], [id_abon], [num_order], [data_create], [name_serv], [name_vid], [name_type], [name_status], [describe], [date_end], [problem_type], [id_manager]) VALUES (3, 3, N'785493422/01.06.2022', CAST(N'2022-06-01' AS Date), N'Видеонаблюдение', N'Диагностика и настройка оборудования/подключения', N'Нет доступа к услуге', N'Закрыта', NULL, CAST(N'2022-06-01' AS Date), N'Консультация', 6)
INSERT [dbo].[Order] ([id_order], [id_abon], [num_order], [data_create], [name_serv], [name_vid], [name_type], [name_status], [describe], [date_end], [problem_type], [id_manager]) VALUES (4, 1, N'785493417/01.06.2022', CAST(N'2022-06-05' AS Date), N'Интернет', N'Подключение', N'Подключение услуг с новой инфраструктурой', N'Закрыта', NULL, CAST(N'2022-06-05' AS Date), N'Техническое обслуживание', 6)
INSERT [dbo].[Order] ([id_order], [id_abon], [num_order], [data_create], [name_serv], [name_vid], [name_type], [name_status], [describe], [date_end], [problem_type], [id_manager]) VALUES (7, 1, N'785493417/07.06.2022', CAST(N'2022-06-07' AS Date), N'Видеонаблюдение', N'Оплата услуг', N'Выписка по платежам', N'Закрыта', NULL, CAST(N'2022-06-07' AS Date), N'Техническое обслуживание', 1)
INSERT [dbo].[Order] ([id_order], [id_abon], [num_order], [data_create], [name_serv], [name_vid], [name_type], [name_status], [describe], [date_end], [problem_type], [id_manager]) VALUES (23, 1, N'785493417/07.06.2022/3:28', CAST(N'2022-06-07' AS Date), N'Видеонаблюдение', N'Диагностика и настройка оборудования/подключения', N'Нет доступа к услуге', N'Закрыта', NULL, CAST(N'2022-06-07' AS Date), N'Консультация', 1)
INSERT [dbo].[Order] ([id_order], [id_abon], [num_order], [data_create], [name_serv], [name_vid], [name_type], [name_status], [describe], [date_end], [problem_type], [id_manager]) VALUES (24, 1, N'785493417/07.06.2022/3:29', CAST(N'2022-06-07' AS Date), N'Интернет', N'Диагностика и настройка оборудования/подключения', N'Нет доступа к услуге', N'Требует выезда', NULL, NULL, N'Консультация', 3)
INSERT [dbo].[Order] ([id_order], [id_abon], [num_order], [data_create], [name_serv], [name_vid], [name_type], [name_status], [describe], [date_end], [problem_type], [id_manager]) VALUES (25, 3, N'785493419/07.06.2022/3:40', CAST(N'2022-06-07' AS Date), N'Видеонаблюдение', N'Оплата услуг', N'Информация о платежах', N'Требует выезда', NULL, NULL, N'Консультация', 6)
INSERT [dbo].[Order] ([id_order], [id_abon], [num_order], [data_create], [name_serv], [name_vid], [name_type], [name_status], [describe], [date_end], [problem_type], [id_manager]) VALUES (26, 1, N'785493417/07.06.2022/4:03', CAST(N'2022-06-07' AS Date), N'Интернет', N'Оплата услуг', N'Информация о платежах', N'Закрыта', NULL, CAST(N'2022-06-07' AS Date), N'Консультация', 1)
INSERT [dbo].[Order] ([id_order], [id_abon], [num_order], [data_create], [name_serv], [name_vid], [name_type], [name_status], [describe], [date_end], [problem_type], [id_manager]) VALUES (27, 1, N'785493417/07.06.2022/10:11', CAST(N'2022-06-07' AS Date), N'Видеонаблюдение', N'Диагностика и настройка оборудования/подключения', N'Низкая скорость соединения', N'Закрыта', NULL, CAST(N'2022-06-07' AS Date), N'Консультация', 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[Role] ([name_role]) VALUES (N'Директор')
INSERT [dbo].[Role] ([name_role]) VALUES (N'Пользователь')
INSERT [dbo].[Role] ([name_role]) VALUES (N'Руководитель отдела по работе с клиентами')
INSERT [dbo].[Role] ([name_role]) VALUES (N'Руководитель технического департамента')
INSERT [dbo].[Role] ([name_role]) VALUES (N'Специалист по работе с клиентами')
INSERT [dbo].[Role] ([name_role]) VALUES (N'Технический специалист')
GO
INSERT [dbo].[Servis] ([name_serv]) VALUES (N'Видеонаблюдение')
INSERT [dbo].[Servis] ([name_serv]) VALUES (N'Интернет')
INSERT [dbo].[Servis] ([name_serv]) VALUES (N'Мобильная связь')
INSERT [dbo].[Servis] ([name_serv]) VALUES (N'Телевидение')
GO
INSERT [dbo].[Status] ([name_status]) VALUES (N'Закрыта')
INSERT [dbo].[Status] ([name_status]) VALUES (N'Новая')
INSERT [dbo].[Status] ([name_status]) VALUES (N'Требует выезда')
GO
SET IDENTITY_INSERT [dbo].[Task] ON 

INSERT [dbo].[Task] ([id_task], [name_role], [date], [task]) VALUES (1, N'Директор', N'6 июня 12.00 ', N'Собрание акционеров')
INSERT [dbo].[Task] ([id_task], [name_role], [date], [task]) VALUES (2, N'Руководитель отдела по работе с клиентами', N'6 июня', N'Публикация на сайте о проекте')
INSERT [dbo].[Task] ([id_task], [name_role], [date], [task]) VALUES (3, N'Технический специалист', N'6 июня 15.00', N'Собрание техдепартамента')
INSERT [dbo].[Task] ([id_task], [name_role], [date], [task]) VALUES (4, N'Руководитель технического департамента', N'6 июня 15.00', N'Собрание техдепартамента')
INSERT [dbo].[Task] ([id_task], [name_role], [date], [task]) VALUES (5, N'Руководитель отдела по работе с клиентами', N'6 июня 12.00 ', N'Собрание акционеров')
INSERT [dbo].[Task] ([id_task], [name_role], [date], [task]) VALUES (6, N'Директор', N'6 июня 15.00', N'Собрание техдепартамента')
INSERT [dbo].[Task] ([id_task], [name_role], [date], [task]) VALUES (7, N'Руководитель отдела по работе с клиентами', N'6 июня 10.00', N'Планерка')
INSERT [dbo].[Task] ([id_task], [name_role], [date], [task]) VALUES (8, N'Директор', N'6 июня 10.00', N'Планерка')
INSERT [dbo].[Task] ([id_task], [name_role], [date], [task]) VALUES (9, N'Руководитель технического департамента', N'6 июня 10.00', N'Планерка')
INSERT [dbo].[Task] ([id_task], [name_role], [date], [task]) VALUES (10, N'Руководитель технического департамента', N'6 июня', N'ДР директора')
INSERT [dbo].[Task] ([id_task], [name_role], [date], [task]) VALUES (11, N'Специалист по работе с клиентами', N'6 июня', N'Быть готовым к новым отчетам')
INSERT [dbo].[Task] ([id_task], [name_role], [date], [task]) VALUES (12, N'Специалист по работе с клиентами', N'6 июня 17.15 ', N'Загрузить документы за день')
INSERT [dbo].[Task] ([id_task], [name_role], [date], [task]) VALUES (13, N'Специалист по работе с клиентами', N'6 июня', N'загрузить страховки')
INSERT [dbo].[Task] ([id_task], [name_role], [date], [task]) VALUES (14, N'Технический специалист', N'6 июня', N'ДР директора')
INSERT [dbo].[Task] ([id_task], [name_role], [date], [task]) VALUES (15, N'Руководитель отдела по работе с клиентами', N'6 июня', N'ДР директора')
INSERT [dbo].[Task] ([id_task], [name_role], [date], [task]) VALUES (16, N'Специалист по работе с клиентами', N'6 июня', N'ДР директора')
SET IDENTITY_INSERT [dbo].[Task] OFF
GO
INSERT [dbo].[TypeProblem] ([problem_type]) VALUES (N'Консультация')
INSERT [dbo].[TypeProblem] ([problem_type]) VALUES (N'Техническое обслуживание')
GO
INSERT [dbo].[TypeServis] ([name_type], [name_vid]) VALUES (N'Включение в договор дополнительной услуги', N'Управление договором/контактными данными')
INSERT [dbo].[TypeServis] ([name_type], [name_vid]) VALUES (N'Выписка по платежам', N'Оплата услуг')
INSERT [dbo].[TypeServis] ([name_type], [name_vid]) VALUES (N'Изменение адреса предоставления услуг', N'Управление тарифом/услугой')
INSERT [dbo].[TypeServis] ([name_type], [name_vid]) VALUES (N'Изменение контактных данных', N'Управление договором/контактными данными')
INSERT [dbo].[TypeServis] ([name_type], [name_vid]) VALUES (N'Изменение тарифа', N'Управление тарифом/услугой')
INSERT [dbo].[TypeServis] ([name_type], [name_vid]) VALUES (N'Изменение условий договора', N'Управление договором/контактными данными')
INSERT [dbo].[TypeServis] ([name_type], [name_vid]) VALUES (N'Информация о платежах', N'Оплата услуг')
INSERT [dbo].[TypeServis] ([name_type], [name_vid]) VALUES (N'Нет доступа к услуге', N'Диагностика и настройка оборудования/подключения')
INSERT [dbo].[TypeServis] ([name_type], [name_vid]) VALUES (N'Низкая скорость соединения', N'Диагностика и настройка оборудования/подключения')
INSERT [dbo].[TypeServis] ([name_type], [name_vid]) VALUES (N'Отключение услуги', N'Управление тарифом/услугой')
INSERT [dbo].[TypeServis] ([name_type], [name_vid]) VALUES (N'Подключение услуг на существующей инфраструктуре', N'Подключение')
INSERT [dbo].[TypeServis] ([name_type], [name_vid]) VALUES (N'Подключение услуг с новой инфраструктурой', N'Подключение')
INSERT [dbo].[TypeServis] ([name_type], [name_vid]) VALUES (N'Получение квитанции на оплату услуги', N'Оплата услуг')
INSERT [dbo].[TypeServis] ([name_type], [name_vid]) VALUES (N'Приостановка предоставления услуги', N'Управление тарифом/услугой')
INSERT [dbo].[TypeServis] ([name_type], [name_vid]) VALUES (N'Разрыв соединения', N'Диагностика и настройка оборудования/подключения')
GO
INSERT [dbo].[VidServis] ([name_vid]) VALUES (N'Диагностика и настройка оборудования/подключения')
INSERT [dbo].[VidServis] ([name_vid]) VALUES (N'Оплата услуг')
INSERT [dbo].[VidServis] ([name_vid]) VALUES (N'Подключение')
INSERT [dbo].[VidServis] ([name_vid]) VALUES (N'Управление договором/контактными данными')
INSERT [dbo].[VidServis] ([name_vid]) VALUES (N'Управление тарифом/услугой')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Abonent]    Script Date: 09.06.2022 10:49:30 ******/
ALTER TABLE [dbo].[Abonent] ADD  CONSTRAINT [IX_Abonent] UNIQUE NONCLUSTERED 
(
	[ls] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Abonent_3]    Script Date: 09.06.2022 10:49:30 ******/
ALTER TABLE [dbo].[Abonent] ADD  CONSTRAINT [IX_Abonent_3] UNIQUE NONCLUSTERED 
(
	[pasport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Abonent_4]    Script Date: 09.06.2022 10:49:30 ******/
ALTER TABLE [dbo].[Abonent] ADD  CONSTRAINT [IX_Abonent_4] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Abonent_5]    Script Date: 09.06.2022 10:49:30 ******/
ALTER TABLE [dbo].[Abonent] ADD  CONSTRAINT [IX_Abonent_5] UNIQUE NONCLUSTERED 
(
	[number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Abonent_6]    Script Date: 09.06.2022 10:49:30 ******/
ALTER TABLE [dbo].[Abonent] ADD  CONSTRAINT [IX_Abonent_6] UNIQUE NONCLUSTERED 
(
	[num_dogovor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Manager]    Script Date: 09.06.2022 10:49:30 ******/
ALTER TABLE [dbo].[Manager] ADD  CONSTRAINT [IX_Manager] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Order]    Script Date: 09.06.2022 10:49:30 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [IX_Order] UNIQUE NONCLUSTERED 
(
	[num_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Abonent] ADD  CONSTRAINT [DF_Abonent_name_role]  DEFAULT (N'Пользователь') FOR [name_role]
GO
ALTER TABLE [dbo].[Abonent]  WITH CHECK ADD  CONSTRAINT [FK_Abonent_DogovorType] FOREIGN KEY([dogovor_type])
REFERENCES [dbo].[DogovorType] ([dogovor_type])
GO
ALTER TABLE [dbo].[Abonent] CHECK CONSTRAINT [FK_Abonent_DogovorType]
GO
ALTER TABLE [dbo].[Abonent]  WITH CHECK ADD  CONSTRAINT [FK_Abonent_Gender] FOREIGN KEY([gender])
REFERENCES [dbo].[Gender] ([gender])
GO
ALTER TABLE [dbo].[Abonent] CHECK CONSTRAINT [FK_Abonent_Gender]
GO
ALTER TABLE [dbo].[Abonent]  WITH CHECK ADD  CONSTRAINT [FK_Abonent_Oborud] FOREIGN KEY([num_of_oborud])
REFERENCES [dbo].[Oborud] ([serial_num])
GO
ALTER TABLE [dbo].[Abonent] CHECK CONSTRAINT [FK_Abonent_Oborud]
GO
ALTER TABLE [dbo].[Abonent]  WITH CHECK ADD  CONSTRAINT [FK_Abonent_Role] FOREIGN KEY([name_role])
REFERENCES [dbo].[Role] ([name_role])
GO
ALTER TABLE [dbo].[Abonent] CHECK CONSTRAINT [FK_Abonent_Role]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Role] FOREIGN KEY([name_role])
REFERENCES [dbo].[Role] ([name_role])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_Manager_Role]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Abonent] FOREIGN KEY([id_abon])
REFERENCES [dbo].[Abonent] ([id_abon])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Abonent]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Manager] FOREIGN KEY([id_manager])
REFERENCES [dbo].[Manager] ([id_manager])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Manager]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Servis] FOREIGN KEY([name_serv])
REFERENCES [dbo].[Servis] ([name_serv])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Servis]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([name_status])
REFERENCES [dbo].[Status] ([name_status])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_TypeProblem] FOREIGN KEY([problem_type])
REFERENCES [dbo].[TypeProblem] ([problem_type])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_TypeProblem]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_TypeServis] FOREIGN KEY([name_type])
REFERENCES [dbo].[TypeServis] ([name_type])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_TypeServis]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_VidServis] FOREIGN KEY([name_vid])
REFERENCES [dbo].[VidServis] ([name_vid])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_VidServis]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Role1] FOREIGN KEY([name_role])
REFERENCES [dbo].[Role] ([name_role])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Role1]
GO
ALTER TABLE [dbo].[TypeServis]  WITH CHECK ADD  CONSTRAINT [FK_TypeServis_VidServis] FOREIGN KEY([name_vid])
REFERENCES [dbo].[VidServis] ([name_vid])
GO
ALTER TABLE [dbo].[TypeServis] CHECK CONSTRAINT [FK_TypeServis_VidServis]
GO
USE [master]
GO
ALTER DATABASE [NevaTelecom1] SET  READ_WRITE 
GO
