USE [master]
GO
/****** Object:  Database [DevoteeServer]    Script Date: 03-08-2024 13:29:40 ******/
CREATE DATABASE [DevoteeServer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DevoteeServer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL2019\MSSQL\DATA\DevoteeServer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DevoteeServer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL2019\MSSQL\DATA\DevoteeServer.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DevoteeServer] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DevoteeServer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DevoteeServer] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [DevoteeServer] SET ANSI_NULLS ON 
GO
ALTER DATABASE [DevoteeServer] SET ANSI_PADDING ON 
GO
ALTER DATABASE [DevoteeServer] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [DevoteeServer] SET ARITHABORT ON 
GO
ALTER DATABASE [DevoteeServer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DevoteeServer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DevoteeServer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DevoteeServer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DevoteeServer] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [DevoteeServer] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [DevoteeServer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DevoteeServer] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [DevoteeServer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DevoteeServer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DevoteeServer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DevoteeServer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DevoteeServer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DevoteeServer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DevoteeServer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DevoteeServer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DevoteeServer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DevoteeServer] SET RECOVERY FULL 
GO
ALTER DATABASE [DevoteeServer] SET  MULTI_USER 
GO
ALTER DATABASE [DevoteeServer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DevoteeServer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DevoteeServer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DevoteeServer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DevoteeServer] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DevoteeServer] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DevoteeServer] SET QUERY_STORE = OFF
GO
USE [DevoteeServer]
GO
/****** Object:  Table [dbo].[Devotees]    Script Date: 03-08-2024 13:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Devotees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [nvarchar](max) NOT NULL,
	[middlename] [nvarchar](max) NOT NULL,
	[lastname] [nvarchar](max) NOT NULL,
	[emaidId] [nvarchar](max) NOT NULL,
	[devoteeLoginId] [nvarchar](max) NULL,
	[InitiationDate] [datetime2](7) NOT NULL,
	[flatno] [int] NOT NULL,
	[area] [nvarchar](max) NOT NULL,
	[city] [nvarchar](max) NOT NULL,
	[state] [nvarchar](max) NOT NULL,
	[pincode] [nvarchar](max) NOT NULL,
	[UserImageId] [int] NULL,
	[UserImageURL] [nvarchar](max) NULL,
	[CreatedByID] [int] NULL,
	[UpdatedByID] [int] NULL,
	[CreatedDate] [datetime2](7) NULL,
	[UpdatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Devotees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donations]    Script Date: 03-08-2024 13:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DonationAmount] [int] NOT NULL,
	[DonationDate] [datetime2](7) NOT NULL,
	[year] [int] NOT NULL,
	[month] [int] NOT NULL,
	[DevoteeId] [int] NULL,
	[CreatedByID] [int] NULL,
	[UpdatedByID] [int] NULL,
	[CreatedDate] [datetime2](7) NULL,
	[UpdatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Donations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V1]    Script Date: 03-08-2024 13:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V1]
		AS
		SELECT d.Id as ID,d.DonationAmount,d.year ,d.month,de.devoteeLoginId ,de.Id as DevoteeId
		FROM Donations d join Devotees de 
		on de.Id = d.DevoteeId;
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 03-08-2024 13:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 03-08-2024 13:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 03-08-2024 13:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 03-08-2024 13:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 03-08-2024 13:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 03-08-2024 13:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 03-08-2024 13:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PassWord] [nvarchar](max) NULL,
	[Role] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 03-08-2024 13:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [int] NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserImages]    Script Date: 03-08-2024 13:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[size] [nvarchar](max) NULL,
	[type] [nvarchar](max) NULL,
	[lastModified] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[webkitRelativePath] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 03-08-2024 13:29:41 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 03-08-2024 13:29:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 03-08-2024 13:29:41 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 03-08-2024 13:29:41 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 03-08-2024 13:29:41 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 03-08-2024 13:29:41 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 03-08-2024 13:29:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Devotees_UserImageId]    Script Date: 03-08-2024 13:29:41 ******/
CREATE NONCLUSTERED INDEX [IX_Devotees_UserImageId] ON [dbo].[Devotees]
(
	[UserImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Donations_DevoteeId]    Script Date: 03-08-2024 13:29:41 ******/
CREATE NONCLUSTERED INDEX [IX_Donations_DevoteeId] ON [dbo].[Donations]
(
	[DevoteeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Devotees]  WITH CHECK ADD  CONSTRAINT [FK_Devotees_UserImages_UserImageId] FOREIGN KEY([UserImageId])
REFERENCES [dbo].[UserImages] ([Id])
GO
ALTER TABLE [dbo].[Devotees] CHECK CONSTRAINT [FK_Devotees_UserImages_UserImageId]
GO
ALTER TABLE [dbo].[Donations]  WITH CHECK ADD  CONSTRAINT [FK_Donations_Devotees_DevoteeId] FOREIGN KEY([DevoteeId])
REFERENCES [dbo].[Devotees] ([Id])
GO
ALTER TABLE [dbo].[Donations] CHECK CONSTRAINT [FK_Donations_Devotees_DevoteeId]
GO
/****** Object:  StoredProcedure [dbo].[GetDevoteesNotPaidDonation]    Script Date: 03-08-2024 13:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDevoteesNotPaidDonation] 
AS
	SELECT * FROM Devotees WHERE Id NOT IN 
	(SELECT DevoteeId FROM Donations);
GO
/****** Object:  StoredProcedure [dbo].[GetDonationGroupAsc]    Script Date: 03-08-2024 13:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDonationGroupAsc] 
AS
BEGIN
		

		SELECT count(Id)as Id,SUM(DonationAmount)as DonationAmount, year , month ,devoteeLoginId as DevoteeId
		FROM 
		(
			SELECT d.Id as ID,d.DonationAmount,d.year ,d.month,de.devoteeLoginId ,de.Id as DevoteeId
			FROM Donations d join Devotees de 
			on de.Id = d.DevoteeId
		)as V1 
		
		GROUP BY year,month,devoteeLoginId 
		ORDER BY DonationAmount ASC;
		
END
GO
/****** Object:  StoredProcedure [dbo].[GetDonationGroupDesc]    Script Date: 03-08-2024 13:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDonationGroupDesc] 
AS
BEGIN

		SELECT count(Id)as Id,SUM(DonationAmount)as DonationAmount, year , month ,devoteeLoginId as DevoteeId
		FROM 
		(
			SELECT d.Id as ID,d.DonationAmount,d.year ,d.month,de.devoteeLoginId ,de.Id as DevoteeId
			FROM Donations d join Devotees de 
			on de.Id = d.DevoteeId
		)as V1 
		
		GROUP BY year,month,devoteeLoginId 
		ORDER BY DonationAmount DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[GetDonationsForDevotee]    Script Date: 03-08-2024 13:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDonationsForDevotee](
	@ID int 
)
AS
BEGIN
		SELECT count(Id)as Id,SUM(DonationAmount)as DonationAmount, year , month ,devoteeLoginId as DevoteeId
		FROM 
		(
			SELECT d.Id as ID,d.DonationAmount,d.year ,d.month,de.devoteeLoginId ,de.Id as DevoteeId
			FROM Donations d join Devotees de 
			on de.Id = d.DevoteeId where DevoteeId = @ID
		)as V1 
		
		GROUP BY year,month,devoteeLoginId 
		ORDER BY DonationAmount ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[GetDonationWithUser]    Script Date: 03-08-2024 13:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDonationWithUser] 
AS
	SELECT * FROM Devotees WHERE devoteeLoginId NOT IN 
	(SELECT DevoteeId FROM Donations);
GO
/****** Object:  StoredProcedure [dbo].[GetUserImagEByID]    Script Date: 03-08-2024 13:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserImagEByID](
 @DevoteeID INT
 )
 AS
 BEGIN
 
		SELECT U.Id,U.lastModified,U.lastModifiedDate,U.name,U.size,U.type,U.webkitRelativePath FROM UserImages U
		JOIN Devotees D ON D.UserImageId = U.Id WHERE D.Id = @DevoteeID;
 END
GO
/****** Object:  StoredProcedure [dbo].[SearchDevotee]    Script Date: 03-08-2024 13:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchDevotee]
( @Input VARCHAR )
AS
BEGIN
  DECLARE @SEARCH VARCHAR(10) = CONCAT('%',@Input,'%');

	SELECT * FROM Devotees WHERE
	firstname LIKE @SEARCH 
	OR middlename LIKE @SEARCH  OR
	lastname LIKE  @SEARCH OR emaidId LIKE @SEARCH OR
	devoteeLoginId LIKE  @SEARCH OR InitiationDate LIKE @SEARCH OR
	flatno LIKE  @SEARCH OR area LIKE @SEARCH OR city LIKE  @SEARCH OR
	state LIKE @SEARCH OR pincode LIKE  @SEARCH 

END
GO
USE [master]
GO
ALTER DATABASE [DevoteeServer] SET  READ_WRITE 
GO
