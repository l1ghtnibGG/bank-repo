USE [master]
GO
/****** Object:  Database [Innowise]    Script Date: 20.12.2021 16:01:31 ******/
CREATE DATABASE [Innowise]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Innowise', FILENAME = N'E:\SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Innowise.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Innowise_log', FILENAME = N'E:\SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Innowise_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Innowise] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Innowise].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Innowise] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Innowise] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Innowise] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Innowise] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Innowise] SET ARITHABORT OFF 
GO
ALTER DATABASE [Innowise] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Innowise] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Innowise] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Innowise] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Innowise] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Innowise] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Innowise] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Innowise] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Innowise] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Innowise] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Innowise] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Innowise] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Innowise] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Innowise] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Innowise] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Innowise] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Innowise] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Innowise] SET RECOVERY FULL 
GO
ALTER DATABASE [Innowise] SET  MULTI_USER 
GO
ALTER DATABASE [Innowise] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Innowise] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Innowise] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Innowise] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Innowise] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Innowise', N'ON'
GO
ALTER DATABASE [Innowise] SET QUERY_STORE = OFF
GO
USE [Innowise]
GO
/****** Object:  Table [dbo].[Банки]    Script Date: 20.12.2021 16:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Банки](
	[Id] [int] NOT NULL,
	[Название банка] [nvarchar](50) NOT NULL,
	[Город] [nvarchar](50) NOT NULL,
	[Баланс аккаунта] [money] NOT NULL,
 CONSTRAINT [PK_Банки] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Карточки]    Script Date: 20.12.2021 16:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Карточки](
	[id] [int] NOT NULL,
	[Название карты] [nvarchar](50) NOT NULL,
	[Название банка] [nvarchar](50) NOT NULL,
	[Баланс] [money] NOT NULL,
	[idКлиента] [int] NOT NULL,
 CONSTRAINT [PK_Карточки] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 20.12.2021 16:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[id] [int] NOT NULL,
	[Фамилия] [nchar](10) NOT NULL,
	[Имя] [nchar](10) NOT NULL,
	[Отчество] [nchar](10) NOT NULL,
	[Соц статус] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Клиенты] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Промежуточная]    Script Date: 20.12.2021 16:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Промежуточная](
	[idКлиента] [int] NOT NULL,
	[idБанка] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Карточки]  WITH CHECK ADD  CONSTRAINT [FK_Карточки_Клиенты] FOREIGN KEY([idКлиента])
REFERENCES [dbo].[Клиенты] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Карточки] CHECK CONSTRAINT [FK_Карточки_Клиенты]
GO
ALTER TABLE [dbo].[Промежуточная]  WITH CHECK ADD  CONSTRAINT [FK_Промежуточная_Банки] FOREIGN KEY([idБанка])
REFERENCES [dbo].[Банки] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Промежуточная] CHECK CONSTRAINT [FK_Промежуточная_Банки]
GO
ALTER TABLE [dbo].[Промежуточная]  WITH CHECK ADD  CONSTRAINT [FK_Промежуточная_Клиенты] FOREIGN KEY([idКлиента])
REFERENCES [dbo].[Клиенты] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Промежуточная] CHECK CONSTRAINT [FK_Промежуточная_Клиенты]
GO
/****** Object:  StoredProcedure [dbo].[AddMoney]    Script Date: 20.12.2021 16:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddMoney]
AS
BEGIN
SET NOCOUNT ON
 
SELECT Клиенты.Фамилия, Клиенты.Имя, Банки.[Название банка], Банки.[Баланс аккаунта] + 10   
FROM  Банки JOIN Клиенты ON Клиенты.id = Банки.Id
WHERE Клиенты.[Соц статус] = 'Трудоспособный'
 
END
GO
/****** Object:  StoredProcedure [dbo].[Trans]    Script Date: 20.12.2021 16:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Trans] 
AS
BEGIN
DECLARE @ver INT
SET @ver = (SELECT Банки.[Баланс аккаунта] FROM Банки WHERE Банки.Id = 1);
IF @ver >= 100 
BEGIN
BEGIN TRANSACTION
    UPDATE Банки SET [Баланс аккаунта] = [Баланс аккаунта] - 100 WHERE Id = 1;
	UPDATE Карточки SET Баланс = Баланс + 100 WHERE idКлиента = 1;
	COMMIT;
	END;
END;
GO
USE [master]
GO
ALTER DATABASE [Innowise] SET  READ_WRITE 
GO
