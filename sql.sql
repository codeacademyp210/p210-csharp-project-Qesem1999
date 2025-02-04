USE [master]
GO
/****** Object:  Database [FrontTask]    Script Date: 02.06.2019 19:52:59 ******/
CREATE DATABASE [FrontTask]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FrontTask', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\FrontTask.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FrontTask_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\FrontTask_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FrontTask] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FrontTask].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FrontTask] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FrontTask] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FrontTask] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FrontTask] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FrontTask] SET ARITHABORT OFF 
GO
ALTER DATABASE [FrontTask] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FrontTask] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FrontTask] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FrontTask] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FrontTask] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FrontTask] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FrontTask] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FrontTask] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FrontTask] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FrontTask] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FrontTask] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FrontTask] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FrontTask] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FrontTask] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FrontTask] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FrontTask] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FrontTask] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FrontTask] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FrontTask] SET  MULTI_USER 
GO
ALTER DATABASE [FrontTask] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FrontTask] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FrontTask] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FrontTask] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FrontTask] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FrontTask] SET QUERY_STORE = OFF
GO
USE [FrontTask]
GO
/****** Object:  Table [dbo].[Classrooms]    Script Date: 02.06.2019 19:52:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classrooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Classrooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Educations]    Script Date: 02.06.2019 19:52:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Educations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Educations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 02.06.2019 19:52:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[PositionId] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Salary] [money] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 02.06.2019 19:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ClassroomId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[MentorId] [int] NOT NULL,
	[Capacity] [int] NOT NULL,
	[EducationProgramId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 02.06.2019 19:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 02.06.2019 19:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Fee] [money] NOT NULL,
	[GroupId] [int] NOT NULL,
	[TaskId] [int] NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 02.06.2019 19:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Deadline] [datetime] NOT NULL,
	[GroupId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 02.06.2019 19:53:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[SpecialityId] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Classrooms] ON 

INSERT [dbo].[Classrooms] ([Id], [Name], [Status]) VALUES (1, N'Yupiter', 1)
INSERT [dbo].[Classrooms] ([Id], [Name], [Status]) VALUES (2, N'Titan', 1)
INSERT [dbo].[Classrooms] ([Id], [Name], [Status]) VALUES (3, N'Mars', 1)
INSERT [dbo].[Classrooms] ([Id], [Name], [Status]) VALUES (4, N'Merkuri', 1)
INSERT [dbo].[Classrooms] ([Id], [Name], [Status]) VALUES (5, N'Pluton', 1)
INSERT [dbo].[Classrooms] ([Id], [Name], [Status]) VALUES (6, N'Merkuri', 0)
INSERT [dbo].[Classrooms] ([Id], [Name], [Status]) VALUES (7, N'Merkuri', 0)
INSERT [dbo].[Classrooms] ([Id], [Name], [Status]) VALUES (8, N'fses2', 0)
SET IDENTITY_INSERT [dbo].[Classrooms] OFF
SET IDENTITY_INSERT [dbo].[Educations] ON 

INSERT [dbo].[Educations] ([Id], [Name], [Price], [Status]) VALUES (1, N' Digital Marketin1', 2000.0000, 1)
INSERT [dbo].[Educations] ([Id], [Name], [Price], [Status]) VALUES (2, N'Qrafik ve Veb Dizayn', 2500.0000, 1)
INSERT [dbo].[Educations] ([Id], [Name], [Price], [Status]) VALUES (3, N'Proqramlasdirma', 3500.0000, 1)
INSERT [dbo].[Educations] ([Id], [Name], [Price], [Status]) VALUES (4, N'3D modellesdirme', 3000.0000, 1)
INSERT [dbo].[Educations] ([Id], [Name], [Price], [Status]) VALUES (5, N'Sistem Aministrasiyasi', 4000.0000, 1)
INSERT [dbo].[Educations] ([Id], [Name], [Price], [Status]) VALUES (6, N' Ms Office', 2500.0000, 1)
INSERT [dbo].[Educations] ([Id], [Name], [Price], [Status]) VALUES (7, N'Ingilis Dili', 1000.0000, 1)
INSERT [dbo].[Educations] ([Id], [Name], [Price], [Status]) VALUES (8, N'dss', 1000.0000, 0)
SET IDENTITY_INSERT [dbo].[Educations] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Email], [Phone], [PositionId], [StartTime], [Salary], [Status]) VALUES (2, N'Nicat', N'Abdullayev', N'Nicat@code.edu.az', N'0551000001', 4, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 300.0000, 1)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Email], [Phone], [PositionId], [StartTime], [Salary], [Status]) VALUES (4, N'Nazli', N'Memmedov', N'Nazli@code.edu.az', N'0513425432', 5, CAST(N'2017-04-27T00:00:00.000' AS DateTime), 600.0000, 1)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Email], [Phone], [PositionId], [StartTime], [Salary], [Status]) VALUES (5, N'Meryem', N'Eyvavazova', N'Meryem@code.edu.az', N'0773423545', 3, CAST(N'2017-11-22T00:00:00.000' AS DateTime), 800.0000, 1)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Email], [Phone], [PositionId], [StartTime], [Salary], [Status]) VALUES (6, N'Anar', N'Baxsaliyev', N'Anar@code.edu.az', N'0705345231', 1, CAST(N'2015-05-01T00:00:00.000' AS DateTime), 1500.0000, 1)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Email], [Phone], [PositionId], [StartTime], [Salary], [Status]) VALUES (8, N'Namiq', N'Seydayev', N'Miqmiq@code.edu.az', N'0505345233', 5, CAST(N'2017-02-12T00:00:00.000' AS DateTime), 600.0000, 1)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Email], [Phone], [PositionId], [StartTime], [Salary], [Status]) VALUES (9, N'Yasar', N'Mehdiyev', N'Yasar@code.edu.az', N'0773423534', 2, CAST(N'2019-01-13T00:00:00.000' AS DateTime), 500.0000, 1)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Email], [Phone], [PositionId], [StartTime], [Salary], [Status]) VALUES (10, N'Receb', N'Qarayev', N'Receb@code.edu.az', N'0553246307', 4, CAST(N'2018-10-04T00:00:00.000' AS DateTime), 300.0000, 1)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Email], [Phone], [PositionId], [StartTime], [Salary], [Status]) VALUES (11, N'Ramil', N'Sefereliyev', N'Ramil', N'0708587252', 4, CAST(N'2018-07-15T00:00:00.000' AS DateTime), 300.0000, 1)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Email], [Phone], [PositionId], [StartTime], [Salary], [Status]) VALUES (13, N'Ilham', N'Quliyev', N'Ilham@code.edu.az', N'0513544656', 4, CAST(N'2018-02-20T00:00:00.000' AS DateTime), 300.0000, 1)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Email], [Phone], [PositionId], [StartTime], [Salary], [Status]) VALUES (14, N'Misir', N'Huseynov', N'Misir@code.edu.az', N'0703442291', 4, CAST(N'2018-08-05T00:00:00.000' AS DateTime), 300.0000, 1)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Email], [Phone], [PositionId], [StartTime], [Salary], [Status]) VALUES (15, N'Hikmet', N'Eliyeva', N'Hikmet@code.edu.az', N'0553434234', 4, CAST(N'2017-12-14T00:00:00.000' AS DateTime), 300.0000, 1)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Email], [Phone], [PositionId], [StartTime], [Salary], [Status]) VALUES (16, N'Samil', N'Rehimov', N'Samil@code.edu.az', N'0773423545', 4, CAST(N'2019-03-11T00:00:00.000' AS DateTime), 300.0000, 0)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Email], [Phone], [PositionId], [StartTime], [Salary], [Status]) VALUES (17, N'Qezenfer', N'Namiql', N'qezi@code.edu.az', N'0773321465', 3, CAST(N'2017-12-12T00:00:00.000' AS DateTime), 1000.0000, 0)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Email], [Phone], [PositionId], [StartTime], [Salary], [Status]) VALUES (18, N'Goynur', N'Eyvazov', N'geynur@code.edu.az', N'0513487213', 3, CAST(N'2019-06-02T00:00:00.000' AS DateTime), 1000.0000, 0)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Email], [Phone], [PositionId], [StartTime], [Salary], [Status]) VALUES (19, N'Geynur', N'Huseynli', N'geynur@code.edu.az', N'0772314765', 3, CAST(N'2019-06-02T00:00:00.000' AS DateTime), 1000.0000, 0)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([Id], [Name], [ClassroomId], [TeacherId], [MentorId], [Capacity], [EducationProgramId], [Status]) VALUES (1, N'P210', 2, 1, 2, 16, 3, 1)
INSERT [dbo].[Groups] ([Id], [Name], [ClassroomId], [TeacherId], [MentorId], [Capacity], [EducationProgramId], [Status]) VALUES (2, N'P211', 1, 8, 10, 18, 3, 0)
INSERT [dbo].[Groups] ([Id], [Name], [ClassroomId], [TeacherId], [MentorId], [Capacity], [EducationProgramId], [Status]) VALUES (3, N'P212', 3, 2, 11, 14, 2, 1)
INSERT [dbo].[Groups] ([Id], [Name], [ClassroomId], [TeacherId], [MentorId], [Capacity], [EducationProgramId], [Status]) VALUES (8, N'P213', 4, 4, 13, 16, 5, 1)
INSERT [dbo].[Groups] ([Id], [Name], [ClassroomId], [TeacherId], [MentorId], [Capacity], [EducationProgramId], [Status]) VALUES (9, N'P214', 5, 5, 14, 20, 6, 1)
INSERT [dbo].[Groups] ([Id], [Name], [ClassroomId], [TeacherId], [MentorId], [Capacity], [EducationProgramId], [Status]) VALUES (10, N'P215', 3, 6, 15, 12, 7, 1)
INSERT [dbo].[Groups] ([Id], [Name], [ClassroomId], [TeacherId], [MentorId], [Capacity], [EducationProgramId], [Status]) VALUES (11, N'P216', 2, 1, 16, 14, 4, 1)
INSERT [dbo].[Groups] ([Id], [Name], [ClassroomId], [TeacherId], [MentorId], [Capacity], [EducationProgramId], [Status]) VALUES (12, N'P217', 1, 7, 14, 21, 1, 0)
INSERT [dbo].[Groups] ([Id], [Name], [ClassroomId], [TeacherId], [MentorId], [Capacity], [EducationProgramId], [Status]) VALUES (13, N'P217', 1, 7, 14, 21, 1, 0)
INSERT [dbo].[Groups] ([Id], [Name], [ClassroomId], [TeacherId], [MentorId], [Capacity], [EducationProgramId], [Status]) VALUES (14, N'P217', 1, 7, 14, 21, 1, 0)
INSERT [dbo].[Groups] ([Id], [Name], [ClassroomId], [TeacherId], [MentorId], [Capacity], [EducationProgramId], [Status]) VALUES (15, N'P217', 1, 7, 14, 21, 1, 0)
INSERT [dbo].[Groups] ([Id], [Name], [ClassroomId], [TeacherId], [MentorId], [Capacity], [EducationProgramId], [Status]) VALUES (16, N'P217', 4, 7, 13, 22, 1, 1)
INSERT [dbo].[Groups] ([Id], [Name], [ClassroomId], [TeacherId], [MentorId], [Capacity], [EducationProgramId], [Status]) VALUES (17, N'P218', 7, 4, 16, 23, 5, 0)
SET IDENTITY_INSERT [dbo].[Groups] OFF
SET IDENTITY_INSERT [dbo].[Positions] ON 

INSERT [dbo].[Positions] ([Id], [Name], [Status]) VALUES (1, N'CEO', 1)
INSERT [dbo].[Positions] ([Id], [Name], [Status]) VALUES (2, N'Consultant', 1)
INSERT [dbo].[Positions] ([Id], [Name], [Status]) VALUES (3, N'Receptionist', 1)
INSERT [dbo].[Positions] ([Id], [Name], [Status]) VALUES (4, N'Mentor', 1)
INSERT [dbo].[Positions] ([Id], [Name], [Status]) VALUES (5, N'Maid', 1)
INSERT [dbo].[Positions] ([Id], [Name], [Status]) VALUES (6, N'header', 0)
INSERT [dbo].[Positions] ([Id], [Name], [Status]) VALUES (7, N'cs4', 0)
SET IDENTITY_INSERT [dbo].[Positions] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [Name], [Surname], [Email], [Phone], [Fee], [GroupId], [TaskId], [Status]) VALUES (1, N'Qesem', N'Qarayev', N'Qesem@code.edu.az', N'0553304456', 3500.0000, 1, 1, 1)
INSERT [dbo].[Students] ([Id], [Name], [Surname], [Email], [Phone], [Fee], [GroupId], [TaskId], [Status]) VALUES (3, N'Rustem', N'Seydayev', N'Rustem@code.edu.az', N'0774352354', 2500.0000, 3, 3, 1)
INSERT [dbo].[Students] ([Id], [Name], [Surname], [Email], [Phone], [Fee], [GroupId], [TaskId], [Status]) VALUES (6, N'Murad', N'Babazade', N'Murad@code.edu.az', N'0551243241', 2000.0000, 1, 3, 1)
INSERT [dbo].[Students] ([Id], [Name], [Surname], [Email], [Phone], [Fee], [GroupId], [TaskId], [Status]) VALUES (11, N'Ekber', N'Amanov', N'Ekber@code.edu.az', N'0514325235', 1500.0000, 8, 5, 1)
INSERT [dbo].[Students] ([Id], [Name], [Surname], [Email], [Phone], [Fee], [GroupId], [TaskId], [Status]) VALUES (17, N'Heyder', N'Ekberli', N'Heyder@code.edu.az', N'0703542523', 1500.0000, 10, 3, 1)
INSERT [dbo].[Students] ([Id], [Name], [Surname], [Email], [Phone], [Fee], [GroupId], [TaskId], [Status]) VALUES (21, N'Pervin', N'Pasazade', N'pervin@code.edu.az', N'0774536575', 1000.0000, 1, 6, NULL)
SET IDENTITY_INSERT [dbo].[Students] OFF
SET IDENTITY_INSERT [dbo].[Tasks] ON 

INSERT [dbo].[Tasks] ([Id], [Name], [Deadline], [GroupId], [Status]) VALUES (1, N'Flexbox', CAST(N'2019-05-31T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Tasks] ([Id], [Name], [Deadline], [GroupId], [Status]) VALUES (2, N'HTML', CAST(N'2019-05-30T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[Tasks] ([Id], [Name], [Deadline], [GroupId], [Status]) VALUES (3, N'Position', CAST(N'2019-05-29T00:00:00.000' AS DateTime), 3, 1)
INSERT [dbo].[Tasks] ([Id], [Name], [Deadline], [GroupId], [Status]) VALUES (5, N'Responsivety', CAST(N'2019-05-28T00:00:00.000' AS DateTime), 8, 1)
INSERT [dbo].[Tasks] ([Id], [Name], [Deadline], [GroupId], [Status]) VALUES (6, N'Events', CAST(N'2019-05-27T00:00:00.000' AS DateTime), 9, 1)
INSERT [dbo].[Tasks] ([Id], [Name], [Deadline], [GroupId], [Status]) VALUES (8, N'Bootstrap', CAST(N'2019-05-26T00:00:00.000' AS DateTime), 10, 1)
INSERT [dbo].[Tasks] ([Id], [Name], [Deadline], [GroupId], [Status]) VALUES (9, N'c## Basic', CAST(N'2019-05-25T00:00:00.000' AS DateTime), 11, 1)
INSERT [dbo].[Tasks] ([Id], [Name], [Deadline], [GroupId], [Status]) VALUES (10, N'Borderbox', CAST(N'2019-06-01T00:00:00.000' AS DateTime), 11, 0)
INSERT [dbo].[Tasks] ([Id], [Name], [Deadline], [GroupId], [Status]) VALUES (11, N'Borderbox', CAST(N'2109-06-01T00:00:00.000' AS DateTime), 13, 0)
INSERT [dbo].[Tasks] ([Id], [Name], [Deadline], [GroupId], [Status]) VALUES (12, N'Border', CAST(N'2019-05-31T00:00:00.000' AS DateTime), 11, 0)
INSERT [dbo].[Tasks] ([Id], [Name], [Deadline], [GroupId], [Status]) VALUES (13, N'border', CAST(N'2019-05-31T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Tasks] ([Id], [Name], [Deadline], [GroupId], [Status]) VALUES (14, N'ssss', CAST(N'2019-05-30T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Tasks] ([Id], [Name], [Deadline], [GroupId], [Status]) VALUES (15, N'border', CAST(N'2019-05-31T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Tasks] ([Id], [Name], [Deadline], [GroupId], [Status]) VALUES (16, N'border1', CAST(N'2019-06-09T00:00:00.000' AS DateTime), 11, 0)
SET IDENTITY_INSERT [dbo].[Tasks] OFF
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([Id], [Name], [Surname], [SpecialityId], [Email], [Phone], [Status]) VALUES (1, N'Settar', N'Amrahov', 1, N'Sattar@code.edu.az', N'0514669934', 1)
INSERT [dbo].[Teachers] ([Id], [Name], [Surname], [SpecialityId], [Email], [Phone], [Status]) VALUES (2, N'Knyaz', N'Yaqubov', 2, N'Knyaz@code.edu.az', N'0554384953', 1)
INSERT [dbo].[Teachers] ([Id], [Name], [Surname], [SpecialityId], [Email], [Phone], [Status]) VALUES (4, N'Orxan', N'Memmedov', 3, N'Orxan@code.edu.az', N'0505431365', 1)
INSERT [dbo].[Teachers] ([Id], [Name], [Surname], [SpecialityId], [Email], [Phone], [Status]) VALUES (5, N'Elnur', N'Ibrahimzade', 4, N'Elnur@code.edu.az', N'0703423543', 1)
INSERT [dbo].[Teachers] ([Id], [Name], [Surname], [SpecialityId], [Email], [Phone], [Status]) VALUES (6, N'Sebine', N'Besirova', 5, N'Sebine@code.edu.az', N'0774334626', 1)
INSERT [dbo].[Teachers] ([Id], [Name], [Surname], [SpecialityId], [Email], [Phone], [Status]) VALUES (7, N'a', N'b', 2, N'', N'', 0)
INSERT [dbo].[Teachers] ([Id], [Name], [Surname], [SpecialityId], [Email], [Phone], [Status]) VALUES (8, N'Samir', N'Dadaszade', 1, N'Samir@code.edu.az', N'0554354535', 1)
INSERT [dbo].[Teachers] ([Id], [Name], [Surname], [SpecialityId], [Email], [Phone], [Status]) VALUES (9, N'Adil', N'Babazade', 1, N'Adil@code.edu.az', N'0551242341', 0)
INSERT [dbo].[Teachers] ([Id], [Name], [Surname], [SpecialityId], [Email], [Phone], [Status]) VALUES (20, N'', N'', 7, N'', N'', 0)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
ALTER TABLE [dbo].[Classrooms] ADD  CONSTRAINT [DF_Classrooms_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Educations] ADD  CONSTRAINT [DF_Educations_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Employees] ADD  CONSTRAINT [DF_Employees_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Groups] ADD  CONSTRAINT [DF_Groups_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Positions] ADD  CONSTRAINT [DF_Positions_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [DF_Students_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Teachers] ADD  CONSTRAINT [DF_Teachers_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Positions] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Positions] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Positions]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Classrooms] FOREIGN KEY([ClassroomId])
REFERENCES [dbo].[Classrooms] ([Id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Classrooms]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Educations] FOREIGN KEY([EducationProgramId])
REFERENCES [dbo].[Educations] ([Id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Educations]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Employees] FOREIGN KEY([MentorId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Employees]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Teachers1] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([Id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Teachers1]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Groups]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Tasks] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Tasks] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Tasks]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Groups]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_Educations] FOREIGN KEY([SpecialityId])
REFERENCES [dbo].[Educations] ([Id])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_Educations]
GO
USE [master]
GO
ALTER DATABASE [FrontTask] SET  READ_WRITE 
GO
