USE [master]
GO
/****** Object:  Database [pap_Diogo]    Script Date: 11/07/2022 12:10:19 ******/
CREATE DATABASE [pap_Diogo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pap_Diogo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\pap_Diogo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pap_Diogo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\pap_Diogo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [pap_Diogo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pap_Diogo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pap_Diogo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pap_Diogo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pap_Diogo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pap_Diogo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pap_Diogo] SET ARITHABORT OFF 
GO
ALTER DATABASE [pap_Diogo] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [pap_Diogo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pap_Diogo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pap_Diogo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pap_Diogo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pap_Diogo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pap_Diogo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pap_Diogo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pap_Diogo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pap_Diogo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [pap_Diogo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pap_Diogo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pap_Diogo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pap_Diogo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pap_Diogo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pap_Diogo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pap_Diogo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pap_Diogo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [pap_Diogo] SET  MULTI_USER 
GO
ALTER DATABASE [pap_Diogo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pap_Diogo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pap_Diogo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pap_Diogo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pap_Diogo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [pap_Diogo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [pap_Diogo] SET QUERY_STORE = OFF
GO
USE [pap_Diogo]
GO
/****** Object:  Table [dbo].[Animal]    Script Date: 11/07/2022 12:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal](
	[ID_animal] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](150) NOT NULL,
	[Género] [nvarchar](50) NOT NULL,
	[Idade] [nvarchar](50) NOT NULL,
	[Porte] [nvarchar](50) NULL,
	[Foto] [nvarchar](100) NOT NULL,
	[Características] [nvarchar](500) NULL,
	[Data de publicaçao] [datetime2](7) NULL,
	[Raça] [int] NULL,
	[Cor] [nvarchar](50) NULL,
	[Instituiçao] [nvarchar](50) NULL,
	[Data de adoção final] [datetime2](7) NULL,
	[Data adoçao] [datetime2](7) NULL,
	[Utilizador] [nvarchar](50) NULL,
	[Desparazitado] [bit] NULL,
	[Vacinas] [nvarchar](500) NULL,
	[Esterilizado] [bit] NULL,
	[Descriçao] [nvarchar](500) NULL,
	[Concelho] [int] NULL,
 CONSTRAINT [PK__Animal__8A011B3ECF8AAE08] PRIMARY KEY CLUSTERED 
(
	[ID_animal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 11/07/2022 12:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[ApplicationName] [nvarchar](235) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Concelho]    Script Date: 11/07/2022 12:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concelho](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](150) NOT NULL,
	[Distrito] [int] NULL,
 CONSTRAINT [PK__Concelho__3214EC2784CD1CB3] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distrito]    Script Date: 11/07/2022 12:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distrito](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK__Distrito__3214EC2737880149] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favoritos]    Script Date: 11/07/2022 12:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favoritos](
	[Favorito_id] [int] IDENTITY(1,1) NOT NULL,
	[Utilizador] [nvarchar](50) NULL,
	[Animal] [int] NULL,
 CONSTRAINT [PK_Favoritos] PRIMARY KEY CLUSTERED 
(
	[Favorito_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instituiçao]    Script Date: 11/07/2022 12:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instituiçao](
	[ID_Instituiçao] [nvarchar](50) NOT NULL,
	[Nome] [nvarchar](150) NOT NULL,
	[Morada] [nvarchar](150) NULL,
	[Localidade] [nvarchar](150) NULL,
	[Código Postal] [nchar](8) NULL,
	[Telefone] [nchar](9) NULL,
	[Telemóvel] [nchar](9) NULL,
	[Email] [nvarchar](150) NOT NULL,
	[URL] [nvarchar](150) NULL,
	[Latitude] [nvarchar](150) NULL,
	[Longitude] [nvarchar](150) NULL,
	[3 Words] [nvarchar](150) NULL,
	[Concelho] [int] NULL,
	[Data de registo] [datetime2](7) NULL,
 CONSTRAINT [PK__Institui__BB4AC9392E9AF7F3] PRIMARY KEY CLUSTERED 
(
	[ID_Instituiçao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Memberships]    Script Date: 11/07/2022 12:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Memberships](
	[UserId] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowsStart] [datetime] NOT NULL,
	[Comment] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profiles]    Script Date: 11/07/2022 12:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profiles](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [nvarchar](max) NOT NULL,
	[PropertyValueStrings] [nvarchar](max) NOT NULL,
	[PropertyValueBinary] [varbinary](max) NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Raça]    Script Date: 11/07/2022 12:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Raça](
	[ID_Raça] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](150) NOT NULL,
	[Características] [nvarchar](500) NULL,
	[Foto] [nvarchar](100) NOT NULL,
	[Tipo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Raça] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Raça_Utilizador]    Script Date: 11/07/2022 12:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Raça_Utilizador](
	[Raça] [int] NULL,
	[Utilizador] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/07/2022 12:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo]    Script Date: 11/07/2022 12:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo](
	[ID_Tipo] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/07/2022 12:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersInRoles]    Script Date: 11/07/2022 12:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utilizador]    Script Date: 11/07/2022 12:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utilizador](
	[ID_Utilizador] [nvarchar](50) NOT NULL,
	[Nome] [nvarchar](150) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[Telefone] [nchar](9) NULL,
	[Data de registo] [datetime2](7) NULL,
	[Concelho] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Utilizador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utilizador_Animal]    Script Date: 11/07/2022 12:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utilizador_Animal](
	[Utilizador_Animal] [int] IDENTITY(1,1) NOT NULL,
	[Utilizador] [nvarchar](50) NULL,
	[Animal] [int] NULL,
 CONSTRAINT [PK_Utilizador_Animal] PRIMARY KEY CLUSTERED 
(
	[Utilizador_Animal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UtilizadorInteresse]    Script Date: 11/07/2022 12:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UtilizadorInteresse](
	[ID_UtilizadorInteresse] [int] IDENTITY(1,1) NOT NULL,
	[Distrito] [int] NULL,
	[Concelho] [int] NULL,
	[Tipo] [int] NULL,
	[Raça] [int] NULL,
	[Idade] [nvarchar](50) NULL,
	[Porte] [nvarchar](50) NULL,
	[Género] [nvarchar](50) NULL,
	[Utilizador] [nvarchar](50) NULL,
 CONSTRAINT [pkUtilizadorInteresse] PRIMARY KEY CLUSTERED 
(
	[ID_UtilizadorInteresse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Animal] ON 
GO
INSERT [dbo].[Animal] ([ID_animal], [Nome], [Género], [Idade], [Porte], [Foto], [Características], [Data de publicaçao], [Raça], [Cor], [Instituiçao], [Data de adoção final], [Data adoçao], [Utilizador], [Desparazitado], [Vacinas], [Esterilizado], [Descriçao], [Concelho]) VALUES (5, N'sheila', N'Feminino', N'Sénior', N'Pequeno', N'~/imgs/fecb5524-6cef-4403-aeba-2756070551bc_gato-persa.jpg', N'gato peludo', CAST(N'2022-06-01T00:00:00.0000000' AS DateTime2), 9, N'branco escuro', N'9a6c7546-bfe3-467b-9160-ecf3570b738b', NULL, CAST(N'2022-02-25T00:00:00.0000000' AS DateTime2), N'f1bba87c-9a84-4814-a931-46e294470f0f', 1, N'uma vacina teste', 1, N'um gato pequeno e peludo', 132)
GO
INSERT [dbo].[Animal] ([ID_animal], [Nome], [Género], [Idade], [Porte], [Foto], [Características], [Data de publicaçao], [Raça], [Cor], [Instituiçao], [Data de adoção final], [Data adoçao], [Utilizador], [Desparazitado], [Vacinas], [Esterilizado], [Descriçao], [Concelho]) VALUES (6, N'tostas', N'Masculino', N'Bebé', N'Médio', N'~/imgs/d09447fb-f544-4c53-8ad9-8fbd50840ff0_dog image.jpg', N'cao medio', CAST(N'2022-06-06T00:00:00.0000000' AS DateTime2), 8, N'preto e castanho', N'9a6c7546-bfe3-467b-9160-ecf3570b738b', NULL, CAST(N'2022-05-16T00:00:00.0000000' AS DateTime2), N'f1bba87c-9a84-4814-a931-46e294470f0f', 1, N'uma vacina teste', 1, N'uma cao de porte grande', 60)
GO
INSERT [dbo].[Animal] ([ID_animal], [Nome], [Género], [Idade], [Porte], [Foto], [Características], [Data de publicaçao], [Raça], [Cor], [Instituiçao], [Data de adoção final], [Data adoçao], [Utilizador], [Desparazitado], [Vacinas], [Esterilizado], [Descriçao], [Concelho]) VALUES (8, N'boxer', N'Masculino', N'Sénior', N'Médio', N'~/imgs/dc6c4ca8-7c41-4095-9285-713ba4c5f862_Boxer.jfif', N'cao medio', CAST(N'2022-06-06T00:00:00.0000000' AS DateTime2), 10, N'branco e castanho', N'9a6c7546-bfe3-467b-9160-ecf3570b738b', NULL, NULL, NULL, 1, N'uma vacina teste', 0, N'uma cao de porte grande', 24)
GO
INSERT [dbo].[Animal] ([ID_animal], [Nome], [Género], [Idade], [Porte], [Foto], [Características], [Data de publicaçao], [Raça], [Cor], [Instituiçao], [Data de adoção final], [Data adoçao], [Utilizador], [Desparazitado], [Vacinas], [Esterilizado], [Descriçao], [Concelho]) VALUES (9, N'Guga', N'Feminino', N'Bebé', N'Pequeno', N'~/imgs/6e4cbb18-0b77-40f0-8947-32e3a3839e34_boxer bebe.jfif', N'cao bebe', CAST(N'2022-06-08T00:00:00.0000000' AS DateTime2), 10, N'castanho', N'766b459c-f322-48a0-b1ce-aec14a177af2', CAST(N'2022-07-04T15:11:08.0573711' AS DateTime2), CAST(N'2022-07-04T15:10:51.9127393' AS DateTime2), N'f1bba87c-9a84-4814-a931-46e294470f0f', 1, N'uma vacina teste', 1, N'um cao bebe', 154)
GO
INSERT [dbo].[Animal] ([ID_animal], [Nome], [Género], [Idade], [Porte], [Foto], [Características], [Data de publicaçao], [Raça], [Cor], [Instituiçao], [Data de adoção final], [Data adoçao], [Utilizador], [Desparazitado], [Vacinas], [Esterilizado], [Descriçao], [Concelho]) VALUES (10, N'Greg', N'Masculino', N'Bebé', N'Pequeno', N'~/imgs/d669d972-46b2-4810-aed7-73e0687acd3d_bulldogue bebe.jfif', N'cao bebe', CAST(N'2022-06-08T00:00:00.0000000' AS DateTime2), 11, N'branco e cinza', N'766b459c-f322-48a0-b1ce-aec14a177af2', NULL, NULL, NULL, 0, N'uma vacina teste', 0, N'um cao bebe', 137)
GO
INSERT [dbo].[Animal] ([ID_animal], [Nome], [Género], [Idade], [Porte], [Foto], [Características], [Data de publicaçao], [Raça], [Cor], [Instituiçao], [Data de adoção final], [Data adoçao], [Utilizador], [Desparazitado], [Vacinas], [Esterilizado], [Descriçao], [Concelho]) VALUES (11, N'Balu', N'Masculino', N'Jovem', N'Médio', N'~/imgs/9787f1aa-6939-4752-9512-f0ede17e4efb_border collie.jfif', N'amigável e sociável ', CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 18, N'preto e branco', N'9a6c7546-bfe3-467b-9160-ecf3570b738b', NULL, NULL, NULL, 1, N'vacina da raiva, Leishmaniose Canina', 1, N'um cao que adora o seu dono e dar passeios', 110)
GO
INSERT [dbo].[Animal] ([ID_animal], [Nome], [Género], [Idade], [Porte], [Foto], [Características], [Data de publicaçao], [Raça], [Cor], [Instituiçao], [Data de adoção final], [Data adoçao], [Utilizador], [Desparazitado], [Vacinas], [Esterilizado], [Descriçao], [Concelho]) VALUES (12, N'Frodo', N'Masculino', N'Jovem', N'Médio', N'~/imgs/ab933681-2ebe-4a27-837c-a190269605af_bull terrier.jfif', N'muita energia e brincalhão', CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 26, N'branco', N'9a6c7546-bfe3-467b-9160-ecf3570b738b', NULL, NULL, NULL, 1, N'vacina da raiva', 1, N'um cao branco com o olho preto que adora brincar com o dono', 158)
GO
INSERT [dbo].[Animal] ([ID_animal], [Nome], [Género], [Idade], [Porte], [Foto], [Características], [Data de publicaçao], [Raça], [Cor], [Instituiçao], [Data de adoção final], [Data adoçao], [Utilizador], [Desparazitado], [Vacinas], [Esterilizado], [Descriçao], [Concelho]) VALUES (13, N'Mickey', N'Feminino', N'Jovem', N'Médio', N'~/imgs/7443f59a-7c8c-4ad9-8260-73d6c1683bce_Dachshund.jfif', N'calmo e dócil', CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 36, N'castanho', N'9a6c7546-bfe3-467b-9160-ecf3570b738b', NULL, NULL, NULL, 1, N'vacina da raiva', 1, N'um cao calmo que gosta de acompanhar o dono', 193)
GO
INSERT [dbo].[Animal] ([ID_animal], [Nome], [Género], [Idade], [Porte], [Foto], [Características], [Data de publicaçao], [Raça], [Cor], [Instituiçao], [Data de adoção final], [Data adoçao], [Utilizador], [Desparazitado], [Vacinas], [Esterilizado], [Descriçao], [Concelho]) VALUES (14, N'Sandy', N'Feminino', N'Jovem', N'Médio', N'~/imgs/7dfd660d-6c36-436f-8cd6-b5c1b4a509db_husky.jfif', N'um cão amigável e sociável', CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 19, N'branco e castanho', N'9a6c7546-bfe3-467b-9160-ecf3570b738b', NULL, NULL, NULL, 1, N'vacina da raiva', 1, N'um cao que adora o seu dono e dar passeios', 143)
GO
INSERT [dbo].[Animal] ([ID_animal], [Nome], [Género], [Idade], [Porte], [Foto], [Características], [Data de publicaçao], [Raça], [Cor], [Instituiçao], [Data de adoção final], [Data adoçao], [Utilizador], [Desparazitado], [Vacinas], [Esterilizado], [Descriçao], [Concelho]) VALUES (15, N'Slinky', N'Masculino', N'Jovem', N'Grande', N'~/imgs/5433bd5d-5299-4181-a686-84ccd934bbf5_golden.jfif', N'amigável e sociável ', CAST(N'2022-07-04T00:00:00.0000000' AS DateTime2), 14, N'castanho', N'9a6c7546-bfe3-467b-9160-ecf3570b738b', NULL, NULL, NULL, 1, N'vacina da raiva', 1, N'um cao que adora o seu dono e dar passeios', 214)
GO
INSERT [dbo].[Animal] ([ID_animal], [Nome], [Género], [Idade], [Porte], [Foto], [Características], [Data de publicaçao], [Raça], [Cor], [Instituiçao], [Data de adoção final], [Data adoçao], [Utilizador], [Desparazitado], [Vacinas], [Esterilizado], [Descriçao], [Concelho]) VALUES (16, N'bolinha', N'Feminino', N'Adulto', N'Médio', N'~/imgs/1c110709-e292-4aee-a17d-eda0975d8fde_dogue alemao filhote.jfif', N'amigável e sociável ', CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 31, N'cinzento', N'766b459c-f322-48a0-b1ce-aec14a177af2', NULL, NULL, NULL, 1, N'vacina da raiva', 1, N'um cao que adora o seu dono e dar passeios', 157)
GO
INSERT [dbo].[Animal] ([ID_animal], [Nome], [Género], [Idade], [Porte], [Foto], [Características], [Data de publicaçao], [Raça], [Cor], [Instituiçao], [Data de adoção final], [Data adoçao], [Utilizador], [Desparazitado], [Vacinas], [Esterilizado], [Descriçao], [Concelho]) VALUES (17, N'Spock', N'Feminino', N'Jovem', N'Médio', N'~/imgs/26dd2897-5730-47a6-a30a-56235f78f16f_gato birmanes.jfif', N'gato medio', CAST(N'2022-07-07T00:00:00.0000000' AS DateTime2), 80, N'branco e cinza', N'766b459c-f322-48a0-b1ce-aec14a177af2', NULL, NULL, NULL, 1, N'uma vacina teste', 1, N'um gato pequeno e peludo', 157)
GO
INSERT [dbo].[Animal] ([ID_animal], [Nome], [Género], [Idade], [Porte], [Foto], [Características], [Data de publicaçao], [Raça], [Cor], [Instituiçao], [Data de adoção final], [Data adoçao], [Utilizador], [Desparazitado], [Vacinas], [Esterilizado], [Descriçao], [Concelho]) VALUES (18, N'faísca', N'Masculino', N'Bebé', N'Médio', N'~/imgs/b833e427-fa6b-4788-a026-135d66c42431_golden bebe.jfif', N'amigável e sociável ', CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 14, N'castanho', N'aea8f2ac-60e8-4973-bfe2-4da224d33a57', NULL, NULL, NULL, 1, N'vacina da raiva, Leishmaniose Canina', 1, N'um cao que adora o seu dono e dar passeios', 163)
GO
INSERT [dbo].[Animal] ([ID_animal], [Nome], [Género], [Idade], [Porte], [Foto], [Características], [Data de publicaçao], [Raça], [Cor], [Instituiçao], [Data de adoção final], [Data adoçao], [Utilizador], [Desparazitado], [Vacinas], [Esterilizado], [Descriçao], [Concelho]) VALUES (19, N'Benny', N'Masculino', N'Adulto', N'Grande', N'~/imgs/281367e4-f8eb-4d64-a42b-6b82557c34be_dobermann 1.png', N'muita energia e brincalhão', CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 38, N'preto e castanho', N'aea8f2ac-60e8-4973-bfe2-4da224d33a57', NULL, NULL, NULL, 1, N'vacina da raiva, Leishmaniose Canina', 1, N'uma cao de porte grande', 193)
GO
INSERT [dbo].[Animal] ([ID_animal], [Nome], [Género], [Idade], [Porte], [Foto], [Características], [Data de publicaçao], [Raça], [Cor], [Instituiçao], [Data de adoção final], [Data adoçao], [Utilizador], [Desparazitado], [Vacinas], [Esterilizado], [Descriçao], [Concelho]) VALUES (20, N'Estrela', N'Feminino', N'Bebé', N'Pequeno', N'~/imgs/e048878a-e08f-4e1f-86e3-73b92ca53402_pinscher 1.jpg', N'muita energia e brincalhão', CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 35, N'preto e castanho', N'aea8f2ac-60e8-4973-bfe2-4da224d33a57', NULL, NULL, NULL, 1, N'vacina da raiva, Leishmaniose Canina', 0, N'um cao pequeno e com muita energia', 163)
GO
INSERT [dbo].[Animal] ([ID_animal], [Nome], [Género], [Idade], [Porte], [Foto], [Características], [Data de publicaçao], [Raça], [Cor], [Instituiçao], [Data de adoção final], [Data adoçao], [Utilizador], [Desparazitado], [Vacinas], [Esterilizado], [Descriçao], [Concelho]) VALUES (21, N'Amora', N'Feminino', N'Jovem', N'Médio', N'~/imgs/d632fe59-0a59-4af4-9015-60eddba2ef25_labrador 2.jfif', N'amigável e sociável ', CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 12, N'castanho', N'aea8f2ac-60e8-4973-bfe2-4da224d33a57', NULL, NULL, NULL, 1, N'vacina da raiva, Leishmaniose Canina', 1, N'um cao que adora o seu dono e dar passeios', 158)
GO
INSERT [dbo].[Animal] ([ID_animal], [Nome], [Género], [Idade], [Porte], [Foto], [Características], [Data de publicaçao], [Raça], [Cor], [Instituiçao], [Data de adoção final], [Data adoçao], [Utilizador], [Desparazitado], [Vacinas], [Esterilizado], [Descriçao], [Concelho]) VALUES (22, N'Biscoito', N'Masculino', N'Bebé', N'Médio', N'~/imgs/e0db9b63-8b7f-4386-8759-45e464f61f7a_dalmata 2.jfif', N'amigável e sociável ', CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 35, N'branco malhado', N'aea8f2ac-60e8-4973-bfe2-4da224d33a57', NULL, NULL, NULL, 1, N'vacina da raiva, Leishmaniose Canina', 1, N'um cao que adora o seu dono e dar passeios', 170)
GO
INSERT [dbo].[Animal] ([ID_animal], [Nome], [Género], [Idade], [Porte], [Foto], [Características], [Data de publicaçao], [Raça], [Cor], [Instituiçao], [Data de adoção final], [Data adoçao], [Utilizador], [Desparazitado], [Vacinas], [Esterilizado], [Descriçao], [Concelho]) VALUES (23, N'Falcão', N'Masculino', N'Jovem', N'Grande', N'~/imgs/492f3711-0fc0-4b88-91fb-696bafabf49a_labrador 1.jfif', N'amigável e sociável ', CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 12, N'castanho', N'aea8f2ac-60e8-4973-bfe2-4da224d33a57', NULL, NULL, NULL, 1, N'vacina da raiva, Leishmaniose Canina', 1, N'amigável e sociável', 218)
GO
INSERT [dbo].[Animal] ([ID_animal], [Nome], [Género], [Idade], [Porte], [Foto], [Características], [Data de publicaçao], [Raça], [Cor], [Instituiçao], [Data de adoção final], [Data adoçao], [Utilizador], [Desparazitado], [Vacinas], [Esterilizado], [Descriçao], [Concelho]) VALUES (24, N'mia', N'Feminino', N'Bebé', N'Pequeno', N'~/imgs/df5e9d05-fc88-42a5-a010-803d319e3435_Bombaim 1.jfif', N'um gato muito carinhoso', CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 78, N'preto', N'aea8f2ac-60e8-4973-bfe2-4da224d33a57', NULL, NULL, NULL, 1, N'Panleucopénia', 1, N'um gato pequeno e peludo', 163)
GO
INSERT [dbo].[Animal] ([ID_animal], [Nome], [Género], [Idade], [Porte], [Foto], [Características], [Data de publicaçao], [Raça], [Cor], [Instituiçao], [Data de adoção final], [Data adoçao], [Utilizador], [Desparazitado], [Vacinas], [Esterilizado], [Descriçao], [Concelho]) VALUES (25, N'roscas', N'Masculino', N'Adulto', N'Pequeno', N'~/imgs/60c375e7-8431-4179-aec0-d721f2b7db7a_Azul russo 1.jfif', N'amigável e sociável ', CAST(N'2022-07-10T00:00:00.0000000' AS DateTime2), 73, N'cinza', N'aea8f2ac-60e8-4973-bfe2-4da224d33a57', NULL, NULL, NULL, 1, N'Panleucopénia', 1, N'uma gato de porte pequeno', 173)
GO
INSERT [dbo].[Animal] ([ID_animal], [Nome], [Género], [Idade], [Porte], [Foto], [Características], [Data de publicaçao], [Raça], [Cor], [Instituiçao], [Data de adoção final], [Data adoçao], [Utilizador], [Desparazitado], [Vacinas], [Esterilizado], [Descriçao], [Concelho]) VALUES (29, N'Pipoca', N'Feminino', N'Jovem', N'Pequeno', N'~/imgs/ac33d6df-a428-4331-ad5a-a2d42401936c_toyger 1.jfif', N'gato que parece um tigre', CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 87, N'castanho com riscas', N'766b459c-f322-48a0-b1ce-aec14a177af2', NULL, NULL, NULL, 1, N'Panleucopénia', 1, N'gato que parece um tigre', 157)
GO
INSERT [dbo].[Animal] ([ID_animal], [Nome], [Género], [Idade], [Porte], [Foto], [Características], [Data de publicaçao], [Raça], [Cor], [Instituiçao], [Data de adoção final], [Data adoçao], [Utilizador], [Desparazitado], [Vacinas], [Esterilizado], [Descriçao], [Concelho]) VALUES (30, N'Jeff', N'Masculino', N'Jovem', N'Pequeno', N'~/imgs/ff83651a-f72c-4bbb-b259-cd23a97baf8e_toyger 2.jfif', N'gato que parece um tigre', CAST(N'2022-07-11T00:00:00.0000000' AS DateTime2), 87, N'castanho com riscas', N'766b459c-f322-48a0-b1ce-aec14a177af2', NULL, NULL, NULL, 1, N'vacina da raiva', 1, N'gato que parece um tigre', 157)
GO
SET IDENTITY_INSERT [dbo].[Animal] OFF
GO
INSERT [dbo].[Applications] ([ApplicationId], [ApplicationName], [Description]) VALUES (N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'/', NULL)
GO
SET IDENTITY_INSERT [dbo].[Concelho] ON 
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (1, N'Águeda', 1)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (2, N'Albergaria-a-Velha', 1)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (3, N'Anadia', 1)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (4, N'Arouca', 1)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (5, N'Aveiro', 1)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (6, N'Castelo de Paiva', 1)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (7, N'Espinho', 1)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (8, N'Estarreja', 1)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (9, N'Santa Maria da Feira', 1)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (10, N'Ílhavo', 1)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (11, N'Mealhada', 1)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (12, N'Murtosa', 1)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (13, N'Oliveira de Azemeis', 1)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (14, N'Oliveira do Bairro', 1)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (15, N'Ovar', 1)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (16, N'São João da Madeira', 1)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (17, N'Sever do Vouga', 1)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (18, N'Vagos', 1)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (19, N'Vale de Cambra', 1)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (20, N'Aljustrel', 2)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (21, N'Almodovar', 2)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (22, N'Alvito', 2)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (23, N'Barrancos', 2)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (24, N'Beja', 2)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (25, N'Castro Verde', 2)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (26, N'Cuba', 2)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (27, N'Ferreira do Alentejo', 2)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (28, N'Mértola', 2)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (29, N'Moura', 2)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (30, N'Odemira', 2)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (31, N'Ourique', 2)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (32, N'Serpa', 2)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (33, N'Vidigueira', 2)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (34, N'Amares', 3)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (35, N'Barcelos', 3)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (36, N'Braga', 3)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (37, N'Cabeceiras de Basto', 3)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (38, N'Celorico de Basto', 3)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (39, N'Esposende', 3)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (40, N'Fafe', 3)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (41, N'Guimarães', 3)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (42, N'Póvoa de Lanhoso', 3)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (43, N'Terras de Bouro', 3)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (44, N'Vieira do Minho', 3)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (45, N'Vila Nova de Famalicão', 3)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (46, N'Vila Verde', 3)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (47, N'Vizela', 3)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (48, N'Alfandega da Fé', 4)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (49, N'Bragança', 4)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (50, N'Carrazeda de Ansiães', 4)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (51, N'Freixo Espada a Cinta', 4)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (52, N'Macedo de Cavaleiros', 4)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (53, N'Miranda do Douro', 4)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (54, N'Mirandela', 4)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (55, N'Mogadouro', 4)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (56, N'Torre de Moncorvo', 4)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (57, N'Vila Flor', 4)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (58, N'Vimioso', 4)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (59, N'Vinhais', 4)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (60, N'Belmonte', 5)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (61, N'Castelo Branco', 5)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (62, N'Covilhã', 5)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (63, N'Fundão', 5)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (64, N'Idanha-a-Nova', 5)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (65, N'Oleiros', 5)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (66, N'Penamacor', 5)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (67, N'Proença-a-Nova', 5)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (68, N'Sertã', 5)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (69, N'Vila de Rei', 5)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (70, N'Vila Velha de Ródão', 5)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (71, N'Arganil', 6)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (72, N'Cantanhede', 6)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (73, N'Coimbra', 6)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (74, N'Condeixa-a-Nova', 6)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (75, N'Figueira da Foz', 6)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (76, N'Góis', 6)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (77, N'Lousã', 6)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (78, N'Mira', 6)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (79, N'Miranda do Corvo', 6)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (80, N'Montemor-o-Velho', 6)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (81, N'Oliveira do Hospital', 6)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (82, N'Pampilhosa da Serra', 6)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (83, N'Penacova', 6)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (84, N'Penela', 6)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (85, N'Soure', 6)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (86, N'Tábua', 6)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (87, N'Vila Nova de Poiares', 6)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (88, N'Alandroal', 7)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (89, N'Arraiolos', 7)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (90, N'Borba', 7)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (91, N'Estremoz', 7)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (92, N'Évora', 7)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (93, N'Montemor-o-Novo', 7)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (94, N'Mora', 7)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (95, N'Mourão', 7)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (96, N'Portel', 7)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (97, N'Redondo', 7)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (98, N'Reguengos de Monsaraz', 7)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (99, N'Vendas Novas', 7)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (100, N'Viana do Alentejo', 7)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (101, N'Vila Viçosa', 7)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (102, N'Albufeira', 8)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (103, N'Alcoutim', 8)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (104, N'Aljezur', 8)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (105, N'Castro Marim', 8)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (106, N'Faro', 8)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (107, N'Lagoa', 8)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (108, N'Lagos', 8)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (109, N'Loulé', 8)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (110, N'Monchique', 8)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (111, N'Olhão', 8)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (112, N'Portimão', 8)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (113, N'São Brás de Alportel', 8)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (114, N'Silves', 8)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (115, N'Tavira', 8)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (116, N'Vila do Bispo', 8)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (117, N'Vila Real Sto Antonio', 8)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (118, N'Aguiar da Beira', 9)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (119, N'Almeida', 9)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (120, N'Celorico da Beira', 9)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (121, N'Fig. Castelo Rodrigo', 9)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (122, N'Fornos de Algodres', 9)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (123, N'Gouveia', 9)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (124, N'Guarda', 9)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (125, N'Manteigas', 9)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (126, N'Meda', 9)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (127, N'Pinhel', 9)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (128, N'Sabugal', 9)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (129, N'Seia', 9)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (130, N'Trancoso', 9)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (131, N'Vila Nova de Foz Coa', 9)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (132, N'Alcobaça', 10)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (133, N'Alvaiázere', 10)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (134, N'Ansião', 10)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (135, N'Batalha', 10)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (136, N'Bombarral', 10)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (137, N'Caldas da Rainha', 10)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (138, N'Castanheira de Pera', 10)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (139, N'Figueiró dos Vinhos', 10)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (140, N'Leiria', 10)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (141, N'Marinha Grande', 10)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (142, N'Nazaré', 10)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (143, N'Óbidos', 10)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (144, N'Pedrogão Grande', 10)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (145, N'Peniche', 10)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (146, N'Pombal', 10)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (147, N'Porto de Mós', 10)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (148, N'Alenquer', 11)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (149, N'Arruda dos Vinhos', 11)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (150, N'Azambuja', 11)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (151, N'Cadaval', 11)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (152, N'Cascais', 11)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (153, N'Lisboa', 11)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (154, N'Loures', 11)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (155, N'Lourinhã', 11)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (156, N'Mafra', 11)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (157, N'Oeiras', 11)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (158, N'Sintra', 11)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (159, N'Sobral de Monte Agraço', 11)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (160, N'Torres Vedras', 11)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (161, N'Vila Franca de Xira', 11)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (162, N'Amadora', 11)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (163, N'Odivelas', 11)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (164, N'Alter do Chão', 12)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (165, N'Arronches', 12)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (166, N'Avis', 12)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (167, N'Campo Maior', 12)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (168, N'Castelo de Vide', 12)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (169, N'Crato', 12)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (170, N'Elvas', 12)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (171, N'Fronteira', 12)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (172, N'Gavião', 12)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (173, N'Marvão', 12)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (174, N'Monforte', 12)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (175, N'Nisa', 12)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (176, N'Ponte de Sor', 12)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (177, N'Portalegre', 12)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (178, N'Sousel', 12)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (179, N'Amarante', 13)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (180, N'Baião', 13)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (181, N'Felgueiras', 13)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (182, N'Gondomar', 13)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (183, N'Lousada', 13)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (184, N'Maia', 13)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (185, N'Marco de Canaveses', 13)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (186, N'Matosinhos', 13)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (187, N'Paços de Ferreira', 13)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (188, N'Paredes', 13)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (189, N'Penafiel', 13)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (190, N'Porto', 13)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (191, N'Póvoa de Varzim', 13)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (192, N'Santo Tirso', 13)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (193, N'Valongo', 13)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (194, N'Vila do Conde', 13)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (195, N'Vila Nova de Gaia', 13)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (196, N'Trofa', 13)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (197, N'Abrantes', 14)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (198, N'Alcanena', 14)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (199, N'Almeirim', 14)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (200, N'Alpiarça', 14)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (201, N'Benavente', 14)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (202, N'Cartaxo', 14)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (203, N'Chamusca', 14)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (204, N'Constancia', 14)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (205, N'Coruche', 14)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (206, N'Entroncamento', 14)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (207, N'Ferreira do Zezere', 14)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (208, N'Golegã', 14)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (209, N'Mação', 14)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (210, N'Rio Maior', 14)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (211, N'Salvaterra de Magos', 14)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (212, N'Santarém', 14)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (213, N'Sardoal', 14)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (214, N'Tomar', 14)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (215, N'Torres Novas', 14)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (216, N'Vila Nova da Barquinha', 14)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (217, N'Ourém', 14)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (218, N'Alcácer do Sal', 15)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (219, N'Alcochete', 15)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (220, N'Almada', 15)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (221, N'Barreiro', 15)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (222, N'Grandola', 15)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (223, N'Moita', 15)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (224, N'Montijo', 15)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (225, N'Palmela', 15)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (226, N'Santiago do Cacém', 15)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (227, N'Seixal', 15)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (228, N'Sesimbra', 15)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (229, N'Setúbal', 15)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (230, N'Sines', 15)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (231, N'Arcos de Valdevez', 16)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (232, N'Caminha', 16)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (233, N'Melgaço', 16)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (234, N'Monção', 16)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (235, N'Paredes de Coura', 16)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (236, N'Ponte da Barca', 16)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (237, N'Ponte de Lima', 16)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (238, N'Valença', 16)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (239, N'Viana do Castelo', 16)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (240, N'Vila Nova de Cerveira', 16)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (241, N'Alijó', 17)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (242, N'Boticas', 17)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (243, N'Chaves', 17)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (244, N'Mesão Frio', 17)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (245, N'Mondim de Basto', 17)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (246, N'Montalegre', 17)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (247, N'Murça', 17)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (248, N'Peso da Régua', 17)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (249, N'Ribeira de Pena', 17)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (250, N'Sabrosa', 17)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (251, N'Sta Marta de Penaguião', 17)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (252, N'Valpaços', 17)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (253, N'Vila Pouca de Aguiar', 17)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (254, N'Vila Real', 17)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (255, N'Armamar', 18)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (256, N'Carregal do Sal', 18)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (257, N'Castro Daire', 18)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (258, N'Cinfães', 18)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (259, N'Lamego', 18)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (260, N'Mangualde', 18)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (261, N'Moimenta da Beira', 18)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (262, N'Mortágua', 18)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (263, N'Nelas', 18)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (264, N'Oliveira de Frades', 18)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (265, N'Penalva do Castelo', 18)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (266, N'Penedono', 18)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (267, N'Resende', 18)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (268, N'Santa Comba Dão', 18)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (269, N'São João da Pesqueira', 18)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (270, N'São Pedro do Sul', 18)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (271, N'Sátão', 18)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (272, N'Sernancelhe', 18)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (273, N'Tabuaço', 18)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (274, N'Tarouca', 18)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (275, N'Tondela', 18)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (276, N'Vila Nova de Paiva', 18)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (277, N'Viseu', 18)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (278, N'Vouzela', 18)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (279, N'Angra do Heroismo', 19)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (280, N'Calheta', 19)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (281, N'Santa Cruz da Graciosa', 19)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (282, N'Velas', 19)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (283, N'Praia da Vitória', 19)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (284, N'Corvo', 20)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (285, N'Horta', 20)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (286, N'Lajes das Flores', 20)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (287, N'Lajes do Pico', 20)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (288, N'Madalena', 20)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (289, N'Santa Cruz das Flores', 20)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (290, N'São Roque do Pico', 20)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (291, N'Lagoa', 21)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (292, N'Nordeste', 21)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (293, N'Ponta Delgada', 21)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (294, N'Povoação', 21)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (295, N'Ribeira Grande', 21)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (296, N'Vila Franca do Campo', 21)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (297, N'Vila do Porto', 21)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (298, N'Calheta', 22)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (299, N'Câmara de Lobos', 22)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (300, N'Funchal', 22)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (301, N'Machico', 22)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (302, N'Ponta do Sol', 22)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (303, N'Porto Moniz', 22)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (304, N'Porto Santo', 22)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (305, N'Ribeira Brava', 22)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (306, N'Santa Cruz', 22)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (307, N'Santana', 22)
GO
INSERT [dbo].[Concelho] ([ID], [Nome], [Distrito]) VALUES (308, N'São Vicente', 22)
GO
SET IDENTITY_INSERT [dbo].[Concelho] OFF
GO
SET IDENTITY_INSERT [dbo].[Distrito] ON 
GO
INSERT [dbo].[Distrito] ([ID], [Nome]) VALUES (1, N'Aveiro                        ')
GO
INSERT [dbo].[Distrito] ([ID], [Nome]) VALUES (2, N'Beja                          ')
GO
INSERT [dbo].[Distrito] ([ID], [Nome]) VALUES (3, N'Braga                         ')
GO
INSERT [dbo].[Distrito] ([ID], [Nome]) VALUES (4, N'Bragança                      ')
GO
INSERT [dbo].[Distrito] ([ID], [Nome]) VALUES (5, N'Castelo Branco                ')
GO
INSERT [dbo].[Distrito] ([ID], [Nome]) VALUES (6, N'Coimbra                       ')
GO
INSERT [dbo].[Distrito] ([ID], [Nome]) VALUES (7, N'Évora                         ')
GO
INSERT [dbo].[Distrito] ([ID], [Nome]) VALUES (8, N'Faro                          ')
GO
INSERT [dbo].[Distrito] ([ID], [Nome]) VALUES (9, N'Guarda                        ')
GO
INSERT [dbo].[Distrito] ([ID], [Nome]) VALUES (10, N'Leiria                        ')
GO
INSERT [dbo].[Distrito] ([ID], [Nome]) VALUES (11, N'Lisboa                        ')
GO
INSERT [dbo].[Distrito] ([ID], [Nome]) VALUES (12, N'Portalegre                    ')
GO
INSERT [dbo].[Distrito] ([ID], [Nome]) VALUES (13, N'Porto                         ')
GO
INSERT [dbo].[Distrito] ([ID], [Nome]) VALUES (14, N'Santarém                      ')
GO
INSERT [dbo].[Distrito] ([ID], [Nome]) VALUES (15, N'Setúbal                       ')
GO
INSERT [dbo].[Distrito] ([ID], [Nome]) VALUES (16, N'Viana do Castelo              ')
GO
INSERT [dbo].[Distrito] ([ID], [Nome]) VALUES (17, N'Vila Real                     ')
GO
INSERT [dbo].[Distrito] ([ID], [Nome]) VALUES (18, N'Viseu                         ')
GO
INSERT [dbo].[Distrito] ([ID], [Nome]) VALUES (19, N'Angra do Heroismo             ')
GO
INSERT [dbo].[Distrito] ([ID], [Nome]) VALUES (20, N'Horta                         ')
GO
INSERT [dbo].[Distrito] ([ID], [Nome]) VALUES (21, N'Ponta Delgada                 ')
GO
INSERT [dbo].[Distrito] ([ID], [Nome]) VALUES (22, N'Funchal')
GO
SET IDENTITY_INSERT [dbo].[Distrito] OFF
GO
SET IDENTITY_INSERT [dbo].[Favoritos] ON 
GO
INSERT [dbo].[Favoritos] ([Favorito_id], [Utilizador], [Animal]) VALUES (1, N'f1bba87c-9a84-4814-a931-46e294470f0f', 8)
GO
INSERT [dbo].[Favoritos] ([Favorito_id], [Utilizador], [Animal]) VALUES (2, N'f1bba87c-9a84-4814-a931-46e294470f0f', 9)
GO
INSERT [dbo].[Favoritos] ([Favorito_id], [Utilizador], [Animal]) VALUES (3, N'f1bba87c-9a84-4814-a931-46e294470f0f', 10)
GO
SET IDENTITY_INSERT [dbo].[Favoritos] OFF
GO
INSERT [dbo].[Instituiçao] ([ID_Instituiçao], [Nome], [Morada], [Localidade], [Código Postal], [Telefone], [Telemóvel], [Email], [URL], [Latitude], [Longitude], [3 Words], [Concelho], [Data de registo]) VALUES (N'766b459c-f322-48a0-b1ce-aec14a177af2', N'SOS animal', N'Lote R4, Estr. Paço do Lumiar loja a ', N'Lisboa', N'1600-542', NULL, NULL, N'instituicao123@gmail.com', N'https://sosanimal.com
', N'38.7678377', N'-9.1806704', NULL, 163, CAST(N'2022-06-08T10:43:00.5267773' AS DateTime2))
GO
INSERT [dbo].[Instituiçao] ([ID_Instituiçao], [Nome], [Morada], [Localidade], [Código Postal], [Telefone], [Telemóvel], [Email], [URL], [Latitude], [Longitude], [3 Words], [Concelho], [Data de registo]) VALUES (N'9a6c7546-bfe3-467b-9160-ecf3570b738b', N'Amigo animal', N'R. Padre Paulo Warkocz, 29 ', N'Lisboa', N'1500-374', N'219876543', N'938765432', N'instituicao168@gmail.com', N'http://amigoanimal.org.br/', NULL, NULL, NULL, 163, CAST(N'2022-05-30T14:21:47.8947751' AS DateTime2))
GO
INSERT [dbo].[Instituiçao] ([ID_Instituiçao], [Nome], [Morada], [Localidade], [Código Postal], [Telefone], [Telemóvel], [Email], [URL], [Latitude], [Longitude], [3 Words], [Concelho], [Data de registo]) VALUES (N'aea8f2ac-60e8-4973-bfe2-4da224d33a57', N'quatro patas', N'Colombo Loja 0.518/9, Piso 0, Av. Lusíada', N'Lisboa', N'1500-392', N'210991988', N'918734596', N'quatropatas123123@gmail.com', N'https://www.quatropatas.pt
', N'38.6624493', N'-9.0735775', NULL, 163, CAST(N'2022-07-07T16:19:51.0040046' AS DateTime2))
GO
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'266c41e5-0d55-4b7a-9efa-0a9597ff83d3', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'eArG4ZFnpEa3/8yi4Qm/gDXcxqLzUFkFhFP+pJKe2PA=', 1, N'mhtK8jwiHrccekyOT7bgNg==', N'ut2@email.com', NULL, NULL, 1, 0, CAST(N'2022-05-09T13:35:31.743' AS DateTime), CAST(N'2022-06-14T11:07:46.730' AS DateTime), CAST(N'2022-05-09T13:35:31.743' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'5c273ad5-5a76-4595-8374-1990126eaa35', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'owkxp8+e4VYj/AdXnVjsxN/at0MM588vzsSRlct/Cf8=', 1, N'KgpdDbDJViDXqginMs8mVQ==', N'inst3@email.com', NULL, NULL, 0, 0, CAST(N'2022-05-09T13:38:58.220' AS DateTime), CAST(N'2022-05-09T13:38:58.220' AS DateTime), CAST(N'2022-05-09T13:38:58.220' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'bd37ad6a-f27b-4528-b97d-4427005810f2', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'c9Cla0tVEyzUzGEOu8uBw2pjSNsfWvc1ZHN0b4WVyhc=', 1, N'e3/dNihUx6gGhseLePrHYw==', N'mariaclararm25@gmail.com', NULL, NULL, 1, 0, CAST(N'2022-07-10T08:35:26.320' AS DateTime), CAST(N'2022-07-10T08:54:45.563' AS DateTime), CAST(N'2022-07-10T08:35:26.320' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'85b96fab-432e-4670-93c1-46a19060426e', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'5Z1QiSLDCcqgup1Ke11K4+/YXnMh9LiyJi+3COyZk60=', 1, N'B9Z0gogOAksMSUwkCESqlg==', N'inst28574658574@email.com', NULL, NULL, 1, 0, CAST(N'2022-05-09T12:18:05.290' AS DateTime), CAST(N'2022-05-30T15:14:34.570' AS DateTime), CAST(N'2022-05-09T12:18:05.290' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'f1bba87c-9a84-4814-a931-46e294470f0f', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'oR/BlX58ofOCfuICfE7ygESO4Wz/uFHIcTXEPFIaRhE=', 1, N'doq6iZVLAPmwwTc0i839QA==', N'user1@gmail.com', NULL, NULL, 1, 0, CAST(N'2022-05-30T13:31:50.640' AS DateTime), CAST(N'2022-07-11T10:43:12.123' AS DateTime), CAST(N'2022-06-15T09:44:29.430' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'aea8f2ac-60e8-4973-bfe2-4da224d33a57', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'6u64k2fnLhWFXqdZuJ2VydzpOabcvSNCIbZyAFH3btg=', 1, N'ko93FzkKGKybAjiu78ad5w==', N'quatropatas123123@gmail.com', NULL, NULL, 1, 0, CAST(N'2022-07-07T15:19:40.540' AS DateTime), CAST(N'2022-07-11T10:44:42.377' AS DateTime), CAST(N'2022-07-07T15:19:40.540' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'43a980f7-3c39-4c5c-9072-6da1d55f1949', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'Z7Pd5AnVIW/Yp7pMdtkHm+Ntp5wTHne5I8lqhuXvjOs=', 1, N'URofNcZA4NoyMjKP+/bIZA==', N'instituicao168@gmail.com', NULL, NULL, 1, 0, CAST(N'2022-05-09T10:44:44.413' AS DateTime), CAST(N'2022-07-10T22:26:11.543' AS DateTime), CAST(N'2022-05-09T10:44:44.413' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'26899bcc-dd15-4527-9161-89f7dd731ecc', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'5lQaFeqjeEwX0fTxw6VEVtobqWagQWMT6PZT+2mp5pw=', 1, N'bSj2wCkg7eQuIFg/oG3D4w==', N'Admin@gmail.com', NULL, NULL, 1, 0, CAST(N'2022-06-29T09:35:42.533' AS DateTime), CAST(N'2022-06-29T09:35:51.947' AS DateTime), CAST(N'2022-06-29T09:35:42.533' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'7fb4d4fc-2b42-46d6-88b8-a0e5fd106541', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'S9+rf4Y+dEA66VQ3sdEFUySfL9kDJtpudofqlX5G8/Y=', 1, N'oBrMRQ1fsij0fki1C76BsQ==', N'antonio75638574@gmail.com', NULL, NULL, 1, 0, CAST(N'2022-07-04T08:52:18.360' AS DateTime), CAST(N'2022-07-04T09:27:20.473' AS DateTime), CAST(N'2022-07-04T09:25:07.677' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'766b459c-f322-48a0-b1ce-aec14a177af2', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'vDw0YjZF5asKxDclVXJP8MAzrb6y1Uu3CHHLkzWm0tg=', 1, N'sEtHL553Xd5kmT8X5xOpjw==', N'instituicao123@gmail.com', NULL, NULL, 1, 0, CAST(N'2022-06-08T09:42:54.383' AS DateTime), CAST(N'2022-07-11T11:04:23.240' AS DateTime), CAST(N'2022-06-08T09:42:54.383' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'469ff0f0-10da-4db8-809a-c36ecbb277e8', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'8iF5kJHTKXsY8dpDPXMXnMjwqN9oUykp/mYEf0daPME=', 1, N'Edm8ExvuyGnpW98jq72WYg==', N'diogosousampt03@gmail.com', NULL, NULL, 1, 0, CAST(N'2022-05-09T14:05:29.710' AS DateTime), CAST(N'2022-07-11T09:45:13.950' AS DateTime), CAST(N'2022-05-09T14:05:29.710' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'9a6c7546-bfe3-467b-9160-ecf3570b738b', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'DIHQiEzbXlD0aGA0NzHiwEmypzDFMhY2f/wnoMDoPAc=', 1, N'pQ/n72T3a2AlQYmjcyDkgw==', N'instituicao1@gmail.com', NULL, NULL, 1, 0, CAST(N'2022-05-30T13:21:39.737' AS DateTime), CAST(N'2022-07-10T22:27:01.380' AS DateTime), CAST(N'2022-05-30T13:21:39.737' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Raça] ON 
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (8, N'Pastor alemão', N'Um cão relativamente grande grande', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (9, N'Persa', N'Um gato peludo ', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (10, N'Boxer', N'Um cão magro e com pouco pelo', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (11, N'Buldogue', N'Cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (12, N'Labrador retriever', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (13, N'Poodle', N'cao', N'not null ', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (14, N'Golden retriever', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (15, N'Chihuahua', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (16, N'Buldogue francês', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (17, N'Bichon frisé', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (18, N'Border collie', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (19, N'Husky siberiano', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (20, N'Pug', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (21, N'American staffordshire terrier', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (22, N'Boston terrier', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (23, N'Cavalier king charles spaniel', N'cao', N'not null ', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (24, N'Yorkshire terrier', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (25, N'Pastor australiano', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (26, N'Bull terrier', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (27, N'Cocker spaniel inglês', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (28, N'Basset Hound', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (29, N'Galgo Afegão', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (30, N'Cão Esquimó Americano', N'cao', N'not null ', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (31, N'Dogue alemão', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (32, N'Maltês', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (33, N'Chow-chow', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (34, N'Shih-tzu', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (35, N'Affenpinscher', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (36, N'Dachshund', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (37, N'Basenji', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (38, N'Dobermann', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (39, N'Airedale terrier', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (40, N'Cão de crista chinês', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (41, N'Spaniel bretão', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (42, N'Pastor-belga', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (43, N'Bulmastife', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (44, N'Bedlington terrier', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (45, N'Bichon havanês', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (46, N'Cão-de-santo-humberto', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (47, N'Pastor-da-anatólia', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (48, N'Rhodesian ridgeback', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (49, N'Lhasa apso', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (50, N'Griffon de Bruxelas', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (51, N'American pit bull terrier', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (52, N'RottWeiler', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (53, N'Shiba inu', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (54, N'Cane corso', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (55, N'Mastim', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (56, N'Zwergspitz', N'cao', N'not null', 1)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (57, N'Maine Coon', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (58, N'Gato de pelo curto inglês', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (59, N'Gato de bengala', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (60, N'Siamês', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (61, N'Sphynx', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (62, N'Ragdoll', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (63, N'Munchkin', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (64, N'Scottish Fold', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (66, N'Norueguês da Floresta', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (67, N'Siberiano', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (68, N'Gato Savannah', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (69, N'Gato de pelo curto americano', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (70, N'Exótico', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (71, N'Angorá', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (72, N'Himalaio', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (73, N'Azul russo', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (74, N'Gato comum europeu', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (75, N'Sagrado da Birmânia', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (76, N'Chartreux', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (77, N'Gato abissínio', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (78, N'Bombaim', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (79, N'Kinkalow', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (80, N'Gato birmanês', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (81, N'Oriental Shorthair', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (82, N'Ragamuffin', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (83, N'Somali', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (84, N'Singapura', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (85, N'Curl Americano', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (86, N'British Longhair', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (87, N'Toyger', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (88, N'Van Turco', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (89, N'Gato manês', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (90, N'Donskoy', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (91, N'Oriental Havana', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (92, N'Ocicat', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (93, N'Balinês', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (94, N'LaPerm', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (95, N'Cymric', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (96, N'Comish Rex', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (97, N'Selkirk Rex', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (98, N'Bobtail americano', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (99, N'Nebelung', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (100, N'Thai', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (101, N'Korat', N'gato', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (102, N'Tonquinês', N'gato ', N'not null ', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (103, N'Lykoi', N'gato ', N'not null', 2)
GO
INSERT [dbo].[Raça] ([ID_Raça], [Nome], [Características], [Foto], [Tipo]) VALUES (104, N'Peterbald', N'gato', N'not null', 2)
GO
SET IDENTITY_INSERT [dbo].[Raça] OFF
GO
INSERT [dbo].[Roles] ([RoleId], [ApplicationId], [RoleName], [Description]) VALUES (N'194627f3-0e48-4d8a-967c-5cfa0705967e', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'administrador', NULL)
GO
INSERT [dbo].[Roles] ([RoleId], [ApplicationId], [RoleName], [Description]) VALUES (N'b7065935-190f-41c6-8791-767fdbb5eba2', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'utilizador', NULL)
GO
INSERT [dbo].[Roles] ([RoleId], [ApplicationId], [RoleName], [Description]) VALUES (N'78aad127-f9dd-480f-b290-ee08eebadac9', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'instituicao', NULL)
GO
SET IDENTITY_INSERT [dbo].[Tipo] ON 
GO
INSERT [dbo].[Tipo] ([ID_Tipo], [Nome]) VALUES (1, N'Cão')
GO
INSERT [dbo].[Tipo] ([ID_Tipo], [Nome]) VALUES (2, N'Gato')
GO
SET IDENTITY_INSERT [dbo].[Tipo] OFF
GO
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'266c41e5-0d55-4b7a-9efa-0a9597ff83d3', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'ut2', 0, CAST(N'2022-06-14T11:07:46.730' AS DateTime))
GO
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'5c273ad5-5a76-4595-8374-1990126eaa35', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'inst3', 0, CAST(N'2022-05-09T13:38:58.397' AS DateTime))
GO
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'c94cc53f-b4be-4b9e-9e7a-1b9686bd8bf5', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'inst1', 0, CAST(N'2022-05-09T15:51:16.670' AS DateTime))
GO
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'bd37ad6a-f27b-4528-b97d-4427005810f2', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'Maria', 0, CAST(N'2022-07-10T08:54:45.563' AS DateTime))
GO
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'85b96fab-432e-4670-93c1-46a19060426e', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'inst2', 0, CAST(N'2022-05-30T15:14:34.570' AS DateTime))
GO
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'f1bba87c-9a84-4814-a931-46e294470f0f', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'joao', 0, CAST(N'2022-07-11T10:43:12.123' AS DateTime))
GO
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'aea8f2ac-60e8-4973-bfe2-4da224d33a57', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'quatro patas', 0, CAST(N'2022-07-11T10:44:42.377' AS DateTime))
GO
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'43a980f7-3c39-4c5c-9072-6da1d55f1949', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'Amigo animal', 0, CAST(N'2022-07-10T22:26:11.543' AS DateTime))
GO
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'26899bcc-dd15-4527-9161-89f7dd731ecc', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'Admin', 0, CAST(N'2022-06-29T09:35:51.947' AS DateTime))
GO
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'7fb4d4fc-2b42-46d6-88b8-a0e5fd106541', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'antonio', 0, CAST(N'2022-07-04T09:27:20.473' AS DateTime))
GO
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'766b459c-f322-48a0-b1ce-aec14a177af2', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'SOS animal', 0, CAST(N'2022-07-11T11:04:23.240' AS DateTime))
GO
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'469ff0f0-10da-4db8-809a-c36ecbb277e8', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'diogo', 0, CAST(N'2022-07-11T09:45:13.950' AS DateTime))
GO
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'9a6c7546-bfe3-467b-9160-ecf3570b738b', N'96e169a0-d4a4-488f-9f67-7fcd2016b10e', N'instituicao1', 0, CAST(N'2022-07-10T22:27:01.380' AS DateTime))
GO
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'266c41e5-0d55-4b7a-9efa-0a9597ff83d3', N'b7065935-190f-41c6-8791-767fdbb5eba2')
GO
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'5c273ad5-5a76-4595-8374-1990126eaa35', N'78aad127-f9dd-480f-b290-ee08eebadac9')
GO
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'c94cc53f-b4be-4b9e-9e7a-1b9686bd8bf5', N'78aad127-f9dd-480f-b290-ee08eebadac9')
GO
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'bd37ad6a-f27b-4528-b97d-4427005810f2', N'b7065935-190f-41c6-8791-767fdbb5eba2')
GO
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'85b96fab-432e-4670-93c1-46a19060426e', N'78aad127-f9dd-480f-b290-ee08eebadac9')
GO
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'f1bba87c-9a84-4814-a931-46e294470f0f', N'b7065935-190f-41c6-8791-767fdbb5eba2')
GO
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'aea8f2ac-60e8-4973-bfe2-4da224d33a57', N'78aad127-f9dd-480f-b290-ee08eebadac9')
GO
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'26899bcc-dd15-4527-9161-89f7dd731ecc', N'194627f3-0e48-4d8a-967c-5cfa0705967e')
GO
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'7fb4d4fc-2b42-46d6-88b8-a0e5fd106541', N'b7065935-190f-41c6-8791-767fdbb5eba2')
GO
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'766b459c-f322-48a0-b1ce-aec14a177af2', N'78aad127-f9dd-480f-b290-ee08eebadac9')
GO
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'469ff0f0-10da-4db8-809a-c36ecbb277e8', N'194627f3-0e48-4d8a-967c-5cfa0705967e')
GO
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'9a6c7546-bfe3-467b-9160-ecf3570b738b', N'78aad127-f9dd-480f-b290-ee08eebadac9')
GO
INSERT [dbo].[Utilizador] ([ID_Utilizador], [Nome], [Email], [Telefone], [Data de registo], [Concelho]) VALUES (N'266c41e5-0d55-4b7a-9efa-0a9597ff83d3', N'ut2', N'ut2@email.com', NULL, CAST(N'2022-05-09T14:35:43.1642009' AS DateTime2), 163)
GO
INSERT [dbo].[Utilizador] ([ID_Utilizador], [Nome], [Email], [Telefone], [Data de registo], [Concelho]) VALUES (N'7fb4d4fc-2b42-46d6-88b8-a0e5fd106541', N'António', N'antonio75638574@gmail.com', NULL, CAST(N'2022-07-04T09:52:25.4863242' AS DateTime2), 143)
GO
INSERT [dbo].[Utilizador] ([ID_Utilizador], [Nome], [Email], [Telefone], [Data de registo], [Concelho]) VALUES (N'bd37ad6a-f27b-4528-b97d-4427005810f2', N'Maria Clara', N'mariaclararm25@gmail.com', N'912481300', CAST(N'2022-07-10T09:35:32.1060623' AS DateTime2), 163)
GO
INSERT [dbo].[Utilizador] ([ID_Utilizador], [Nome], [Email], [Telefone], [Data de registo], [Concelho]) VALUES (N'f1bba87c-9a84-4814-a931-46e294470f0f', N'joao', N'joao0349123@gmail.com', N'987654321', CAST(N'2022-05-30T14:31:50.7055918' AS DateTime2), 157)
GO
SET IDENTITY_INSERT [dbo].[Utilizador_Animal] ON 
GO
INSERT [dbo].[Utilizador_Animal] ([Utilizador_Animal], [Utilizador], [Animal]) VALUES (4, N'266c41e5-0d55-4b7a-9efa-0a9597ff83d3', 9)
GO
INSERT [dbo].[Utilizador_Animal] ([Utilizador_Animal], [Utilizador], [Animal]) VALUES (5, N'f1bba87c-9a84-4814-a931-46e294470f0f', 10)
GO
INSERT [dbo].[Utilizador_Animal] ([Utilizador_Animal], [Utilizador], [Animal]) VALUES (1005, N'f1bba87c-9a84-4814-a931-46e294470f0f', 9)
GO
INSERT [dbo].[Utilizador_Animal] ([Utilizador_Animal], [Utilizador], [Animal]) VALUES (1006, N'f1bba87c-9a84-4814-a931-46e294470f0f', 10)
GO
SET IDENTITY_INSERT [dbo].[Utilizador_Animal] OFF
GO
SET IDENTITY_INSERT [dbo].[UtilizadorInteresse] ON 
GO
INSERT [dbo].[UtilizadorInteresse] ([ID_UtilizadorInteresse], [Distrito], [Concelho], [Tipo], [Raça], [Idade], [Porte], [Género], [Utilizador]) VALUES (1, NULL, 157, NULL, 87, N'0', N'0', N'Feminino', N'f1bba87c-9a84-4814-a931-46e294470f0f')
GO
INSERT [dbo].[UtilizadorInteresse] ([ID_UtilizadorInteresse], [Distrito], [Concelho], [Tipo], [Raça], [Idade], [Porte], [Género], [Utilizador]) VALUES (2, NULL, 163, NULL, 14, N'0', N'0', N'0', N'bd37ad6a-f27b-4528-b97d-4427005810f2')
GO
SET IDENTITY_INSERT [dbo].[UtilizadorInteresse] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_UserName]    Script Date: 11/07/2022 12:10:19 ******/
CREATE NONCLUSTERED INDEX [IDX_UserName] ON [dbo].[Users]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [fkAnimalInstituiçao] FOREIGN KEY([Instituiçao])
REFERENCES [dbo].[Instituiçao] ([ID_Instituiçao])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [fkAnimalInstituiçao]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [fkAnimalRaça] FOREIGN KEY([Raça])
REFERENCES [dbo].[Raça] ([ID_Raça])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [fkAnimalRaça]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [fkAnimalUtilizador] FOREIGN KEY([Utilizador])
REFERENCES [dbo].[Utilizador] ([ID_Utilizador])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [fkAnimalUtilizador]
GO
ALTER TABLE [dbo].[Concelho]  WITH CHECK ADD  CONSTRAINT [FK__Concelho__Distri__267ABA7A] FOREIGN KEY([Distrito])
REFERENCES [dbo].[Distrito] ([ID])
GO
ALTER TABLE [dbo].[Concelho] CHECK CONSTRAINT [FK__Concelho__Distri__267ABA7A]
GO
ALTER TABLE [dbo].[Favoritos]  WITH CHECK ADD  CONSTRAINT [FK_Favoritos_Animal] FOREIGN KEY([Animal])
REFERENCES [dbo].[Animal] ([ID_animal])
GO
ALTER TABLE [dbo].[Favoritos] CHECK CONSTRAINT [FK_Favoritos_Animal]
GO
ALTER TABLE [dbo].[Favoritos]  WITH CHECK ADD  CONSTRAINT [FK_Favoritos_Utilizador] FOREIGN KEY([Utilizador])
REFERENCES [dbo].[Utilizador] ([ID_Utilizador])
GO
ALTER TABLE [dbo].[Favoritos] CHECK CONSTRAINT [FK_Favoritos_Utilizador]
GO
ALTER TABLE [dbo].[Instituiçao]  WITH CHECK ADD  CONSTRAINT [FK_Instituiçao_Concelho] FOREIGN KEY([Concelho])
REFERENCES [dbo].[Concelho] ([ID])
GO
ALTER TABLE [dbo].[Instituiçao] CHECK CONSTRAINT [FK_Instituiçao_Concelho]
GO
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipEntity_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipEntity_Application]
GO
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipEntity_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipEntity_User]
GO
ALTER TABLE [dbo].[Profiles]  WITH CHECK ADD  CONSTRAINT [ProfileEntity_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Profiles] CHECK CONSTRAINT [ProfileEntity_User]
GO
ALTER TABLE [dbo].[Raça]  WITH CHECK ADD  CONSTRAINT [fkTipoRaça] FOREIGN KEY([Tipo])
REFERENCES [dbo].[Tipo] ([ID_Tipo])
GO
ALTER TABLE [dbo].[Raça] CHECK CONSTRAINT [fkTipoRaça]
GO
ALTER TABLE [dbo].[Raça_Utilizador]  WITH CHECK ADD  CONSTRAINT [fkRaçaUtilizador] FOREIGN KEY([Raça])
REFERENCES [dbo].[Raça] ([ID_Raça])
GO
ALTER TABLE [dbo].[Raça_Utilizador] CHECK CONSTRAINT [fkRaçaUtilizador]
GO
ALTER TABLE [dbo].[Raça_Utilizador]  WITH CHECK ADD  CONSTRAINT [fkUtilizadorRaça] FOREIGN KEY([Utilizador])
REFERENCES [dbo].[Utilizador] ([ID_Utilizador])
GO
ALTER TABLE [dbo].[Raça_Utilizador] CHECK CONSTRAINT [fkUtilizadorRaça]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [RoleEntity_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [RoleEntity_Application]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [User_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [User_Application]
GO
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRole_Role]
GO
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRole_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRole_User]
GO
ALTER TABLE [dbo].[Utilizador]  WITH CHECK ADD  CONSTRAINT [FK_Utilizador_Concelho] FOREIGN KEY([Concelho])
REFERENCES [dbo].[Concelho] ([ID])
GO
ALTER TABLE [dbo].[Utilizador] CHECK CONSTRAINT [FK_Utilizador_Concelho]
GO
ALTER TABLE [dbo].[Utilizador_Animal]  WITH CHECK ADD  CONSTRAINT [FK_Utilizador_Animal_Animal] FOREIGN KEY([Animal])
REFERENCES [dbo].[Animal] ([ID_animal])
GO
ALTER TABLE [dbo].[Utilizador_Animal] CHECK CONSTRAINT [FK_Utilizador_Animal_Animal]
GO
ALTER TABLE [dbo].[Utilizador_Animal]  WITH CHECK ADD  CONSTRAINT [FK_Utilizador_Animal_Utilizador] FOREIGN KEY([Utilizador])
REFERENCES [dbo].[Utilizador] ([ID_Utilizador])
GO
ALTER TABLE [dbo].[Utilizador_Animal] CHECK CONSTRAINT [FK_Utilizador_Animal_Utilizador]
GO
ALTER TABLE [dbo].[UtilizadorInteresse]  WITH CHECK ADD  CONSTRAINT [fkUtilizador] FOREIGN KEY([Utilizador])
REFERENCES [dbo].[Utilizador] ([ID_Utilizador])
GO
ALTER TABLE [dbo].[UtilizadorInteresse] CHECK CONSTRAINT [fkUtilizador]
GO
/****** Object:  StoredProcedure [dbo].[uspDadosUtilizador]    Script Date: 11/07/2022 12:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspDadosUtilizador](@id NVARCHAR(50))
AS
SELECT
Ut.Nome 'Utilizador', Ut.Email, Ut.Telefone, Ut.[Data de registo],
C.Nome 'Concelho', D.Nome 'Distrito'
FROM Utilizador Ut JOIN Users Us ON Ut.ID_Utilizador = Us.UserId
LEFT JOIN Concelho C ON Ut.Concelho = C.ID
LEFT JOIN Distrito D ON C.Distrito = D.ID
WHERE Us.UserID = @id
GO
/****** Object:  StoredProcedure [dbo].[uspObterDadosUtilizador]    Script Date: 11/07/2022 12:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspObterDadosUtilizador](@id NVARCHAR(50))
AS
SELECT
Ut.Nome 'Utilizador', Ut.Email, Ut.Telefone, Ut.[Data de registo],
C.Nome 'Concelho', D.Nome 'Distrito'
FROM Utilizador Ut JOIN Users Us ON Ut.ID_Utilizador = Us.UserId
LEFT JOIN Concelho C ON Ut.Concelho = C.ID
LEFT JOIN Distrito D ON C.Distrito = D.ID
WHERE Us.UserID = @id 
GO
USE [master]
GO
ALTER DATABASE [pap_Diogo] SET  READ_WRITE 
GO
