USE [master]
GO

/****** Object:  Database [OnTrack]    Script Date: 10/31/2016 16:02:14 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'OnTrack')
DROP DATABASE [OnTrack]
GO

USE [master]
GO

/****** Object:  Database [OnTrack]    Script Date: 10/31/2016 16:02:14 ******/
CREATE DATABASE [OnTrack] ON  PRIMARY 
( NAME = N'OnTrack', FILENAME = N'E:\Database\OnTrack.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OnTrack_log', FILENAME = N'E:\Database\OnTrack_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [OnTrack] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnTrack].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [OnTrack] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [OnTrack] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [OnTrack] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [OnTrack] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [OnTrack] SET ARITHABORT OFF 
GO

ALTER DATABASE [OnTrack] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [OnTrack] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [OnTrack] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [OnTrack] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [OnTrack] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [OnTrack] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [OnTrack] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [OnTrack] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [OnTrack] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [OnTrack] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [OnTrack] SET  DISABLE_BROKER 
GO

ALTER DATABASE [OnTrack] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [OnTrack] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [OnTrack] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [OnTrack] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [OnTrack] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [OnTrack] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [OnTrack] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [OnTrack] SET  READ_WRITE 
GO

ALTER DATABASE [OnTrack] SET RECOVERY FULL 
GO

ALTER DATABASE [OnTrack] SET  MULTI_USER 
GO

ALTER DATABASE [OnTrack] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [OnTrack] SET DB_CHAINING OFF 
GO
USE [OnTrack]
GO
/****** Object:  User [OnTrack_user]    Script Date: 11/14/2016 16:08:05 ******/
CREATE USER [OnTrack_user] FOR LOGIN [OnTrack_user] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[RAG]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RAG](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_RAG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectType]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProjectType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectStatus]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProjectStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[PIN] [nvarchar](150) NULL,
	[ProposalID] [nvarchar](150) NULL,
	[Region] [nvarchar](150) NULL,
	[Country] [nvarchar](150) NULL,
	[Location] [nvarchar](150) NULL,
	[StatusID] [int] NULL,
	[IsJointFunded] [bit] NULL,
	[IsLocallyFunded] [bit] NULL,
	[TypeID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CashValueLC] [float] NULL,
	[CashValueRC] [float] NULL,
	[CashValueGBP] [float] NULL,
	[InKindValueLC] [float] NULL,
	[InKindValueRC] [float] NULL,
	[InKindValueGBP] [float] NULL,
	[Progress] [int] NULL,
	[DeliveryRAGID] [int] NULL,
	[DeliveryRAGCommentary] [nvarchar](max) NULL,
	[DeliveryDonorNarrative] [nvarchar](max) NULL,
	[BudgetRAGID] [int] NULL,
	[BudgetRAGCommentary] [nvarchar](max) NULL,
	[BudgetDonorNarrative] [nvarchar](max) NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OutputCategory]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutputCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_OutputCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Output]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Output](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OutcomeID] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CategoryID] [int] NOT NULL,
	[TargetQty] [int] NULL,
	[ProgressQty] [int] NULL,
	[DeliveryDate] [datetime] NULL,
	[RAGID] [int] NULL,
	[RAGCommentary] [nvarchar](max) NULL,
	[DonorNarrative] [nvarchar](max) NULL,
 CONSTRAINT [PK_Output] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Outcome]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Outcome](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ImpactID] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Outcome] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Impact]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Impact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Statement] [nvarchar](max) NOT NULL,
	[ProjectID] [int] NOT NULL,
 CONSTRAINT [PK_Impact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OutputID] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Progress] [int] NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BudgetLine](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[COACategoryID] [int] NULL,
	[BudgetAmtLC] [float] NULL,
	[Currency] [nvarchar] (50) NULL,
	[UnitPrice] [float] NULL,
	[TotalRC] [float] NULL,
	[TotalGBP] [float] NULL,
	[ActualAmtLC] [float] NULL,
	[BudgetRAGID] [int] NULL,
	[RAGCommentary] [nvarchar](max) NULL,
	[DonorNarrative] [nvarchar](max) NULL,
 CONSTRAINT [PK_BudgetLine] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BudgetMonthly](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Month] [int] NOT NULL,
	[Qty] [int] NULL,
	[Amount] [float] NULL,
	[BudgetLineID] [int] NOT NULL,
 CONSTRAINT [PK_BudgetMonthly] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COACategory]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COACategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_COACategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Indicators]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Indicators](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IndicatorID] [int] NOT NULL,
	[OperatorID] [int] NULL,
	[TargetValue] [int] NULL,
	[BaselineValue] [int] NULL,
	[ActualValue] [int] NULL,
	[RefID] [int] NOT NULL,
 CONSTRAINT [PK_Indicators] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operator]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operator](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Operator] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Operator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Indicator]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Indicator](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int] NOT NULL,
	[CategoryID] [int] NULL,
	[Description] [nvarchar] (max) NULL,
 CONSTRAINT [PK_Indicator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IndicatorCategory]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndicatorCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_IndicatorCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IndicatorType]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndicatorType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_IndicatorType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SDGs]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDGs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[SDGID] [int] NOT NULL,
	[PercentSplit] [int] NULL,
 CONSTRAINT [PK_SDGs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SDG]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDG](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar] (250) NOT NULL,
	[Description] [nvarchar] (max) NULL,
 CONSTRAINT [PK_SDG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sectors]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sectors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[SectorID] [int] NOT NULL,
	[PercentSplit] [int] NULL,
 CONSTRAINT [PK_Sectors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sector]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sector](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar] (150) NOT NULL,
	[Description] [nvarchar] (max) NULL,
	[ParentID] [int] NULL,
 CONSTRAINT [PK_Sector] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[Donor] [nvarchar] (150) NOT NULL,
	[DonorContractPIN] [nvarchar] (150) NULL,
	[DonorReference] [nvarchar] (150) NULL,
	[BackDonor] [nvarchar] (150) NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Risk]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Risk](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[Description] [nvarchar] (max) NULL,
	[ProbLikelihood] [nvarchar] (150) NULL,
	[Impact] [nvarchar] (150) NULL,
	[ResponseStrategy] [nvarchar] (150) NULL,
	[ResponseDesc] [nvarchar] (max) NULL,
	[Score] [int] NULL,
	[Owner] [nvarchar] (150) NULL,
	[InternalComments] [nvarchar] (max) NULL,
	[DonorNarrative] [nvarchar] (max) NULL,
	[ReviewDate] [datetime] NULL
 CONSTRAINT [PK_Risk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Issue]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Issue](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[Description] [nvarchar] (max) NULL,
	[Priority] [nvarchar] (150) NULL,
	[Status] [nvarchar] (150) NULL,
	[Owner] [nvarchar] (150) NULL,
	[OwnerRole] [nvarchar] (150) NULL,
	[OwnerComments] [nvarchar] (max) NULL,
	[ReviewDate] [datetime] NULL
 CONSTRAINT [PK_Issue] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonorPayment]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonorPayment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[InstallmentDate] [datetime] NULL,
	[Description] [nvarchar] (max) NULL,
	[PaymentType] [nvarchar] (150) NULL,
	[ReportType] [nvarchar] (150) NULL,
	[SubmissionDate] [datetime] NULL,
	[InstallmentAmt] [float] NULL,
	[Currency] [nvarchar] (150) NULL
 CONSTRAINT [PK_DonorPayment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BeneficiaryGroup]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BeneficiaryGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[VulnerabilityGroupID] [int] NOT NULL,
	[Description] [nvarchar] (max) NULL,
	[Under5Male] [int] NULL,
	[Under5Female] [int] NULL,
	[5to18Male] [int] NULL,
	[5to18Female] [int] NULL,
	[19to50Male] [int] NULL,
	[19to55Female] [int] NULL,
	[Over50Male] [int] NULL,
	[Over50Female] [int] NULL,
	[MaleDirect] [int] NULL,
	[MaleIndirect] [int] NULL,
	[FemaleDirect] [int] NULL,
	[FemaleIndirect] [int] NULL,
	[IsLarge] [bit] NULL
 CONSTRAINT [PK_BeneficiaryGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VulnerabilityGroup]    Script Date: 11/14/2016 16:08:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VulnerabilityGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar] (150) NOT NULL,
	[Description] [nvarchar] (max) NULL,
 CONSTRAINT [PK_VulnerabilityGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/* INSERT DATA FOR LOOKUP TABLES */
INSERT INTO [OnTrack].[dbo].[IndicatorCategory] ([Name],[Description]) VALUES ('Impact' ,NULL)
INSERT INTO [OnTrack].[dbo].[IndicatorCategory] ([Name],[Description]) VALUES ('Outcome' ,NULL)
GO
INSERT INTO [OnTrack].[dbo].[IndicatorType] ([Name],[Description]) VALUES ('Percentage' ,NULL)
INSERT INTO [OnTrack].[dbo].[IndicatorType] ([Name],[Description]) VALUES ('# out of #' ,NULL)
INSERT INTO [OnTrack].[dbo].[IndicatorType] ([Name],[Description]) VALUES ('# per #' ,NULL)
INSERT INTO [OnTrack].[dbo].[IndicatorType] ([Name],[Description]) VALUES ('Index/Ratio' ,NULL)
INSERT INTO [OnTrack].[dbo].[IndicatorType] ([Name],[Description]) VALUES ('Existence of' ,NULL)
INSERT INTO [OnTrack].[dbo].[IndicatorType] ([Name],[Description]) VALUES ('Quality of' ,NULL)
INSERT INTO [OnTrack].[dbo].[IndicatorType] ([Name],[Description]) VALUES ('Examples of' ,NULL)
GO
INSERT INTO [OnTrack].[dbo].[OutputCategory] ([Name],[Description]) VALUES ('Latrines', NULL);
INSERT INTO [OnTrack].[dbo].[OutputCategory] ([Name],[Description]) VALUES ('Non Food Items', NULL);
INSERT INTO [OnTrack].[dbo].[OutputCategory] ([Name],[Description]) VALUES ('Seminar and Workshop', NULL);
INSERT INTO [OnTrack].[dbo].[OutputCategory] ([Name],[Description]) VALUES ('Awareness and Advocacy', NULL);
INSERT INTO [OnTrack].[dbo].[OutputCategory] ([Name],[Description]) VALUES ('Training', NULL);
INSERT INTO [OnTrack].[dbo].[OutputCategory] ([Name],[Description]) VALUES ('Mosquito Nets', NULL);
GO
INSERT INTO [OnTrack].[dbo].[RAG] ([Name],[Description]) VALUES ('Red' ,NULL)
INSERT INTO [OnTrack].[dbo].[RAG] ([Name],[Description]) VALUES ('Amber' ,NULL)
INSERT INTO [OnTrack].[dbo].[RAG] ([Name],[Description]) VALUES ('Green' ,NULL)
GO
INSERT INTO [OnTrack].[dbo].[Impact] ([Statement], [ProjectID]) VALUES ('Improved resilience of communities in terms of food security, income, sanitation and health in Nyambi and Nyamuka villages (Machinga and Zomba districts respectively) by 2016.', 1)
GO
INSERT INTO [OnTrack].[dbo].[Project] ([Name]) VALUES ('Project 1')
GO
INSERT INTO [OnTrack].[dbo].[Indicator] ([TypeID],[CategoryID],[Description]) VALUES (1 ,1 ,'% of population living in extreme poverty')
INSERT INTO [OnTrack].[dbo].[Indicator] ([TypeID],[CategoryID],[Description]) VALUES (4 ,1 ,'Food production index and household food consumption score')
INSERT INTO [OnTrack].[dbo].[Indicator] ([TypeID],[CategoryID],[Description]) VALUES (1 ,2 ,'# and % of children who demonstrate knowledge of the actions they can take to protect themselves from violence and abuse')
INSERT INTO [OnTrack].[dbo].[Indicator] ([TypeID],[CategoryID],[Description]) VALUES (4 ,2 ,'Ratio of children in residential care versus family-based care')
GO
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Advocacy',NULL,NULL)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Capacity Building',NULL,NULL)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Disaster Preparedness Planning',NULL,NULL)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Disaster Response',NULL,NULL)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Disaster Risk Reduction',NULL,NULL)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Education',NULL,NULL)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Food Security',NULL,NULL)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Health',NULL,NULL)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Income Generation',NULL,NULL)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Microfinance',NULL,NULL)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Orphans & Child Welfare',NULL,NULL)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Seasonal',NULL,NULL)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Sustainable Livelihoods',NULL,NULL)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('WASH',NULL,NULL)

INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Advocacy',NULL,1)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Civil Society Capacity Building ',NULL,2)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Social Mobilisation',NULL,2)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Social Empowerment',NULL,2)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Building of IR Capacity for Emergency Response',NULL,3)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Building Capacity of Local Partner',NULL,3)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Building Community Capacity for Emergency Response',NULL,3)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Camp Management',NULL,4)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Education in Emergencies',NULL,4)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('FI/NFI Distribution',NULL,4)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Emergency Health Response',NULL,4)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Shelter Construction',NULL,4)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('WATSAN in Emergencies',NULL,4)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Agricultural Adaption',NULL,5)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Conflict Transformation',NULL,5)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Earthquake Preparedness',NULL,5)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Flood Defences and Preparation',NULL,5)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Improved Water Management for Drought',NULL,5)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('School Refurbishment and Building',NULL,6)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Teacher Training',NULL,6)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Orphan Sponsorship (School Fees)',NULL,6)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Distribution of Education Materials',NULL,6)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Agriculture',NULL,7)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Irrigation',NULL,7)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Food Security',NULL,7)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Maternal/Child Health',NULL,8)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Provision of Primary Health Care Facilities',NULL,8)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Provision of Hospital Equipment',NULL,8)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Inoculation',NULL,8)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Distribution of Mosquito Nets',NULL,8)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('HIV/AIDS Awareness',NULL,8)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Income Generation',NULL,9)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Microfinance',NULL,10)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Orphans & Child Welfare',NULL,11)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Qurbani',NULL,12)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Ramadhan',NULL,12)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Microfinance for Livelihoods',NULL,13)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Income Generation (Grants/In-kind excl. Microfinance)',NULL,13)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Vocational Training',NULL,13)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Orphans Sponsorship (Grants excl. Microfinance)',NULL,13)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Water & Sanitation',NULL,14)
INSERT INTO [OnTrack].[dbo].[Sector] ([Name],[Description], [ParentID]) VALUES ('Hygiene Promotion',NULL,14)
GO
INSERT INTO [OnTrack].[dbo].[SDG] ([Name],[Description]) VALUES ('Goal 1: End poverty in all its forms everywhere',NULL)
INSERT INTO [OnTrack].[dbo].[SDG] ([Name],[Description]) VALUES ('Goal 2: End hunger, achieve food security and improved nutrition and promote sustainable agriculture',NULL)
INSERT INTO [OnTrack].[dbo].[SDG] ([Name],[Description]) VALUES ('Goal 3: Ensure healthy lives and promote well-being for all at all ages',NULL)
INSERT INTO [OnTrack].[dbo].[SDG] ([Name],[Description]) VALUES ('Goal 4: Ensure inclusive and equitable quality education and promote lifelong learning opportunities for all',NULL)
INSERT INTO [OnTrack].[dbo].[SDG] ([Name],[Description]) VALUES ('Goal 5: Achieve gender equality and empower all women and girls',NULL)
INSERT INTO [OnTrack].[dbo].[SDG] ([Name],[Description]) VALUES ('Goal 6: Ensure availability and sustainable management of water and sanitation for all',NULL)
INSERT INTO [OnTrack].[dbo].[SDG] ([Name],[Description]) VALUES ('Goal 7: Ensure access to affordable, reliable, sustainable and modern energy for all',NULL)
INSERT INTO [OnTrack].[dbo].[SDG] ([Name],[Description]) VALUES ('Goal 8: Promote sustained, inclusive and sustainable economic growth, full and productive employment and decent work for all',NULL)
INSERT INTO [OnTrack].[dbo].[SDG] ([Name],[Description]) VALUES ('Goal 9: Build resilient infrastructure, promote inclusive and sustainable industrialization and foster innovation',NULL)
INSERT INTO [OnTrack].[dbo].[SDG] ([Name],[Description]) VALUES ('Goal 10: Reduce inequality within and among countries',NULL)
INSERT INTO [OnTrack].[dbo].[SDG] ([Name],[Description]) VALUES ('Goal 11: Make cities and human settlements inclusive, safe, resilient and sustainable',NULL)
INSERT INTO [OnTrack].[dbo].[SDG] ([Name],[Description]) VALUES ('Goal 12: Ensure sustainable consumption and production patterns',NULL)
INSERT INTO [OnTrack].[dbo].[SDG] ([Name],[Description]) VALUES ('Goal 13: Take urgent action to combat climate change and its impacts*',NULL)
INSERT INTO [OnTrack].[dbo].[SDG] ([Name],[Description]) VALUES ('Goal 14: Conserve and sustainably use the oceans, seas and marine resources for sustainable development',NULL)
INSERT INTO [OnTrack].[dbo].[SDG] ([Name],[Description]) VALUES ('Goal 15: Protect, restore and promote sustainable use of terrestrial ecosystems, sustainably manage forests, combat desertification, and halt and reverse land degradation and halt biodiversity loss',NULL)
INSERT INTO [OnTrack].[dbo].[SDG] ([Name],[Description]) VALUES ('Goal 16: Promote peaceful and inclusive societies for sustainable development, provide access to justice for all and build effective, accountable and inclusive institutions at all levels',NULL)
INSERT INTO [OnTrack].[dbo].[SDG] ([Name],[Description]) VALUES ('Goal 17: Strengthen the means of implementation and revitalize the global partnership for sustainable development',NULL)
GO
INSERT INTO [OnTrack].[dbo].[VulnerabilityGroup] ([Name],[Description]) VALUES ('Estimated Direct Beneficiaries',NULL)
INSERT INTO [OnTrack].[dbo].[VulnerabilityGroup] ([Name],[Description]) VALUES ('Estimated Indirect Beneficiaries',NULL)
INSERT INTO [OnTrack].[dbo].[VulnerabilityGroup] ([Name],[Description]) VALUES ('Non Vulnerable Groups or Other',NULL)
INSERT INTO [OnTrack].[dbo].[VulnerabilityGroup] ([Name],[Description]) VALUES ('Elderly',NULL)
INSERT INTO [OnTrack].[dbo].[VulnerabilityGroup] ([Name],[Description]) VALUES ('Widows',NULL)
INSERT INTO [OnTrack].[dbo].[VulnerabilityGroup] ([Name],[Description]) VALUES ('Female Headed (But not widowed)',NULL)
GO
INSERT INTO [OnTrack].[dbo].[ProjectStatus] ([Name],[Description]) VALUES ('Starting up',NULL)
INSERT INTO [OnTrack].[dbo].[ProjectStatus] ([Name],[Description]) VALUES ('Ongoing',NULL)
INSERT INTO [OnTrack].[dbo].[ProjectStatus] ([Name],[Description]) VALUES ('Suspended',NULL)
INSERT INTO [OnTrack].[dbo].[ProjectStatus] ([Name],[Description]) VALUES ('Cancelled',NULL)
INSERT INTO [OnTrack].[dbo].[ProjectStatus] ([Name],[Description]) VALUES ('Completed',NULL)
INSERT INTO [OnTrack].[dbo].[ProjectStatus] ([Name],[Description]) VALUES ('Archived',NULL)
GO
INSERT INTO [OnTrack].[dbo].[ProjectType] ([Name],[Description]) VALUES ('Advocacy',NULL)
INSERT INTO [OnTrack].[dbo].[ProjectType] ([Name],[Description]) VALUES ('Development',NULL)
INSERT INTO [OnTrack].[dbo].[ProjectType] ([Name],[Description]) VALUES ('Distaster Risk Reduction',NULL)
INSERT INTO [OnTrack].[dbo].[ProjectType] ([Name],[Description]) VALUES ('Early Recovery',NULL)
INSERT INTO [OnTrack].[dbo].[ProjectType] ([Name],[Description]) VALUES ('Emergency',NULL)
INSERT INTO [OnTrack].[dbo].[ProjectType] ([Name],[Description]) VALUES ('Orphans',NULL)
INSERT INTO [OnTrack].[dbo].[ProjectType] ([Name],[Description]) VALUES ('Qurbani',NULL)
INSERT INTO [OnTrack].[dbo].[ProjectType] ([Name],[Description]) VALUES ('Ramadhan',NULL)
INSERT INTO [OnTrack].[dbo].[ProjectType] ([Name],[Description]) VALUES ('Rehabilitation',NULL)

