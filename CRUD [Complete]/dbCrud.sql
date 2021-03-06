USE [master]
GO
/****** Object:  Database [dbCrud]    Script Date: 26/09/2016 4:46:07 PM ******/
CREATE DATABASE [dbCrud]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbCrud', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.LEMONDEV\MSSQL\DATA\dbCrud.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbCrud_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.LEMONDEV\MSSQL\DATA\dbCrud_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbCrud] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbCrud].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbCrud] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbCrud] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbCrud] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbCrud] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbCrud] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbCrud] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbCrud] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbCrud] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbCrud] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbCrud] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbCrud] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbCrud] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbCrud] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbCrud] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbCrud] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbCrud] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbCrud] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbCrud] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbCrud] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbCrud] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbCrud] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbCrud] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbCrud] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbCrud] SET  MULTI_USER 
GO
ALTER DATABASE [dbCrud] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbCrud] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbCrud] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbCrud] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [dbCrud] SET DELAYED_DURABILITY = DISABLED 
GO
USE [dbCrud]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 26/09/2016 4:46:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[Email] [nvarchar](100) NULL,
	[UserType] [nvarchar](20) NULL,
	[Status] [nvarchar](20) NULL,
	[DateAdded] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Birthday], [Email], [UserType], [Status], [DateAdded]) VALUES (1, N'Steven', N'Tomas', CAST(N'1993-01-01' AS Date), N'steven.tomas@live.com', N'Guest', N'Active', CAST(N'2016-10-26 00:00:00.000' AS DateTime))
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Birthday], [Email], [UserType], [Status], [DateAdded]) VALUES (2, N'Rafael', N'Ramos', CAST(N'1995-01-01' AS Date), N'rafael.ramos@live.com', N'Guest', N'Active', CAST(N'2016-10-26 00:00:00.000' AS DateTime))
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Birthday], [Email], [UserType], [Status], [DateAdded]) VALUES (3, N'Lawrence', N'Corpus', CAST(N'1996-01-01' AS Date), N'lawrence.corpus@live.com', N'Client', N'Active', CAST(N'2016-10-26 00:00:00.000' AS DateTime))
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Birthday], [Email], [UserType], [Status], [DateAdded]) VALUES (4, N'Klaine', N'Mendoza', CAST(N'1997-02-12' AS Date), N'klaine.mendoza@yahoo.com', N'Client', N'Active', CAST(N'2016-10-26 00:00:00.000' AS DateTime))
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Birthday], [Email], [UserType], [Status], [DateAdded]) VALUES (5, N'Isaac', N'Maestro', CAST(N'1996-02-21' AS Date), N'sak.isaac@gmail.com', N'Client', N'Active', CAST(N'2016-10-26 00:00:00.000' AS DateTime))
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Birthday], [Email], [UserType], [Status], [DateAdded]) VALUES (7, N'Mika', N'Zabate', CAST(N'1993-04-13' AS Date), N'mika.z@gmail.com', N'Guest', N'Active', CAST(N'2016-09-26 16:38:52.663' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
USE [master]
GO
ALTER DATABASE [dbCrud] SET  READ_WRITE 
GO
