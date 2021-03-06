CREATE DATABASE MHRS

USE MHRS

/****** Object:  Table [dbo].[City]    Script Date: 12.10.2016 01:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[LicensePlate] [char](2) NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[LicensePlate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clinic]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clinic](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CheckupPeriod] [int] NOT NULL,
 CONSTRAINT [PK_Clinic] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Doctor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TC] [char](11) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,
	[TitleID] [int] NOT NULL,
 CONSTRAINT [PK_Doctor_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hos_Clin_Poli_Dr]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hos_Clin_Poli_Dr](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HospitalID] [int] NOT NULL,
	[ClinicID] [int] NOT NULL,
	[PoliclinicID] [int] NOT NULL,
	[DoctorID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Hos_Clin_Poli_Dr_Active]  DEFAULT ((1)),
 CONSTRAINT [PK_Hos_Clin_Poli_Dr_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hospital]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hospital](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[TownID] [int] NOT NULL,
 CONSTRAINT [PK_Hospital] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Policlinic]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Policlinic](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Policlinic] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reserve]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserve](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[hcpdID] [int] NOT NULL,
	[ReserveDate] [date] NOT NULL,
	[ReserveTime] [time](0) NOT NULL,
	[IsPassed] [bit] NULL CONSTRAINT [DF_Reserve_IsPassed]  DEFAULT ((0)),
	[IsDrop] [bit] NULL CONSTRAINT [DF_Reserve_IsDrop]  DEFAULT ((0)),
 CONSTRAINT [PK_Reserve] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SecretQuestion]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SecretQuestion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Question] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SecretQuestion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Title]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Title](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Title] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Town]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Town](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[CityLicensePlate] [char](2) NOT NULL,
 CONSTRAINT [PK_Town] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TC] [char](11) NOT NULL,
	[Password] [varchar](15) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[PlaceOfBirth] [varchar](100) NULL,
	[FatherName] [varchar](50) NULL,
	[MotherName] [varchar](50) NULL,
	[Phone] [char](11) NOT NULL,
	[Email] [nvarchar](60) NOT NULL,
	[SecretID] [int] NOT NULL,
	[SecretAnswer] [varchar](50) NOT NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vw_GetCity]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_GetCity]
AS
SELECT * FROM City

GO
/****** Object:  View [dbo].[vw_GetClinic]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_GetClinic]
AS
SELECT DISTINCT c.Id [Clinic ID],c.Name [Clinic Name],c.CheckupPeriod [Clinic CheckupPreiod],t.Id [Town ID] FROM Town t
INNER JOIN Hospital h ON t.Id = h.TownID
INNER JOIN Hos_Clin_Poli_Dr hcpd ON hcpd.HospitalID = h.Id
INNER JOIN Clinic c ON c.Id = hcpd.ClinicID
GO
/****** Object:  View [dbo].[vw_GetDoctor]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_GetDoctor]
AS
SELECT DISTINCT 
                  d.Id AS [Doctor ID], d.TC AS [Doctor TC], d.FirstName AS [Doctor FirstName], d.LastName AS [Doctor LastName], d.TitleID AS [Doctor TitleID], d.Gender AS [Doctor Gender], p.Id AS [Policlinic ID], t.Id AS [Town ID], 
                  c.Id AS [Clinic ID], h.Id AS [Hospital ID], dbo.Title.Id AS TitleID, dbo.Title.Name AS TitleName
FROM     dbo.Town AS t INNER JOIN
                  dbo.Hospital AS h ON t.Id = h.TownID INNER JOIN
                  dbo.Hos_Clin_Poli_Dr AS hcpd ON hcpd.HospitalID = h.Id INNER JOIN
                  dbo.Clinic AS c ON c.Id = hcpd.ClinicID INNER JOIN
                  dbo.Policlinic AS p ON p.Id = hcpd.PoliclinicID INNER JOIN
                  dbo.Doctor AS d ON d.Id = hcpd.DoctorID INNER JOIN
                  dbo.Title ON d.TitleID = dbo.Title.Id

GO
/****** Object:  View [dbo].[vw_GetHCPD]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_GetHCPD]
AS
SELECT * FROM Hos_Clin_Poli_Dr

GO
/****** Object:  View [dbo].[vw_GethcpdIDInDoctor]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_GethcpdIDInDoctor]
AS
SELECT * FROM Hos_Clin_Poli_Dr
GO
/****** Object:  View [dbo].[vw_GetHospital]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_GetHospital]
AS
SELECT DISTINCT h.Id [Hospital ID],h.Name [Hospital Name],c.Id [Clinic ID],t.Id [Town ID] FROM Town t
INNER JOIN Hospital h ON t.Id = h.TownID
INNER JOIN Hos_Clin_Poli_Dr hcpd ON hcpd.HospitalID = h.Id
INNER JOIN Clinic c ON c.Id = hcpd.ClinicID

GO
/****** Object:  View [dbo].[vw_GetPoliclinic]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_GetPoliclinic]
AS
SELECT DISTINCT p.Id [Policlinic ID],p.Name,t.Id [Town ID],c.Id[Clinic ID],h.Id[Hospital ID] FROM Town t
INNER JOIN Hospital h ON t.Id = h.TownID
INNER JOIN Hos_Clin_Poli_Dr hcpd ON hcpd.HospitalID = h.Id
INNER JOIN Clinic c ON c.Id = hcpd.ClinicID
INNER JOIN Policlinic p ON p.Id = hcpd.PoliclinicID

GO
/****** Object:  View [dbo].[vw_GetReserve]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_GetReserve]
AS
SELECT * FROM Reserve
GO
/****** Object:  View [dbo].[vw_GetReserveControl]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_GetReserveControl]
AS
SELECT u.Id [UserID], c.Id [ClinicID] ,r.IsPassed [IsPassed],r.IsDrop [IsDrop] FROM Reserve r 
INNER JOIN Hos_Clin_Poli_Dr hcpd ON hcpd.Id = r.hcpdID
INNER JOIN Clinic c ON c.Id = hcpd.ClinicID
INNER JOIN [User] u ON r.UserID = u.Id
GO
/****** Object:  View [dbo].[vw_GetReserveHistory]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_GetReserveHistory]
AS
SELECT r.Id AS [Reserve ID], h.Name AS [Hospital Name], c.Name AS [Clinic Name], p.Name AS [Policlinic Name], d.FirstName AS [Doctor FirstName], d.LastName AS [Doctor LastName], r.ReserveDate, r.ReserveTime, r.IsPassed, 
                  r.IsDrop, u.Id AS [User ID], t.Name AS TitleName
FROM     dbo.Doctor AS d INNER JOIN
                  dbo.Hos_Clin_Poli_Dr AS hcpd ON hcpd.DoctorID = d.Id INNER JOIN
                  dbo.Reserve AS r ON r.hcpdID = hcpd.Id INNER JOIN
                  dbo.[User] AS u ON u.Id = r.UserID INNER JOIN
                  dbo.Clinic AS c ON c.Id = hcpd.ClinicID INNER JOIN
                  dbo.Hospital AS h ON hcpd.HospitalID = h.Id INNER JOIN
                  dbo.Policlinic AS p ON hcpd.PoliclinicID = p.Id INNER JOIN
                  dbo.Title AS t ON d.TitleID = t.Id

GO
/****** Object:  View [dbo].[vw_GetSecretQuestion]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_GetSecretQuestion]
AS
SELECT Id,Question FROM SecretQuestion
GO
/****** Object:  View [dbo].[vw_GetTitle]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_GetTitle]
AS
SELECT * FROM Title
GO
/****** Object:  View [dbo].[vw_GetTown]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_GetTown]
AS
SELECT t.Id,t.Name,t.CityLicensePlate FROM Town t

GO
/****** Object:  View [dbo].[vw_GetUser]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_GetUser]
AS
SELECT * FROM [User]
GO
/****** Object:  View [dbo].[vw_UserInformation]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_UserInformation]
AS
SELECT u.TC [User TC],u.FirstName[User FirstName],u.LastName[User LastName],u.Email[User Email],u.[Password] [User Password],sq.Question[SQ],u.SecretAnswer [SA] FROM [User] u
INNER JOIN SecretQuestion sq ON u.SecretID = sq.Id
GO
/****** Object:  View [dbo].[vw_UserLogin]    Script Date: 12.10.2016 01:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_UserLogin]
AS
SELECT Id [User ID],TC [User TC], [Password] [User Password] FROM [User]
GO
INSERT [dbo].[City] ([LicensePlate], [Name]) VALUES (N'06', N'Ankara')
INSERT [dbo].[City] ([LicensePlate], [Name]) VALUES (N'11', N'Bilecik')
INSERT [dbo].[City] ([LicensePlate], [Name]) VALUES (N'16', N'Bursa')
INSERT [dbo].[City] ([LicensePlate], [Name]) VALUES (N'34', N'İstanbul')
INSERT [dbo].[City] ([LicensePlate], [Name]) VALUES (N'35', N'İzmir')
INSERT [dbo].[City] ([LicensePlate], [Name]) VALUES (N'39', N'Kırklareli')
INSERT [dbo].[City] ([LicensePlate], [Name]) VALUES (N'52', N'Ordu')
INSERT [dbo].[City] ([LicensePlate], [Name]) VALUES (N'61', N'Trabzon')
SET IDENTITY_INSERT [dbo].[Clinic] ON 

INSERT [dbo].[Clinic] ([Id], [Name], [CheckupPeriod]) VALUES (1, N'Göz', 30)
INSERT [dbo].[Clinic] ([Id], [Name], [CheckupPeriod]) VALUES (2, N'KBB', 15)
INSERT [dbo].[Clinic] ([Id], [Name], [CheckupPeriod]) VALUES (3, N'Dahiliye', 20)
INSERT [dbo].[Clinic] ([Id], [Name], [CheckupPeriod]) VALUES (4, N'Genel Cerrahi', 20)
INSERT [dbo].[Clinic] ([Id], [Name], [CheckupPeriod]) VALUES (5, N'Beyin Cerrahi', 20)
INSERT [dbo].[Clinic] ([Id], [Name], [CheckupPeriod]) VALUES (6, N'Radyoloji', 20)
INSERT [dbo].[Clinic] ([Id], [Name], [CheckupPeriod]) VALUES (7, N'Diş', 30)
INSERT [dbo].[Clinic] ([Id], [Name], [CheckupPeriod]) VALUES (8, N'Psikiyatri', 30)
INSERT [dbo].[Clinic] ([Id], [Name], [CheckupPeriod]) VALUES (9, N'Cildiye', 15)
INSERT [dbo].[Clinic] ([Id], [Name], [CheckupPeriod]) VALUES (10, N'Nöroloji', 15)
SET IDENTITY_INSERT [dbo].[Clinic] OFF
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (1, N'12223241413', N'Şabettin', N'Bacaksız', 1, 2)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (2, N'12312432433', N'Kamil', N'Ateş', 1, 6)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (3, N'12345678912', N'Ahmet', N'Sarı', 1, 1)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (4, N'12355654768', N'Hüseyin', N'Şen', 1, 6)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (5, N'12423543677', N'Meriç', N'Fırat', 0, 6)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (6, N'12435443678', N'Meral', N'Eryol', 0, 4)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (7, N'14324543515', N'Tuğçe', N'Aru', 0, 4)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (8, N'23423423423', N'Murat', N'Gündoğdu', 1, 1)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (9, N'23423522522', N'Kemalettin', N'Tunç', 1, 5)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (10, N'23423523554', N'Narin', N'Eker', 0, 5)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (11, N'23443654365', N'Furkan', N'Başaran', 1, 3)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (12, N'23445664522', N'Halil', N'Gürsoy', 1, 3)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (13, N'23454546564', N'Kemal', N'Şaki', 1, 5)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (14, N'23456546764', N'Betül', N'Aksoy', 0, 2)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (15, N'23523422523', N'Ateş', N'Türkkan', 1, 6)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (16, N'23534643523', N'Emel', N'Sayar', 0, 4)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (17, N'23534654362', N'Hülya', N'Polat', 0, 4)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (18, N'23554654678', N'Selim', N'Gürbüz', 1, 3)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (19, N'23749238473', N'Filiz', N'Ekmekçi', 0, 5)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (20, N'23847328432', N'Başak', N'Akyüz', 0, 4)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (21, N'23942938428', N'Dilek', N'Atınç', 0, 5)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (22, N'23948232343', N'Yiğit', N'Köse', 1, 4)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (23, N'24392423324', N'Arzu', N'Başak', 0, 3)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (24, N'24578346734', N'Seda', N'Bayraktar', 0, 2)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (25, N'32423456546', N'Merve', N'Korgun', 0, 2)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (26, N'32482395844', N'Sena', N'Yıldız', 0, 4)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (27, N'32483284832', N'Bayram', N'Dalgıçlar', 1, 6)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (28, N'32749234233', N'Behzat', N'Güney', 1, 5)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (29, N'32784237433', N'Emre', N'Tokatçı', 1, 2)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (30, N'32832572985', N'Gürkan', N'Gürsu', 1, 5)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (31, N'32944354354', N'Ela', N'Kaya', 0, 2)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (32, N'34237422342', N'Kerim', N'Kaya', 1, 6)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (33, N'34324328423', N'Raif', N'Çıplak', 1, 3)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (34, N'34383838833', N'Zekiye', N'Uygur', 0, 2)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (35, N'34424234233', N'Kerem', N'Gündüz', 1, 3)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (36, N'34567890987', N'Büşra', N'Yıldırım', 0, 2)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (37, N'34577545643', N'Aytaç', N'Ekin', 1, 1)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (38, N'34645734534', N'Toni', N'Demirci', 1, 2)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (39, N'34665745634', N'Gizem', N'Gebzeli', 0, 2)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (40, N'34753498758', N'Doğan', N'Çevreci', 1, 1)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (41, N'34758347584', N'Hamdi', N'Güler', 1, 3)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (42, N'34857345453', N'Dursun', N'Ustaoğlu', 1, 5)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (43, N'34859439744', N'Sadullah', N'Yirmisekizincioğulları', 1, 6)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (44, N'34878747777', N'Cabbar', N'Soysuz', 1, 3)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (45, N'34895738475', N'Mehmet', N'Yeşildağ', 1, 1)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (46, N'34958734754', N'Ali', N'Hakyemez', 1, 1)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (47, N'38475934848', N'Serhat', N'Tabakçı', 1, 4)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (48, N'38493543844', N'Ferhat', N'Cahiller', 1, 3)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (49, N'39284732947', N'Ayşe', N'Kaya', 0, 2)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (50, N'39743274373', N'Bektaş', N'Heybeci', 1, 4)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (51, N'43534534543', N'Ceren', N'Beklemez', 0, 4)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (52, N'43583459345', N'Ruhi', N'Keser', 1, 5)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (53, N'44354353655', N'Mehtap', N'Palabıyık', 0, 5)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (54, N'44357887553', N'Dilara', N'Uçan', 0, 5)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (55, N'45345353454', N'Hüsnü', N'Çoban', 1, 2)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (56, N'45654684755', N'Hasret', N'Geçer', 0, 6)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (57, N'45676545677', N'Melis', N'Candan', 0, 1)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (58, N'45678964528', N'Gamze', N'Demir', 0, 5)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (59, N'45767657443', N'Yiğit', N'Taş', 1, 3)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (60, N'45968549655', N'Sergen', N'Satan', 1, 3)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (61, N'46765768456', N'Gizem', N'Eryol', 0, 4)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (62, N'49358394574', N'Ayşegül', N'Gezer', 0, 6)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (63, N'49385434354', N'Gizem', N'Çırak', 0, 1)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (64, N'49495949694', N'Melek', N'Ateş', 0, 1)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (65, N'52343242345', N'Pelin', N'Nur', 0, 2)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (66, N'52432342423', N'Cemil', N'Ay', 1, 1)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (67, N'52553653653', N'Fatih', N'Çelebi', 1, 1)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (68, N'54635623452', N'Hadise', N'Yedi', 0, 6)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (69, N'54654634523', N'Buse', N'Bornova', 0, 1)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (70, N'55474353434', N'Remzi', N'Türk', 1, 6)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (71, N'56567787665', N'Deniz', N'Güven', 0, 6)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (72, N'56789765788', N'Serkan', N'Mutlu', 1, 1)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (73, N'62346235678', N'Melisa', N'Yıldız', 0, 4)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (74, N'65756767867', N'Ayşe', N'Akın', 0, 1)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (75, N'65765733453', N'Bayram', N'Başar', 1, 3)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (76, N'66774677335', N'Samet', N'Can', 1, 2)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (77, N'67684344366', N'Durancan', N'Yılmaz', 1, 2)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (78, N'67890734233', N'Sedef', N'Çakmak', 0, 4)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (79, N'72348787237', N'Dilara', N'Gözügörmez', 0, 6)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (80, N'72574854357', N'Mehmet', N'Çolak', 1, 5)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (81, N'73459347543', N'İsmet', N'Dursun', 1, 5)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (82, N'74564564456', N'Serkan', N'Ateş', 1, 3)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (83, N'76543215654', N'Elif', N'Özbek', 0, 1)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (84, N'79762472534', N'Mehmet', N'Erdem', 1, 5)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (85, N'79797987474', N'Ali', N'Yıldız', 1, 3)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (86, N'82734687236', N'Canan', N'Budak', 0, 4)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (87, N'82955734784', N'Halil', N'Kütükçü', 1, 5)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (88, N'83475934879', N'Ayten', N'Adıgüzel', 0, 4)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (89, N'84353484849', N'Eda', N'Sağıroğu', 0, 3)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (90, N'87435974774', N'İhsan', N'Duran', 1, 1)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (91, N'87593475894', N'Davut', N'Fındıkçı', 1, 4)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (92, N'87598797878', N'Fidan', N'Oduncuoğlu', 0, 6)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (93, N'87652345673', N'Poyraz', N'Tahta', 1, 5)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (94, N'87977347733', N'Ayça', N'Has', 0, 6)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (95, N'88832427343', N'Burak', N'Sepetçi', 1, 3)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (96, N'88989324324', N'Altan', N'Baş', 1, 5)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (97, N'89067876465', N'Ozan', N'Geniş', 1, 1)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (98, N'89324923432', N'Dursun', N'Çakır', 1, 1)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (99, N'89384797873', N'Nuray', N'Ay', 0, 3)
GO
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (100, N'89889999999', N'Sümeyye', N'Hisat', 0, 2)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (101, N'90343243283', N'Pelinay', N'Köroğlu', 0, 4)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (102, N'92348328233', N'Neslihan', N'Subaşı', 0, 4)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (103, N'92423002394', N'Can', N'Atacan', 1, 6)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (104, N'92945348743', N'Zehra', N'Uygun', 0, 2)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (105, N'92954785734', N'Hasan', N'Kitapçı', 1, 5)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (106, N'93453453475', N'Polat', N'Kazımlar', 1, 2)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (107, N'93459438384', N'Tarık', N'Suat', 1, 2)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (108, N'93485349548', N'Hülya', N'Bahçeci', 0, 2)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (109, N'94358345734', N'Betül', N'Aktaş', 0, 3)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (110, N'97598473975', N'Kazım', N'Durmaz', 1, 4)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (111, N'98237423753', N'Turgut', N'Demir', 1, 1)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (112, N'98237487345', N'Sevilay', N'Küçük', 0, 6)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (113, N'98237538484', N'Edip', N'Aktel', 1, 3)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (114, N'98343945734', N'Yüksel', N'Bekletmez', 1, 6)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (115, N'98893473483', N'Turgay', N'Abazoğlu', 1, 1)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (116, N'99003003949', N'Şahap', N'Üzülmez', 1, 1)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (117, N'99923034239', N'Rukiye', N'Bekir', 0, 3)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (118, N'99940030044', N'Doğan', N'Kahvecioğlu', 1, 1)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (119, N'99988899898', N'Keriman', N'Ceviz', 0, 4)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (120, N'23423423344', N'Ayşe', N'Abdal', 0, 2)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (121, N'87868767854', N'Selim', N'Güngören', 1, 4)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (122, N'12334255335', N'Hayrettin', N'Ekinci', 1, 3)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (123, N'76863428764', N'Buse', N'Ayyıldız', 0, 2)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (124, N'42342342344', N'Neşe', N'Kardemir', 0, 5)
INSERT [dbo].[Doctor] ([Id], [TC], [FirstName], [LastName], [Gender], [TitleID]) VALUES (125, N'54323131234', N'Halil', N'Karaboğa', 1, 6)
SET IDENTITY_INSERT [dbo].[Doctor] OFF
SET IDENTITY_INSERT [dbo].[Hos_Clin_Poli_Dr] ON 

INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (1, 1, 1, 1, 1, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (2, 1, 2, 4, 2, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (3, 2, 7, 19, 3, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (4, 2, 7, 20, 4, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (5, 3, 4, 10, 5, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (6, 3, 4, 11, 6, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (7, 3, 6, 16, 7, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (8, 4, 1, 1, 8, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (9, 4, 1, 2, 9, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (10, 4, 2, 4, 10, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (11, 4, 9, 25, 11, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (12, 5, 3, 7, 12, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (13, 6, 5, 13, 13, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (14, 6, 10, 28, 14, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (15, 6, 5, 13, 15, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (16, 6, 5, 14, 16, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (17, 7, 9, 25, 17, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (18, 7, 9, 26, 18, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (19, 7, 9, 27, 19, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (20, 8, 1, 1, 20, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (21, 8, 2, 4, 21, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (22, 8, 3, 7, 22, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (23, 9, 6, 16, 23, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (24, 9, 6, 17, 24, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (25, 9, 3, 7, 25, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (26, 10, 10, 28, 26, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (27, 10, 10, 29, 27, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (28, 11, 1, 1, 28, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (29, 11, 1, 2, 29, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (30, 11, 2, 4, 30, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (31, 11, 2, 5, 31, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (32, 11, 2, 6, 32, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (33, 11, 3, 7, 33, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (34, 11, 8, 22, 34, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (35, 12, 5, 13, 35, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (36, 12, 7, 19, 36, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (37, 12, 9, 25, 37, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (38, 12, 8, 22, 38, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (39, 12, 10, 28, 39, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (40, 12, 10, 29, 40, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (41, 13, 5, 13, 41, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (42, 13, 6, 16, 42, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (43, 13, 6, 17, 43, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (44, 14, 3, 7, 44, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (45, 14, 4, 10, 45, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (46, 14, 4, 11, 46, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (47, 14, 5, 13, 47, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (48, 15, 7, 19, 48, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (49, 15, 7, 20, 49, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (50, 15, 7, 21, 50, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (51, 16, 7, 19, 51, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (52, 16, 8, 22, 52, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (53, 16, 9, 25, 53, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (54, 17, 1, 1, 54, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (55, 17, 1, 2, 55, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (56, 17, 5, 10, 56, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (57, 17, 7, 17, 57, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (58, 18, 7, 19, 58, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (59, 18, 7, 20, 59, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (60, 18, 7, 21, 60, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (61, 19, 1, 1, 61, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (62, 19, 1, 2, 62, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (63, 19, 2, 4, 63, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (64, 19, 2, 5, 64, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (65, 19, 9, 25, 65, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (66, 20, 7, 19, 67, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (67, 20, 7, 20, 68, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (68, 20, 7, 21, 69, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (69, 21, 7, 19, 70, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (70, 21, 7, 20, 71, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (71, 22, 5, 13, 72, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (72, 22, 3, 7, 73, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (73, 23, 8, 22, 74, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (74, 23, 9, 25, 75, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (75, 23, 10, 28, 76, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (76, 24, 9, 25, 77, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (77, 24, 9, 26, 78, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (78, 24, 8, 22, 79, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (79, 25, 7, 19, 80, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (80, 25, 7, 20, 81, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (81, 25, 7, 21, 82, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (82, 26, 3, 7, 83, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (83, 26, 3, 8, 84, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (84, 26, 3, 9, 85, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (85, 27, 5, 13, 86, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (86, 27, 5, 14, 87, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (87, 27, 5, 15, 88, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (88, 27, 6, 16, 89, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (89, 27, 6, 17, 90, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (90, 28, 7, 19, 91, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (91, 28, 7, 20, 92, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (92, 28, 7, 21, 93, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (93, 29, 2, 4, 94, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (94, 29, 2, 5, 95, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (95, 29, 2, 6, 96, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (96, 29, 3, 7, 97, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (97, 30, 8, 22, 98, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (98, 30, 8, 23, 99, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (99, 30, 5, 13, 100, 1)
GO
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (100, 30, 5, 14, 101, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (101, 30, 1, 1, 102, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (102, 31, 4, 10, 103, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (103, 31, 4, 11, 104, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (104, 31, 4, 12, 105, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (105, 31, 5, 13, 106, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (106, 31, 5, 14, 107, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (107, 31, 5, 15, 108, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (108, 31, 6, 16, 109, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (109, 32, 7, 19, 110, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (110, 32, 7, 20, 111, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (111, 32, 7, 21, 112, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (112, 33, 1, 1, 113, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (113, 33, 1, 2, 114, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (114, 33, 1, 3, 115, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (115, 33, 5, 13, 116, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (116, 33, 6, 16, 117, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (117, 33, 9, 25, 118, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (118, 33, 8, 22, 119, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (119, 33, 8, 23, 66, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (120, 15, 7, 19, 120, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (121, 15, 7, 19, 121, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (122, 15, 7, 19, 122, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (123, 15, 7, 20, 123, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (124, 15, 7, 20, 124, 1)
INSERT [dbo].[Hos_Clin_Poli_Dr] ([Id], [HospitalID], [ClinicID], [PoliclinicID], [DoctorID], [IsActive]) VALUES (125, 15, 7, 20, 125, 1)
SET IDENTITY_INSERT [dbo].[Hos_Clin_Poli_Dr] OFF
SET IDENTITY_INSERT [dbo].[Hospital] ON 

INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (1, N'Arnavutköy Devlet Hastanesi', 35)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (2, N'Ataşehir Ağız ve Diş Sağlığı Hastanesi', 10)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (3, N'Ataşehir Fatih Sultan Mehmet Eğitim ve Araştırma Hastanesi', 10)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (4, N'Bağcılar Eğitim ve Araştırma Hastanesi', 12)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (5, N'Bahçelievler Fizik Tedavi ve Rehabilitaston Eğitim ve Araştırma Hastanesi', 13)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (6, N'Bahçelievler Devlet Hastanesi', 13)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (7, N'Bakırköy Lepra Deri ve Zührevi Hastalıklar Hastanesi', 11)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (8, N'Şişli Etfal Eğitim ve Araştırma Hastanesi', 14)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (9, N'Şişli - Okmeydanı Eğitim ve Araştırma Hastanesi', 14)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (10, N'Bozüyük Devlet Hastanesi', 2)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (11, N'Söğüt Devlet Hastanesi', 5)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (12, N'Bilecik Devlet Hastanesi ', 1)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (13, N'Osmaneli Devlet Hastanesi', 36)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (14, N'Çekirge Devlet Hastanesi', 9)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (15, N'Nilüfer Ağız ve Diş Sağlığı Merkezi', 7)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (16, N'Bursa Devlet Hastanesi', 6)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (17, N'İzmir Foça Devlet Hastanesi', 16)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (18, N'İzmir Alsancak Ağız ve Diş Sağlığı Merkezi', 37)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (19, N'Tepecik Eğitim ve Araştırma Hastanesi', 38)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (20, N'İzmir Karşıyaka Ağız veDiş Sağlığı Merkezi', 17)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (21, N'Mamak Ağız ve Diş Sağlığı Merkezi', 21)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (22, N'Beypazarı Devlet Hastanesi', 20)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (23, N'29 Mayıs Devlet Hastanesi', 39)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (24, N'Atatürk Eğitim ve Araştırma Hastanesi', 20)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (25, N'Trabzon Ağız ve Diş Sağlığı Merkezi', 22)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (26, N'Maçka Ömer Burhanoğlu Fizik Tedavi  ve Rehabilitasyon Merkezi', 24)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (27, N'Sürmene Devlet Hastanesi', 23)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (28, N'Kırklareli Ağız ve Diş Sağlığı Merkezi', 27)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (29, N'Kırklareli Devlet Hastanesi', 27)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (30, N'Kırklareli Lüleburgaz Devlet Hastanesi', 28)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (31, N'Ordu Devlet Hastanesi', 32)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (32, N'Ordu Ağız ve Diş Sağlığı Merkezi', 32)
INSERT [dbo].[Hospital] ([Id], [Name], [TownID]) VALUES (33, N'Ordu Ünye Devlet Hastanesi', 33)
SET IDENTITY_INSERT [dbo].[Hospital] OFF
SET IDENTITY_INSERT [dbo].[Policlinic] ON 

INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (1, N'Göz 1')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (2, N'Göz 2')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (3, N'Göz 3')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (4, N'KBB 1')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (5, N'KBB 2 ')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (6, N'KBB 3')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (7, N'Dahiliye 1')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (8, N'Dahiliye 2')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (9, N'Dahiliye 3')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (10, N'Genel Cerrahi 1')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (11, N'Genel Cerrahi 2')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (12, N'Genel Cerrahi 3')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (13, N'Beyin Cerrahi 1')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (14, N'Beyin Cerrahi 2')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (15, N'Beyin Cerrahi 3')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (16, N'Radyoloji 1')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (17, N'Radyoloji 2')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (18, N'Radyoloji 3')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (19, N'Diş 1')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (20, N'Diş 2')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (21, N'Diş 3')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (22, N'Psikiyatri 1')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (23, N'Psikiyatri 2')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (24, N'Psikiyatri 3')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (25, N'Cildiye 1')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (26, N'Cildiye 2 ')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (27, N'Cildiye 3')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (28, N'Nöroloji 1')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (29, N'Nöroloji 2')
INSERT [dbo].[Policlinic] ([Id], [Name]) VALUES (30, N'Nöroloji 3')
SET IDENTITY_INSERT [dbo].[Policlinic] OFF
SET IDENTITY_INSERT [dbo].[Reserve] ON 

INSERT [dbo].[Reserve] ([Id], [UserID], [hcpdID], [ReserveDate], [ReserveTime], [IsPassed], [IsDrop]) VALUES (35, 2, 69, CAST(N'2016-10-10' AS Date), CAST(N'11:30:00' AS Time), 1, 0)
INSERT [dbo].[Reserve] ([Id], [UserID], [hcpdID], [ReserveDate], [ReserveTime], [IsPassed], [IsDrop]) VALUES (36, 2, 72, CAST(N'2016-10-10' AS Date), CAST(N'09:00:00' AS Time), 1, 1)
INSERT [dbo].[Reserve] ([Id], [UserID], [hcpdID], [ReserveDate], [ReserveTime], [IsPassed], [IsDrop]) VALUES (37, 7, 72, CAST(N'2016-10-10' AS Date), CAST(N'12:00:00' AS Time), 1, 0)
INSERT [dbo].[Reserve] ([Id], [UserID], [hcpdID], [ReserveDate], [ReserveTime], [IsPassed], [IsDrop]) VALUES (38, 5, 72, CAST(N'2016-10-10' AS Date), CAST(N'13:00:00' AS Time), 1, 0)
INSERT [dbo].[Reserve] ([Id], [UserID], [hcpdID], [ReserveDate], [ReserveTime], [IsPassed], [IsDrop]) VALUES (39, 7, 71, CAST(N'2016-10-10' AS Date), CAST(N'13:40:00' AS Time), 1, 0)
INSERT [dbo].[Reserve] ([Id], [UserID], [hcpdID], [ReserveDate], [ReserveTime], [IsPassed], [IsDrop]) VALUES (40, 2, 102, CAST(N'2016-10-10' AS Date), CAST(N'10:40:00' AS Time), 1, 0)
INSERT [dbo].[Reserve] ([Id], [UserID], [hcpdID], [ReserveDate], [ReserveTime], [IsPassed], [IsDrop]) VALUES (47, 7, 72, CAST(N'2016-10-11' AS Date), CAST(N'09:00:00' AS Time), 0, 1)
INSERT [dbo].[Reserve] ([Id], [UserID], [hcpdID], [ReserveDate], [ReserveTime], [IsPassed], [IsDrop]) VALUES (48, 7, 72, CAST(N'2016-10-12' AS Date), CAST(N'15:20:00' AS Time), 0, 1)
INSERT [dbo].[Reserve] ([Id], [UserID], [hcpdID], [ReserveDate], [ReserveTime], [IsPassed], [IsDrop]) VALUES (49, 7, 71, CAST(N'2016-10-12' AS Date), CAST(N'09:00:00' AS Time), 0, 0)
INSERT [dbo].[Reserve] ([Id], [UserID], [hcpdID], [ReserveDate], [ReserveTime], [IsPassed], [IsDrop]) VALUES (52, 7, 69, CAST(N'2016-10-12' AS Date), CAST(N'09:30:00' AS Time), 0, 0)
INSERT [dbo].[Reserve] ([Id], [UserID], [hcpdID], [ReserveDate], [ReserveTime], [IsPassed], [IsDrop]) VALUES (53, 7, 78, CAST(N'2016-10-12' AS Date), CAST(N'09:00:00' AS Time), 0, 1)
INSERT [dbo].[Reserve] ([Id], [UserID], [hcpdID], [ReserveDate], [ReserveTime], [IsPassed], [IsDrop]) VALUES (54, 7, 93, CAST(N'2016-10-12' AS Date), CAST(N'09:00:00' AS Time), 0, 0)
INSERT [dbo].[Reserve] ([Id], [UserID], [hcpdID], [ReserveDate], [ReserveTime], [IsPassed], [IsDrop]) VALUES (55, 7, 76, CAST(N'2016-10-12' AS Date), CAST(N'13:00:00' AS Time), 0, 1)
SET IDENTITY_INSERT [dbo].[Reserve] OFF
SET IDENTITY_INSERT [dbo].[SecretQuestion] ON 

INSERT [dbo].[SecretQuestion] ([Id], [Question]) VALUES (1, N'En Sevdiğin Arkadaşının Adı Nedir?')
INSERT [dbo].[SecretQuestion] ([Id], [Question]) VALUES (2, N'İlkokul Öğretmenin Adı Nedir?')
INSERT [dbo].[SecretQuestion] ([Id], [Question]) VALUES (3, N'Evcil Hayvanın Adı Nedir?')
SET IDENTITY_INSERT [dbo].[SecretQuestion] OFF
SET IDENTITY_INSERT [dbo].[Title] ON 

INSERT [dbo].[Title] ([Id], [Name]) VALUES (1, N'Dr.')
INSERT [dbo].[Title] ([Id], [Name]) VALUES (2, N'Op.Dr.')
INSERT [dbo].[Title] ([Id], [Name]) VALUES (3, N'Yard.Doc.Dr.')
INSERT [dbo].[Title] ([Id], [Name]) VALUES (4, N'Doc.Dr.')
INSERT [dbo].[Title] ([Id], [Name]) VALUES (5, N'Prof.Dr.')
INSERT [dbo].[Title] ([Id], [Name]) VALUES (6, N'Asist.')
SET IDENTITY_INSERT [dbo].[Title] OFF
SET IDENTITY_INSERT [dbo].[Town] ON 

INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (1, N'Merkez', N'11')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (2, N'Bozüyük', N'11')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (3, N'Gölpazarı', N'11')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (5, N'Söğüt', N'11')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (6, N'Merkez', N'16')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (7, N'Nilüfer', N'16')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (8, N'Mudanya', N'16')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (9, N'Çekirge', N'16')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (10, N'Ataşehir', N'34')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (11, N'Bakırköy', N'34')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (12, N'Bağcılar', N'34')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (13, N'Bahçelievler', N'34')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (14, N'Şişli', N'34')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (15, N'Konak', N'35')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (16, N'Foça', N'35')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (17, N'Karşıyaka', N'35')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (20, N'Beypazarı', N'06')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (21, N'Mamak', N'06')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (22, N'Merkez', N'61')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (23, N'Sürmene', N'61')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (24, N'Maçka', N'61')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (25, N'Akçabat', N'61')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (27, N'Merkez', N'39')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (28, N'Lüleburgaz', N'39')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (32, N'Merkez', N'52')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (33, N'Ünye', N'52')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (35, N'Arnavutköy', N'34')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (36, N'Osmaneli', N'11')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (37, N'Alsancak', N'35')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (38, N'Tepecik', N'35')
INSERT [dbo].[Town] ([Id], [Name], [CityLicensePlate]) VALUES (39, N'Merkez', N'06')
SET IDENTITY_INSERT [dbo].[Town] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [TC], [Password], [FirstName], [LastName], [Gender], [DateOfBirth], [PlaceOfBirth], [FatherName], [MotherName], [Phone], [Email], [SecretID], [SecretAnswer]) VALUES (1, N'12518564468', N'ali123', N'Ali', N'Aksoy', 1, CAST(N'1990-10-05' AS Date), N'Bilecik', N'Emre', N'Merve', N'05387895431', N'aliaksoy@gmail.com', 1, N'Kemal')
INSERT [dbo].[User] ([Id], [TC], [Password], [FirstName], [LastName], [Gender], [DateOfBirth], [PlaceOfBirth], [FatherName], [MotherName], [Phone], [Email], [SecretID], [SecretAnswer]) VALUES (2, N'12534862368', N'sinem123', N'Sinem', N'Koşu', 0, CAST(N'1990-06-15' AS Date), N'Edirne', N'Kemal', N'Kader', N'05368955683', N'sinemkosu@gmail.com', 2, N'Kamuran')
INSERT [dbo].[User] ([Id], [TC], [Password], [FirstName], [LastName], [Gender], [DateOfBirth], [PlaceOfBirth], [FatherName], [MotherName], [Phone], [Email], [SecretID], [SecretAnswer]) VALUES (3, N'15235486452', N'can123', N'Can', N'Ateş', 1, CAST(N'1992-10-11' AS Date), N'İstanbul', N'Gökhan', N'Meliha', N'05369898745', N'canates@gmail.com', 3, N'Boncuk')
INSERT [dbo].[User] ([Id], [TC], [Password], [FirstName], [LastName], [Gender], [DateOfBirth], [PlaceOfBirth], [FatherName], [MotherName], [Phone], [Email], [SecretID], [SecretAnswer]) VALUES (4, N'15876549528', N'dogan123', N'Doğan', N'Kahveci', 1, CAST(N'1992-11-14' AS Date), N'İstanbul', N'Ahmet', N'Ayşe', N'05388485953', N'dogankahveci92@hotmail.com', 1, N'Ayşe')
INSERT [dbo].[User] ([Id], [TC], [Password], [FirstName], [LastName], [Gender], [DateOfBirth], [PlaceOfBirth], [FatherName], [MotherName], [Phone], [Email], [SecretID], [SecretAnswer]) VALUES (5, N'15886458123', N'arzu123', N'Arzu', N'Maden', 0, CAST(N'1990-10-12' AS Date), N'İzmir', N'Ali', N'Zeynep', N'05236548569', N'arzumaden@gmail.com', 2, N'Selim')
INSERT [dbo].[User] ([Id], [TC], [Password], [FirstName], [LastName], [Gender], [DateOfBirth], [PlaceOfBirth], [FatherName], [MotherName], [Phone], [Email], [SecretID], [SecretAnswer]) VALUES (6, N'35654856845', N'pelin123', N'Pelin', N'Yılmaz', 0, CAST(N'1992-11-25' AS Date), N'İzmir', N'Sami', N'Cansu', N'05236598712', N'pelinyılmaz@gmail.com', 3, N'Rex')
INSERT [dbo].[User] ([Id], [TC], [Password], [FirstName], [LastName], [Gender], [DateOfBirth], [PlaceOfBirth], [FatherName], [MotherName], [Phone], [Email], [SecretID], [SecretAnswer]) VALUES (7, N'42361616650', N'mehmet123', N'Ahmet', N'Avcı', 1, CAST(N'1994-08-08' AS Date), N'Lüleburgaz/Kırklareli', N'Ahmet', N'Şirin', N'05398482923', N'mehmetavci39@gmail.com', 1, N'deneme')
INSERT [dbo].[User] ([Id], [TC], [Password], [FirstName], [LastName], [Gender], [DateOfBirth], [PlaceOfBirth], [FatherName], [MotherName], [Phone], [Email], [SecretID], [SecretAnswer]) VALUES (8, N'58954236412', N'fatih123', N'Fatih', N'Bayrak', 1, CAST(N'1980-12-10' AS Date), N'Ankara', N'Osman', N'Melek', N'05258456325', N'fatihbayrak@gmail.com', 2, N'Sultan')
INSERT [dbo].[User] ([Id], [TC], [Password], [FirstName], [LastName], [Gender], [DateOfBirth], [PlaceOfBirth], [FatherName], [MotherName], [Phone], [Email], [SecretID], [SecretAnswer]) VALUES (9, N'58954725125', N'burak123', N'Burak', N'Kaya', 1, CAST(N'1992-10-08' AS Date), N'İstanbul', N'Ali', N'Fatma', N'05386594258', N'burakkaya@programmer.net', 3, N'Maviş')
INSERT [dbo].[User] ([Id], [TC], [Password], [FirstName], [LastName], [Gender], [DateOfBirth], [PlaceOfBirth], [FatherName], [MotherName], [Phone], [Email], [SecretID], [SecretAnswer]) VALUES (10, N'67843456789', N'ayse123', N'Ayşe', N'Özkaynak', 0, CAST(N'1990-05-16' AS Date), N'Sinop', N'Ayhan', N'Zehra', N'05236545862', N'ayseozkaynak@gmail.com', 1, N'Burcu')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Title] FOREIGN KEY([TitleID])
REFERENCES [dbo].[Title] ([Id])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Title]
GO
ALTER TABLE [dbo].[Hos_Clin_Poli_Dr]  WITH CHECK ADD  CONSTRAINT [FK_Hos_Clin_Poli_Dr_Clinic] FOREIGN KEY([ClinicID])
REFERENCES [dbo].[Clinic] ([Id])
GO
ALTER TABLE [dbo].[Hos_Clin_Poli_Dr] CHECK CONSTRAINT [FK_Hos_Clin_Poli_Dr_Clinic]
GO
ALTER TABLE [dbo].[Hos_Clin_Poli_Dr]  WITH CHECK ADD  CONSTRAINT [FK_Hos_Clin_Poli_Dr_Doctor1] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctor] ([Id])
GO
ALTER TABLE [dbo].[Hos_Clin_Poli_Dr] CHECK CONSTRAINT [FK_Hos_Clin_Poli_Dr_Doctor1]
GO
ALTER TABLE [dbo].[Hos_Clin_Poli_Dr]  WITH CHECK ADD  CONSTRAINT [FK_Hos_Clin_Poli_Dr_Hospital] FOREIGN KEY([HospitalID])
REFERENCES [dbo].[Hospital] ([Id])
GO
ALTER TABLE [dbo].[Hos_Clin_Poli_Dr] CHECK CONSTRAINT [FK_Hos_Clin_Poli_Dr_Hospital]
GO
ALTER TABLE [dbo].[Hos_Clin_Poli_Dr]  WITH CHECK ADD  CONSTRAINT [FK_Hos_Clin_Poli_Dr_Policlinic] FOREIGN KEY([PoliclinicID])
REFERENCES [dbo].[Policlinic] ([Id])
GO
ALTER TABLE [dbo].[Hos_Clin_Poli_Dr] CHECK CONSTRAINT [FK_Hos_Clin_Poli_Dr_Policlinic]
GO
ALTER TABLE [dbo].[Hospital]  WITH CHECK ADD  CONSTRAINT [FK_Hospital_Town] FOREIGN KEY([TownID])
REFERENCES [dbo].[Town] ([Id])
GO
ALTER TABLE [dbo].[Hospital] CHECK CONSTRAINT [FK_Hospital_Town]
GO
ALTER TABLE [dbo].[Reserve]  WITH CHECK ADD  CONSTRAINT [FK_Reserve_Hos_Clin_Poli_Dr] FOREIGN KEY([hcpdID])
REFERENCES [dbo].[Hos_Clin_Poli_Dr] ([Id])
GO
ALTER TABLE [dbo].[Reserve] CHECK CONSTRAINT [FK_Reserve_Hos_Clin_Poli_Dr]
GO
ALTER TABLE [dbo].[Reserve]  WITH CHECK ADD  CONSTRAINT [FK_Reserve_User1] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Reserve] CHECK CONSTRAINT [FK_Reserve_User1]
GO
ALTER TABLE [dbo].[Town]  WITH CHECK ADD  CONSTRAINT [FK_Town_City1] FOREIGN KEY([CityLicensePlate])
REFERENCES [dbo].[City] ([LicensePlate])
GO
ALTER TABLE [dbo].[Town] CHECK CONSTRAINT [FK_Town_City1]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_SecretQuestion] FOREIGN KEY([SecretID])
REFERENCES [dbo].[SecretQuestion] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_SecretQuestion]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddReserve]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AddReserve]
(
@UserID int,
@HcpdID int,
@ReserveDate date,
@ReserveTime time(0)
)
AS
BEGIN

	INSERT INTO Reserve VALUES 
			(@UserID,@HcpdID, @ReserveDate, @ReserveTime, 0, 0)	
	END

GO
/****** Object:  StoredProcedure [dbo].[sp_AllReserve]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AllReserve]
(
@ClinicID int
)
AS
BEGIN
DECLARE @CheckupPeriod int
DECLARE @StartTime time(0)
DECLARE @FinishTime time(0)

SET @CheckupPeriod = (SELECT CheckupPeriod FROM Clinic WHERE Id = @ClinicID)
SET @StartTime = '09:00:00'
SET @FinishTime = '15:00:00'

WHILE @StartTime <= @FinishTime
	BEGIN
		IF(@StartTime <= '12:00:00' OR @StartTime >= '13:00:00' )
		BEGIN
		SELECT Count( @StartTime )
		END
	SET @StartTime = DATEADD(MINUTE,@CheckupPeriod,@StartTime)
	END 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CancelReserve]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_CancelReserve]
(
@ReserveID int
)
AS
BEGIN
 UPDATE Reserve SET IsDrop = 1
  WHERE @ReserveID = Id AND IsPassed = 0 AND IsDrop= 0
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCity]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetCity]
(
@CityLicensePlate char(2)
)
AS
BEGIN
SELECT * FROM vw_GetCity WHERE LicensePlate = @CityLicensePlate
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetClinic]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetClinic]
(
@TownID int
)
AS
BEGIN
SELECT[Clinic ID],[Clinic Name],[Clinic CheckupPreiod] FROM vw_GetClinic WHERE  [Town ID] = @TownID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetClinicOne]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetClinicOne]
(
@ClinicID int
)
AS
BEGIN
SELECT [Clinic ID],[Clinic Name],[Clinic CheckupPreiod] FROM vw_GetClinic WHERE  [Clinic ID] = @ClinicID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDoctor]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetDoctor]
(
@TownID int,
@ClinicID int,
@HospitalID int,
@PoliclinicID int
)
AS
BEGIN
Select [Doctor ID],[Doctor TC],[Doctor FirstName],[Doctor LastName],[Doctor TitleID],[Doctor Gender],[TitleName] From vw_GetDoctor WHERE [Town ID] = @TownID AND [Clinic ID] = @ClinicID AND [Hospital ID] = @HospitalID AND [Policlinic ID] = @PoliclinicID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDoctorOne]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetDoctorOne]
(
@DoctorID int
)
AS
BEGIN
SELECT [Doctor ID], [Doctor TC], [Doctor FirstName], [Doctor LastName], [Doctor TitleID], [Doctor Gender] FROM vw_GetDoctor WHERE [Doctor ID] = @DoctorID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetHCPDID]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetHCPDID]
(
@HospitalID int,
@ClinicID int,
@PoliclinicID int,
@DoctorID int
)
AS
BEGIN
SELECT Id FROM vw_GetHCPD WHERE DoctorID = @DoctorID AND HospitalID = @HospitalID AND ClinicID = @ClinicID AND PoliclinicID = @PoliclinicID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetHospital]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetHospital]
(
@TownID int,
@ClinicID int
)
AS
BEGIN
SELECT [Hospital ID],[Hospital Name],[Town ID] FROM  vw_GetHospital WHERE [Town ID] = @TownID AND [Clinic ID] = @ClinicID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetHospitalOne]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetHospitalOne]
(
@HospitalID int
)
AS
BEGIN
SELECT [Hospital ID],[Hospital Name]  FROM vw_GetHospital WHERE [Hospital ID] = @HospitalID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetHour]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetHour]
(
@Date date,
@DoctorID int
)
AS
BEGIN
DECLARE @hcpdID int

SET @hcpdID = (SELECT Id FROM vw_GethcpdIDInDoctor WHERE DoctorID = @DoctorID)
SELECT DISTINCT [ReserveTime] FROM vw_GetReserve WHERE ReserveDate = @Date AND IsDrop =0 AND hcpdID = @hcpdID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetPassword]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetPassword]
(
@Email nvarchar(60)
)
AS
BEGIN
SELECT [Id] FROM vw_GetUser WHERE Email = @Email
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetPeriod]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetPeriod]
(
@ClinicID int
)
AS
BEGIN
SELECT DISTINCT [Clinic CheckupPreiod] FROM vw_GetClinic WHERE [Clinic ID] = @ClinicID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetPoliclinic]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetPoliclinic]
(
@TownID int,
@ClinicID int,
@HospitalID int
)
AS
BEGIN
Select [Policlinic ID], Name From vw_GetPoliclinic WHERE [Town ID] = @TownID AND [Clinic ID] = @ClinicID AND [Hospital ID] = @HospitalID 
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetPoliclinicOne]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetPoliclinicOne]
(
@PoliclinicID int
)
AS
BEGIN
SELECT [Policlinic ID], [Name] FROM vw_GetPoliclinic WHERE [Policlinic ID] = @PoliclinicID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetReserveControl]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetReserveControl]
(
@UserID int,
@ClinicID int
)
AS
BEGIN
SELECT Count(*) [T] FROM vw_GetReserveControl WHERE  [ClinicID] = @ClinicID AND [UserID] = @UserID  AND ([IsPassed]= 0 AND [IsDrop] = 0 )
Group BY [UserID]
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetReserveHistory]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetReserveHistory]
(
@UserID int
)
AS
BEGIN
Select * FROM vw_GetReserveHistory WHERE [User ID] = @UserID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetSecretQuestion]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetSecretQuestion]
(
@SecretQuestionID int
)
AS
BEGIN
SELECT Id,Question  FROM vw_GetSecretQuestion WHERE Id = @SecretQuestionID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTitle]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetTitle]
AS
BEGIN
SELECT * FROM vw_GetTitle
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTitleOne]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetTitleOne]
(
@TitleID int
)
AS
BEGIN
SELECT * FROM vw_GetTitle WHERE Id = @TitleID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTown]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetTown]
(
@CityLicensePlate char(2)
)
AS
BEGIN
SELECT * FROM vw_GetTown WHERE CityLicensePlate = @CityLicensePlate
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetTownOne]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetTownOne]
(
@TownID int
)
AS
BEGIN
SELECT * FROM vw_GetTown WHERE Id = @TownID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUser]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetUser]
(
@UserID int
)
AS
BEGIN
SELECT * FROM vw_GetUser WHERE Id = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Login]
(
@TC char(11),
@Password varchar(15)
)
AS
BEGIN

 DECLARE @Control int
 DECLARE @Login int

 SET @Control = (SELECT COUNT(*) FROM vw_UserLogin WHERE  [User TC] = @TC)
 SET @Login = (SELECT COUNT(*) FROM vw_UserLogin WHERE [User TC] = @TC AND [User Password] = @Password)
	 IF (@Control = 1)
		 BEGIN		 
			  IF(@Login = 1)
				  BEGIN
					SELECT [User ID] FROM vw_UserLogin WHERE [User TC] = @TC AND [User Password] = @Password
				  END
			  ELSE
				  BEGIN
					SELECT 0 -- Şifre Hatalı
				  END
		 END
      ELSE
		BEGIN
		  SELECT -1 --Üye değil
		END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SendMail]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SendMail]
(
@TC char(11)
)
AS
BEGIN
SELECT * FROM vw_UserInformation WHERE [User TC] = @TC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateReserve]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UpdateReserve]
AS
BEGIN
UPDATE Reserve SET IsPassed = 1
WHERE ReserveDate <= CONVERT(DATE, GETDATE(), 23)  AND CONVERT(TIME(0), GETDATE(), 8) >= ReserveTime AND IsPassed = 0 AND IsDrop = 0
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserCreateAndControl]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UserCreateAndControl]
(
@TC char(11),
@Password varchar(15),
@FirstName varchar(50),
@LastName varchar(50),
@Gender bit,
@DateOfBirth date,
@PlaceOfBirth varchar(100),
@FatherName varchar(50),
@MotherName varchar(50),
@Phone char(11),
@Email nvarchar(60),
@SecretID int,
@SecretAnswer varchar(50)
)
AS
BEGIN
IF((SELECT count(*) FROM [User] WHERE TC =  @TC) = 1)
	BEGIN
		SELECT 0
	END
ELSE
	BEGIN
		INSERT INTO [User] (TC,Password,FirstName,LastName,Gender,DateOfBirth,PlaceOfBirth,FatherName,MotherName,Phone,Email,SecretID,SecretAnswer) VALUES(@TC,@Password,@FirstName,@LastName,@Gender,@DateOfBirth,
		@PlaceOfBirth,@FatherName,@MotherName,@Phone,@Email,@SecretID,@SecretAnswer)
		SELECT 'Üyelik Başarıyla Gerçekleşti!'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserProfilUpdate]    Script Date: 12.10.2016 01:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UserProfilUpdate]
(
@UserID int,
@Password varchar(15),
@FirstName varchar(50),
@LastName varchar(50),
@Gender bit,
@DateOfBirth date,
@PlaceOfBirth varchar(100),
@FatherName varchar(50),
@MotherName varchar(50),
@Phone char(11),
@Email nvarchar(60),
@SecretID int,
@SecretAnswer varchar(50)
)
AS
BEGIN
UPDATE [User] SET [Password] = @Password, FirstName = @FirstName, LastName = @LastName, Gender = @Gender , DateOfBirth = @DateOfBirth, PlaceOfBirth = @PlaceOfBirth, FatherName = @FatherName , MotherName = @MotherName , Phone = @Phone , Email = @Email, SecretID = @SecretID, SecretAnswer = @SecretAnswer  WHERE Id = @UserID 
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[36] 2[19] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -120
         Left = 0
      End
      Begin Tables = 
         Begin Table = "t"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 148
               Right = 249
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "h"
            Begin Extent = 
               Top = 154
               Left = 48
               Bottom = 295
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hcpd"
            Begin Extent = 
               Top = 301
               Left = 48
               Bottom = 464
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 469
               Left = 48
               Bottom = 610
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 616
               Left = 48
               Bottom = 735
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 735
               Left = 48
               Bottom = 898
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Title"
            Begin Extent = 
               Top = 124
               Left = 502
               Bottom = 243
               Right = 696
            End
            DisplayFlags = 280
            TopColumn = 0
     ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GetDoctor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'    End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GetDoctor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GetDoctor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[23] 4[45] 2[26] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -480
         Left = 0
      End
      Begin Tables = 
         Begin Table = "d"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hcpd"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "r"
            Begin Extent = 
               Top = 343
               Left = 48
               Bottom = 506
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u"
            Begin Extent = 
               Top = 511
               Left = 48
               Bottom = 674
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 679
               Left = 48
               Bottom = 820
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "h"
            Begin Extent = 
               Top = 493
               Left = 408
               Bottom = 634
               Right = 602
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 587
               Left = 739
               Bottom = 706
               Right = 933
            End
            DisplayFlags = 280
            TopColumn = 0
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GetReserveHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' End
         Begin Table = "t"
            Begin Extent = 
               Top = 523
               Left = 717
               Bottom = 642
               Right = 911
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1968
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GetReserveHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GetReserveHistory'
GO
