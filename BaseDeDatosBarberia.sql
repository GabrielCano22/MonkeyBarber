USE [master]
GO
/****** Object:  Database [barberia]    Script Date: 30/09/2023 21:02:59 p. m. ******/
CREATE DATABASE [barberia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'barberia', FILENAME = N'D:\Sql\MSSQL16.MSSQLSERVER\MSSQL\DATA\barberia.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'barberia_log', FILENAME = N'D:\Sql\MSSQL16.MSSQLSERVER\MSSQL\DATA\barberia_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [barberia] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [barberia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [barberia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [barberia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [barberia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [barberia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [barberia] SET ARITHABORT OFF 
GO
ALTER DATABASE [barberia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [barberia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [barberia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [barberia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [barberia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [barberia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [barberia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [barberia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [barberia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [barberia] SET  ENABLE_BROKER 
GO
ALTER DATABASE [barberia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [barberia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [barberia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [barberia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [barberia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [barberia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [barberia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [barberia] SET RECOVERY FULL 
GO
ALTER DATABASE [barberia] SET  MULTI_USER 
GO
ALTER DATABASE [barberia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [barberia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [barberia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [barberia] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [barberia] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [barberia] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'barberia', N'ON'
GO
ALTER DATABASE [barberia] SET QUERY_STORE = ON
GO
ALTER DATABASE [barberia] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [barberia]
GO
/****** Object:  Table [dbo].[barbero]    Script Date: 30/09/2023 21:02:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[barbero](
	[cod_barbero] [nvarchar](10) NOT NULL,
	[documento] [int] NULL,
	[nombre] [nvarchar](50) NULL,
	[direccion] [nvarchar](50) NULL,
	[teléfono] [int] NULL,
	[activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_barbero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[deudores]    Script Date: 30/09/2023 21:02:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deudores](
	[cod_deudor] [nvarchar](10) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[direccion] [nvarchar](50) NULL,
	[telefono_fijo] [int] NULL,
	[celular] [int] NULL,
	[documento] [int] NULL,
	[cantidad_que_debe] [int] NULL,
	[activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_deudor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turno]    Script Date: 30/09/2023 21:02:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turno](
	[cod_turno] [nvarchar](10) NOT NULL,
	[fecha] [date] NULL,
	[hora] [time](7) NULL,
	[valor] [int] NULL,
	[nombre_cliente] [nvarchar](50) NULL,
	[nombre_barbero] [nvarchar](50) NULL,
	[activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_turno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[barbero] ([cod_barbero], [documento], [nombre], [direccion], [teléfono], [activo]) VALUES (N'1010', 1035970610, N'Juan Fernando', N'Av19a #58-89', 604512475, 1)
GO
INSERT [dbo].[barbero] ([cod_barbero], [documento], [nombre], [direccion], [teléfono], [activo]) VALUES (N'1011', 1035970310, N'Juan Manuel', N'Av19a #58-49', 60421312, 1)
GO
INSERT [dbo].[barbero] ([cod_barbero], [documento], [nombre], [direccion], [teléfono], [activo]) VALUES (N'1012', 1035970610, N'Juan Fernando Quintero', N'Av19a #57-39', 604594512, 1)
GO
INSERT [dbo].[deudores] ([cod_deudor], [nombre], [direccion], [telefono_fijo], [celular], [documento], [cantidad_que_debe], [activo]) VALUES (N'1011', N'Federico Gutierrez', N'cll 45a #26-30', 6045342, 312234454, 1035970610, 50000, 1)
GO
INSERT [dbo].[deudores] ([cod_deudor], [nombre], [direccion], [telefono_fijo], [celular], [documento], [cantidad_que_debe], [activo]) VALUES (N'1015', N'Juan Fernando Zuleta ', N'Av30b #57-98', 604587456, 312254787, 1025478596, 50000, 1)
GO
INSERT [dbo].[Turno] ([cod_turno], [fecha], [hora], [valor], [nombre_cliente], [nombre_barbero], [activo]) VALUES (N'1011', CAST(N'2023-04-07' AS Date), CAST(N'22:19:00' AS Time), 12000, N'Pablo Emilio Betancur', N'Juan Fernando Ramirez', 1)
GO
INSERT [dbo].[Turno] ([cod_turno], [fecha], [hora], [valor], [nombre_cliente], [nombre_barbero], [activo]) VALUES (N'1015', CAST(N'2023-05-28' AS Date), CAST(N'15:00:00' AS Time), 15000, N'Gabriel Cano', N'Cristian Goez', 0)
GO
/****** Object:  StoredProcedure [dbo].[Actualizar_barbero]    Script Date: 30/09/2023 21:02:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Actualizar_barbero]
@cod_barbero nvarchar(10),
@documento int,
@nombre nvarchar(50),
@direccion nvarchar(50),
@teléfono int,
@activo bit
as
insert into barbero(cod_barbero,documento,nombre,direccion,teléfono,activo)
values (@cod_barbero,@nombre,@documento,@direccion,@teléfono,@activo)
GO
/****** Object:  StoredProcedure [dbo].[Actualizar_deudor]    Script Date: 30/09/2023 21:02:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Actualizar_deudor]
@cod_deudor nvarchar(10),
@nombre nvarchar (50),
@direccion nvarchar(50),
@telefono_fijo int,
@celular int,
@documento int,
@cantidad_que_debe int,
@activo bit
as
insert into deudores(cod_deudor,nombre,direccion,telefono_fijo,celular,documento,cantidad_que_debe,activo)
values (@cod_deudor,@nombre,@direccion,@telefono_fijo,@celular,@documento,@cantidad_que_debe,@activo)
GO
/****** Object:  StoredProcedure [dbo].[Actualizar_turno]    Script Date: 30/09/2023 21:02:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Actualizar_turno]
@cod_turno nvarchar (10),
@fecha date,
@hora time,
@valor int,
@nombre_cliente nvarchar(50),
@nombre_barbero nvarchar(50),
@activo bit
as
insert into Turno(cod_turno,fecha,hora,valor,nombre_cliente,nombre_barbero,activo)
values (@cod_turno,@fecha,@hora,@valor,@nombre_cliente,@nombre_barbero,@activo)
GO
/****** Object:  StoredProcedure [dbo].[Anular_barbero]    Script Date: 30/09/2023 21:02:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Anular_barbero]
@pcod_barbero nvarchar (10)
as
update barbero set activo =0 where cod_barbero=@pcod_barbero
GO
/****** Object:  StoredProcedure [dbo].[Anular_deudor]    Script Date: 30/09/2023 21:02:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Anular_deudor]
@pcod_deudor nvarchar (10)
as
update deudores set activo =0 where cod_deudor=@pcod_deudor
GO
/****** Object:  StoredProcedure [dbo].[Anular_tuno]    Script Date: 30/09/2023 21:02:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Anular_tuno]
@pcod_turno nvarchar (10)
as
update Turno set activo =0 where cod_turno=@pcod_turno
GO
/****** Object:  StoredProcedure [dbo].[Consultar_barbero]    Script Date: 30/09/2023 21:02:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Consultar_barbero]
@cod_barbero nvarchar(10)
as
select * from barbero
GO
/****** Object:  StoredProcedure [dbo].[Consultar_deudor]    Script Date: 30/09/2023 21:02:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Consultar_deudor]
@cod_deudor nvarchar (10)
as
select * from deudores 
GO
/****** Object:  StoredProcedure [dbo].[Consultar_turno]    Script Date: 30/09/2023 21:02:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Consultar_turno]
@cod_turno nvarchar (10)
as
select * from Turno
GO
USE [master]
GO
ALTER DATABASE [barberia] SET  READ_WRITE 
GO
