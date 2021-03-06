USE [master]
GO
/****** Object:  Database [Interpol]    Script Date: 26.06.2020 0:40:37 ******/
CREATE DATABASE [Interpol]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Interpol', FILENAME = N'D:\sql17\MSSQL14.SQLEXPRESS\MSSQL\DATA\Interpol.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Interpol_log', FILENAME = N'D:\sql17\MSSQL14.SQLEXPRESS\MSSQL\DATA\Interpol_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Interpol] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Interpol].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Interpol] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Interpol] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Interpol] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Interpol] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Interpol] SET ARITHABORT OFF 
GO
ALTER DATABASE [Interpol] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Interpol] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Interpol] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Interpol] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Interpol] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Interpol] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Interpol] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Interpol] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Interpol] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Interpol] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Interpol] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Interpol] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Interpol] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Interpol] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Interpol] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Interpol] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Interpol] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Interpol] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Interpol] SET  MULTI_USER 
GO
ALTER DATABASE [Interpol] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Interpol] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Interpol] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Interpol] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Interpol] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Interpol] SET QUERY_STORE = OFF
GO
USE [Interpol]
GO
/****** Object:  Table [dbo].[Belongs]    Script Date: 26.06.2020 0:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Belongs](
	[ID_Criminal] [int] NOT NULL,
	[ID_Grouping] [int] NOT NULL,
	[Position] [nvarchar](50) NULL,
 CONSTRAINT [XPKBelongs] PRIMARY KEY CLUSTERED 
(
	[ID_Criminal] ASC,
	[ID_Grouping] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Case]    Script Date: 26.06.2020 0:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Case](
	[ID_Case] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Case] PRIMARY KEY CLUSTERED 
(
	[ID_Case] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 26.06.2020 0:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[ID_City] [int] NOT NULL,
	[ID_Country] [int] NULL,
 CONSTRAINT [XPKCity] PRIMARY KEY CLUSTERED 
(
	[ID_City] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 26.06.2020 0:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[ID_Country] [int] IDENTITY(1,1) NOT NULL,
	[Country_Name] [nvarchar](50) NULL,
 CONSTRAINT [XPKCountry] PRIMARY KEY CLUSTERED 
(
	[ID_Country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criminal]    Script Date: 26.06.2020 0:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criminal](
	[ID_Criminal] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Nickname] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[BirthdayDate] [date] NULL,
	[DangerLevel] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[DeathDate] [nvarchar](50) NULL,
 CONSTRAINT [XPKCriminal] PRIMARY KEY CLUSTERED 
(
	[ID_Criminal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grouping]    Script Date: 26.06.2020 0:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grouping](
	[ID_Grouping] [int] IDENTITY(1,1) NOT NULL,
	[Name_Grouping] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[DangerLevel] [nvarchar](50) NULL,
 CONSTRAINT [XPKID_Grouping] PRIMARY KEY CLUSTERED 
(
	[ID_Grouping] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lang_Crim]    Script Date: 26.06.2020 0:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lang_Crim](
	[ID_Criminal] [int] NOT NULL,
	[ID_L] [int] NOT NULL,
 CONSTRAINT [XPKLang_Crim] PRIMARY KEY CLUSTERED 
(
	[ID_Criminal] ASC,
	[ID_L] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 26.06.2020 0:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[ID_L] [int] NOT NULL,
	[Language] [char](18) NULL,
 CONSTRAINT [XPKLanguage] PRIMARY KEY CLUSTERED 
(
	[ID_L] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log_Pas]    Script Date: 26.06.2020 0:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log_Pas](
	[Username] [char](18) NOT NULL,
	[Password] [char](18) NULL,
 CONSTRAINT [XPKLog_Pas] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MainInfo]    Script Date: 26.06.2020 0:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainInfo](
	[ID_some] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Nickname] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[BirthdayDate] [date] NULL,
	[DangerLevel] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[DeathDate] [nvarchar](50) NULL,
	[Name_Grouping] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_some_from_tables] PRIMARY KEY CLUSTERED 
(
	[ID_some] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passed]    Script Date: 26.06.2020 0:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passed](
	[ID_Criminal] [int] NOT NULL,
	[ID_Case] [int] NOT NULL,
 CONSTRAINT [XPKPassed] PRIMARY KEY CLUSTERED 
(
	[ID_Criminal] ASC,
	[ID_Case] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profession]    Script Date: 26.06.2020 0:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profession](
	[ID_Profession] [int] IDENTITY(1,1) NOT NULL,
	[Name_Prof] [char](18) NULL,
 CONSTRAINT [XPKProfession] PRIMARY KEY CLUSTERED 
(
	[ID_Profession] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Signs]    Script Date: 26.06.2020 0:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Signs](
	[ID_Criminal] [int] NOT NULL,
	[Tall] [nvarchar](50) NULL,
	[EyeColor] [nvarchar](50) NULL,
	[HairColor] [nvarchar](50) NULL,
	[Special_Signs] [nvarchar](50) NULL,
 CONSTRAINT [XPKSigns] PRIMARY KEY CLUSTERED 
(
	[ID_Criminal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speciality]    Script Date: 26.06.2020 0:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speciality](
	[ID_Profession] [int] NOT NULL,
	[ID_Criminal] [int] NOT NULL,
 CONSTRAINT [XPKSpeciality] PRIMARY KEY CLUSTERED 
(
	[ID_Profession] ASC,
	[ID_Criminal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Belongs]  WITH CHECK ADD  CONSTRAINT [R_15] FOREIGN KEY([ID_Criminal])
REFERENCES [dbo].[Criminal] ([ID_Criminal])
GO
ALTER TABLE [dbo].[Belongs] CHECK CONSTRAINT [R_15]
GO
ALTER TABLE [dbo].[Belongs]  WITH CHECK ADD  CONSTRAINT [R_16] FOREIGN KEY([ID_Grouping])
REFERENCES [dbo].[Grouping] ([ID_Grouping])
GO
ALTER TABLE [dbo].[Belongs] CHECK CONSTRAINT [R_16]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [R_1] FOREIGN KEY([ID_Country])
REFERENCES [dbo].[Country] ([ID_Country])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [R_1]
GO
ALTER TABLE [dbo].[Lang_Crim]  WITH CHECK ADD  CONSTRAINT [R_10] FOREIGN KEY([ID_Criminal])
REFERENCES [dbo].[Criminal] ([ID_Criminal])
GO
ALTER TABLE [dbo].[Lang_Crim] CHECK CONSTRAINT [R_10]
GO
ALTER TABLE [dbo].[Lang_Crim]  WITH CHECK ADD  CONSTRAINT [R_11] FOREIGN KEY([ID_L])
REFERENCES [dbo].[Language] ([ID_L])
GO
ALTER TABLE [dbo].[Lang_Crim] CHECK CONSTRAINT [R_11]
GO
ALTER TABLE [dbo].[Passed]  WITH CHECK ADD  CONSTRAINT [FK_Passed_Case] FOREIGN KEY([ID_Case])
REFERENCES [dbo].[Case] ([ID_Case])
GO
ALTER TABLE [dbo].[Passed] CHECK CONSTRAINT [FK_Passed_Case]
GO
ALTER TABLE [dbo].[Passed]  WITH CHECK ADD  CONSTRAINT [R_2] FOREIGN KEY([ID_Criminal])
REFERENCES [dbo].[Criminal] ([ID_Criminal])
GO
ALTER TABLE [dbo].[Passed] CHECK CONSTRAINT [R_2]
GO
ALTER TABLE [dbo].[Signs]  WITH CHECK ADD  CONSTRAINT [R_14] FOREIGN KEY([ID_Criminal])
REFERENCES [dbo].[Criminal] ([ID_Criminal])
GO
ALTER TABLE [dbo].[Signs] CHECK CONSTRAINT [R_14]
GO
ALTER TABLE [dbo].[Speciality]  WITH CHECK ADD  CONSTRAINT [R_12] FOREIGN KEY([ID_Profession])
REFERENCES [dbo].[Profession] ([ID_Profession])
GO
ALTER TABLE [dbo].[Speciality] CHECK CONSTRAINT [R_12]
GO
ALTER TABLE [dbo].[Speciality]  WITH CHECK ADD  CONSTRAINT [R_13] FOREIGN KEY([ID_Criminal])
REFERENCES [dbo].[Criminal] ([ID_Criminal])
GO
ALTER TABLE [dbo].[Speciality] CHECK CONSTRAINT [R_13]
GO
USE [master]
GO
ALTER DATABASE [Interpol] SET  READ_WRITE 
GO
