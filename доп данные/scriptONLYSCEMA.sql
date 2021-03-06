USE [master]
GO
/****** Object:  Database [NevaTelecom1]    Script Date: 07.06.2022 4:09:57 ******/
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
/****** Object:  Table [dbo].[Abonent]    Script Date: 07.06.2022 4:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abonent](
	[id_abon] [int] IDENTITY(1,1) NOT NULL,
	[number] [nvarchar](50) NOT NULL,
	[fio] [nvarchar](150) NOT NULL,
	[gender] [nvarchar](50) NOT NULL,
	[birth] [datetime] NULL,
	[phone] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[address_reg] [nvarchar](150) NOT NULL,
	[address_live] [nvarchar](150) NOT NULL,
	[pasport] [nchar](11) NOT NULL,
	[code_otdel] [nchar](7) NOT NULL,
	[department] [nvarchar](150) NOT NULL,
	[date_issue] [datetime] NULL,
	[num_dogovor] [nvarchar](50) NOT NULL,
	[date_dogovor] [datetime] NULL,
	[dogovor_type] [nvarchar](50) NOT NULL,
	[reason_end] [text] NULL,
	[ls] [nvarchar](50) NOT NULL,
	[servis] [nvarchar](50) NOT NULL,
	[date_end] [datetime] NULL,
	[num_of_oborud] [nvarchar](50) NOT NULL,
	[name_role] [nvarchar](50) NOT NULL,
	[pass] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Abonent] PRIMARY KEY CLUSTERED 
(
	[id_abon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Abonent] UNIQUE NONCLUSTERED 
(
	[ls] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Abonent_3] UNIQUE NONCLUSTERED 
(
	[pasport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Abonent_4] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Abonent_5] UNIQUE NONCLUSTERED 
(
	[number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Abonent_6] UNIQUE NONCLUSTERED 
(
	[num_dogovor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DogovorType]    Script Date: 07.06.2022 4:09:57 ******/
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
/****** Object:  Table [dbo].[Gender]    Script Date: 07.06.2022 4:09:57 ******/
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
/****** Object:  Table [dbo].[Manager]    Script Date: 07.06.2022 4:09:57 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Manager] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oborud]    Script Date: 07.06.2022 4:09:57 ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 07.06.2022 4:09:57 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Order] UNIQUE NONCLUSTERED 
(
	[num_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 07.06.2022 4:09:57 ******/
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
/****** Object:  Table [dbo].[Servis]    Script Date: 07.06.2022 4:09:57 ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 07.06.2022 4:09:57 ******/
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
/****** Object:  Table [dbo].[Task]    Script Date: 07.06.2022 4:09:57 ******/
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
/****** Object:  Table [dbo].[TypeProblem]    Script Date: 07.06.2022 4:09:57 ******/
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
/****** Object:  Table [dbo].[TypeServis]    Script Date: 07.06.2022 4:09:57 ******/
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
/****** Object:  Table [dbo].[VidServis]    Script Date: 07.06.2022 4:09:57 ******/
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
