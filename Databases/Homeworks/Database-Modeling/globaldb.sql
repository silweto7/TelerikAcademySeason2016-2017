USE [master]
GO
/****** Object:  Database [GlobalDB]    Script Date: 10/22/2016 11:02:30 AM ******/
CREATE DATABASE [GlobalDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GlobalDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.EXPRESS\MSSQL\DATA\GlobalDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GlobalDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.EXPRESS\MSSQL\DATA\GlobalDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GlobalDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GlobalDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GlobalDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GlobalDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GlobalDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GlobalDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GlobalDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [GlobalDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GlobalDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GlobalDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GlobalDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GlobalDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GlobalDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GlobalDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GlobalDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GlobalDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GlobalDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GlobalDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GlobalDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GlobalDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GlobalDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GlobalDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GlobalDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GlobalDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GlobalDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GlobalDB] SET  MULTI_USER 
GO
ALTER DATABASE [GlobalDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GlobalDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GlobalDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GlobalDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [GlobalDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [GlobalDB]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 10/22/2016 11:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AddressText] [nvarchar](50) NULL,
	[TownId] [int] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Continents]    Script Date: 10/22/2016 11:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
 CONSTRAINT [PK_Continents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 10/22/2016 11:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
	[ContinentId] [int] NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Persons]    Script Date: 10/22/2016 11:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Towns]    Script Date: 10/22/2016 11:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Towns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_Towns] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Towns] FOREIGN KEY([TownId])
REFERENCES [dbo].[Towns] ([Id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Towns]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [ FK_Continents_Countries] FOREIGN KEY([ContinentId])
REFERENCES [dbo].[Continents] ([Id])
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [ FK_Continents_Countries]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_Addresses] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([Id])
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_Addresses]
GO
ALTER TABLE [dbo].[Towns]  WITH CHECK ADD  CONSTRAINT [FK_Towns_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Towns] CHECK CONSTRAINT [FK_Towns_Countries]
GO
USE [master]
GO
ALTER DATABASE [GlobalDB] SET  READ_WRITE 
GO
