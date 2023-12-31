USE [master]
GO
/****** Object:  Database [USERDB]    Script Date: 9/13/2023 11:48:19 AM ******/
CREATE DATABASE [USERDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'USERDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\USERDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'USERDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\USERDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [USERDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [USERDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [USERDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [USERDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [USERDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [USERDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [USERDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [USERDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [USERDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [USERDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [USERDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [USERDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [USERDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [USERDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [USERDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [USERDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [USERDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [USERDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [USERDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [USERDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [USERDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [USERDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [USERDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [USERDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [USERDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [USERDB] SET  MULTI_USER 
GO
ALTER DATABASE [USERDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [USERDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [USERDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [USERDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [USERDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [USERDB]
GO
/****** Object:  Table [dbo].[user_tbl]    Script Date: 9/13/2023 11:48:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_tbl](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[MobileNumber] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_user_tbl] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [USERDB] SET  READ_WRITE 
GO
