USE [dbKey2h]
GO
/****** Object:  User [dbKey2h]    Script Date: 28-02-2025 19:30:40 ******/
CREATE USER [dbKey2h] FOR LOGIN [dbKey2h] WITH DEFAULT_SCHEMA=[dbKey2h]
GO
/****** Object:  DatabaseRole [gd_execprocs]    Script Date: 28-02-2025 19:30:41 ******/
CREATE ROLE [gd_execprocs]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [dbKey2h]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [dbKey2h]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [dbKey2h]
GO
ALTER ROLE [db_datareader] ADD MEMBER [dbKey2h]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [dbKey2h]
GO
/****** Object:  Schema [dbKey2h]    Script Date: 28-02-2025 19:30:41 ******/
CREATE SCHEMA [dbKey2h]
GO
/****** Object:  Table [dbKey2h].[tblBlockFloorPlan]    Script Date: 28-02-2025 19:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbKey2h].[tblBlockFloorPlan](
	[BlockFloorPlanID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NULL,
	[BlockID] [int] NULL,
	[Title] [nvarchar](256) NULL,
	[ImagePath] [nvarchar](256) NULL,
	[DisplayOrder] [int] NULL,
	[Status] [bit] NULL,
	[AddedBy] [varchar](256) NULL,
	[AddedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](60) NULL,
	[Updateddate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbKey2h].[tblCustomisationWorkApproval]    Script Date: 28-02-2025 19:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbKey2h].[tblCustomisationWorkApproval](
	[CWAID] [int] IDENTITY(1,1) NOT NULL,
	[FlatID] [nvarchar](50) NULL,
	[CustomizationWork] [nvarchar](256) NULL,
	[CustomizationDetails] [nvarchar](256) NULL,
	[ApprovalStatus] [nvarchar](80) NULL,
	[Remarks] [nvarchar](max) NULL,
	[AddedDate] [datetime] NULL,
	[AddedBy] [nvarchar](60) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](60) NULL,
	[Amount] [nvarchar](60) NULL,
	[ClientApprovedstatus] [nvarchar](60) NULL,
	[ApprovedBy] [nvarchar](60) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbKey2h].[tblCustomisationWorkApprovalHistory]    Script Date: 28-02-2025 19:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbKey2h].[tblCustomisationWorkApprovalHistory](
	[CWAHID] [int] IDENTITY(1,1) NOT NULL,
	[CWAID] [int] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Customizationwordetails] [nvarchar](256) NULL,
	[WorkTitle] [nvarchar](256) NULL,
	[Approvalstatus] [nvarchar](60) NULL,
	[HistoryDate] [datetime] NULL,
	[ApprovedBy] [nvarchar](60) NULL,
	[UpdatedDate] [datetime] NULL,
	[FlatID] [nvarchar](60) NULL,
	[AddedBy] [nvarchar](60) NULL,
	[ClientApprovedstatus] [nvarchar](60) NULL,
	[Amount] [nvarchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[CWAHID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbKey2h].[tblFlatFloorPlan]    Script Date: 28-02-2025 19:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbKey2h].[tblFlatFloorPlan](
	[FlatFloorPlanID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NULL,
	[BlockID] [int] NULL,
	[FlatID] [int] NULL,
	[Title] [nvarchar](256) NULL,
	[ImagePath] [nvarchar](256) NULL,
	[DisplayOrder] [int] NULL,
	[Status] [bit] NULL,
	[AddedBy] [varchar](256) NULL,
	[AddedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](60) NULL,
	[Updateddate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAppMenu]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAppMenu](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [varchar](256) NULL,
	[MenuStatus] [bit] NULL,
	[AddedBy] [varchar](256) NULL,
	[AddedDate] [datetime] NULL,
	[UpdatedBy] [varchar](256) NULL,
	[UpdatedDate] [datetime] NULL,
	[IconImageName] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_MenuID] UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAppVersion]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAppVersion](
	[Sno] [int] NOT NULL,
	[AndroidVersionNo] [varchar](256) NULL,
	[iOSVersionNo] [varchar](256) NULL,
	[AndroidAppLink] [nvarchar](256) NULL,
	[iOSAppStoreLink] [nvarchar](256) NULL,
	[Title] [varchar](256) NULL,
	[Description] [varchar](max) NULL,
	[ForceUpdate] [bit] NULL,
	[UpdateMandatory] [bit] NULL,
	[AndroidVersionCode] [int] NULL,
	[IOSVersionCode] [int] NULL,
 CONSTRAINT [tblAppVersion_pk] PRIMARY KEY CLUSTERED 
(
	[Sno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBroadcasts]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBroadcasts](
	[BroadcastID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](256) NULL,
	[Message] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[AddedBy] [varchar](256) NULL,
	[ProjectID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BroadcastID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCity]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCity](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](256) NULL,
	[StateID] [int] NULL,
	[CityStatus] [bit] NULL,
	[AddedDate] [datetime] NULL,
 CONSTRAINT [tblCity_pk] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_CityID] UNIQUE NONCLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblClientAppMenu]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClientAppMenu](
	[ClientMenuID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[MenuID] [int] NULL,
	[ClientMenuStatus] [bit] NULL,
	[AddedBy] [varchar](256) NULL,
	[AddedDate] [datetime] NULL,
	[UpdatedBy] [varchar](256) NULL,
	[UpdatedDate] [datetime] NULL,
	[DisplayOrder] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientMenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_ClientMenuID] UNIQUE NONCLUSTERED 
(
	[ClientMenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblClientDashboardIssues]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClientDashboardIssues](
	[Sno] [int] IDENTITY(1,1) NOT NULL,
	[Pagename] [nvarchar](512) NOT NULL,
	[MethodOrFunctionname] [nvarchar](512) NOT NULL,
	[ErrrMsg] [nvarchar](max) NOT NULL,
	[IssueStatus] [nvarchar](100) NOT NULL,
	[Addeddate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Sno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblClients]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClients](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[ClientName] [varchar](256) NULL,
	[CompanyName] [varchar](256) NULL,
	[ContactPersonName] [varchar](256) NULL,
	[ContactPersonNumber] [varchar](256) NULL,
	[ContactPersonEmailID] [varchar](256) NULL,
	[AppStatus] [bit] NULL,
	[ClientLogo] [nvarchar](256) NULL,
	[ProjectsLimit] [int] NULL,
	[UsersLimit] [int] NULL,
	[Status] [bit] NULL,
	[Superadminusername] [varchar](256) NULL,
	[Superadminpassword] [varchar](256) NULL,
	[MailID] [varchar](256) NULL,
	[WatiLink] [nvarchar](max) NULL,
	[WatiBearerToken] [nvarchar](max) NULL,
	[WatiID] [nvarchar](256) NULL,
	[AddedBy] [varchar](256) NULL,
	[AddedDate] [datetime] NULL,
	[UpdatedBy] [varchar](256) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [tblClients_pk] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_ClientID] UNIQUE NONCLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblClientSideMenu]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClientSideMenu](
	[SideMID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[MenuName] [nvarchar](256) NULL,
	[Status] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[AddedDate] [datetime] NULL,
	[AddedBy] [nvarchar](256) NULL,
	[Image] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[SideMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_SideMID] UNIQUE NONCLUSTERED 
(
	[SideMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblClientSubAppMenu]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClientSubAppMenu](
	[ClientSubMenuID] [int] IDENTITY(1,1) NOT NULL,
	[SubMenuID] [int] NULL,
	[ClientSubMenuStatus] [bit] NULL,
	[ClientID] [int] NULL,
	[AddedBy] [varchar](256) NULL,
	[AddedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientSubMenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_ClientSubMenuID] UNIQUE NONCLUSTERED 
(
	[ClientSubMenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblClientUsers]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClientUsers](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[Username] [varchar](256) NULL,
	[Password] [varchar](256) NULL,
	[UserEmailID] [varchar](256) NULL,
	[UserStatus] [bit] NULL,
	[AddedBy] [varchar](256) NULL,
	[AddedDate] [datetime] NULL,
	[UpdatedBy] [varchar](256) NULL,
	[UpdatedDate] [datetime] NULL,
	[Role] [varchar](256) NULL,
	[Photo] [nvarchar](256) NULL,
	[Name] [nvarchar](256) NULL,
	[Gender] [varchar](256) NULL,
	[Salutation] [varchar](256) NULL,
	[PhoneNumber] [varchar](256) NULL,
	[WhatsappNumber] [varchar](256) NULL,
 CONSTRAINT [unique_UserID] UNIQUE NONCLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblcustomerFlatBookingReferedby]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblcustomerFlatBookingReferedby](
	[RefID] [int] IDENTITY(1,1) NOT NULL,
	[Referedby] [nvarchar](50) NULL,
	[AddedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RefID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomerPaymentSchedule]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomerPaymentSchedule](
	[PSID] [int] IDENTITY(1,1) NOT NULL,
	[FlatID] [int] NULL,
	[FlatCustomerID] [int] NULL,
	[PaymentLabelID] [int] NULL,
	[SubAmount] [int] NULL,
	[AddedBy] [nvarchar](256) NULL,
	[AddedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](256) NULL,
	[UpdatedDate] [datetime] NULL,
	[PaymentStatus] [varchar](256) NULL,
	[PaymentUpdatedBy] [varchar](256) NULL,
	[DemandID] [int] NULL,
	[GST] [int] NULL,
	[Amount] [int] NULL,
	[PaymentPercentage] [nvarchar](512) NULL,
PRIMARY KEY CLUSTERED 
(
	[PSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_PSID] UNIQUE NONCLUSTERED 
(
	[PSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomers]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [varchar](50) NULL,
	[EmailID] [varchar](255) NULL,
	[Mobilenumber] [varchar](20) NULL,
	[WhatsappNumber] [varchar](20) NULL,
	[AddedBy] [varchar](255) NULL,
	[AddedDate] [datetime] NULL,
	[UpdatedBy] [varchar](255) NULL,
	[UpdatedDate] [datetime] NULL,
	[FloorPlanStatus] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomizationWorkProgressStatus]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomizationWorkProgressStatus](
	[WorkProgressID] [int] IDENTITY(1,1) NOT NULL,
	[WorkProgress] [varchar](256) NULL,
	[AddedDate] [datetime] NULL,
	[ColorCode] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[WorkProgressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_WorkProgressID] UNIQUE NONCLUSTERED 
(
	[WorkProgressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDocumentLabel]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDocumentLabel](
	[DocumentID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[ProjectID] [int] NULL,
	[DocumentLabel] [nvarchar](256) NULL,
	[Status] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[AddedDate] [datetime] NULL,
	[AddedBy] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_DocumentID] UNIQUE NONCLUSTERED 
(
	[DocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFlat]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFlat](
	[FlatID] [int] IDENTITY(1,1) NOT NULL,
	[BlockID] [int] NULL,
	[ProjectID] [int] NULL,
	[FlatName] [nvarchar](256) NULL,
	[Facing] [varchar](256) NULL,
	[UDS] [nvarchar](256) NULL,
	[UnitType] [nvarchar](256) NULL,
	[SaleableArea] [nvarchar](256) NULL,
	[CarpetArea] [nvarchar](256) NULL,
	[Balcony] [nvarchar](256) NULL,
	[Wallarea] [nvarchar](256) NULL,
	[CommonArea] [nvarchar](256) NULL,
	[CarparkingCount] [int] NULL,
	[Carparkslot1] [nvarchar](256) NULL,
	[Carparkslot2] [nvarchar](256) NULL,
	[Carparkslot3] [nvarchar](256) NULL,
	[AddedBy] [nvarchar](256) NULL,
	[AddedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](256) NULL,
	[UpdatedDate] [datetime] NULL,
	[FlatStatus] [bit] NULL,
	[Floor] [int] NULL,
	[BlockName] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[FlatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_FlatID] UNIQUE NONCLUSTERED 
(
	[FlatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFlatCostDetails]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFlatCostDetails](
	[CostID] [int] IDENTITY(1,1) NOT NULL,
	[FlatID] [int] NULL,
	[CostLabelID] [int] NULL,
	[Cost] [int] NULL,
	[Status] [bit] NULL,
	[AddedBy] [nvarchar](256) NULL,
	[AddedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](256) NULL,
	[UpdatedDate] [datetime] NULL,
	[ProjectID] [int] NULL,
	[BlockID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_CostID] UNIQUE NONCLUSTERED 
(
	[CostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFlatCustomerBookingDetails]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFlatCustomerBookingDetails](
	[FlatCustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[ProjectID] [int] NULL,
	[BlockID] [int] NULL,
	[FlatID] [int] NULL,
	[ApplicantFirstName] [varchar](255) NULL,
	[ApplicantLastName] [varchar](255) NULL,
	[CoapplicantFirstName] [varchar](255) NULL,
	[CoapplicantLastName] [varchar](255) NULL,
	[Gender] [varchar](50) NULL,
	[EmailID] [varchar](255) NULL,
	[Mobilenumber1] [varchar](20) NULL,
	[Mobilenumber2] [varchar](20) NULL,
	[FatherorSpouseName] [varchar](255) NULL,
	[DoB] [datetime] NULL,
	[WhatsappNumber] [varchar](20) NULL,
	[Profession] [varchar](255) NULL,
	[CompanyName] [varchar](255) NULL,
	[Designation] [varchar](255) NULL,
	[CurrentAddress] [varchar](500) NULL,
	[PermanentAddress] [varchar](500) NULL,
	[ResidentialStatus] [varchar](50) NULL,
	[CoapplicantRelationship] [varchar](255) NULL,
	[CityID] [int] NULL,
	[StateID] [int] NULL,
	[Pincode] [int] NULL,
	[Reference1] [varchar](255) NULL,
	[Reference2] [varchar](255) NULL,
	[LeadSource] [int] NULL,
	[LoanTakenStatus] [bit] NULL,
	[BankName] [varchar](255) NULL,
	[ApplicantPhoto] [varchar](500) NULL,
	[ApplicantPAN] [varchar](50) NULL,
	[ApplicantAadhar] [varchar](50) NULL,
	[CoApplicantPhoto] [varchar](500) NULL,
	[CoApplicantPAN] [varchar](50) NULL,
	[CoApplicantAadhar] [varchar](50) NULL,
	[PoAName] [varchar](255) NULL,
	[PoAAddress] [varchar](500) NULL,
	[PoAPAN] [varchar](50) NULL,
	[PoAAdhar] [varchar](50) NULL,
	[PoADOB] [datetime] NULL,
	[CRMID] [int] NULL,
	[CustomerLoginStatus] [bit] NULL,
	[BookingID] [varchar](50) NULL,
	[Addeddate] [datetime] NULL,
	[Addedby] [nvarchar](50) NULL,
	[Updateddate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[BookingDate] [datetime] NULL,
	[Amountpaid] [int] NULL,
	[PaymentMode] [int] NULL,
	[Bookingknowledgement] [nvarchar](255) NULL,
	[CarparkAllocated] [bit] NULL,
	[NumberofSlots] [int] NULL,
	[Allottedcarparkslotnumber] [nvarchar](255) NULL,
	[Registrationcharges] [int] NULL,
	[RegistrationDate] [datetime] NULL,
	[RegistrationOffice] [nvarchar](225) NULL,
	[OTP] [int] NULL,
	[MPIN] [varchar](4) NULL,
	[OTPSentDate] [datetime] NULL,
	[LastSignedInDate] [datetime] NULL,
	[TokenID] [nvarchar](256) NULL,
	[MPINCreatedDate] [datetime] NULL,
	[TokenIDDateTime] [datetime] NULL,
	[FlatLoginID] [varchar](256) NULL,
	[ReferedBy] [nvarchar](80) NULL,
	[CoaGender] [varchar](50) NULL,
	[CoaEmailID] [varchar](255) NULL,
	[CoaMobilenumber1] [varchar](20) NULL,
	[CoaMobilenumber2] [varchar](20) NULL,
	[CoaWhatsappNumber] [varchar](20) NULL,
	[CoaAddress] [varchar](500) NULL,
	[CoaResidentialStatus] [varchar](50) NULL,
	[CoaStateID] [int] NULL,
	[CoaCityID] [int] NULL,
	[CoaPinCode] [int] NULL,
	[CoDOB] [datetime] NULL,
	[ProfilePic] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[FlatCustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFlatCustomerDemands]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFlatCustomerDemands](
	[DemandID] [int] IDENTITY(1,1) NOT NULL,
	[FlatID] [int] NULL,
	[PaymentLabelID] [int] NULL,
	[PDFName] [nvarchar](256) NULL,
	[AddedDate] [date] NULL,
	[AddedBy] [nvarchar](256) NULL,
	[PaymentStatus] [varchar](256) NULL,
	[PaymentUpdatedDate] [date] NULL,
	[PaymentUpdatedBy] [nvarchar](256) NULL,
	[ProjectID] [int] NULL,
	[BlockNo] [int] NULL,
	[ReceiptPDF] [nvarchar](256) NULL,
	[Amount] [int] NULL,
	[PaymentMode] [varchar](256) NULL,
	[PSID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DemandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_DemandID] UNIQUE NONCLUSTERED 
(
	[DemandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFlatCustomerDocuments]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFlatCustomerDocuments](
	[FlatDocumentID] [int] IDENTITY(1,1) NOT NULL,
	[FlatID] [int] NULL,
	[DocumentLabelID] [int] NULL,
	[PDFName] [nvarchar](256) NULL,
	[ClientID] [int] NULL,
	[ProjectID] [int] NULL,
	[Status] [bit] NULL,
	[AddedDate] [datetime] NULL,
	[AddedBy] [nvarchar](256) NULL,
	[UpdatedBy] [nvarchar](256) NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[FlatDocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_FlatDocumentID] UNIQUE NONCLUSTERED 
(
	[FlatDocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFlatCustomerKYCDocs]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFlatCustomerKYCDocs](
	[DocID] [int] IDENTITY(1,1) NOT NULL,
	[FlatID] [int] NULL,
	[ProjectID] [int] NULL,
	[SaleDeedDraft] [nvarchar](256) NULL,
	[SaleDeedFinal] [nvarchar](256) NULL,
	[SaleAgreementDraft] [nvarchar](256) NULL,
	[SaleAgreementFinal] [nvarchar](256) NULL,
	[AllotmentLetter] [nvarchar](256) NULL,
	[WelcomeLetter] [nvarchar](256) NULL,
	[DemandLetter] [nvarchar](256) NULL,
	[PaymentReceipt] [nvarchar](256) NULL,
	[Bill] [nvarchar](256) NULL,
	[PaymentSchedule] [nvarchar](256) NULL,
	[EBCard] [nvarchar](256) NULL,
	[HandingOverDocs] [nvarchar](256) NULL,
	[CCUpdation] [nvarchar](256) NULL,
	[NOCforHandover] [nvarchar](256) NULL,
	[OtherDocuments] [nvarchar](256) NULL,
	[AddedBy] [nvarchar](100) NULL,
	[Addeddate] [datetime] NULL,
	[BankDocuments] [nvarchar](512) NULL,
	[UpdatedBy] [nvarchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
	[DriveLink] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[DocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFlatCustomerTransaction]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFlatCustomerTransaction](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[FlatID] [int] NULL,
	[DemandID] [int] NULL,
	[PaymentLabelID] [int] NULL,
	[PaymentStatus] [varchar](256) NULL,
	[PaymentUpdatedDate] [date] NULL,
	[PaymentUpdatedBy] [nvarchar](256) NULL,
	[ProjectID] [int] NULL,
	[BlockNo] [int] NULL,
	[ReceiptPDF] [nvarchar](256) NULL,
	[PaidAmount] [int] NULL,
	[PaymentMode] [varchar](256) NULL,
	[PSID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_TransactionID] UNIQUE NONCLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFlatCustomisationDemands]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFlatCustomisationDemands](
	[CDemandID] [int] IDENTITY(1,1) NOT NULL,
	[FlatID] [int] NULL,
	[PDFName] [nvarchar](256) NULL,
	[AddedDate] [date] NULL,
	[AddedBy] [nvarchar](256) NULL,
	[PaymentStatus] [varchar](256) NULL,
	[PaymentUpdatedDate] [date] NULL,
	[PaymentUpdatedBy] [nvarchar](256) NULL,
	[ProjectID] [int] NULL,
	[BlockNo] [int] NULL,
	[ReceiptPDF] [nvarchar](256) NULL,
	[Amount] [int] NULL,
	[PaymentMode] [varchar](256) NULL,
	[CWID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CDemandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_CDemandID] UNIQUE NONCLUSTERED 
(
	[CDemandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFlatCustomisationTransaction]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFlatCustomisationTransaction](
	[CTID] [int] IDENTITY(1,1) NOT NULL,
	[FlatID] [int] NULL,
	[CDemandID] [int] NULL,
	[PaymentStatus] [varchar](256) NULL,
	[PaymentUpdatedDate] [date] NULL,
	[PaymentUpdatedBy] [nvarchar](256) NULL,
	[ProjectID] [int] NULL,
	[BlockNo] [int] NULL,
	[ReceiptPDF] [nvarchar](256) NULL,
	[PaidAmount] [int] NULL,
	[PaymentMode] [varchar](256) NULL,
	[CWID] [int] NULL,
	[RecAddedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_CTID] UNIQUE NONCLUSTERED 
(
	[CTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFlatCustomisationWorks]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFlatCustomisationWorks](
	[CWID] [int] IDENTITY(1,1) NOT NULL,
	[FlatID] [int] NULL,
	[WorkTitle] [nvarchar](max) NULL,
	[WorkStatus] [nvarchar](256) NULL,
	[AddedBy] [nvarchar](256) NULL,
	[UpdatedBy] [nvarchar](256) NULL,
	[ColorCode] [nvarchar](256) NULL,
	[Amount] [varchar](256) NULL,
	[UpdatedDate] [datetime] NULL,
	[AddedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CWID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_CWID] UNIQUE NONCLUSTERED 
(
	[CWID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFlatNotifications]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFlatNotifications](
	[FNID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](256) NULL,
	[Message] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[AddedBy] [varchar](256) NULL,
	[ProjectID] [int] NULL,
	[FlatID] [int] NULL,
	[ReadStatus] [bit] NULL,
	[ListStatus] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[FNID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFlatProgress]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFlatProgress](
	[FlatProgressID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NULL,
	[FlatID] [int] NULL,
	[Month] [varchar](256) NULL,
	[Year] [int] NULL,
	[ThumbnailImage] [nvarchar](256) NULL,
	[AddedDate] [datetime] NULL,
	[AddedBy] [nvarchar](256) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](256) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[FlatProgressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_FlatProgressID] UNIQUE NONCLUSTERED 
(
	[FlatProgressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFlatQualityReports]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFlatQualityReports](
	[QFID] [int] IDENTITY(1,1) NOT NULL,
	[FlatID] [int] NULL,
	[BlockID] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[PDFName] [nvarchar](max) NULL,
	[AddedBy] [int] NULL,
	[AddedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[Status] [bit] NULL,
	[ProjectID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[QFID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_QFID] UNIQUE NONCLUSTERED 
(
	[QFID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFloorPlan]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFloorPlan](
	[FloorPlanID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NULL,
	[Title] [nvarchar](256) NULL,
	[ImagePath] [nvarchar](256) NULL,
	[DisplayOrder] [int] NULL,
	[Status] [bit] NULL,
	[AddedBy] [varchar](256) NULL,
	[AddedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[FloorPlanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_FloorPlanID] UNIQUE NONCLUSTERED 
(
	[FloorPlanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblIndiaBankList]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblIndiaBankList](
	[BankID] [int] IDENTITY(1,1) NOT NULL,
	[BankName] [varchar](255) NULL,
	[BankType] [varchar](50) NULL,
	[IsStatus] [bit] NULL,
	[addedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BankID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLeadSource]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLeadSource](
	[LeadID] [int] IDENTITY(1,1) NOT NULL,
	[LeadSourceName] [varchar](256) NULL,
	[LeadSourceStatus] [bit] NULL,
	[AddedBy] [varchar](256) NULL,
	[AddedDate] [datetime] NULL,
	[ClientID] [int] NULL,
 CONSTRAINT [PK__tblLeadS__73EF791A9D6DB01A] PRIMARY KEY CLUSTERED 
(
	[LeadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_LeadID] UNIQUE NONCLUSTERED 
(
	[LeadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPaymentLabels]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPaymentLabels](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[PaymentLabel] [nvarchar](256) NULL,
	[AddedBy] [nvarchar](256) NULL,
	[AddedDate] [datetime] NULL,
	[Status] [bit] NULL,
	[UpdatedBy] [nvarchar](256) NULL,
	[UpdatedDate] [datetime] NULL,
	[DisplayOrder] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_PID] UNIQUE NONCLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPaymentMode]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPaymentMode](
	[PaymentModeID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentMode] [nvarchar](100) NULL,
	[Addeddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentModeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProjectAmenities]    Script Date: 28-02-2025 19:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjectAmenities](
	[AID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[Image] [nvarchar](256) NULL,
	[DisplayOrder] [int] NULL,
	[AddedDate] [datetime] NULL,
	[AddedBy] [varchar](256) NULL,
 CONSTRAINT [unique_AID] UNIQUE NONCLUSTERED 
(
	[AID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProjectBlock]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjectBlock](
	[BlockID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NULL,
	[BlockStatus] [bit] NULL,
	[BlockName] [varchar](256) NULL,
	[AddedBy] [varchar](256) NULL,
	[AddedDate] [datetime] NULL,
	[UpdatedBy] [varchar](256) NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BlockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_BlockID] UNIQUE NONCLUSTERED 
(
	[BlockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProjectCostLabels]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjectCostLabels](
	[CostLabelID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NULL,
	[CostParameterName] [nvarchar](256) NULL,
	[Status] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[AddedBy] [nvarchar](256) NULL,
	[AddedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](256) NULL,
	[UpdatedDate] [datetime] NULL,
	[Parameter] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[CostLabelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_CostLabelID] UNIQUE NONCLUSTERED 
(
	[CostLabelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProjectFlatProgressImage]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjectFlatProgressImage](
	[FlatProgressImageID] [int] IDENTITY(1,1) NOT NULL,
	[FlatProgressID] [int] NULL,
	[ImageName] [nvarchar](256) NULL,
	[Content] [nvarchar](256) NULL,
	[Status] [bit] NULL,
	[DisplayOrder] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FlatProgressImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_FlatProgressImageID] UNIQUE NONCLUSTERED 
(
	[FlatProgressImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProjectHomeScreen]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjectHomeScreen](
	[PHID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NULL,
	[HighlightImage1] [nvarchar](256) NULL,
	[HighlightImage2] [nvarchar](256) NULL,
	[HighlightImage3] [nvarchar](256) NULL,
	[HighlightImage4] [nvarchar](256) NULL,
	[HighlightImage5] [nvarchar](256) NULL,
	[Apartments] [nvarchar](256) NULL,
	[Bhk] [nvarchar](256) NULL,
	[SquareFeet] [nvarchar](256) NULL,
	[AddedDate] [datetime] NULL,
	[AddedBy] [nvarchar](256) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](256) NULL,
	[Status] [bit] NULL,
	[Splacescreen] [nvarchar](512) NULL,
	[Logo] [nvarchar](512) NULL,
PRIMARY KEY CLUSTERED 
(
	[PHID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_PHID] UNIQUE NONCLUSTERED 
(
	[PHID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProjectProgress]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjectProgress](
	[ProgressID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NULL,
	[Month] [varchar](256) NULL,
	[Year] [int] NULL,
	[ThumbnailImage] [nvarchar](256) NULL,
	[AddedDate] [datetime] NULL,
	[AddedBy] [nvarchar](256) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](256) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProgressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_ProgressID] UNIQUE NONCLUSTERED 
(
	[ProgressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProjectProgressImage]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjectProgressImage](
	[ProgressImageID] [int] IDENTITY(1,1) NOT NULL,
	[ProgressID] [int] NULL,
	[ImageName] [nvarchar](256) NULL,
	[Content] [nvarchar](256) NULL,
	[Status] [bit] NULL,
	[DisplayOrder] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProgressImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_ProgressImageID] UNIQUE NONCLUSTERED 
(
	[ProgressImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProjectQualityReports]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjectQualityReports](
	[QPID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[PDFName] [nvarchar](max) NULL,
	[AddedBy] [int] NULL,
	[AddedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[QPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_QPID] UNIQUE NONCLUSTERED 
(
	[QPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProjectReferralList]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjectReferralList](
	[RID] [int] IDENTITY(1,1) NOT NULL,
	[FlatID] [int] NULL,
	[CustomerID] [int] NULL,
	[ReferredDate] [varchar](200) NULL,
	[ReferralName] [nvarchar](256) NULL,
	[ReferralMobile] [nvarchar](256) NULL,
	[ReferralContent] [nvarchar](max) NULL,
	[ProjectID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_RID] UNIQUE NONCLUSTERED 
(
	[RID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProjectReferScreen]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjectReferScreen](
	[ReferScreenID] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[ProjectID] [int] NULL,
	[ClientID] [int] NULL,
	[MessageContent] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[AddedDate] [date] NOT NULL,
	[AddedBy] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReferScreenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_ReferScreenID] UNIQUE NONCLUSTERED 
(
	[ReferScreenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProjects]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjects](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[ProjectName] [varchar](max) NULL,
	[ProjectLogo] [varchar](max) NULL,
	[Location] [varchar](256) NULL,
	[Address] [varchar](256) NULL,
	[State] [int] NULL,
	[City] [int] NULL,
	[PostalCode] [int] NULL,
	[GoogleMapLink] [nvarchar](max) NULL,
	[BlockCount] [int] NULL,
	[FlatCount] [int] NULL,
	[LandArea] [varchar](256) NULL,
	[RERANumber] [nvarchar](256) NULL,
	[ProjectStatus] [int] NULL,
	[ProjectDisplayStatus] [bit] NULL,
	[ProjectStatusPercentage] [int] NULL,
	[SplashScreenImage] [nvarchar](256) NULL,
	[LocationMap] [varchar](256) NULL,
	[AddedBy] [varchar](256) NULL,
	[AddedDate] [datetime] NULL,
	[UpdatedBy] [varchar](256) NULL,
	[UpdatedDate] [datetime] NULL,
	[BankName] [varchar](256) NULL,
	[AccountName] [varchar](256) NULL,
	[IFSCNumber] [varchar](256) NULL,
	[BranchName] [varchar](256) NULL,
	[AccountNumber] [nvarchar](50) NULL,
	[Latitude] [nvarchar](256) NULL,
	[Longitude] [nvarchar](256) NULL,
	[NotificationGroup] [varchar](256) NULL,
	[FlatLoginCode] [nvarchar](50) NULL,
 CONSTRAINT [PK__tblProje__761ABED01AB3F772] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_ProjectID] UNIQUE NONCLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProjectSpecificationDetails]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjectSpecificationDetails](
	[SpecDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[SpecID] [int] NULL,
	[ProjectID] [int] NULL,
	[SpecificationDetails] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[AddedBy] [nvarchar](256) NULL,
	[AddedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](256) NULL,
	[UpdatedDate] [datetime] NULL,
	[SpecificationTitle] [nvarchar](256) NULL,
	[SpecificationLogo] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[SpecDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_SpecDetailsID] UNIQUE NONCLUSTERED 
(
	[SpecDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProjectSpecifications]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjectSpecifications](
	[SpecID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NULL,
	[Status] [bit] NULL,
	[SpecificationTitle] [nvarchar](256) NULL,
	[SpecificationLogo] [nvarchar](256) NULL,
	[AddedBy] [nvarchar](256) NULL,
	[AddedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](256) NULL,
	[UpdatedDate] [datetime] NULL,
	[DisplayOrder] [int] NULL,
 CONSTRAINT [PK__tblProje__883D519B8B0ECD8A] PRIMARY KEY CLUSTERED 
(
	[SpecID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_SpecID] UNIQUE NONCLUSTERED 
(
	[SpecID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProjectWhatsHappening]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjectWhatsHappening](
	[WHID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NULL,
	[Content] [nvarchar](max) NULL,
	[DisplayStatus] [bit] NULL,
	[AddedBy] [nvarchar](255) NULL,
	[AddedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedDate] [datetime] NULL,
	[DisplayOrder] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[WHID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSnapshotHighlights]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSnapshotHighlights](
	[SHID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NULL,
	[SnapshotHighlight] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[AddedBy] [nvarchar](256) NULL,
	[AddedDate] [datetime] NULL,
	[DisplayOrder] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SHID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_SHID] UNIQUE NONCLUSTERED 
(
	[SHID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSnapshots]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSnapshots](
	[SID] [int] IDENTITY(1,1) NOT NULL,
	[SnapshotImage] [nvarchar](256) NULL,
	[ProjectID] [int] NULL,
	[AddedBy] [nvarchar](256) NULL,
	[AddedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](256) NULL,
	[UpdatedDate] [datetime] NULL,
	[Status] [bit] NULL,
	[DisplayOrder] [int] NULL,
 CONSTRAINT [tblSnapshots_pk] PRIMARY KEY CLUSTERED 
(
	[SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_SID] UNIQUE NONCLUSTERED 
(
	[SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblState]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblState](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](256) NULL,
	[StateStatus] [bit] NULL,
	[AddedDate] [datetime] NULL,
 CONSTRAINT [tblState_pk] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_StateID] UNIQUE NONCLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSubAppMenu]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubAppMenu](
	[SubMenuID] [int] IDENTITY(1,1) NOT NULL,
	[SubMenuName] [varchar](256) NULL,
	[SubMenuStatus] [bit] NULL,
	[MenuID] [int] NULL,
	[AddedBy] [varchar](256) NULL,
	[AddedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[SubMenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_SubMenuID] UNIQUE NONCLUSTERED 
(
	[SubMenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBroadcasts] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblCity]  WITH CHECK ADD  CONSTRAINT [link_tblState_tblCity] FOREIGN KEY([StateID])
REFERENCES [dbo].[tblState] ([StateID])
GO
ALTER TABLE [dbo].[tblCity] CHECK CONSTRAINT [link_tblState_tblCity]
GO
/****** Object:  StoredProcedure [dbKey2h].[AddBlockFloorPlan]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbKey2h].[AddBlockFloorPlan]    
@ProjectID int,   
@BlockID int,  
@Title varchar(200),  
@ImagePath varchar(200),  
@Status BIT,    
@AddedBy varchar(256),    
@AddedDate datetime     
As    
Begin     
insert into tblBlockFloorPlan(ProjectID,BlockID,Title,ImagePath,Status,AddedBy,AddedDate)   values(@ProjectID,@BlockID,@Title,@ImagePath,@Status,@AddedBy,@AddedDate)     
End 
GO
/****** Object:  StoredProcedure [dbKey2h].[AddBroadcast]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[AddBroadcast]
@ProjectID int,
@Message varchar(MAX),
@Title varchar(256),
@AddedBy varchar(256),
@AddedDate datetime
As
Begin
insert into tblBroadcasts (ProjectID,Message,Title,AddedBy,CreatedDate) Values(@ProjectID,@Message,@Title,@AddedBy,@AddedDate)
End
GO
/****** Object:  StoredProcedure [dbKey2h].[AddBroadcastToFlats]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[AddBroadcastToFlats]
    @ProjectID INT,
    @Title NVARCHAR(256),
    @Message NVARCHAR(MAX),
    @AddedBy VARCHAR(256)
AS
BEGIN
        -- Get the current date and time
        DECLARE @CreatedDate DATETIME = GETDATE();

        -- Insert notifications for each flat in the project
        INSERT INTO tblFlatNotifications (Title, Message, CreatedDate, AddedBy, ProjectID, FlatID, ReadStatus, ListStatus)
        SELECT 
            @Title AS Title,
            @Message AS Message,
            @CreatedDate AS CreatedDate,
            @AddedBy AS AddedBy,
            @ProjectID AS ProjectID,
            FlatID,         -- Ensure FlatID exists in the source table
            0 AS ReadStatus,
            1 AS ListStatus
        FROM 
            tblFlat        -- Ensure this is the correct table for flats
        WHERE 
            ProjectID = @ProjectID;
    END ;
GO
/****** Object:  StoredProcedure [dbKey2h].[AddCustomersBasicDetails]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[AddCustomersBasicDetails]
@Gender varchar(50),
@EmailID Varchar(255),
@Mobilenumber varchar(20),
@WhatsappNumber varchar(20),
@AddedBy  varchar(255),
@AddedDate Datetime,
@CustomerID INT OUTPUT
as
Begin
Insert into tblCustomers (Gender,EmailID,Mobilenumber,WhatsappNumber,AddedBy,AddedDate) Values(@Gender,@EmailID,@Mobilenumber,@WhatsappNumber,@AddedBy,@AddedDate)
SET @CustomerID = SCOPE_IDENTITY();
End
GO
/****** Object:  StoredProcedure [dbKey2h].[AddCustomisationWorkApproval]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[AddCustomisationWorkApproval]  
@FlatID nvarchar(50),  
@CustomizationWork nvarchar(256),  
@CustomizationDetails nvarchar(256),  
@ApprovalStatus nvarchar(80),  
@Remarks nvarchar(max),  
@AddedDate Datetime,  
@AddedBy nvarchar(60),  
@Amount nvarchar(60),
@ClientApprovedstatus Nvarchar(60),
@ApprovedBy Nvarchar(60),
@CWAID INT OUTPUT 
As  
Begin  
Insert into tblCustomisationWorkApproval(FlatID,CustomizationWork,CustomizationDetails,ApprovalStatus,Remarks,Amount,AddedDate,AddedBy,ClientApprovedstatus,ApprovedBy)Values(@FlatID,@CustomizationWork,@CustomizationDetails,@ApprovalStatus,@Remarks,@Amount,@AddedDate,@AddedBy,@ClientApprovedstatus,@ApprovedBy)  
SET @CWAID = SCOPE_IDENTITY();  
End  
GO
/****** Object:  StoredProcedure [dbKey2h].[addCustomisationWorkApprovalHistory]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbKey2h].[addCustomisationWorkApprovalHistory]
    @CWAID INT,
    @Remarks NVARCHAR(MAX),
    @Customizationwordetails NVARCHAR(256),
    @WorkTitle NVARCHAR(256),
    @Approvalstatus NVARCHAR(60),
    @HistoryDate DATETIME,
    @UpdatedDate DATETIME = NULL,
    @FlatID nvarchar(60),
    @AddedBy nvarchar(60),
    @ApprovedBy Nvarchar(60),
    @ClientApprovedstatus Nvarchar(60),
    @Amount Nvarchar(60)
AS
BEGIN
    INSERT INTO tblCustomisationWorkApprovalHistory 
        (CWAID, Remarks, Customizationwordetails, WorkTitle, Approvalstatus, HistoryDate, UpdatedDate,FlatID,AddedBy,ApprovedBy,ClientApprovedstatus,Amount)
    VALUES 
        (@CWAID, @Remarks, @Customizationwordetails, @WorkTitle, @Approvalstatus, @HistoryDate, @UpdatedDate,@FlatID,@AddedBy,@ApprovedBy,@ClientApprovedstatus,@Amount);
END;
GO
/****** Object:  StoredProcedure [dbKey2h].[AddCustomWorkdetails]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[AddCustomWorkdetails]
@FlatID int,
@WorkTitle nvarchar(200),
@WorkStatus nvarchar(512),
@AddedBy nvarchar(512),
@AddedDate datetime,
@Amount nvarchar(256)
As
Begin
Insert into tblFlatCustomisationWorks (FlatID,WorkTitle,WorkStatus,Amount,AddedBy,AddedDate) Values(@FlatID,@WorkTitle,@WorkStatus,@Amount,@AddedBy,@AddedDate)
End
GO
/****** Object:  StoredProcedure [dbKey2h].[AddFlatCostDetails]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbKey2h].[AddFlatCostDetails]  
  
        @FlatID int,  
        @BlockID Int,
        @CostLabelID int,  
        @Cost int,  
        @Status Bit,  
        @ProjectID int,  
        @addedBy nvarchar(512),  
        @Addeddate  nvarchar(512)  
        As  
        Begin  
        insert into tblFlatCostDetails(FlatID,CostLabelID,Cost,Status,ProjectID,BlockID,AddedBy,AddedDate) Values(@FlatID,@CostLabelID,@Cost,@Status,@ProjectID,@BlockID,@AddedBy,@AddedDate)  
        End
GO
/****** Object:  StoredProcedure [dbKey2h].[AddFlatCustomerBookingDetails]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbKey2h].[AddFlatCustomerBookingDetails]    
@CustomerID int, @ProjectID int, @BlockID int, @FlatID int, @ApplicantFirstName varchar(255),    
@ApplicantLastName varchar(255), @CoapplicantFirstName varchar(255), @CoapplicantLastName varchar(255),    
@Gender varchar(50), @EmailID varchar(255), @Mobilenumber1 varchar(20), @Mobilenumber2 varchar(20),    
@FatherorSpouseName varchar(255), @DoB datetime, @WhatsappNumber varchar(255), @Profession varchar(255),    
@CompanyName varchar(255), @Designation varchar(255), @CurrentAddress varchar(500), @PermanentAddress varchar(500),    
@ResidentialStatus varchar(50), @CoapplicantRelationship varchar(255), @CityID int, @StateID int, @Pincode int,    
@Reference1 varchar(255), @Reference2 varchar(255), @LeadSource int, @LoanTakenStatus Bit, @BankName nvarchar(255),    
@ApplicantPhoto nvarchar(500), @ApplicantPAN nvarchar(50), @ApplicantAadhar nvarchar(50), @CoApplicantPhoto nvarchar(500),    
@CoApplicantPAN nvarchar(50), @CoApplicantAadhar nvarchar(50), @PoAName varchar(255), @PoAAddress varchar(500),    
@PoAPAN varchar(50), @PoAAdhar varchar(50), @PoADOB datetime, @CoDOB Datetime, @CRMID int, @CustomerLoginStatus Bit,    
@BookingDate Datetime, @Amountpaid int, @PaymentMode Int, @Bookingknowledgement nvarchar(255), @CarparkAllocated bit,    
@NumberofSlots int, @Allottedcarparkslotnumber nvarchar(255), @Registrationcharges int, @RegistrationDate Datetime,    
@RegistrationOffice nvarchar(225), @ReferedBy nvarchar(80), @CoaGender varchar(50), @CoaEmailID varchar(255),    
@CoaMobilenumber1 Varchar(20), @CoaMobilenumber2 Varchar(20), @CoaWhatsappNumber Varchar(20), @CoaAddress varchar(500),    
@CoaResidentialStatus varchar(50), @CoaStateID int, @CoaCityID int, @CoaPinCode int, @Addeddate Datetime,    
@Addedby varchar(50), @FlatName varchar(256),@FlatLoginCode nvarchar(256)  
AS    
BEGIN    
    Insert into tblFlatCustomerBookingDetails(CustomerID, ProjectID, BlockID, FlatID, ApplicantFirstName,    
    ApplicantLastName, CoapplicantFirstName, CoapplicantLastName, Gender, EmailID, Mobilenumber1, Mobilenumber2,    
    FatherorSpouseName, DoB, WhatsappNumber, Profession, CompanyName, Designation, CurrentAddress, PermanentAddress,    
    ResidentialStatus, CoapplicantRelationship, CityID, StateID, Pincode, Reference1, Reference2, LeadSource,    
    LoanTakenStatus, BankName, ApplicantPhoto, ApplicantPAN, ApplicantAadhar, CoApplicantPhoto, CoApplicantPAN,    
    CoApplicantAadhar, PoAName, PoAAddress, PoAPAN, PoAAdhar, PoADOB, CRMID, CustomerLoginStatus, BookingDate,    
    Amountpaid, PaymentMode, Bookingknowledgement, CarparkAllocated, NumberofSlots, Allottedcarparkslotnumber,    
    Registrationcharges, RegistrationDate, RegistrationOffice, ReferedBy, CoaGender, CoaEmailID, CoaMobilenumber1,    
    CoaMobilenumber2, CoaWhatsappNumber, CoaAddress, CoaResidentialStatus, CoaStateID, CoaCityID, CoaPinCode,    
    CoDOB, Addeddate, Addedby)    
    Values(@CustomerID, @ProjectID, @BlockID, @FlatID, @ApplicantFirstName, @ApplicantLastName,    
    @CoapplicantFirstName, @CoapplicantLastName, @Gender, @EmailID, @Mobilenumber1, @Mobilenumber2,    
    @FatherorSpouseName, @DoB, @WhatsappNumber, @Profession, @CompanyName, @Designation, @CurrentAddress,    
    @PermanentAddress, @ResidentialStatus, @CoapplicantRelationship, @CityID, @StateID, @Pincode, @Reference1,    
    @Reference2, @LeadSource, @LoanTakenStatus, @BankName, @ApplicantPhoto, @ApplicantPAN, @ApplicantAadhar,    
    @CoApplicantPhoto, @CoApplicantPAN, @CoApplicantAadhar, @PoAName, @PoAAddress, @PoAPAN, @PoAAdhar, @PoADOB,    
    @CRMID, @CustomerLoginStatus, @BookingDate, @Amountpaid, @PaymentMode, @Bookingknowledgement, @CarparkAllocated,    
    @NumberofSlots, @Allottedcarparkslotnumber, @Registrationcharges, @RegistrationDate, @RegistrationOffice,    
    @ReferedBy, @CoaGender, @CoaEmailID, @CoaMobilenumber1, @CoaMobilenumber2, @CoaWhatsappNumber, @CoaAddress,    
    @CoaResidentialStatus, @CoaStateID, @CoaCityID, @CoaPinCode, @CoDOB, @Addeddate, @Addedby);    
  
    Update tblFlatCustomerBookingDetails    
    Set FlatLoginID = @FlatLoginCode + @FlatName  
    Where FlatID = @FlatID;    
END  
GO
/****** Object:  StoredProcedure [dbKey2h].[AddFlatCustomerBookingDetailsnew]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[AddFlatCustomerBookingDetailsnew]   
@CustomerID int,   
@ProjectID int,   
@BlockID int,  
@FlatID int,  
@ApplicantFirstName varchar(255),  
@ApplicantLastName varchar(255),  
@CoapplicantFirstName varchar(255),  
@CoapplicantLastName varchar(255),   
@Gender varchar(50),  
@EmailID varchar(255),   
@Mobilenumber1 varchar(20),  
@Mobilenumber2 varchar(20),  
@FatherorSpouseName varchar(255),  
@DoB datetime,   
@WhatsappNumber varchar(255),   
@Profession varchar(255),   
@CompanyName varchar(255),   
@Designation varchar(255),  
@CurrentAddress varchar(500),  
@PermanentAddress varchar(500),  
@ResidentialStatus varchar(50),  
@CoapplicantRelationship varchar(255),  
@CityID int,   
@StateID int,   
@Pincode int,   
@Reference1 varchar(255),  
@Reference2 varchar(255),  
@LeadSource int,   
@LoanTakenStatus Bit,   
@BankName nvarchar(255),   
@ApplicantPhoto nvarchar(500),  
@ApplicantPAN nvarchar(50),   
@ApplicantAadhar nvarchar(50),   
@CoApplicantPhoto nvarchar(500),  
@CoApplicantPAN nvarchar(50),   
@CoApplicantAadhar nvarchar(50),  
@PoAName varchar(255),   
@PoAAddress varchar(500),   
@PoAPAN varchar(50),  
@PoAAdhar varchar(50),  
@PoADOB datetime,
@CoDOB Datetime,
@CRMID int,  
@CustomerLoginStatus Bit,  
@BookingDate Datetime,  
@Amountpaid int,  
@PaymentMode Int,   
@Bookingknowledgement nvarchar(255),   
@CarparkAllocated bit,  
@NumberofSlots int,   
@Allottedcarparkslotnumber nvarchar(255),  
@Registrationcharges int,  
@RegistrationDate Datetime,   
@RegistrationOffice nvarchar(225),  
@ReferedBy nvarchar(80),
@CoaGender varchar(50),
@CoaEmailID varchar(255),
@CoaMobilenumber1  Varchar(20),
@CoaMobilenumber2 Varchar(20),
@CoaWhatsappNumber Varchar(20),
@CoaAddress varchar(500),
@CoaResidentialStatus varchar(50),
@CoaStateID int,
@CoaCityID int,
@CoaPinCode int,
@Addeddate Datetime,   
@Addedby varchar(50),  
@FlatName varchar(256) As Begin     -- Insert into tblFlatCustomerBookingDetails      
Insert into tblFlatCustomerBookingDetails(CustomerID,  
ProjectID,      
BlockID,   
FlatID,   
ApplicantFirstName,   
ApplicantLastName,   
CoapplicantFirstName,    
CoapplicantLastName,     Gender,     EmailID,     Mobilenumber1,     Mobilenumber2,       
FatherorSpouseName,     DoB,      WhatsappNumber,     Profession,     CompanyName,     Designation,     CurrentAddress,     PermanentAddress,     ResidentialStatus,     CoapplicantRelationship,     CityID,     StateID,     Pincode,     Reference1,     Reference2,     LeadSource,     LoanTakenStatus,     BankName,     ApplicantPhoto,     ApplicantPAN,     ApplicantAadhar,     CoApplicantPhoto,     CoApplicantPAN,     CoApplicantAadhar,     PoAName,     PoAAddress,     PoAPAN,     PoAAdhar,     PoADOB,     
  
CRMID,     CustomerLoginStatus,     BookingDate,     Amountpaid,     PaymentMode,     Bookingknowledgement,     CarparkAllocated,     NumberofSlots,     Allottedcarparkslotnumber,     Registrationcharges,     RegistrationDate,     RegistrationOffice,   ReferedBy,         
CoaGender ,
CoaEmailID ,
CoaMobilenumber1  ,
CoaMobilenumber2 ,
CoaWhatsappNumber ,
CoaAddress ,
CoaResidentialStatus ,
CoaStateID ,
CoaCityID ,
CoaPinCode ,
CoDOB,




Addeddate,     Addedby     )        
Values(@CustomerID,     @ProjectID,     @BlockID,     @FlatID,     @ApplicantFirstName,     @ApplicantLastName,     @CoapplicantFirstName,     @CoapplicantLastName,     @Gender,     @EmailID,     @Mobilenumber1,     @Mobilenumber2,     @FatherorSpouseName
,     @DoB,      @WhatsappNumber,     @Profession,     @CompanyName,     @Designation,     @CurrentAddress,     @PermanentAddress,     @ResidentialStatus,     @CoapplicantRelationship,     @CityID,     @StateID,     @Pincode,     @Reference1,     @Reference2,     @LeadSource,     @LoanTakenStatus,     @BankName,     @ApplicantPhoto,     @ApplicantPAN,     @ApplicantAadhar,     @CoApplicantPhoto,     @CoApplicantPAN,     @CoApplicantAadhar,     @PoAName,     @PoAAddress,    
   @PoAPAN,     @PoAAdhar,     @PoADOB,     @CRMID,     @CustomerLoginStatus,     @BookingDate,     @Amountpaid,     @PaymentMode,     @Bookingknowledgement,     @CarparkAllocated,     @NumberofSlots,     @Allottedcarparkslotnumber,     @Registrationcharges,     @RegistrationDate,     @RegistrationOffice,    @ReferedBy, 
   @CoaGender ,
@CoaEmailID ,
@CoaMobilenumber1  ,
@CoaMobilenumber2 ,
@CoaWhatsappNumber ,
@CoaAddress ,
@CoaResidentialStatus ,
@CoaStateID ,
@CoaCityID ,
@CoaPinCode ,
@CoDOB,
   
   
   @Addeddate,     @Addedby     );      
   -- Update FlatLoginID using FlatID and @FlatName     
   Update tblFlatCustomerBookingDetails     Set FlatLoginID = @FlatName + CAST(FlatID AS NVARCHAR(50))   
   Where FlatID = @FlatID;  
   End 
GO
/****** Object:  StoredProcedure [dbKey2h].[AddFlatCustomerBookingDetailsOld]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbKey2h].[AddFlatCustomerBookingDetailsOld]
@CustomerID int,
@ProjectID int,
@BlockID int,
@FlatID int,
@ApplicantFirstName	varchar(255),
@ApplicantLastName varchar(255),
@CoapplicantFirstName varchar(255),
@CoapplicantLastName varchar(255),
@Gender varchar(50),
@EmailID varchar(255),
@Mobilenumber1 varchar(20),
@Mobilenumber2 varchar(20),
@FatherorSpouseName varchar(255),
@DoB datetime,
@WhatsappNumber varchar(255),
@Profession varchar(255),
@CompanyName varchar(255),
@Designation varchar(255),
@CurrentAddress varchar(500),
@PermanentAddress varchar(500),
@ResidentialStatus varchar(50),
@CoapplicantRelationship varchar(255),
@CityID int,
@StateID int,
@Pincode int,
@Reference1 varchar(255),
@Reference2 varchar(255),
@LeadSource int,
@LoanTakenStatus Bit,
@BankName nvarchar(255),
@ApplicantPhoto nvarchar(500),
@ApplicantPAN nvarchar(50),
@ApplicantAadhar nvarchar(50),
@CoApplicantPhoto nvarchar(500),
@CoApplicantPAN nvarchar(50),
@CoApplicantAadhar nvarchar(50),
@PoAName varchar(255),
@PoAAddress varchar(500),
@PoAPAN varchar(50),
@PoAAdhar varchar(50),
@PoADOB datetime,
@CRMID int,
@CustomerLoginStatus Bit,
@BookingDate Datetime,
@Amountpaid int,
@PaymentMode Int,
@Bookingknowledgement nvarchar(255),
@CarparkAllocated bit,
@NumberofSlots int,
@Allottedcarparkslotnumber nvarchar(255),
@Registrationcharges int,
@RegistrationDate Datetime,
@RegistrationOffice nvarchar(225),
@Addeddate Datetime,
@Addedby varchar(50)

As
Begin
Insert into tblFlatCustomerBookingDetails(CustomerID,
ProjectID,
BlockID,
FlatID,
ApplicantFirstName,
ApplicantLastName ,
CoapplicantFirstName,
CoapplicantLastName,
Gender,
EmailID,
Mobilenumber1,
Mobilenumber2,
FatherorSpouseName,
DoB, 
WhatsappNumber,
Profession,
CompanyName,
Designation,
CurrentAddress,
PermanentAddress,
ResidentialStatus,
CoapplicantRelationship,
CityID,
StateID ,
Pincode ,
Reference1,
Reference2,
LeadSource,
LoanTakenStatus,
BankName ,
ApplicantPhoto,
ApplicantPAN ,
ApplicantAadhar ,
CoApplicantPhoto ,
CoApplicantPAN ,
CoApplicantAadhar ,
PoAName,
PoAAddress,
PoAPAN,
PoAAdhar ,
PoADOB ,
CRMID ,
CustomerLoginStatus ,
BookingDate,
Amountpaid,
PaymentMode,
Bookingknowledgement,
CarparkAllocated ,
NumberofSlots ,
Allottedcarparkslotnumber,
Registrationcharges,
RegistrationDate,
RegistrationOffice,
Addeddate,
Addedby
) Values(@CustomerID,
@ProjectID,
@BlockID,
@FlatID,
@ApplicantFirstName,
@ApplicantLastName ,
@CoapplicantFirstName,
@CoapplicantLastName,
@Gender,
@EmailID,
@Mobilenumber1,
@Mobilenumber2,
@FatherorSpouseName,
@DoB, 
@WhatsappNumber,
@Profession,
@CompanyName,
@Designation,
@CurrentAddress,
@PermanentAddress,
@ResidentialStatus,
@CoapplicantRelationship,
@CityID,
@StateID ,
@Pincode ,
@Reference1,
@Reference2,
@LeadSource,
@LoanTakenStatus,
@BankName ,
@ApplicantPhoto,
@ApplicantPAN ,
@ApplicantAadhar ,
@CoApplicantPhoto ,
@CoApplicantPAN ,
@CoApplicantAadhar ,
@PoAName,
@PoAAddress,
@PoAPAN,
@PoAAdhar ,
@PoADOB ,
@CRMID ,
@CustomerLoginStatus ,
@BookingDate,
@Amountpaid,
@PaymentMode,
@Bookingknowledgement,
@CarparkAllocated ,
@NumberofSlots ,
@Allottedcarparkslotnumber,
@Registrationcharges,
@RegistrationDate,
@RegistrationOffice,
@Addeddate,
@Addedby
)

End
GO
/****** Object:  StoredProcedure [dbKey2h].[AddFlatCustomerDemands]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[AddFlatCustomerDemands]  
@ProjectID Int,  
@BlockNo int,  
@FlatID int,  
@PaymentLabelID int,  
@PDFName nvarchar(512),
@Amount nvarchar(512),
@PSID int,
@AddedDate date,  
@AddedBy nvarchar(512),  
@PaymentStatus varchar(512)  
As  
Begin  
insert into tblFlatCustomerDemands(FlatID,PaymentLabelID,PDFName,AddedDate,AddedBy,PaymentStatus,Amount,PSID,ProjectID,BlockNo) Values(@FlatID,@PaymentLabelID,@PDFName,@AddedDate,@AddedBy,@PaymentStatus,@Amount,@PSID,@ProjectID,@BlockNo)  
End  
GO
/****** Object:  StoredProcedure [dbKey2h].[AddFlatCustomerKYCDocs]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[AddFlatCustomerKYCDocs]
@FlatID int,
@ProjectID int,
@SaleDeedDraft nvarchar(512),
@SaleDeedFinal nvarchar(512),
@SaleAgreementDraft nvarchar(512),
@SaleAgreementFinal nvarchar(512),
@AllotmentLetter nvarchar(512),
@WelcomeLetter nvarchar(512),
@DemandLetter nvarchar(512),
@PaymentReceipt nvarchar(512),
@Bill nvarchar(512),
@PaymentSchedule nvarchar(512),
@EBCard nvarchar(512),
@HandingOverDocs nvarchar(512),
@CCUpdation nvarchar(512),
@NOCforHandover nvarchar(512),
@OtherDocuments nvarchar(512),
@BankDocuments nvarchar(512),
@AddedBy nvarchar(100),
@Addeddate Datetime
As
Begin
Insert into tblFlatCustomerKYCDocs(FlatID,ProjectID,SaleDeedDraft,SaleDeedFinal,SaleAgreementDraft,SaleAgreementFinal,AllotmentLetter,WelcomeLetter,DemandLetter,PaymentReceipt,Bill,PaymentSchedule,EBCard,HandingOverDocs,CCUpdation,NOCforHandover,OtherDocuments,BankDocuments,AddedBy,Addeddate) Values(@FlatID,@ProjectID,@SaleDeedDraft,@SaleDeedFinal,@SaleAgreementDraft,@SaleAgreementFinal,@AllotmentLetter,@WelcomeLetter,@DemandLetter,@PaymentReceipt,@Bill,@PaymentSchedule,@EBCard,@HandingOverDocs,@CCUpdation,@NOCforHandover,@OtherDocuments,@BankDocuments,@AddedBy,@Addeddate)
End
GO
/****** Object:  StoredProcedure [dbKey2h].[AddFlatCustomerTransaction]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure   [dbKey2h].[AddFlatCustomerTransaction]
@FlatID Int,
@DemandID int,
@PaymentStatus varchar(256),
@PaymentUpdatedDate Datetime,
@PaymentUpdatedBy nvarchar(512),
@ProjectID int,
@BlockNo int,
@ReceiptPDF nvarchar(512),
@PaidAmount int,
@PaymentMode nvarchar(256)
As  
Begin  
Insert into tblFlatCustomerTransaction (FlatID,DemandID,PaymentStatus,PaymentUpdatedDate,PaymentUpdatedBy,ProjectID,BlockNo,ReceiptPDF,PaidAmount,PaymentMode) Values(@FlatID,@DemandID,@PaymentStatus,@PaymentUpdatedDate,@PaymentUpdatedBy,@ProjectID,@BlockNo,@ReceiptPDF,@PaidAmount,@PaymentMode)
End  
GO
/****** Object:  StoredProcedure [dbKey2h].[AddFlatCustomisationDemands]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[AddFlatCustomisationDemands]
@FlatID int,
@PDFName nvarchar(512),
@PaymentStatus varchar(256),
@AddedBy nvarchar(50),
@AddedDate date,
@CWID int
As
Begin
insert into tblFlatCustomisationDemands(FlatID,PDFName,PaymentStatus,AddedBy,AddedDate,CWID) Values(@FlatID,@PDFName,@PaymentStatus,@AddedBy,@AddedDate,@CWID)
End
GO
/****** Object:  StoredProcedure [dbKey2h].[AddFlatCustomisationTransaction]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure  [dbKey2h].[AddFlatCustomisationTransaction]
@FlatID int,
@CDemandID int,
@PaymentStatus varchar(256),
@PaymentUpdatedDate Date,
@PaymentUpdatedBy nvarchar(512),
@ReceiptPDF Nvarchar(512),
@PaidAmount int,
@PaymentMode int,
@RecAddedDate datetime
As
Begin
Insert into tblFlatCustomisationTransaction(FlatID,CDemandID,PaymentStatus,ReceiptPDF,PaidAmount,PaymentMode,PaymentUpdatedBy,PaymentUpdatedDate,RecAddedDate) Values(@FlatID,@CDemandID,@PaymentStatus,@ReceiptPDF,@PaidAmount,@PaymentMode,@PaymentUpdatedBy,@PaymentUpdatedDate,@RecAddedDate)
END
GO
/****** Object:  StoredProcedure [dbKey2h].[addFlatdetails]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[addFlatdetails]
@BlockID int,
@ProjectID int,
@FlatName nvarchar(512),
@Facing varchar(256),
@UDS nvarchar(512),
@UnitType nvarchar(512),
@SaleableArea nvarchar(512),
@CarpetArea nvarchar(512),
@Balcony nvarchar(512),
@Wallarea nvarchar(512),
@CarparkingCount int,
@Carparkslot1 nvarchar(512),
@Carparkslot2 nvarchar(512),
@Carparkslot3 nvarchar(512),
@AddedBy nvarchar(512),
@AddedDate datetime,
@FlatStatus bit,
@Floor int
as
begin

Insert into tblflat (ProjectID,BlockID,FlatName,Facing,UDS,UnitType,SaleableArea,CarpetArea,Balcony,Wallarea,CarparkingCount,Carparkslot1,Carparkslot2,Carparkslot3,AddedBy,AddedDate,FlatStatus,Floor)values(@ProjectID,@BlockID,@FlatName,@Facing,@UDS,@UnitType,@SaleableArea,@CarpetArea,@Balcony,@Wallarea,@CarparkingCount,@Carparkslot1,@Carparkslot2,@Carparkslot3,@AddedBy,@AddedDate,@FlatStatus,@Floor)

End
GO
/****** Object:  StoredProcedure [dbKey2h].[AddFlatFloorPlan]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[AddFlatFloorPlan]  
@ProjectID int, 
@BlockID int,
@FlatID int,
@Title varchar(200),
@ImagePath varchar(200),
@Status BIT,  
@AddedBy varchar(256),  
@AddedDate datetime   
As  
Begin   
insert into tblFlatFloorPlan(ProjectID,BlockID,FlatID,Title,ImagePath,Status,AddedBy,AddedDate)   values(@ProjectID,@BlockID,@FlatID,@Title,@ImagePath,@Status,@AddedBy,@AddedDate)   
End  
GO
/****** Object:  StoredProcedure [dbKey2h].[AddFlatPaymentScheduleDetails]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

        CREATE Procedure [dbKey2h].[AddFlatPaymentScheduleDetails]  
  
        @FlatID int,  
        @PaymentLabelID int,  
        @Amount int,  
        @GST INt,  
        @SubAmount int,  
        @PaymentPercentage Nvarchar(512),
        @AddedBy nvarchar(512),  
        @Addeddate  nvarchar(512)  
As  
Begin  
 insert into tblCustomerPaymentSchedule (FlatID,PaymentLabelID,Amount,GST,SubAmount,AddedBy,AddedDate,PaymentPercentage) Values(@FlatID,@PaymentLabelID,@Amount,@GST,@SubAmount,@AddedBy,@AddedDate,@PaymentPercentage)  
End
GO
/****** Object:  StoredProcedure [dbKey2h].[AddFlatProgress]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[AddFlatProgress]
@ProjectID int,
@FlatID int,
@Month varchar(256),
@Year int,
@ThumbnailImage nvarchar(512),
@AddedDate datetime,
@AddedBy nvarchar(512),
@Status bit,
@FlatProgressID int OUTPUT  
As
Begin
Insert into tblFlatProgress (ProjectID,FlatID,Month,Year,ThumbnailImage,AddedDate,AddedBy,Status) Values(@ProjectID,@FlatID,@Month,@Year,@ThumbnailImage,@AddedDate,@AddedBy,@Status)
SET @FlatProgressID = SCOPE_IDENTITY();  
End

GO
/****** Object:  StoredProcedure [dbKey2h].[AddFlatProgressImage]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[AddFlatProgressImage]
@ProgressID Int,
@ImageName nvarchar(512),
@Content nvarchar(512),
@status Bit
As
Begin
Insert into tblProjectFlatProgressImage (FlatProgressID,ImageName,Content,Status) Values(@ProgressID,@ImageName,@Content,@Status)
End
GO
/****** Object:  StoredProcedure [dbKey2h].[AddFlatQP]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[AddFlatQP]    
@ProjectID int,
@BlockId INT,
@FlatID INT,
@Title varchar(200),    
@PDFName varchar(200),    
@Status BIT,    
@AddedBy varchar(256),    
@AddedDate datetime        
As    
Begin        
insert into tblFlatQualityReports(ProjectID,BlockID,FlatID,Title,PDFName,Status,AddedBy,AddedDate)  values(@ProjectID,@BlockID,@FlatID,@Title,@PDFName,@Status,@AddedBy,@AddedDate)       
End 
GO
/****** Object:  StoredProcedure [dbKey2h].[AddFlatQualityReports]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbKey2h].[AddFlatQualityReports]  
  
        @FlatID int,  
        @BlockID Int,
        @Title nvarchar(max),  
        @PDFName int,  
        @Status Bit,  
        @ProjectID int,  
        @AddedBy int,  
        @Addeddate datetime 
        As  
        Begin  
        insert into tblFlatQualityReports(FlatID,Title,PDFName,Status,ProjectID,BlockID,AddedBy,AddedDate) 
        
        Values(@FlatID,@Title,@PDFName,@Status,@ProjectID,@BlockID,@AddedBy,@AddedDate) 
         
        End
GO
/****** Object:  StoredProcedure [dbKey2h].[AddLeadSource]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[AddLeadSource]
@ClientID int,
@LeadSourceName varchar(200),
@LeadSourceStatus BIT,
@AddedBy varchar(256),
@AddedDate datetime

As
Begin

insert into tblLeadSource(ClientID,LeadSourceName,LeadSourceStatus,AddedBy,AddedDate) 

values(@ClientID,@LeadSourceName,@LeadSourceStatus,@AddedBy,@AddedDate)

End
GO
/****** Object:  StoredProcedure [dbKey2h].[AddProjectAmenities]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[AddProjectAmenities]
@ProjectID int,
@Title nvarchar(50),
@Image nvarchar(200),
@DisplayOrder int,
@AddedDate Datetime,
@AddedBy nvarchar(256)
As
Begin
insert into  tblProjectAmenities (ProjectID,Title,Image,DisplayOrder,AddedDate,AddedBy) Values(@ProjectID,@Title,@Image,@DisplayOrder,@AddedDate,@AddedBy)
End
GO
/****** Object:  StoredProcedure [dbKey2h].[AddProjectBlock]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[AddProjectBlock]
@ProjectID int,
@BlockName varchar(256),
@BlockStatus bit,
@AddedBy varchar(256),
@AddedDate datetime
As
Begin
insert into tblProjectBlock (ProjectID,BlockName,BlockStatus,AddedBy,AddedDate) Values(@ProjectID,@BlockName,1,@AddedBy,@AddedDate)
End
GO
/****** Object:  StoredProcedure [dbKey2h].[AddProjectFloorPlan]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[AddProjectFloorPlan]
@ProjectID int,
@Title varchar(200),
@ImagePath varchar(200),
@Status BIT,
@AddedBy varchar(256),
@AddedDate datetime

As
Begin

insert into tblFloorPlan(ProjectID,Title,ImagePath,Status,AddedBy,AddedDate) 

values(@ProjectID,@Title,@ImagePath,@Status,@AddedBy,@AddedDate)

End
GO
/****** Object:  StoredProcedure [dbKey2h].[AddProjectHomeScreen]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[AddProjectHomeScreen]
@ProjectID int,
@BHK varchar(200),
@Sqft varchar(200),
@FlatCount varchar(256),
@AddedBy varchar(256),
@AddedDate datetime
As
Begin
insert into tblProjectHomeScreen(ProjectID,Apartments,Bhk,SquareFeet,AddedBy,AddedDate,Status) values(@ProjectID,@FlatCount,@BHK,@Sqft,@AddedBy,@AddedDate,1)
End
GO
/****** Object:  StoredProcedure [dbKey2h].[Addprojectprogress]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbKey2h].[Addprojectprogress]
@ProjectID int,
@Month  varchar(256),
@Year int,
@ThumbnailImage nvarchar(512),
@Status bit,
@AddedBy nvarchar(512),
@AddedDate datetime,
@ProgressID int OUTPUT
As
Begin

insert into  tblProjectProgress (ProjectID,Month,Year,ThumbnailImage,Status,AddedDate,AddedBy) Values(@ProjectID,@Month,@Year,@ThumbnailImage,@Status,@AddedDate,@AddedBy)
SET @ProgressID = SCOPE_IDENTITY();  
End
GO
/****** Object:  StoredProcedure [dbKey2h].[Addprojectprogressimage]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[Addprojectprogressimage]
@ProgressID int,

@ImageName nvarchar(512),
@Content nvarchar(512),
@Status Bit,
@DisplayOrder int
As
Begin

insert into tblProjectProgressImage(ProgressID,ImageName,Content,Status,DisplayOrder)  values(@ProgressID,@ImageName,@Content,@Status,@DisplayOrder)

End
GO
/****** Object:  StoredProcedure [dbKey2h].[AddProjectQP]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[AddProjectQP]  
@ProjectID int,  
@Title varchar(200),  
@PDFName varchar(200),  
@Status BIT,  
@AddedBy varchar(256),  
@AddedDate datetime  
  
As  
Begin  
  
insert into tblProjectQualityReports(ProjectID,Title,PDFName,Status,AddedBy,AddedDate)   
  
values(@ProjectID,@Title,@PDFName,@Status,@AddedBy,@AddedDate)  
  
End  
GO
/****** Object:  StoredProcedure [dbKey2h].[AddProjects]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbKey2h].[AddProjects]    
@ClientID int,    
@ProjectName varchar(200),    
@ProjectLogo varchar(200),    
@Location varchar(256),    
@Address varchar(256),    
@State int,    
@City int,    
@PostalCode int,    
@GoogleMapLink nvarchar(200),    
@BlockCount int,    
@FlatCount int,    
@LandArea varchar(256),    
@RERANumber nvarchar(512),    
@ProjectStatus int,    
@ProjectDisplayStatus bit,    
@ProjectStatusPercentage int,    
@SplashScreenImage nvarchar(512),    
@LocationMap varchar(256),    
@Latitude nvarchar(512),  
@Longitude nvarchar(512),  
@BankName varchar(256),    
@AccountName varchar(256),    
@AccountNumber nvarchar(50),    
@IFSCNumber varchar(256),    
@BranchName varchar(256),    
@AddedBy varchar(256),    
@AddedDate datetime, @ProjectID INT OUTPUT     
As    
Begin    
insert into tblProjects(ClientID,ProjectName,ProjectLogo,Location,Address,State,City,PostalCode,GoogleMapLink,BlockCount,FlatCount,LandArea,RERANumber,ProjectStatus,ProjectDisplayStatus,ProjectStatusPercentage,SplashScreenImage,LocationMap,BankName,AccountName,AccountNumber,IFSCNumber,BranchName,Latitude,Longitude,AddedBy,AddedDate) values(@ClientID,@ProjectName,@ProjectLogo,@Location,@Address,@State,@City,@PostalCode,@GoogleMapLink,@BlockCount,@FlatCount,@LandArea,@RERANumber,@ProjectStatus,@ProjectDisplayStatus,@ProjectStatusPercentage,@SplashScreenImage,@LocationMap,@BankName,@AccountName,@AccountNumber,@IFSCNumber,@BranchName,@Longitude,@Latitude,@AddedBy,@AddedDate) SET @ProjectID = SCOPE_IDENTITY();    
End    
GO
/****** Object:  StoredProcedure [dbKey2h].[AddProjectsOld]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[AddProjectsOld]
@ClientID int,
@ProjectName varchar(200),
@ProjectLogo varchar(200),
@Location varchar(256),
@Address varchar(256),
@State int,
@City int,
@PostalCode int,
@GoogleMapLink nvarchar(200),
@BlockCount int,
@FlatCount int,
@LandArea varchar(256),
@RERANumber nvarchar(512),
@ProjectStatus int,
@ProjectDisplayStatus bit,
@ProjectStatusPercentage int,
@SplashScreenImage nvarchar(512),
@LocationMap varchar(256),
@BankName varchar(256),
@AccountName varchar(256),
@AccountNumber nvarchar(50),
@IFSCNumber varchar(256),
@BranchName varchar(256),
@AddedBy varchar(256),
@AddedDate datetime
As
Begin
insert into tblProjects(ClientID,ProjectName,ProjectLogo,Location,Address,State,City,PostalCode,GoogleMapLink,BlockCount,FlatCount,LandArea,RERANumber,ProjectStatus,ProjectDisplayStatus,ProjectStatusPercentage,SplashScreenImage,LocationMap,BankName,AccountName,AccountNumber,IFSCNumber,BranchName,AddedBy,AddedDate) values(@ClientID,@ProjectName,@ProjectLogo,@Location,@Address,@State,@City,@PostalCode,@GoogleMapLink,@BlockCount,@FlatCount,@LandArea,@RERANumber,@ProjectStatus,@ProjectDisplayStatus,@ProjectStatusPercentage,@SplashScreenImage,@LocationMap,@BankName,@AccountName,@AccountNumber,@IFSCNumber,@BranchName,@AddedBy,@AddedDate)
End
GO
/****** Object:  StoredProcedure [dbKey2h].[AddReferralDetailsfromApp]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[AddReferralDetailsfromApp]
    @ProjectID INT,
    @FlatID VARCHAR(200),
    @ReferralName nvarchar(256),
    @Mobile VARCHAR(256),
    @Content VARCHAR(MAX)
AS
BEGIN
    -- Insert statement with current date inserted using GETDATE() and converting to date type
    INSERT INTO tblProjectReferralList (ProjectID, FlatID, ReferralName, ReferralMobile, ReferralContent, ReferredDate)
    VALUES (@ProjectID, @FlatID, @ReferralName, @Mobile, @Content, CAST(GETDATE() AS DATE))
END

GO
/****** Object:  StoredProcedure [dbKey2h].[AddReferScreenContent]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[AddReferScreenContent]
@ClientID int,
@ProjectID int,
@Question nvarchar(MAX),
@MessageContent nvarchar(MAX),
@Content nvarchar(MAX),
@Image nvarchar(MAX),
@AddedBy nvarchar(512),
@AddedDate varchar(max)

as
begin

Insert into tblProjectReferScreen (ProjectID,ClientID,Question,MessageContent,Content,Image,AddedBy,AddedDate)values(@ProjectID,@ClientID,@Question,@MessageContent,@Content,@Image,@AddedBy,@AddedDate)

End
GO
/****** Object:  StoredProcedure [dbKey2h].[AddRMDetails]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[AddRMDetails]
@ClientID int,
@Username varchar(200),
@Name varchar(200),
@PhoneNumber varchar(256),
@Role varchar(256),
@Gender varchar(256),
@Salutation varchar(256),
@UserEmailID varchar(256),
@WhatsappNumber nvarchar(200),
@Photo varchar(256),
@AddedBy varchar(256),
@Password varchar(256),
@UserStatus BIT,
@AddedDate datetime

As
Begin

insert into tblClientUsers(ClientID,UserName,Name,PhoneNumber,WhatsappNumber,Role,Gender,Salutation,Password,UserEmailID,UserStatus,Photo,AddedBy,AddedDate) 

values(@ClientID,@UserName,@Name,@PhoneNumber,@WhatsappNumber,@Role,@Gender,@Salutation,@Password,@UserEmailID,@UserStatus,@Photo,@AddedBy,@AddedDate)

End
GO
/****** Object:  StoredProcedure [dbKey2h].[AddSpecifications]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[AddSpecifications]
@SpecificationTitle nvarchar(MAX),
@SpecificationDetails nvarchar(MAX),
@ProjectID INt,
@AddedDate Datetime,
@AddedBy nvarchar(20),
@Status bit

As
Begin

INSERT into tblProjectSpecificationDetails 
(SpecificationTitle,SpecificationDetails,ProjectID,AddedDate,AddedBy,Status) values 
(@SpecificationTitle,@SpecificationDetails,@ProjectID,@AddedDate,@AddedBy,@Status)


End


GO
/****** Object:  StoredProcedure [dbKey2h].[AddWhatshappening]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[AddWhatshappening]
@ProjectID int,
@Content varchar(200),
@DisplayStatus BIT,
@AddedBy varchar(256),
@AddedDate datetime

As
Begin

insert into tblProjectWhatsHappening(ProjectID,Content,DisplayStatus,AddedBy,AddedDate) 

values(@ProjectID,@Content,@DisplayStatus,@AddedBy,@AddedDate)

End
GO
/****** Object:  StoredProcedure [dbKey2h].[AlreadyexistcustomerBasicdetailsBynumber]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[AlreadyexistcustomerBasicdetailsBynumber]
@Mobilenumber1 varchar(20)
As
Begin
Select * from tblCustomers where Mobilenumber=@Mobilenumber1
End
GO
/****** Object:  StoredProcedure [dbKey2h].[AlreadyExistFlatCostByProIDBlockIDFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[AlreadyExistFlatCostByProIDBlockIDFlatID]    
@ProjectID int,      
@FlatID int ,
@BlockID int
As    
Begin    
Select * from tblFlatCostDetails where ProjectID=@ProjectID AND FlatID=@FlatID   and BlockID=@BlockID    
END
GO
/****** Object:  StoredProcedure [dbKey2h].[AlreadyexistFlatCustomerBookingDetailsByProjectIDAndBlockIDAndFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbKey2h].[AlreadyexistFlatCustomerBookingDetailsByProjectIDAndBlockIDAndFlatID]
@ProjectID int,
@BlockID int,
@FlatID int
as
Begin
Select * from tblFlatCustomerBookingDetails where ProjectID=@ProjectID And BlockID=@BlockID AND FlatID=@FlatID

End
GO
/****** Object:  StoredProcedure [dbKey2h].[AlreadyExistFlatCustomerDemandsByPaymentLabelIDFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[AlreadyExistFlatCustomerDemandsByPaymentLabelIDFlatID]
@PaymentLabelID int,  
@FlatID int  
As
Begin
Select * from tblFlatCustomerDemands where PaymentLabelID=@PaymentLabelID AND FlatID=@FlatID  
END
GO
/****** Object:  StoredProcedure [dbKey2h].[AlreadyExistFlatQualityReporttByProIDBlockIDFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[AlreadyExistFlatQualityReporttByProIDBlockIDFlatID]  
@ProjectID int,    
@FlatID int    
As  
Begin  
Select * from tblFlatQualityReports where ProjectID=@ProjectID AND FlatID=@FlatID    
END
GO
/****** Object:  StoredProcedure [dbKey2h].[AlreadyExistProjectNamebyClientID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[AlreadyExistProjectNamebyClientID]
@ClentID int
as
Begin
 select * from tblProjects Where ClientID=@ClentID
End
GO
/****** Object:  StoredProcedure [dbKey2h].[AlreadyExistProjectNamebyIDandName]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE Procedure [dbKey2h].[AlreadyExistProjectNamebyIDandName]  
@ProjectID int,  
@ProjectName nvarchar(512),
@AddedBy nvarchar(50)
as    
Begin    
   SELECT COUNT(1)  
            FROM tblprojects  
            WHERE ProjectName = @ProjectName  
            AND (@ProjectID IS NULL OR ProjectID !=@ProjectID) AND  AddedBy=@AddedBy
End 
GO
/****** Object:  StoredProcedure [dbKey2h].[AlreadyExistsLeadSourceName]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[AlreadyExistsLeadSourceName]
@LeadSourceName varchar(200)
as
Begin
 select * from tblLeadSource Where LeadSourceName=@LeadSourceName
End
GO
/****** Object:  StoredProcedure [dbKey2h].[AlreadyexisttransactionByDemandID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[AlreadyexisttransactionByDemandID]
@DemandID Int
As
Begin
Select * FROM tblFlatCustomerDemands where DemandID=@DemandID
End
GO
/****** Object:  StoredProcedure [dbKey2h].[BlockAlreadyExistByProjectid]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[BlockAlreadyExistByProjectid]  
    
   @ProjectID INT = NULL  , 
   @BlockName nvarchar(252) = NULL   
as  
begin  
Select * from tblProjectBlock where ProjectID=@ProjectID and BlockName like @BlockName  
end  
GO
/****** Object:  StoredProcedure [dbKey2h].[BlockCountGetByPIDandABy]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[BlockCountGetByPIDandABy]
@ProjectID int,
@AddedBy nvarchar(50)
As
Begin
select Count(BlockID) from tblProjectBlock where ProjectID=@ProjectID and AddedBy=@AddedBy
End
GO
/****** Object:  StoredProcedure [dbKey2h].[CalculatePaymentBalance]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[CalculatePaymentBalance]  
@PaymentUpdatedBy nvarchar(50),  
@CDemandID int,  
@FlatID int  
As  
Begin  
SELECT sum(TBCT.PaidAmount) As PaidAmount
FROM tblFlatCustomisationTransaction TBCT  
inner JOIN tblFlatCustomisationDemands TBLD ON TBLD.CDemandID = TBCT.CDemandID  
inner JOIN tblFlatCustomisationWorks TFW ON TBLD.CWID = TFW.CWID  
WHERE TBCT.PaymentUpdatedBy = @PaymentUpdatedBy  
  AND TBLD.CDemandID = @CDemandID  
  AND TBCT.FlatID = @FlatID  
  
End
GO
/****** Object:  StoredProcedure [dbKey2h].[CheckExistProjectCostLabelsParameterByCLID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[CheckExistProjectCostLabelsParameterByCLID]
    @CostLabelID INT,
    @AddedBy NVARCHAR(50)
AS
BEGIN
SELECT CASE
           WHEN EXISTS (
               SELECT 1 
               FROM tblProjectCostLabels 
               WHERE CostlabelID = @CostLabelID 
                 AND AddedBy = @AddedBy 
                 AND CostLabelID NOT IN ('1','3','6', '7', '8')
           ) THEN 0
           ELSE 1
END AS RecordStatus
End

GO
/****** Object:  StoredProcedure [dbKey2h].[CheckFlatAndMpin]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbKey2h].[CheckFlatAndMpin]
    @Flatname NVARCHAR(256),
    @Mpin VARCHAR(4)
AS
BEGIN
    -- Check if flat name exists
    IF EXISTS (SELECT 1 FROM tblFlatCustomerBookingDetails tfc left join tblflat tf on tf.FlatID=tfc.FlatID WHERE FlatName = @Flatname)
    BEGIN
        -- Check if flat name and MPIN match
        IF EXISTS (SELECT 1 FROM tblFlatCustomerBookingDetails tfc left join tblflat tf on tf.FlatID=tfc.FlatID WHERE FlatName = @Flatname AND MPIN = @Mpin)
        BEGIN
            SELECT 'Success' AS Result
        END
        ELSE
        BEGIN
            SELECT 'Invalid MPIN' AS Result
        END
    END
    ELSE
    BEGIN
        SELECT 'Flat name does not exist' AS Result
    END
END
GO
/****** Object:  StoredProcedure [dbKey2h].[CheckFlatCostDetailsExistAllCostLabelParameterByFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[CheckFlatCostDetailsExistAllCostLabelParameterByFlatID]
@FlatID int
As
Begin
SELECT 
    CASE 
        WHEN NOT EXISTS (
            SELECT CostLabelID
            FROM (
                SELECT CostLabelID
                FROM tblProjectCostLabels
                WHERE Parameter IN ('A', 'B', 'G', 'D', 'F')
            ) AS TempCostLabels
            EXCEPT
            SELECT CostLabelID
            FROM tblFlatCostDetails
            WHERE FlatID = @FlatID
        ) THEN 1 
        ELSE 0 
    END AS IsMatch;
End
GO
/****** Object:  StoredProcedure [dbKey2h].[CheckRecordExistsFlatCustomerKYCDocsByFlatIDandAddedBy]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[CheckRecordExistsFlatCustomerKYCDocsByFlatIDandAddedBy]
    @FlatID INT,
    @AddedBy nvarchar(50)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM tblFlatCustomerKYCDocs WHERE FlatID = @FlatID and AddedBy=@AddedBy)
        SELECT CAST(1 AS BIT) AS ExistsFlag -- True
    ELSE
        SELECT CAST(0 AS BIT) AS ExistsFlag -- False
END
GO
/****** Object:  StoredProcedure [dbKey2h].[ClearNotificationsbyFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ClearNotificationsbyFlatID]
@FlatID int 
As
Begin

    update tblFlatNotifications set ListStatus=0 where FlatID=@FlatID 
End
GO
/****** Object:  StoredProcedure [dbKey2h].[Clientdashboardissues]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[Clientdashboardissues]
@Pagename NVARCHAR(512) ,
@MethodOrFunctionname NVARCHAR(512) , 
@ErrrMsg NVARCHAR(MAX), 
@IssueStatus NVARCHAR(100), 
@Addeddate DATETIME
As
Begin
Insert into tblClientDashboardIssues (Pagename,MethodOrFunctionname,ErrrMsg,IssueStatus,Addeddate)  Values(@Pagename,@MethodOrFunctionname,@ErrrMsg,@IssueStatus,@Addeddate)
End
GO
/****** Object:  StoredProcedure [dbKey2h].[CustomerPaymentSchedule]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[CustomerPaymentSchedule]
    @FlatID INT,
    @AddedBy NVARCHAR(50)
AS
BEGIN
    -- Check if the FlatID and AddedBy exist in tblFlatDetails
    IF EXISTS (
        SELECT 1
        FROM tblFlatCustomerTransaction
        WHERE FlatID = @FlatID AND PaymentUpdatedBy = @AddedBy
    )
    BEGIN
        -- Record exists, do not delete
        RETURN 0
    END
    ELSE
    BEGIN
        DELETE FROM tblCustomerPaymentSchedule
        WHERE FlatID = @FlatID AND AddedBy = @AddedBy

         DELETE FROM tblFlatCustomerDemands
        WHERE FlatID = @FlatID AND AddedBy = @AddedBy

        -- Return 1 after successful deletion
        RETURN 1
    END
END
GO
/****** Object:  StoredProcedure [dbKey2h].[CustomerPaymentShedule]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbKey2h].[CustomerPaymentShedule]
@FlatID int,
@AddedBy nvarchar(50)
As
Begin

Delete tblCustomerPaymentSchedule  where FlatID=@FlatID and AddedBy=@AddedBy

END
GO
/****** Object:  StoredProcedure [dbKey2h].[CustomisationWorkApprovalAlreadyExist]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[CustomisationWorkApprovalAlreadyExist]
    @CWAID INT = NULL,         -- NULL means inserting a new record
    @FlatID NVARCHAR(50),
    @CustomizationWork NVARCHAR(256),
    @AddedBy NVARCHAR(60)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT COUNT(1)
    FROM tblCustomisationWorkApproval
    WHERE FlatID = @FlatID  
      AND AddedBy = @AddedBy  
      AND UPPER(CustomizationWork) = UPPER(@CustomizationWork)
      AND (@CWAID IS NULL OR CWAID != @CWAID); -- Exclude the current record during update
END;
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteAllCustomisationCustomisationDemandsByFlatIDAndAddedBy]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[DeleteAllCustomisationCustomisationDemandsByFlatIDAndAddedBy]
    @FlatID INT,
    @AddedBy nvarchar(80)
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM tblFlatCustomisationDemands WHERE FlatID = @FlatID AND AddedBy=@AddedBy;
    DELETE FROM tblFlatCustomisationTransaction WHERE FlatID = @FlatID 

END;
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteAllCustomisationTransactionByFlatIDAndAddedBy]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[DeleteAllCustomisationTransactionByFlatIDAndAddedBy]
    @FlatID INT,
    @AddedBy nvarchar(80)
AS
BEGIN
    SET NOCOUNT ON;
        DELETE FROM tblFlatCustomisationTransaction WHERE FlatID = @FlatID 
END;
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteAllCustomisationWorkApprovalByFlatIDAndAddedBy]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[DeleteAllCustomisationWorkApprovalByFlatIDAndAddedBy]
    @FlatID INT,
    @AddedBy nvarchar(80)
AS
BEGIN
    SET NOCOUNT ON;

     DELETE FROM tblCustomisationWorkApproval 
    WHERE FlatID = CAST(@FlatID AS NVARCHAR(60)) AND AddedBy=@AddedBy;
    DELETE FROM tblFlatCustomisationWorks WHERE FlatID = @FlatID AND AddedBy=@AddedBy;
    DELETE FROM tblFlatCustomisationDemands WHERE FlatID = @FlatID AND AddedBy=@AddedBy;
    DELETE FROM tblFlatCustomisationTransaction WHERE FlatID = @FlatID
END;
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteAllCustomisationWorksByFlatIDAndAddedBy]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[DeleteAllCustomisationWorksByFlatIDAndAddedBy]
    @FlatID INT,
    @AddedBy nvarchar(80)
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM tblFlatCustomisationWorks WHERE FlatID = @FlatID AND AddedBy=@AddedBy;
    DELETE FROM tblFlatCustomisationDemands WHERE FlatID = @FlatID AND AddedBy=@AddedBy;
    DELETE FROM tblFlatCustomisationTransaction WHERE FlatID = @FlatID
END;
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteAllFlatCostDetails]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    Create Procedure [dbKey2h].[DeleteAllFlatCostDetails]
     @FlatID int  
    As
    Begin
    Delete  tblFlatCostDetails where FlatID=@FlatID  
    End
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteAllFlatQualityReports]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    Create Procedure [dbKey2h].[DeleteAllFlatQualityReports]
     @FlatID int  
    As
    Begin
    Delete  tblFlatQualityReports where FlatID=@FlatID  
    End
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteAmenitiesByProjectID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[DeleteAmenitiesByProjectID]
@ProjectID int ,
@AddedBy nvarchar(60)
As
Begin
Delete tblProjectAmenities where ProjectID=@ProjectID and AddedBy=@AddedBy
End
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteBlockbyID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[DeleteBlockbyID]
  
   @BlockID INT = NULL 
as
begin
Delete tblProjectBlock where BlockID=@BlockID
end
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteBlockFloorPlanbyBlockID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE procedure [dbKey2h].[DeleteBlockFloorPlanbyBlockID]    
@BlockID int     
As    
Begin     
delete  tblBlockFloorPlan where BlockID=@BlockID      
End 
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteBlockFloorPlanbyBlockPlanID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[DeleteBlockFloorPlanbyBlockPlanID]    
@BlockFloorPlanID INT
As    
Begin     
delete tblBlockFloorPlan where BlockFloorPlanID=@BlockFloorPlanID   
End 
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteCustomerPaymentSchedule]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[DeleteCustomerPaymentSchedule]
    @FlatID INT,
    @AddedBy NVARCHAR(50)
AS
    BEGIN
        DELETE FROM tblCustomerPaymentSchedule
        WHERE FlatID = @FlatID AND AddedBy = @AddedBy
         DELETE FROM tblFlatCustomerDemands
        WHERE FlatID = @FlatID AND AddedBy = @AddedBy
END
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteCustomisationWorkApprovalByCWAIDandaddedby]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[DeleteCustomisationWorkApprovalByCWAIDandaddedby]
@CWAID int,
@AddedBy nvarchar(60)
As
Begin
Delete tblCustomisationWorkApproval where CWAID=@CWAID and AddedBy=@AddedBy
End
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteCustomizationTransaction]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create PROCEDURE [dbKey2h].[DeleteCustomizationTransaction]  
    @FlatID INT  
AS  
BEGIN  
    IF EXISTS (SELECT 1 FROM tblFlatCustomisationWorks WHERE FlatID = @FlatID)
    BEGIN
        DELETE FROM tblFlatCustomisationWorks WHERE FlatID = @FlatID;
    END

    IF EXISTS (SELECT 1 FROM tblFlatCustomisationDemands WHERE FlatID = @FlatID)
    BEGIN
        DELETE FROM tblFlatCustomisationDemands WHERE FlatID = @FlatID;
    END

    IF EXISTS (SELECT 1 FROM tblFlatCustomisationTransaction WHERE FlatID = @FlatID)
    BEGIN
        DELETE FROM tblFlatCustomisationTransaction WHERE FlatID = @FlatID;
    END
END;
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteFlatBookingCustomerDetailsBYFlatcustomerID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbKey2h].[DeleteFlatBookingCustomerDetailsBYFlatcustomerID]
@FlatCustomerID Int
As
Begin
Delete tblFlatCustomerBookingDetails where FlatCustomerID=@FlatCustomerID
End
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteFlatbyflatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[DeleteFlatbyflatID]
@FlatID int
As
Begin
Delete tblflat where FlatID=@FlatID

End
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteFlatCostDetails]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
     CREATE Procedure [dbKey2h].[DeleteFlatCostDetails]
        @CostID int,
         @FlatID int
        As
        Begin
        Delete tblFlatCostDetails where CostLabelID=@CostID and FlatID=@FlatID
        End
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteFlatCustomerDemandsByDemandID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[DeleteFlatCustomerDemandsByDemandID]
   @DemandID int
  as
  Begin
  Delete tblFlatCustomerDemands where DemandID= @DemandID
  End
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteFlatCustomerTransaction]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[DeleteFlatCustomerTransaction]  
    @FlatID INT  
AS  
BEGIN  
    -- Delete from tblFlatCostDetails if FlatID exists
    IF EXISTS (SELECT 1 FROM tblFlatCostDetails WHERE FlatID = @FlatID)
    BEGIN
        DELETE FROM tblFlatCostDetails WHERE FlatID = @FlatID;
    END

    -- Delete from tblCustomerPaymentSchedule if FlatID exists
    IF EXISTS (SELECT 1 FROM tblCustomerPaymentSchedule WHERE FlatID = @FlatID)
    BEGIN
        DELETE FROM tblCustomerPaymentSchedule WHERE FlatID = @FlatID;
    END

    -- Delete from tblFlatCustomerDemands if FlatID exists
    IF EXISTS (SELECT 1 FROM tblFlatCustomerDemands WHERE FlatID = @FlatID)
    BEGIN
        DELETE FROM tblFlatCustomerDemands WHERE FlatID = @FlatID;
    END

    -- Delete from tblFlatCustomerTransaction if FlatID exists
    IF EXISTS (SELECT 1 FROM tblFlatCustomerTransaction WHERE FlatID = @FlatID)
    BEGIN
        DELETE FROM tblFlatCustomerTransaction WHERE FlatID = @FlatID;
    END
END;
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteFlatCustomisationDemands]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbKey2h].[DeleteFlatCustomisationDemands]
        @CDemandID int,  
        @FlatID int  
        As  
        Begin  
        Delete tblFlatCustomisationDemands where CDemandID=@CDemandID and FlatID=@FlatID  
        End
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteFlatCustomizationWorksTitle]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
        CREATE Procedure [dbKey2h].[DeleteFlatCustomizationWorksTitle]  
        @CWID int,  
         @FlatID int  
        As  
        Begin  
        Delete tblFlatCustomisationWorks where CWID=@CWID and FlatID=@FlatID  
        End
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteflatFloorPlanbyFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbKey2h].[DeleteflatFloorPlanbyFlatID]  
@FlatID int   
As  
Begin   
delete  tblFlatFloorPlan where FlatID=@FlatID    
End  
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteFlatFloorPlanbyFloorPlanID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[DeleteFlatFloorPlanbyFloorPlanID]  
@FlatFloorPlanID int
As  
Begin   
delete tblFlatFloorPlan where FlatFloorPlanID=@FlatFloorPlanID 
End  
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteFlatProgressByProgressID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[DeleteFlatProgressByProgressID]  
@FlatProgressID  int  
As  
Begin   
Delete tblProjectFlatProgressImage where FlatProgressID=@FlatProgressID 
Delete tblFlatProgress where FlatProgressID=@FlatProgressID
End
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteFlatprogressImagesByID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbKey2h].[DeleteFlatprogressImagesByID]  
@ID int  
As  
Begin  
 Delete tblProjectFlatProgressImage  where FlatProgressImageID=@ID  
ENd  
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteFlatQPbyQFID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbKey2h].[DeleteFlatQPbyQFID]    
@QFID int,
@AddedBy varchar(30)
As    
Begin      
delete tblFlatQualityReports where QFID=@QFID and AddedBy=@AddedBy   
End 
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteFlatQualityReports]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
     CREATE Procedure [dbKey2h].[DeleteFlatQualityReports]
        @QFID int,
         @FlatID int
        As
        Begin
        Delete tblFlatQualityReports where QFID=@QFID and FlatID=@FlatID
        End
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteIndivitualFlatCustomerTransaction]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[DeleteIndivitualFlatCustomerTransaction]
@TransactionID int
As
Begin
Delete tblFlatCustomerTransaction where TransactionID=@TransactionID
End
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteIndivitualFlatCustomizationTransaction]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[DeleteIndivitualFlatCustomizationTransaction]  
@CTID int  
As  
Begin  
Delete tblFlatCustomisationTransaction where CTID=@CTID 
End
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteKYCByDocID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[DeleteKYCByDocID]
@DocID int,
@AddedBy nvarchar(50)
As
Begin
delete tblFlatCustomerKYCDocs where DocID=@DocID and Addedby=@AddedBy
End
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteProjectAmenities]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[DeleteProjectAmenities]
@AID int,
@AddedBy nvarchar(256)
As
Begin
Delete tblProjectAmenities where AID=@AID and AddedBy=@AddedBy
End
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteProjectFloorPlanbyFloorPlanID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[DeleteProjectFloorPlanbyFloorPlanID]
@FloorPlanID int

As
Begin

delete tblFloorPlan where FloorPlanID=@FloorPlanID


End
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteProjectFloorPlanbyProjectID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[DeleteProjectFloorPlanbyProjectID]
@ProjectID int

As
Begin

delete tblFloorPlan where ProjectID=@ProjectID


End
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteProjectProgressByProgressID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[DeleteProjectProgressByProgressID]
@ProgressID int
As
Begin

Delete tblProjectProgressImage where ProgressID=@ProgressID
Delete tblProjectProgress where ProgressID=@ProgressID

End
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteProjectprogressImagesByID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[DeleteProjectprogressImagesByID]
@ID int

As
Begin
 Delete tblProjectProgressImage  where progressImageID=@ID
ENd
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteProjectQPbyFlatQPID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[DeleteProjectQPbyFlatQPID]
@QFID int

As
Begin

delete tblFlatQualityReports where QFID=@QFID


End
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteProjectQPbyProjectID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[DeleteProjectQPbyProjectID]
@ProjectID int

As
Begin

delete tblProjectQualityReports where ProjectID=@ProjectID


End
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteProjectQPbyQFID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[DeleteProjectQPbyQFID]  
@QFID int   
As  
Begin    
delete tblProjectQualityReports where QPID=@QFID   
End  
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteProjects]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[DeleteProjects]
@ProjectID int
as
Begin
Delete tblProjects where ProjectID=@ProjectID
End
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteReferContentbyReferScreenID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[DeleteReferContentbyReferScreenID]
@ReferScreenID int
As
Begin
Delete tblProjectReferScreen where ReferScreenID=@ReferScreenID

End
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteShedulepaymentstages]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbKey2h].[DeleteShedulepaymentstages]  
@PSID Int  
As  
Begin  
Delete tblFlatCustomerDemands Where PSID=@PSID  
Delete tblCustomerPaymentSchedule Where PSID=@PSID  
End  
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteSpecificationsbyProjectID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[DeleteSpecificationsbyProjectID]
  
   @ProjectID INT 
as
begin
Delete tblProjectSpecificationDetails where ProjectID=@ProjectID
end
GO
/****** Object:  StoredProcedure [dbKey2h].[DeleteWhatshappeningbyWHID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[DeleteWhatshappeningbyWHID]
@WHID int

As
Begin

delete tblProjectWhatsHappening where WHID=@WHID


End
GO
/****** Object:  StoredProcedure [dbKey2h].[DisableRMbyRMID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbKey2h].[DisableRMbyRMID]   
@RMID INT
AS  
BEGIN    
    update tblclientusers set UserStatus=0 where UserID=@RMID 
 

END


GO
/****** Object:  StoredProcedure [dbKey2h].[ExistCostLabelParameterFlatcostDetailsByCIDandAddedby]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ExistCostLabelParameterFlatcostDetailsByCIDandAddedby]
    @FlatID INT,  
    @AddedBy NVARCHAR(50) 
As
Begin
  SELECT Count(*)  
               FROM tblFlatCostDetails   
               WHERE FlatID = @FlatID   
                 AND AddedBy = @AddedBy   
                 AND CostLabelID IN ('1','3','6', '7', '8')
End
GO
/****** Object:  StoredProcedure [dbKey2h].[existworkapprovalbyid]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[existworkapprovalbyid]
@ID int,
@Addedby nvarchar(50)
as
Begin
SELECT 
    CASE 
        WHEN EXISTS (
           SELECT 1
FROM tblCustomisationWorkApproval ta
INNER JOIN tblFlatCustomisationWorks tw ON ta.CWAID = tw.WorkTitle 
INNER JOIN tblFlatCustomisationDemands tD ON tw.CWID = tD.CWID
INNER JOIN tblFlatCustomisationTransaction tr ON tD.CDemandID = tr.CDemandID
WHERE ta.CWAID = @ID and tA.AddedBy = @AddedBy  
        ) 
        THEN CAST(1 AS BIT)  -- True
        ELSE CAST(0 AS BIT)  -- False
    END AS CWAIDExists

End
GO
/****** Object:  StoredProcedure [dbKey2h].[ExistworkbyID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[ExistworkbyID]
@ID nvarchar(50),
@AddedBy nvarchar(60) 
AS
Begin
Select count(*) as ExistCount from tblFlatCustomisationWorks where WorkTitle=@ID and AddedBy=@AddedBy
End
GO
/****** Object:  StoredProcedure [dbKey2h].[FlatAlreadyExist]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[FlatAlreadyExist]     
    
   @ProjectID INT = NULL  ,   
   @BlockID INT = NULL     
     
as    
begin    
Select * from tblflat where  BlockID = @BlockID and  ProjectID=@ProjectID  
end 
GO
/****** Object:  StoredProcedure [dbKey2h].[FlatCountGetByPIDandABy]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbKey2h].[FlatCountGetByPIDandABy]
@ProjectID int,
@BlockID int,
@AddedBy nvarchar(50)
As
Begin
select Count(FlatID) from tblFlat where ProjectID=@ProjectID and BlockID=@BlockID and AddedBy=@AddedBy
End
GO
/****** Object:  StoredProcedure [dbKey2h].[GetCustomerDetailsByFlatLoginID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[GetCustomerDetailsByFlatLoginID]
    @Flatloginid NVARCHAR(256)
AS
BEGIN
    SELECT 
        c.ApplicantFirstName,
        c.ApplicantLastName,
        f.FlatID,
        f.ProjectID,
        f.FlatName,
        tp.ClientID,
        tp.ProjectName, 
        tp.NotificationGroup,
        c.FlatLoginID
    FROM tblFlat f
    INNER JOIN tblFlatCustomerBookingDetails c ON f.FlatID = c.FlatID left join tblProjects tp on f.ProjectID = tp.ProjectID
    WHERE FlatLoginID = @Flatloginid;
END
GO
/****** Object:  StoredProcedure [dbKey2h].[GetCustomerDetailsByFlatName]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[GetCustomerDetailsByFlatName]
    @Flatname NVARCHAR(256)
AS
BEGIN
    SELECT 
        c.ApplicantFirstName,
        c.ApplicantLastName,
        f.FlatID,
        f.ProjectID,
        f.FlatName,
        tp.ClientID,
        tp.ProjectName
    FROM tblFlat f
    INNER JOIN tblFlatCustomerBookingDetails c ON f.FlatID = c.FlatID left join tblProjects tp on f.ProjectID = tp.ProjectID
    WHERE f.FlatName = @FlatName;
END
GO
/****** Object:  StoredProcedure [dbKey2h].[GetFlatCostDetailsByFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE Procedure [dbKey2h].[GetFlatCostDetailsByFlatID]
        @FlatID int
        As
        Begin
        select tblcd.*,tblc.* from tblFlatCostDetails tblcd left join tblProjectCostLabels tblc on tblc.CostlabelID = tblcd.CostLabelID Where FlatID=@FlatID
        End
GO
/****** Object:  StoredProcedure [dbKey2h].[GetNotificationsbyFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[GetNotificationsbyFlatID]
@FlatID int 
As
Begin

    SELECT TOP 20 * 
    FROM tblFlatNotifications where FlatID=@FlatID
    ORDER BY CreatedDate DESC


End
GO
/****** Object:  StoredProcedure [dbKey2h].[GetParameterCostofFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[GetParameterCostofFlatID]  
@FlatID int,  @Parameter varchar
As   
Begin   
select Cost from tblFlatCostDetails tblcd left join tblProjectCostLabels tblc on tblc.CostlabelID = tblcd.CostLabelID Where FlatID=@FlatID and Parameter=@Parameter 

End        
GO
/****** Object:  StoredProcedure [dbKey2h].[GetPayScheduleBalanceAmount]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[GetPayScheduleBalanceAmount]
    @FlatID INT
AS
BEGIN
    SET NOCOUNT ON;

SELECT 
        ISNULL(
            (SELECT SUM(fcd.Cost) 
             FROM tblFlatCostDetails fcd
             JOIN tblProjectCostLabels pcl 
               ON fcd.CostLabelID = pcl.CostLabelID
             WHERE fcd.FlatID = @FlatID 
               AND pcl.Parameter IN ('a', 'b', 'd', 'f', 'g','h','i','j')
            ), 0)
        - 
        ISNULL(
            (SELECT SUM(fct.PaidAmount) 
             FROM tblFlatCustomerTransaction fct
             WHERE fct.FlatID = @FlatID 
               AND fct.PaymentStatus = 'Paid'
            ), 0) AS Balance;
       
END;
GO
/****** Object:  StoredProcedure [dbKey2h].[GetPaySchedulePaidAmount]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[GetPaySchedulePaidAmount]
    @FlatID INT
AS
BEGIN
    SET NOCOUNT ON;


	select	 ISNULL
        (SUM(fct.PaidAmount),0) AS PaidAmount 
         FROM tblFlatCustomerTransaction fct
         WHERE fct.FlatID = @FlatID
           AND fct.PaymentStatus = 'Paid'
       
END;
GO
/****** Object:  StoredProcedure [dbKey2h].[GetPayScheduleTotalAmount]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[GetPayScheduleTotalAmount]
    @FlatID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        ISNULL(SUM(fcd.Cost), 0) AS TotalAmount
    FROM tblFlatCostDetails fcd
    JOIN tblProjectCostLabels pcl 
        ON fcd.CostLabelID = pcl.CostLabelID 
    WHERE fcd.FlatID = @FlatID  
        AND pcl.Parameter IN ('a', 'b', 'd', 'f', 'g','h','i','j');
END;
GO
/****** Object:  StoredProcedure [dbKey2h].[GetPhoneNumberByFlatName]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE Procedure [dbKey2h].[GetPhoneNumberByFlatName]
        @FlatName varchar(20)
        As
        Begin
SELECT WhatsappNumber FROM tblFlatCustomerBookingDetails WHERE FlatLoginID =@FlatName
End
GO
/****** Object:  StoredProcedure [dbKey2h].[InsertTokenForFlatLoginID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[InsertTokenForFlatLoginID]
    @Flatloginid NVARCHAR(256),
    @TokenID NVARCHAR(256)
AS
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM tblFlat tf
        INNER JOIN tblFlatCustomerBookingDetails tfc ON tf.FlatID = tfc.FlatID 
        WHERE FlatLoginID = @Flatloginid
    )
    BEGIN
        UPDATE tfc
        SET 
            tfc.TokenID = @TokenID,
            tfc.TokenIDDateTime = GETDATE() -- Save current datetime
        FROM tblFlatCustomerBookingDetails tfc
        INNER JOIN tblFlat tf ON tf.FlatID = tfc.FlatID
        WHERE FlatLoginID = @Flatloginid;
    END
    ELSE
    BEGIN
        RETURN -1; -- Indicates flatname does not exist
    END
END;

GO
/****** Object:  StoredProcedure [dbKey2h].[InsertTokenForFlatName]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[InsertTokenForFlatName]
    @Flatname NVARCHAR(256),
    @TokenID NVARCHAR(256)
AS
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM tblFlat tf
        INNER JOIN tblFlatCustomerBookingDetails tfc ON tf.FlatID = tfc.FlatID 
        WHERE tf.FlatName = @Flatname
    )
    BEGIN
        UPDATE tfc
        SET 
            tfc.TokenID = @TokenID,
            tfc.TokenIDDateTime = GETDATE() -- Save current datetime
        FROM tblFlatCustomerBookingDetails tfc
        INNER JOIN tblFlat tf ON tf.FlatID = tfc.FlatID
        WHERE tf.FlatName = @Flatname;
    END
    ELSE
    BEGIN
        RETURN -1; -- Indicates flatname does not exist
    END
END;

GO
/****** Object:  StoredProcedure [dbKey2h].[ProjectBlockCountGetByPIDandAby]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ProjectBlockCountGetByPIDandAby]
@ProjectID int,
@AddedBy nvarchar(50)
As
Begin
select BlockCount from tblProjects where ProjectID=@ProjectID and AddedBy=@AddedBy
End
GO
/****** Object:  StoredProcedure [dbKey2h].[SaveMPINForFlatLoginID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[SaveMPINForFlatLoginID]
    @Flatloginid NVARCHAR(256),
    @MPIN NVARCHAR(10)
AS
BEGIN
    BEGIN
        UPDATE tfc 
        SET MPIN = @MPIN, MPINCreatedDate = GETDATE()
        FROM tblFlatCustomerBookingDetails tfc
        INNER JOIN tblFlat tf ON tf.FlatID = tfc.FlatID
        WHERE FlatLoginID =@Flatloginid;
    END
    
END
GO
/****** Object:  StoredProcedure [dbKey2h].[SaveMPINForFlatName]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[SaveMPINForFlatName]
    @FlatName NVARCHAR(256),
    @MPIN NVARCHAR(10)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM tblFlat WHERE FlatName = @FlatName)
    BEGIN
        UPDATE tfc 
        SET MPIN = @MPIN, MPINCreatedDate = GETDATE()
        FROM tblFlatCustomerBookingDetails tfc
        INNER JOIN tblFlat tf ON tf.FlatID = tfc.FlatID
        WHERE FlatName = @FlatName;
    END
    ELSE
    BEGIN
        RETURN -1; -- Flat name does not exist
    END
END
GO
/****** Object:  StoredProcedure [dbKey2h].[SaveOTPForFlatLoginID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[SaveOTPForFlatLoginID]

    @Flatloginid NVARCHAR(256),
    @OTP NVARCHAR(10)
AS
BEGIN
  
        UPDATE tfc
        SET OTP = @OTP, OTPSentDate = GETDATE()
        FROM tblFlatCustomerBookingDetails tfc
        WHERE FlatLoginID = @Flatloginid;
    
    
END
GO
/****** Object:  StoredProcedure [dbKey2h].[SaveOTPForFlatName]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[SaveOTPForFlatName]

    @FlatName NVARCHAR(256),
    @OTP NVARCHAR(10)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM tblFlat WHERE FlatName = @FlatName)
    BEGIN
         UPDATE tfc
        SET OTP = @OTP, OTPSentDate = GETDATE()
        FROM tblFlatCustomerBookingDetails tfc
        INNER JOIN tblFlat tf ON tf.FlatID = tfc.FlatID
        WHERE tf.FlatName = @FlatName;
    END
    ELSE
    BEGIN
        RETURN -1; -- Indicates flatname does not exist
    END
END
GO
/****** Object:  StoredProcedure [dbKey2h].[SPUpdateprojects]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[SPUpdateprojects]
@ProjectID int,
@ClientID int,
@ProjectName varchar(200),
@ProjectLogo varchar(200),
@Location varchar(256),
@Address varchar(256),
@State int,
@City int,
@PostalCode int,
@GoogleMapLink nvarchar(200),
@BlockCount int,
@FlatCount int,
@LandArea varchar(256),
@RERANumber nvarchar(512),
@ProjectStatus int,
@ProjectDisplayStatus bit,
@ProjectStatusPercentage int,
@SplashScreenImage nvarchar(512),
@LocationMap varchar(256),
@BankName varchar(256),
@AccountName varchar(256),
@AccountNumber nvarchar(50),
@IFSCNumber varchar(256),
@BranchName varchar(256),
@UpdatedBy varchar(256),
@UpdatedDate datetime
As
Begin
Update tblProjects 
set
ClientID=@ClientID,
ProjectName=@ProjectName
,ProjectLogo=@ProjectLogo,
Location=@Location,
Address=@Address,
State=@State,
City=@City,
PostalCode=@PostalCode,
GoogleMapLink=@GoogleMapLink,
BlockCount=@BlockCount,
FlatCount=@FlatCount,
LandArea=@LandArea,
RERANumber=@RERANumber,
ProjectStatus=@ProjectStatus,
ProjectDisplayStatus=@ProjectDisplayStatus,
ProjectStatusPercentage=@ProjectStatusPercentage,
SplashScreenImage=@SplashScreenImage,
LocationMap=@LocationMap,
BankName=@BankName,
AccountName=@AccountName,
AccountNumber=@AccountNumber,
IFSCNumber=@IFSCNumber,
BranchName=@BranchName,
UpdatedBy=@UpdatedBy,UpdatedDate=@UpdatedDate  where ProjectID=@ProjectID
End

GO
/****** Object:  StoredProcedure [dbKey2h].[SpViewAllProjects]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[SpViewAllProjects]
@ProjectID int
As
Begin
Select * from tblProjects where ProjectID=@ProjectID
End
GO
/****** Object:  StoredProcedure [dbKey2h].[UpdateCustomersBasicDetails]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[UpdateCustomersBasicDetails]
@Gender varchar(50),
@EmailID Varchar(255),
@Mobilenumber varchar(20),
@WhatsappNumber varchar(20),
@UpdatedBy  varchar(255),
@UpdatedDate Datetime,
@CustomerID INT
as
Begin
Update tblCustomers set Gender = @Gender,EmailID=@EmailID,Mobilenumber=@Mobilenumber,WhatsappNumber=@WhatsappNumber,UpdatedBy=@UpdatedBy,UpdatedDate=@UpdatedDate where CustomerID=@CustomerID
End
GO
/****** Object:  StoredProcedure [dbKey2h].[UpdatedCustomisationWorkApproval]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[UpdatedCustomisationWorkApproval]
@CWAID int,
@FlatID nvarchar(50),  
@CustomizationWork nvarchar(256),  
@CustomizationDetails nvarchar(256),  
@ApprovalStatus nvarchar(80), 
@Remarks nvarchar(max),  
@UpdateDate Datetime,  
@UpdatedBy nvarchar(60),  
@Amount nvarchar(60),
@ClientApprovedstatus Nvarchar(60),
@ApprovedBy Nvarchar(60)
As
Begin
Update tblCustomisationWorkApproval set FlatID=@FlatID,CustomizationWork=@CustomizationWork,CustomizationDetails=@CustomizationDetails,ClientApprovedstatus=@ClientApprovedstatus, ApprovalStatus=@ApprovalStatus,Remarks=@Remarks,Amount=@Amount,@UpdateDate=@UpdateDate,UpdatedBy=@UpdatedBy where CWAID=@CWAID
End
GO
/****** Object:  StoredProcedure [dbKey2h].[UpdateFlatCost]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
     

        CREATE Procedure [dbKey2h].[UpdateFlatCost]       
        @CostLabelID int,
        @FlatID int,
        @Cost int,
        @UpdatedBy nvarchar(512),
        @UpdatedDate  datetime
        As
        Begin
        update  tblFlatCostDetails set CostLabelID=@CostLabelID,Cost=@Cost,UpdatedBy=@UpdatedBy,UpdatedDate=@UpdatedDate where CostLabelID=@CostLabelID  and  FlatID= @FlatID 
        End
GO
/****** Object:  StoredProcedure [dbKey2h].[UpdateFlatCostDetails]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
     CREATE Procedure [dbKey2h].[UpdateFlatCostDetails]  
        @CostID int,
        @BlockID Int,
        @FlatID int,  
        @CostLabelID int,  
        @Cost int,  
        @Status Bit,  
        @ProjectID int,  
        @UpdatedBy nvarchar(512),  
        @UpdatedDate  datetime  
        As  
        Begin  
       update  tblFlatCostDetails set FlatID=@FlatID,BlockID=@BlockID,CostLabelID=@CostLabelID,Cost=@Cost,Status=@Status,ProjectID=@ProjectID,UpdatedBy=@UpdatedBy,UpdatedDate=@UpdatedDate where CostID=@CostID   
        End  
GO
/****** Object:  StoredProcedure [dbKey2h].[UpdateFlatCustomerBookingDetails]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[UpdateFlatCustomerBookingDetails]      
      
@FlatCustomerID int,      
@CustomerID int,      
@ProjectID int,      
@BlockID int,      
@FlatID int,      
@ApplicantFirstName varchar(255),      
@ApplicantLastName varchar(255),      
@CoapplicantFirstName varchar(255),      
@CoapplicantLastName varchar(255),      
@Gender varchar(50),      
@EmailID varchar(255),      
@Mobilenumber1 varchar(20),      
@Mobilenumber2 varchar(20),      
@FatherorSpouseName varchar(255),      
@DoB datetime,      
@WhatsappNumber varchar(255),      
@Profession varchar(255),      
@CompanyName varchar(255),      
@Designation varchar(255),      
@CurrentAddress varchar(500),      
@PermanentAddress varchar(500),      
@ResidentialStatus varchar(50),      
@CoapplicantRelationship varchar(255),      
@CityID int,      
@StateID int,      
@Pincode int,      
@Reference1 varchar(255),      
@Reference2 varchar(255),      
@LeadSource int,      
@LoanTakenStatus Bit,      
@BankName nvarchar(255),      
@ApplicantPhoto nvarchar(500),      
@ApplicantPAN nvarchar(50),      
@ApplicantAadhar nvarchar(50),      
@CoApplicantPhoto nvarchar(500),      
@CoApplicantPAN nvarchar(50),      
@CoApplicantAadhar nvarchar(50),    
@CoaGender varchar(50),  
@CoaEmailID varchar(255),  
@CoaMobilenumber1  Varchar(20),  
@CoaMobilenumber2 Varchar(20),  
@CoaWhatsappNumber Varchar(20),  
@CoaAddress varchar(500),  
@CoaResidentialStatus varchar(50),  
@CoaStateID int,  
@CoaCityID int,  
@CoaPinCode int,  
@CoDOB Datetime,  
@PoAName varchar(255),      
@PoAAddress varchar(500),      
@PoAPAN varchar(50),      
@PoAAdhar varchar(50),      
@PoADOB datetime,      
@CRMID int,      
@CustomerLoginStatus Bit,      
@BookingDate Datetime,      
@Amountpaid int,      
@PaymentMode Int,      
@Bookingknowledgement nvarchar(255),      
@CarparkAllocated bit,      
@NumberofSlots int,      
@Allottedcarparkslotnumber nvarchar(255),      
@Registrationcharges int,      
@RegistrationDate Datetime,      
@RegistrationOffice nvarchar(225),      
@ReferedBy nvarchar(80),      
@Updateddate Datetime,      
@UpdatedBy varchar(50)      
As      
Begin      
Update tblFlatCustomerBookingDetails set       
ProjectID=@ProjectID,      
BlockID=@BlockID,      
FlatID=@FlatID,      
ApplicantFirstName=@ApplicantFirstName,      
ApplicantLastName =@ApplicantLastName,      
CoapplicantFirstName=@CoapplicantFirstName,      
CoapplicantLastName=@CoapplicantLastName,      
Gender=@Gender,      
EmailID=@EmailID,      
Mobilenumber1=@Mobilenumber1,      
Mobilenumber2=@Mobilenumber2,      
FatherorSpouseName=@FatherorSpouseName,      
DoB=@DoB,      
CoDOB=@CoDOB,  
WhatsappNumber=@WhatsappNumber,      
Profession=@Profession,      
CompanyName=@CompanyName,      
Designation=@Designation,      
CurrentAddress=@CurrentAddress,      
PermanentAddress=@PermanentAddress,      
ResidentialStatus=@ResidentialStatus,      
CoapplicantRelationship=@CoapplicantRelationship,      
CityID=@CityID,      
StateID=@StateID ,      
Pincode=@Pincode ,      
Reference1=@Reference1,      
Reference2=@Reference2,      
LeadSource=@LeadSource,      
LoanTakenStatus=@LoanTakenStatus,      
BankName=@BankName ,      
ApplicantPhoto=@ApplicantPhoto,      
ApplicantPAN=@ApplicantPAN ,      
ApplicantAadhar=@ApplicantAadhar ,      
CoApplicantPhoto=@CoApplicantPhoto ,      
CoApplicantPAN=@CoApplicantPAN ,      
CoApplicantAadhar=@CoApplicantAadhar ,      
PoAName=@PoAName,      
PoAAddress=@PoAAddress,      
PoAPAN=@PoAPAN,      
PoAAdhar=@PoAAdhar ,      
PoADOB=@PoADOB,      
CRMID=@CRMID,      
CustomerLoginStatus=@CustomerLoginStatus,      
BookingDate=@BookingDate,      
Amountpaid=@Amountpaid,      
PaymentMode=@PaymentMode,      
Bookingknowledgement=@Bookingknowledgement,      
CarparkAllocated=@CarparkAllocated ,      
NumberofSlots=@NumberofSlots ,      
Allottedcarparkslotnumber=@Allottedcarparkslotnumber,      
Registrationcharges=@Registrationcharges,      
RegistrationDate=@RegistrationDate,      
RegistrationOffice=@RegistrationOffice,    
ReferedBy=@ReferedBy,  
CoaGender =@CoaGender,  
CoaEmailID =@CoaEmailID,  
CoaMobilenumber1 =@CoaMobilenumber1  ,  
CoaMobilenumber2 =@CoaMobilenumber2 ,  
CoaWhatsappNumber =@CoaWhatsappNumber ,  
CoaAddress=@CoaAddress ,  
CoaResidentialStatus=@CoaResidentialStatus ,  
CoaStateID=@CoaStateID ,  
CoaCityID=@CoaCityID ,  
CoaPinCode=@CoaPinCode ,  
Updateddate=@Updateddate,      
CustomerID =@CustomerID ,    
UpdatedBy=@UpdatedBy  where  FlatCustomerID=@FlatCustomerID        
End      
GO
/****** Object:  StoredProcedure [dbKey2h].[UpdateFlatCustomerDemandsPDF]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[UpdateFlatCustomerDemandsPDF]
 @DemandID int,
 @PDFName nvarchar(512),
 @PaymentUpdatedBy nvarchar(512),
 @PaymentUpdatedDate datetime
 as
 Begin
 update  tblFlatCustomerDemands set PDFName=@PDFName,PaymentUpdatedBy=@PaymentUpdatedBy,PaymentUpdatedDate=@PaymentUpdatedDate where DemandID=@DemandID
 End
GO
/****** Object:  StoredProcedure [dbKey2h].[UpdateFlatCustomerKYCDocs]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[UpdateFlatCustomerKYCDocs]
@DocID int,
@FlatID int,
@ProjectID int,
@SaleDeedDraft nvarchar(512),
@SaleDeedFinal nvarchar(512),
@SaleAgreementDraft nvarchar(512),
@SaleAgreementFinal nvarchar(512),
@AllotmentLetter nvarchar(512),
@WelcomeLetter nvarchar(512),
@DemandLetter nvarchar(512),
@PaymentReceipt nvarchar(512),
@Bill nvarchar(512),
@PaymentSchedule nvarchar(512),
@EBCard nvarchar(512),
@HandingOverDocs nvarchar(512),
@CCUpdation nvarchar(512),
@NOCforHandover nvarchar(512),
@OtherDocuments nvarchar(512),
@BankDocuments nvarchar(512),
@UpdatedBy nvarchar(100),
@UpdatedDate DateTime
As
Begin
Update tblFlatCustomerKYCDocs set FlatID=@FlatID,ProjectID=@ProjectID,SaleDeedDraft=@SaleDeedDraft,SaleDeedFinal=@SaleDeedFinal,SaleAgreementDraft=@SaleAgreementDraft,SaleAgreementFinal=@SaleAgreementFinal,AllotmentLetter=@AllotmentLetter,WelcomeLetter=@WelcomeLetter,DemandLetter=@DemandLetter,PaymentReceipt=@PaymentReceipt,Bill=@Bill,PaymentSchedule=@PaymentSchedule,EBCard=@EBCard,HandingOverDocs=@HandingOverDocs,CCUpdation=@CCUpdation,NOCforHandover=@NOCforHandover,OtherDocuments=@OtherDocuments,BankDocuments=@BankDocuments,UpdatedBy=@UpdatedBy,UpdatedDate=@UpdatedDate where DocID=@DocID
End
GO
/****** Object:  StoredProcedure [dbKey2h].[UpdateFlatdetails]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbKey2h].[UpdateFlatdetails]
@FlatID int,
@BlockID int,
@ProjectID int,
@FlatName nvarchar(512),
@Facing varchar(256),
@UDS nvarchar(512),
@UnitType nvarchar(512),
@SaleableArea nvarchar(512),
@CarpetArea nvarchar(512),
@Balcony nvarchar(512),
@Wallarea nvarchar(512),
@CarparkingCount int,
@Carparkslot1 nvarchar(512),
@Carparkslot2 nvarchar(512),
@Carparkslot3 nvarchar(512),
@UpdatedBy nvarchar(512),
@UpdatedDate datetime,
@FlatStatus bit,
@Floor int
as
begin
update  tblflat  set ProjectID=@ProjectID,BlockID=@BlockID, FlatName=@FlatName,
Facing= @Facing,UDS=@UDS,UnitType=@UnitType,SaleableArea=@SaleableArea,
CarpetArea=@CarpetArea,Balcony=@Balcony,Wallarea=@Wallarea,CarparkingCount=@CarparkingCount,
Carparkslot1=@Carparkslot1,Carparkslot2=@Carparkslot2,Carparkslot3=@Carparkslot3,
UpdatedBy=@UpdatedBy,UpdatedDate=@UpdatedDate,FlatStatus=@FlatStatus,Floor=@Floor where FlatID=@FlatID
End
GO
/****** Object:  StoredProcedure [dbKey2h].[UpdateFlatFloorPlan]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[UpdateFlatFloorPlan]  
@FlatFloorPlanID int,  
@ProjectID int, 
@BlockID int,
@FlatID int,
@Title varchar(200),
@ImagePath nvarchar(200)   
As  
Begin   
update tblFlatFloorPlan set ProjectID=@ProjectID,BlockID=@BlockID,FlatID=@FlatID,Title=@Title, ImagePath=@ImagePath where FlatFloorPlanID=@FlatFloorPlanID    
End  
GO
/****** Object:  StoredProcedure [dbKey2h].[Updateflatprogress]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[Updateflatprogress]    
@FlatProgressID int,  
@ThumbnailImage nvarchar(512),     
@UpdatedBy nvarchar(512),    
@UpdatedDate datetime   
As    
Begin      
Update tblFlatProgress set ThumbnailImage=@ThumbnailImage,UpdatedBy=@UpdatedBy,UpdatedDate=@UpdatedDate where FlatProgressID=@FlatProgressID  
End
GO
/****** Object:  StoredProcedure [dbKey2h].[UpdateFlatQualityReport]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
     

        CREATE Procedure [dbKey2h].[UpdateFlatQualityReport]      
        @QFID INT, 
        @Title nvarchar(max),
        @FlatID int,
        @PDFName nvarchar(max),
        @UpdatedBy int,
        @UpdatedDate  datetime
        As
        Begin
        update  tblFlatQualityReports set PDFName=@PDFName,Title=@Title,UpdatedBy=@UpdatedBy,UpdatedDate=@UpdatedDate where QFID=@QFID  and  FlatID= @FlatID 
        End
GO
/****** Object:  StoredProcedure [dbKey2h].[UpdateFlatQualityReportDetails]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
     CREATE Procedure [dbKey2h].[UpdateFlatQualityReportDetails]
        @QFID int,
        @BlockID Int,
        @FlatID int,  
        @Title nvarchar(max),  
        @PDFName int,  
        @Status Bit,  
        @ProjectID int,  
        @UpdatedBy int,  
        @UpdatedDate  datetime  
        As  
        Begin  
       update  tblFlatQualityReports 
       set FlatID=@FlatID,BlockID=@BlockID,Title=@Title,PDFName=@PDFName,Status=@Status,ProjectID=@ProjectID,UpdatedBy=@UpdatedBy,UpdatedDate=@UpdatedDate 
       where QFID=@QFID   
        End  
GO
/****** Object:  StoredProcedure [dbKey2h].[UpdateNotificationsbyID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[UpdateNotificationsbyID]
@FNID INT
As
Begin

Update tblFlatNotifications set ReadStatus=1 where   FNID=@FNID


End
GO
/****** Object:  StoredProcedure [dbKey2h].[UpdateProjectBlock]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[UpdateProjectBlock]
@BlockID int,
@ProjectID int,
@BlockName varchar(256),
@BlockStatus bit,
@UpdatedBy varchar(256),
@UpdatedDate datetime
As
Begin
Update  tblProjectBlock set ProjectID=@ProjectID,BlockName=@BlockName,BlockStatus=@BlockStatus,UpdatedBy=@UpdatedBy,UpdatedDate=@UpdatedDate where BlockID=@BlockID
End
GO
/****** Object:  StoredProcedure [dbKey2h].[UpdateProjectCompletionStatus]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[UpdateProjectCompletionStatus]
@ProjectID Int,
@ProjectStatusPercentage int,
@AddedBy nvarchar(60),
@UpdatedDate datetime
As
Begin
Update tblProjects set  ProjectStatusPercentage=@ProjectStatusPercentage,UpdatedBy=@AddedBy,UpdatedDate=@UpdatedDate where ProjectID=@ProjectID and AddedBy=@AddedBy
END
GO
/****** Object:  StoredProcedure [dbKey2h].[UpdateProjectFloorPlan]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[UpdateProjectFloorPlan]
@FloorPlanID int,
@Title varchar(200),
@ImagePath nvarchar(200)

As
Begin

update tblFloorPlan set Title=@Title, ImagePath=@ImagePath where FloorPlanID=@FloorPlanID


End
GO
/****** Object:  StoredProcedure [dbKey2h].[UpdateProjectHomeScreen]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[UpdateProjectHomeScreen]
@ProjectID int,  
@BHK varchar(200),  
@Sqft varchar(200),    
@UpdatedBy varchar(256),  
@UpdatedDate datetime 
As
Begin
Update tblProjectHomeScreen set BHK=@BHK,SquareFeet=@Sqft,UpdatedBy=@UpdatedBy,UpdatedDate=@UpdatedDate where ProjectID=@ProjectID
End
GO
/****** Object:  StoredProcedure [dbKey2h].[UpdateProjectHomeScreenByProjectID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbKey2h].[UpdateProjectHomeScreenByProjectID]
@ProjectID int,
@HighlightImage1 nvarchar(512),
@HighlightImage2 nvarchar(512),
@HighlightImage3 nvarchar(512),
@HighlightImage4 nvarchar(512),
@HighlightImage5 nvarchar(512),
@Splacescreen nvarchar(512),
@Logo nvarchar(512),
@UpdatedDate Datetime,
@UpdatedBy nvarchar(60)
As
Begin
Update tblProjectHomeScreen set HighlightImage1=@HighlightImage1,HighlightImage2=@HighlightImage2,HighlightImage3=@HighlightImage3,HighlightImage4=@HighlightImage4,HighlightImage5=@HighlightImage5,Logo=@Logo,Splacescreen=@Splacescreen,UpdatedDate=@UpdatedDate,UpdatedBy=@UpdatedBy where ProjectID=@ProjectID
ENd
GO
/****** Object:  StoredProcedure [dbKey2h].[Updateprojectprogress]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbKey2h].[Updateprojectprogress]  
@ProgressID int,
@ThumbnailImage nvarchar(512),   
@UpdatedBy nvarchar(512),  
@UpdatedDate datetime 
As  
Begin    
Update tblProjectProgress set ThumbnailImage=@ThumbnailImage,UpdatedBy=@UpdatedBy,UpdatedDate=@UpdatedDate where ProgressID=@ProgressID
End
GO
/****** Object:  StoredProcedure [dbKey2h].[UpdateProjectprogressByID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[UpdateProjectprogressByID]
@ID int,
@ImageName nvarchar(512)
As
Begin
 Update tblProjectProgress set ThumbnailImage=@ImageName where ProgressID=@ID
ENd
GO
/****** Object:  StoredProcedure [dbKey2h].[UpdateProjectprogressImagesByID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[UpdateProjectprogressImagesByID]
@ID int,
@Content nvarchar(512),
@ImageName nvarchar(512)
As
Begin
 Update tblProjectProgressImage set ImageName=@ImageName,Content=@Content  where progressImageID=@ID
ENd
GO
/****** Object:  StoredProcedure [dbKey2h].[Updateprojects]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[Updateprojects]    
@ProjectID int,    
@ClientID int,    
@ProjectName varchar(200),    
@ProjectLogo varchar(200),    
@Location varchar(256),    
@Address varchar(256),    
@State int,    
@City int,    
@PostalCode int,    
@GoogleMapLink nvarchar(200),    
@BlockCount int,    
@FlatCount int,    
@LandArea varchar(256),    
@RERANumber nvarchar(512),    
@ProjectStatus int,    
@ProjectDisplayStatus bit,    
@ProjectStatusPercentage int,    
@SplashScreenImage nvarchar(512),    
@LocationMap varchar(256),    
@BankName varchar(256),    
@AccountName varchar(256),    
@AccountNumber nvarchar(50),    
@IFSCNumber varchar(256),    
@BranchName varchar(256),    
@Latitude nvarchar(512),  
@Longitude nvarchar(512),  
@UpdatedBy varchar(256),    
@UpdatedDate datetime    
As    
Begin    
Update tblProjects     
set    
ClientID=@ClientID,    
ProjectName=@ProjectName    
,ProjectLogo=@ProjectLogo,    
Location=@Location,    
Address=@Address,    
State=@State,    
City=@City,    
PostalCode=@PostalCode,    
GoogleMapLink=@GoogleMapLink,    
BlockCount=@BlockCount,    
FlatCount=@FlatCount,    
LandArea=@LandArea,    
RERANumber=@RERANumber,    
ProjectStatus=@ProjectStatus,    
ProjectDisplayStatus=@ProjectDisplayStatus,    
ProjectStatusPercentage=@ProjectStatusPercentage,    
SplashScreenImage=@SplashScreenImage,    
LocationMap=@LocationMap,    
BankName=@BankName,    
AccountName=@AccountName,    
AccountNumber=@AccountNumber,    
IFSCNumber=@IFSCNumber,    
BranchName=@BranchName,    
Longitude=@Longitude, 
Latitude=@Latitude,  
UpdatedBy=@UpdatedBy,UpdatedDate=@UpdatedDate  where ProjectID=@ProjectID    
End
GO
/****** Object:  StoredProcedure [dbKey2h].[Updateprojectsold]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[Updateprojectsold]
@ProjectID int,    
@ClientID int,    
@ProjectName varchar(200),    
@ProjectLogo varchar(200),    
@Location varchar(256),    
@Address varchar(256),    
@State int,    
@City int,    
@PostalCode int,    
@GoogleMapLink nvarchar(200),    
@BlockCount int,    
@FlatCount int,    
@LandArea varchar(256),    
@RERANumber nvarchar(512),    
@ProjectStatus int,    
@ProjectDisplayStatus bit,    
@ProjectStatusPercentage int,    
@SplashScreenImage nvarchar(512),    
@LocationMap varchar(256),    
@BankName varchar(256),    
@AccountName varchar(256),    
@AccountNumber nvarchar(50),    
@IFSCNumber varchar(256),    
@BranchName varchar(256),    
@Latitude nvarchar(512),  
@Longitude nvarchar(512),  
@UpdatedBy varchar(256),    
@UpdatedDate datetime    
As    
Begin    
Update tblProjects     
set    
ClientID=@ClientID,    
ProjectName=@ProjectName    
,ProjectLogo=@ProjectLogo,    
Location=@Location,    
Address=@Address,    
State=@State,    
City=@City,    
PostalCode=@PostalCode,    
GoogleMapLink=@GoogleMapLink,    
BlockCount=@BlockCount,    
FlatCount=@FlatCount,    
LandArea=@LandArea,    
RERANumber=@RERANumber,    
ProjectStatus=@ProjectStatus,    
ProjectDisplayStatus=@ProjectDisplayStatus,    
ProjectStatusPercentage=@ProjectStatusPercentage,    
SplashScreenImage=@SplashScreenImage,    
LocationMap=@LocationMap,    
BankName=@BankName,    
AccountName=@AccountName,    
AccountNumber=@AccountNumber,    
IFSCNumber=@IFSCNumber,    
BranchName=@BranchName,    
Longitude=@Longitude, 
Latitude=@Latitude,  
UpdatedBy=@UpdatedBy,UpdatedDate=@UpdatedDate  where ProjectID=@ProjectID    
End
GO
/****** Object:  StoredProcedure [dbKey2h].[UpdateReferScreenContent]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[UpdateReferScreenContent]
@ReferScreenID int,
@ProjectID int,
@Question nvarchar(MAX),
@MessageContent nvarchar(MAX),
@Content nvarchar(MAX),
@Image nvarchar(MAX)

as
begin

update tblProjectReferScreen set ProjectID=@ProjectID,Question=@Question,MessageContent=@MessageContent,Content=@Content,Image=@Image where ReferScreenID=@ReferScreenID

End
GO
/****** Object:  StoredProcedure [dbKey2h].[UpdateRMDetails]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[UpdateRMDetails]
@Username varchar(200),
@Name varchar(200),
@PhoneNumber varchar(256),
@Role varchar(256),
@Gender varchar(256),
@Salutation varchar(256),
@UserEmailID varchar(256),
@WhatsappNumber nvarchar(200),
@Photo varchar(256),
@UpdatedBy varchar(256),
@Password varchar(256),
@UserStatus BIT,
@UpdatedDate datetime,
@RMID Int

As
Begin

Update tblClientUsers set UserName=UserName,Name=@Name,PhoneNumber=@PhoneNumber,WhatsappNumber=@WhatsappNumber,Role=@Role,Gender=@Gender,Salutation=@Salutation,Password=@Password,UserEmailID=@UserEmailID,UserStatus=@UserStatus,Photo=@Photo,UpdatedBy=@UpdatedBy,UpdatedDate=@UpdatedDate where UserID=@RMID

End
GO
/****** Object:  StoredProcedure [dbKey2h].[UpdateWhatshappening]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[UpdateWhatshappening]
@WHID int,
@Content varchar(200)

As
Begin

update tblProjectWhatsHappening set Content=@Content where WHID=@WHID


End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewActiveprojects]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbKey2h].[ViewActiveprojects]    
as    
Begin    
select * from  tblProjects where ProjectDisplayStatus='1' order by ProjectName Asc  
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllAmenities]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[ViewAllAmenities]
@ProjectID INT,
@AddedBy nvarchar(30)
As
Begin
 select * from tblProjectAmenities where ProjectID=@ProjectID and AddedBy=@AddedBy
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllAmenitiesByFilter]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbKey2h].[ViewAllAmenitiesByFilter]   
    @ProjectID INT = NULL, 
    @AID Int ,
    @AddedBy nvarchar(60)
AS    
BEGIN    
    SET NOCOUNT ON;          
        
    DECLARE @SQL NVARCHAR(MAX);          
    DECLARE @ParameterDef NVARCHAR(MAX);          
         
    SET @ParameterDef = '@ProjectID INT,@AID Int,@AddedBy nvarchar(60)';          
       
    SET @SQL = '  
    WITH CTE AS (  
        SELECT   
            *,   
            ROW_NUMBER() OVER (PARTITION BY ProjectID ORDER BY AID) AS RowNum  
        FROM tblProjectAmenities  
    )  
    SELECT *  
    FROM CTE  
    WHERE RowNum = 1';   
             
    IF (@ProjectID IS NOT NULL and @ProjectID <>'')          
    BEGIN          
        SET @SQL = @SQL + ' AND ProjectID = @ProjectID';          
    END;                   
      IF (@AID IS NOT NULL and   @AID<> '')          
    BEGIN          
        SET @SQL = @SQL + ' AND AID = @AID';          
    END   
    IF (@AddedBy IS NOT NULL and   @AddedBy<> '')          
    BEGIN          
        SET @SQL = @SQL + ' AND AddedBy = @AddedBy';          
    END         
    SET @SQL = @SQL + ' ORDER BY AddedDate DESC';          
    EXEC sp_executesql @SQL,         
        @ParameterDef,         
        @ProjectID = @ProjectID,  
        @AddedBy=@AddedBy,
        @AID=@AID;  
END;  
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllBlock]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbKey2h].[ViewAllBlock]   
    @BlockID INT = NULL,  
    @ProjectID INT = NULL,  
    @BlockStatus BIT = NULL  -- Allow NULL for BlockStatus
AS  
BEGIN    
    SET NOCOUNT ON;    
 
    DECLARE @SQL NVARCHAR(MAX);    
    DECLARE @ParameterDef NVARCHAR(MAX);    
 
    SET @ParameterDef = '@ProjectID INT, @BlockStatus BIT, @BlockID INT';    
 
    -- Base query    
    SET @SQL = 'SELECT * FROM tblProjectBlock WHERE 1 = 1';    
 
    IF (@BlockID IS NOT NULL)    
    BEGIN    
        SET @SQL = @SQL + ' AND BlockID = @BlockID';    
    END    

    IF (@ProjectID IS NOT NULL)    
    BEGIN    
        SET @SQL = @SQL + ' AND ProjectID = @ProjectID';    
    END    
 
    IF (@BlockStatus IS NOT NULL)    
    BEGIN    
        SET @SQL = @SQL + ' AND BlockStatus = @BlockStatus';    
    END    
 
    SET @SQL = @SQL + ' ORDER BY AddedDate Desc';    
 
    EXEC sp_executesql @SQL,   
        @ParameterDef,   
        @ProjectID = @ProjectID,   
        @BlockStatus = @BlockStatus,
        @BlockID = @BlockID
END


GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllBroadcast]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbKey2h].[ViewAllBroadcast]   
    @ProjectID INT = NULL
AS  
BEGIN    
    SET NOCOUNT ON;    
 
    DECLARE @SQL NVARCHAR(MAX);    
    DECLARE @ParameterDef NVARCHAR(MAX);    
 
    SET @ParameterDef = '@ProjectID INT';    
 
    -- Base query    
    SET @SQL = 'SELECT * FROM tblBroadcasts WHERE 1 = 1';    
 
      

    IF (@ProjectID IS NOT NULL)    
    BEGIN    
        SET @SQL = @SQL + ' AND ProjectID = @ProjectID';    
    END    
   
 
    SET @SQL = @SQL + ' ORDER BY CreatedDate Desc';    
 
    EXEC sp_executesql @SQL,   
        @ParameterDef,   
        @ProjectID = @ProjectID
END


GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllCityByStateID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbKey2h].[ViewAllCityByStateID]
@StateID int
As
Begin
select * from  tblCity where StateID=@StateID and CityStatus='1'
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllCostpaymentdetails]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    CREATE PROCEDURE [dbKey2h].[ViewAllCostpaymentdetails]  
    @ProjectID NVARCHAR(50) = NULL,         
    @FlatID NVARCHAR(50) = NULL,                  
    @BlockID NVARCHAR(50) = NULL,
    @searchBy NVARCHAR(200) = NULL,
    @AddedBy NVARCHAR(50) = NULL
AS    
BEGIN    
    SELECT 
        b.ProjectID,        
        b.BlockID,            
        b.FlatID,             
        b.ApplicantFirstName, 
        b.ApplicantLastName,
        b.Mobilenumber1,
        b.AddedBy,
        CASE 
            WHEN EXISTS (SELECT 1 FROM tblFlatCostDetails c WHERE c.FlatID = b.FlatID) THEN 1 ELSE 0 
        END AS HasCostDetails,
        CASE 
            WHEN EXISTS (SELECT 1 FROM tblCustomerPaymentSchedule s WHERE s.FlatID = b.FlatID) THEN 1 ELSE 0 
        END AS HasPaymentSchedule,
        CASE 
            WHEN EXISTS (SELECT 1 FROM tblFlatCustomerDemands d WHERE d.FlatID = b.FlatID) THEN 1 ELSE 0 
        END AS HasDemands,
        CASE 
            WHEN EXISTS (SELECT 1 FROM tblFlatCustomerTransaction t WHERE t.FlatID = b.FlatID) THEN 1 ELSE 0 
        END AS HasTransactions
    FROM 
        tblFlatCustomerBookingDetails b
    WHERE 
        (@ProjectID IS NULL OR @ProjectID = '' OR b.ProjectID = @ProjectID) AND    
        (@FlatID IS NULL OR @FlatID = '' OR b.FlatID = @FlatID) AND    
        (@BlockID IS NULL OR @BlockID = '' OR b.BlockID = @BlockID) AND
        (
            @searchBy IS NULL OR @searchBy = '' OR 
            b.Mobilenumber1 LIKE @searchBy + '%' OR 
            b.ApplicantFirstName = @searchBy
        ) AND
        (@AddedBy IS NULL OR @AddedBy = '' OR b.AddedBy = @AddedBy);
END;
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllcustomerapprovalByID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbKey2h].[ViewAllcustomerapprovalByID]
@ID int
As
Begin
 Select * from tblCustomisationWorkApproval where CWAID=@ID
END
GO
/****** Object:  StoredProcedure [dbKey2h].[viewAllcustomerBYcustomerID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[viewAllcustomerBYcustomerID]
@CustomerID int
As
Begin
SELECT *FROM tblCustomers where CustomerID=@CustomerID
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllCustomerPaymentSchedule]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ViewAllCustomerPaymentSchedule] 
As
Begin
 Select * from tblCustomerPaymentSchedule   
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllCustomisationWorkApprovalByFlatIDandAddedBy]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ViewAllCustomisationWorkApprovalByFlatIDandAddedBy]
@FlatID nvarchar(50),
@AddedBy nvarchar(60)
As
Begin
Select * from tblCustomisationWorkApproval where FlatID=@FlatID And AddedBy=@AddedBy
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllFlatBookingCustomerDetails]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[ViewAllFlatBookingCustomerDetails]    
    @ProjectID INT = NULL,        
    @BlockID INT = NULL,      
    @FlatID INT = NULL,    
    @strsearch NVARCHAR(60) = NULL,    
    @FlatCustomerID INT = NULL    
AS    
BEGIN    
    SET NOCOUNT ON;          
        
    DECLARE @SQL NVARCHAR(MAX);          
    DECLARE @ParameterDef NVARCHAR(MAX);          
        
    -- Define the parameter types correctly          
    SET @ParameterDef = '      
        @ProjectID INT,      
        @BlockID INT,      
        @FlatID INT,      
        @strsearch NVARCHAR(60),    
        @FlatCustomerID INT';          
        
    -- Base query          
    SET @SQL = 'SELECT TFCB.*,TF.FlatName FROM tblFlatCustomerBookingDetails TFCB inner join  tblFlat TF on TFCB.FlatID =TF.FlatID WHERE 1 = 1';          
        
    -- Add filters dynamically          
    IF (@ProjectID IS NOT NULL AND @ProjectID<> '')          
    BEGIN          
        SET @SQL = @SQL + ' AND TFCB.ProjectID = @ProjectID';          
    END          
        
    IF (@BlockID IS NOT NULL AND @BlockID <> '')          
    BEGIN          
        SET @SQL = @SQL + ' AND TFCB.BlockID = @BlockID';          
    END          
        
    IF (@FlatID IS NOT NULL AND @FlatID <> '')          
    BEGIN          
        SET @SQL = @SQL + ' AND TFCB.FlatID = @FlatID';          
    END          
        
    IF (@FlatCustomerID IS NOT NULL AND @FlatCustomerID <>'')          
    BEGIN          
        SET @SQL = @SQL + ' AND TFCB.FlatCustomerID = @FlatCustomerID';          
    END          
        
    IF (@strsearch IS NOT NULL AND @strsearch <> '')          
    BEGIN          
        SET @SQL = @SQL + ' AND (TFCB.Mobilenumber1 LIKE ''%' + @strsearch + '%'' OR TF.FlatName LIKE ''%' + @strsearch + '%'')';          
    END    
    
    -- Add ORDER BY clause          
    SET @SQL = @SQL + ' ORDER BY TFCB.AddedDate DESC';          
        
    -- Execute the dynamic query          
    EXEC sp_executesql @SQL,         
        @ParameterDef,         
        @ProjectID = @ProjectID,       
        @BlockID = @BlockID,      
        @FlatID = @FlatID,    
        @strsearch = @strsearch,    
        @FlatCustomerID = @FlatCustomerID;    
END    
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllFlatByBlockID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[ViewAllFlatByBlockID]  
@BlockID int  
as  
begin  
select * from tblflat where BlockID=@BlockID  and FlatStatus='1' 
End  
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllFlatByFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbKey2h].[ViewAllFlatByFlatID]  
@FlatID int  
as  
begin  
select * from tblflat where FlatID=@FlatID  
End  
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllFlatCostDetails]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[ViewAllFlatCostDetails]    
    @ProjectID INT = NULL,         
    @FlatID INT = NULL,            
    @CostID INT = NULL,          
    @BlockID INT = NULL            
AS    
BEGIN    
    WITH RankedDemands AS (    
        SELECT     
            FlatID,     
            ProjectID,     
            BlockID,     
            CostID,  
            AddedDate,  
            AddedBy,    
            ROW_NUMBER() OVER (PARTITION BY FlatID, ProjectID, BlockID ORDER BY CostID) AS RowNum    
        FROM tblFlatCostDetails    
        WHERE     
            (@ProjectID IS NULL OR @ProjectID = '' OR ProjectID = @ProjectID) AND    
            (@FlatID IS NULL OR @FlatID = '' OR FlatID = @FlatID) AND    
            (@CostID IS NULL OR @CostID = '' OR CostID = @CostID) AND    
            (@BlockID IS NULL OR @BlockID = '' OR BlockID = @BlockID)    
    )    
    SELECT FlatID, ProjectID, BlockID, CostID, AddedBy    
    FROM RankedDemands    
    WHERE RowNum = 1 order By Addeddate Desc, CostID Desc;  -- Fetch only the first DemandID    
END   
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllFlatCustomerBookingDetailsByFlatCustomerID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ViewAllFlatCustomerBookingDetailsByFlatCustomerID]
@FlatCustomerID int
As
Begin

Select * from tblFlatCustomerBookingDetails where FlatCustomerID=@FlatCustomerID
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllFlatCustomerDemands]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[ViewAllFlatCustomerDemands]  
    @ProjectID NVARCHAR(50) = NULL,         
    @FlatID NVARCHAR(50) = NULL,                  
    @BlockID NVARCHAR(50) = NULL,            
    @CWID NVARCHAR(50) = NULL,  
    @CDemandID NVARCHAR(50) = NULL,  
    @AddedBy NVARCHAR(50) = NULL  
AS    
BEGIN    
    WITH RankedDemands AS (    
        SELECT     
            r.FlatID,  
            r.PaymentStatus,  
            b.ProjectID,     
            b.BlockID,     
            r.CWID,   
            r.PDFName,  
            r.CDemandID,    
            r.AddedBy, 
            r.AddedDate,
            b.ApplicantFirstName,  
            ROW_NUMBER() OVER (  
                PARTITION BY r.FlatID  -- Group by FlatID  
                ORDER BY r.CWID DESC    -- Prioritize based on CWID (or another column)  
            ) AS RowNum    
        FROM tblFlatCustomisationDemands r  
        LEFT JOIN tblFlatCustomerBookingDetails b  
            ON r.FlatID = b.FlatID  
        WHERE     
            (@ProjectID IS NULL OR @ProjectID = '' OR b.ProjectID = @ProjectID) AND    
            (@FlatID IS NULL OR @FlatID = '' OR r.FlatID = @FlatID) AND    
            (@CWID IS NULL OR @CWID = '' OR r.CWID = @CWID) AND    
            (@CDemandID IS NULL OR @CDemandID = '' OR r.CDemandID = @CDemandID) AND    
            (@AddedBy IS NULL OR @AddedBy = '' OR r.AddedBy = @AddedBy) AND    
            (@BlockID IS NULL OR @BlockID = '' OR b.BlockID = @BlockID)    
    )    
    SELECT  
        CDemandID,  
        CWID,  
        FlatID,   
        ProjectID,   
        BlockID,   
        PaymentStatus,  
        AddedBy,
        AddedDate,
        ApplicantFirstName  
    FROM RankedDemands  
    WHERE RowNum = 1 Order By AddedDate Desc, CDemandID Desc;  -- Fetch only the first record per FlatID    
END;  
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllFlatCustomerKYCDocs]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[ViewAllFlatCustomerKYCDocs]          
@AddedBy varchar(50)=null,
@ProjectID int=Null,
@BlockID int=Null,
@FlatID int=Null,
@DocID int=Null
AS        
BEGIN          
    SET NOCOUNT ON;          
            
    DECLARE @SQL NVARCHAR(MAX);          
    DECLARE @ParameterDef NVARCHAR(MAX);          
             
    SET @ParameterDef = '@ProjectID INT, @AddedBy INT, @BlockID INT,@FlatID INT,@DocID INT';          
           
    SET @SQL = 'SELECT tblk.*,tbfc.blockID,tbfc.ApplicantFirstName FROM tblFlatCustomerKYCDocs tblK  Inner Join tblFlatCustomerBookingDetails tbfc on tblk.FlatID=tbfc.FlatID    WHERE 1 = 1';          
            
    IF (@ProjectID IS NOT NULL And @ProjectID<>'')          
    BEGIN          
        SET @SQL = @SQL + ' AND tblk.ProjectID = @ProjectID';          
    END          
                           
    IF (@BlockID IS NOT NULL and @BlockID<>'')          
    BEGIN          
        SET @SQL = @SQL + ' AND tbfc.BlockID = @BlockID';          
    END    
    
    IF (@FlatID IS NOT NULL and @FlatID<>'')          
    BEGIN          
        SET @SQL = @SQL + ' AND tblk.FlatID = @FlatID';          
    END          

    IF (@AddedBy IS NOT NULL and @AddedBy<>'')          
    BEGIN          
        SET @SQL = @SQL + ' AND tblk.AddedBy = @AddedBy';          
    END  

    IF (@DocID IS NOT NULL and @DocID<>'')          
    BEGIN          
        SET @SQL = @SQL + ' AND tblk.DocID = @DocID';          
    END          
             
    SET @SQL = @SQL + ' ORDER BY tblk.AddedDate DESC';          
          
  
    EXEC sp_executesql @SQL,         
        @ParameterDef,         
        @ProjectID = @ProjectID,         
        @AddedBy=@AddedBy,
        @BlockID =@BlockID,
        @FlatID=@FlatID,
        @DocID=@DocID
END;  
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllFlatCustomerTransactionByFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[ViewAllFlatCustomerTransactionByFlatID]  
@FlatID int  
As  
Begin  
SELECT   
    tblct.TransactionID,  
    tblct.PaymentUpdatedBy,  
    tblct.PaymentUpdatedDate,  
    tbldemand.ProjectID,  
    tbldemand.BlockNo,  
    tblct.FlatID,  
    tblct.PaymentStatus,  
    tblct.ReceiptPDF,  
    tblct.PaidAmount,  
    tblct.PaymentMode,  
    tbldemand.PaymentLabelID,  
    payment.PaymentLabel    
FROM   
    tblFlatCustomerDemands tbldemand  
INNER JOIN   
    tblFlatCustomerTransaction tblct   
    ON tbldemand.DemandID = tblct.DemandID  
INNER JOIN   
    tblPaymentLabels payment   
    ON tbldemand.PaymentLabelID = payment.PID where tblct.FlatID=@FlatID  order by PaymentUpdatedDate Desc
End  
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllFlatCustomisationDemandsByFIDandABy]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[ViewAllFlatCustomisationDemandsByFIDandABy]
@FlatID int,
@AddedBy nvarchar(50)
As
Begin
select tfcd.CDemandID,tfcd.FlatID,tfcd.PDFName,tfcd.AddedDate,tfcd.AddedBy,tfcd.PaymentStatus,tfcd.CWID ,tfcw.WorkTitle,tfcw.Amount from tblFlatCustomisationDemands tfcd  left join tblFlatCustomisationWorks tfcw   on tfcd.CWID=tfcw.CWID  where tfcd.FlatID=@FlatID and tfcd.AddedBy=@AddedBy
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllFlatCustomisationTransaction]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbKey2h].[ViewAllFlatCustomisationTransaction]
    @ProjectID NVARCHAR(50) = NULL,       
    @FlatID NVARCHAR(50) = NULL,                
    @BlockID NVARCHAR(50) = NULL,          
    @CTID NVARCHAR(50) = NULL,
    @CDemandID NVARCHAR(50) = NULL,
    @PaymentUpdatedBy NVARCHAR(50) = NULL
AS  
BEGIN  
    WITH RankedDemands AS (  
        SELECT   
            r.FlatID,
            r.PaymentStatus,
            b.ProjectID,   
            b.BlockID,   
            r.ReceiptPDF,
            r.CDemandID, 
            r.PaidAmount,
            r.PaymentUpdatedBy,  
            b.ApplicantFirstName,
            ROW_NUMBER() OVER (
                PARTITION BY r.FlatID  -- Group by FlatID
                ORDER BY r.CTID DESC    -- Prioritize based on CWID (or another column)
            ) AS RowNum  
        FROM tblFlatCustomisationTransaction r
        LEFT JOIN tblFlatCustomerBookingDetails b
            ON r.FlatID = b.FlatID
        WHERE   
            (@ProjectID IS NULL OR @ProjectID = '' OR b.ProjectID = @ProjectID) AND  
            (@FlatID IS NULL OR @FlatID = '' OR r.FlatID = @FlatID) AND  
            (@CTID IS NULL OR @CTID = '' OR r.CTID = @CTID) AND  
            (@CDemandID IS NULL OR @CDemandID = '' OR r.CDemandID = @CDemandID) AND  
            (@PaymentUpdatedBy IS NULL OR @PaymentUpdatedBy = '' OR r.PaymentUpdatedBy = @PaymentUpdatedBy) AND  
            (@BlockID IS NULL OR @BlockID = '' OR b.BlockID = @BlockID)  
    )  
    SELECT
        CDemandID,
        PaidAmount,
        FlatID, 
        ProjectID, 
        BlockID, 
        PaymentStatus,
        PaymentUpdatedBy, 
        ApplicantFirstName
    FROM RankedDemands
    WHERE RowNum = 1;  -- Fetch only the first record per FlatID  
END;
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllFlatCustomisationWorksByFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE Procedure [dbKey2h].[ViewAllFlatCustomisationWorksByFlatID]  
@FlatID int,  
@AddedBy nvarchar(50)  
As  
Begin  
select tw.*,tWA.CustomizationWork as WorkTitlenew from tblFlatCustomisationWorks tW inner join tblCustomisationWorkApproval TWA on TW.WorkTitle=TWA.CWAID where tW.FlatID=@FlatID and tW.AddedBy=@AddedBy  
End  
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllFlatCustomizationWorks]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    
CREATE PROCEDURE [dbKey2h].[ViewAllFlatCustomizationWorks]  
    @ProjectID NVARCHAR(50) = NULL,         
    @FlatID NVARCHAR(50) = NULL,                  
    @BlockID NVARCHAR(50) = NULL,            
    @CWID NVARCHAR(50) = NULL,  
    @AddedBy nvarchar(50)=null  
AS    
BEGIN    
    WITH RankedDemands AS (    
        SELECT     
            r.FlatID,  
            r.WorkTitle,  
            r.WorkStatus,  
            r.Amount,  
            b.ProjectID,     
            b.BlockID,     
            r.CWID,    
            r.AddedBy, 
			r.AddedDate,
            b.ApplicantFirstName,  -- Include this column in the CTE  
            ROW_NUMBER() OVER (PARTITION BY r.FlatID, b.ProjectID, b.BlockID ORDER BY r.CWID) AS RowNum    
        FROM tblFlatCustomisationWorks r  
        LEFT JOIN tblFlatCustomerBookingDetails b  
            ON r.FlatID = b.FlatID  
        WHERE     
            (@ProjectID IS NULL OR @ProjectID = '' OR b.ProjectID = @ProjectID) AND    
            (@FlatID IS NULL OR @FlatID = '' OR r.FlatID = @FlatID) AND    
            (@CWID IS NULL OR @CWID = '' OR r.CWID = @CWID) AND    
            (@AddedBy IS NULL OR @AddedBy = '' OR r.AddedBy = @AddedBy) AND    
            (@BlockID IS NULL OR @BlockID = '' OR b.BlockID = @BlockID)    
    )    
    SELECT   
    CWID,  
        FlatID,   
        ProjectID,   
        BlockID,   
        WorkTitle,  
        WorkStatus,  
        Amount,  
        AddedBy, 
		AddedDate,
        ApplicantFirstName  
    FROM RankedDemands  
    WHERE RowNum = 1 order by AddedDate Desc,CWID Desc;  -- Fetch only the first record    
END;
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllFlatCustomizationWorksApproval]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[ViewAllFlatCustomizationWorksApproval]    
    @ProjectID NVARCHAR(50) = NULL,           
    @FlatID NVARCHAR(50) = NULL,                    
    @BlockID NVARCHAR(50) = NULL,              
    @CWAID NVARCHAR(50) = NULL,    
    @AddedBy nvarchar(50)=null    
AS      
BEGIN      
    WITH RankedDemands AS (      
        SELECT       
            r.FlatID,    
            r.CustomizationWork,    
            r.ApprovalStatus,    
            r.Amount,    
            b.ProjectID,       
            b.BlockID,       
            r.CWAID,      
            r.AddedBy,   
   r.AddedDate,  
            b.ApplicantFirstName,  -- Include this column in the CTE    
            ROW_NUMBER() OVER (PARTITION BY r.FlatID, b.ProjectID, b.BlockID ORDER BY r.CWAID) AS RowNum      
        FROM tblCustomisationWorkApproval r    
        LEFT JOIN tblFlatCustomerBookingDetails b    
            ON r.FlatID = b.FlatID    
        WHERE       
            (@ProjectID IS NULL OR @ProjectID = '' OR b.ProjectID = @ProjectID) AND      
            (@FlatID IS NULL OR @FlatID = '' OR r.FlatID = @FlatID) AND      
            (@CWAID IS NULL OR @CWAID = '' OR r.CWAID = @CWAID) AND      
            (@AddedBy IS NULL OR @AddedBy = '' OR r.AddedBy = @AddedBy) AND      
            (@BlockID IS NULL OR @BlockID = '' OR b.BlockID = @BlockID)      
    )      
    SELECT     
    CWAID,    
        FlatID,     
        ProjectID,     
        BlockID,     
        CustomizationWork,    
        ApprovalStatus,    
        Amount,    
        AddedBy,   
  AddedDate,  
        ApplicantFirstName    
    FROM RankedDemands    
    WHERE RowNum = 1 order by AddedDate Desc,CWAID Desc;  -- Fetch only the first record      
END;
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllFlatDemandDetails]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[ViewAllFlatDemandDetails]
    @ProjectID INT = NULL,     
    @FlatID INT = NULL,        
    @DemandID INT = NULL,      
    @BlockNo INT = NULL        
AS
BEGIN
    WITH RankedDemands AS (
        SELECT 
            FlatID, 
            ProjectID, 
            BlockNo, 
            DemandID,
            AddedBy,
            ROW_NUMBER() OVER (PARTITION BY FlatID, ProjectID, BlockNo ORDER BY DemandID) AS RowNum
        FROM tblFlatCustomerDemands
        WHERE 
            (@ProjectID IS NULL OR @ProjectID = '' OR ProjectID = @ProjectID) AND
            (@FlatID IS NULL OR @FlatID = '' OR FlatID = @FlatID) AND
            (@DemandID IS NULL OR @DemandID = '' OR DemandID = @DemandID) AND
            (@BlockNo IS NULL OR @BlockNo = '' OR BlockNo = @BlockNo)
    )
    SELECT FlatID, ProjectID, BlockNo, DemandID, AddedBy
    FROM RankedDemands
    WHERE RowNum = 1;  -- Fetch only the first DemandID
END
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllFlatFloorPlans]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[ViewAllFlatFloorPlans] 
AS 
BEGIN 
SET NOCOUNT ON;  
WITH CTE_FloorPlans 
AS     (       
SELECT              *,   
ROW_NUMBER() OVER (PARTITION BY ProjectID,BlockID,FlatID ORDER BY AddedDate DESC) AS RowNum
FROM tblFlatFloorPlan     
)     SELECT *     FROM CTE_FloorPlans     WHERE RowNum = 1     ORDER BY AddedDate DESC;
END  
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllFlatProgress]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[ViewAllFlatProgress]          
    @Month VARCHAR(50) = NULL,        
    @Year INT = NULL,        
    @ProjectID INT = NULL,  
    @FlatID INT = NULL , 
    @BlockID INT = Null,
    @FlatProgressID INT = NULL    
AS        
BEGIN          
    SET NOCOUNT ON;          
          
    DECLARE @SQL NVARCHAR(MAX);          
    DECLARE @ParameterDef NVARCHAR(MAX);          
          
    SET @ParameterDef = N'@Month VARCHAR(50), @Year INT, @ProjectID INT,@FlatID INT,@FlatProgressID INT,@BlockID INT';          
          
    -- Base query          
    SET @SQL = 'SELECT TFP.*,TF.BLockID FROM tblFlatProgress TFP left join tblflat TF on TF.FlatID = TFP.FlatID WHERE 1 = 1';          
          
    -- Add filters dynamically          
    IF (@Month IS NOT NULL AND @Month <> '')          
    BEGIN          
        SET @SQL = @SQL + ' AND TFP.Month = @Month';          
    END          
       
    IF (@Year IS NOT NULL And @Year <> '')          
    BEGIN          
        SET @SQL = @SQL + ' AND TFP.Year = @Year';          
    END         
                
    IF (@ProjectID IS NOT NULL)          
    BEGIN          
        SET @SQL = @SQL + ' AND TFP.ProjectID = @ProjectID';          
    END       
    IF (@FlatID IS NOT NULL)          
    BEGIN          
        SET @SQL = @SQL + ' AND TFP.FlatID = @FlatID';          
    END     
      
    IF (@FlatProgressID  IS NOT NULL)          
    BEGIN          
        SET @SQL = @SQL + ' AND TFP.FlatProgressID = @FlatProgressID';          
    END       
    
    IF (@BlockID  IS NOT NULL)          
    BEGIN          
        SET @SQL = @SQL + ' AND TF.BlockID = @BlockID';          
    END          
          
    -- Add ORDER BY clause          
    SET @SQL = @SQL + ' ORDER BY TFP.AddedDate DESC';          
          
    -- Execute the dynamic query          
    EXEC sp_executesql @SQL,         
        @ParameterDef,         
        @Month = @Month,         
        @Year = @Year,       
        @ProjectID = @ProjectID,  
        @FlatID=@FlatID,  
        @BlockID=@BlockID,
        @FlatProgressID=@FlatProgressID;     
END 
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllFlatQPbyPIDBIDFID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[ViewAllFlatQPbyPIDBIDFID]       
@ProjectID INT,
@BlockId INT,
@FlatID INT

AS      
BEGIN        
    SET NOCOUNT ON;        
SELECT * FROM tblFlatQualityReports WHERE ProjectID=@ProjectID and BlockID=@BlockId and FlatID=@FlatID  order by AddedDate desc        
END 
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllFlatQualityReports]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[ViewAllFlatQualityReports] 
    @ProjectID INT = NULL,  
    @FlatID INT = NULL ,
    @BlockID Int,
    @QFID Int
AS  
BEGIN  
    SET NOCOUNT ON;        
    
    -- Declare variables for dynamic SQL  
    DECLARE @SQL NVARCHAR(MAX);        
    DECLARE @ParameterDef NVARCHAR(MAX);        
    
    -- Define the parameter definition  
    SET @ParameterDef = '@ProjectID INT, @FlatID INT, @BlockID Int,@QFID Int';        
    
    -- Base query (always returns records if no filters are provided)  
    SET @SQL = '
    WITH CTE AS (
        SELECT 
            *, 
            ROW_NUMBER() OVER (PARTITION BY FlatID ORDER BY QFID) AS RowNum
        FROM tblFlatQualityReports
    )
    SELECT *
    FROM CTE
    WHERE RowNum = 1';  -- Base condition to ensure only one row per FlatID
        
    -- Add filters dynamically based on the presence of parameters  
    IF (@ProjectID IS NOT NULL and @ProjectID <>'')        
    BEGIN        
        SET @SQL = @SQL + ' AND ProjectID = @ProjectID';        
    END;        
        
    IF (@FlatID IS NOT NULL  and @FlatID <>'')        
    BEGIN        
        SET @SQL = @SQL + ' AND FlatID = @FlatID';        
    END;        
        
           IF (@BlockID IS NOT NULL and @BlockID<> '')        
    BEGIN        
        SET @SQL = @SQL + ' AND BlockID = @BlockID';        
    END  
      IF (@QFID IS NOT NULL and   @QFID<> '')        
    BEGIN        
        SET @SQL = @SQL + ' AND QFID = @QFID';        
    END  


    -- Add an ORDER BY clause  
    SET @SQL = @SQL + ' ORDER BY AddedDate DESC';        
        
    -- Execute the dynamic SQL query  
    EXEC sp_executesql @SQL,       
        @ParameterDef,       
        @ProjectID = @ProjectID,       
        @FlatID = @FlatID,
        @QFID=@QFID,
        @BlockID= @BlockID; 
END;
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllIndiaBankList]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ViewAllIndiaBankList]
As
Begin
Select BankID,BankName From tblIndiaBankList
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllLeadsource]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ViewAllLeadsource]

as
Begin
select * from tblLeadSource

End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllLeadsourceByLeadID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ViewAllLeadsourceByLeadID]
  @LeadID int
as  
Begin  
select * from tblLeadSource  where LeadID=@LeadID
  
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllLeadSources]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ViewAllLeadSources]

as
Begin
 select * from tblLeadSource Where 1=1 order by LeadSourceName asc 
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllNotifications]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[ViewAllNotifications]     
    @ProjectID INT = NULL  
AS    
BEGIN      
    SET NOCOUNT ON;      
   
    DECLARE @SQL NVARCHAR(MAX);      
    DECLARE @ParameterDef NVARCHAR(MAX);      
   
    SET @ParameterDef = '@ProjectID INT';      
   
    -- Base query      
    SET @SQL = '  select tf.*,tn.FNID,tn.Title,tn.Message,tn.CreatedDate,tn.ReadStatus,tn.ListStatus from tblFlatNotifications tn inner join tblflat tf on tf.FlatID=tn.FlatID WHERE 1 = 1';      
   
        
  
    IF (@ProjectID IS NOT NULL)      
    BEGIN      
        SET @SQL = @SQL + ' AND tf.ProjectID = @ProjectID';      
    END      
     
   
    SET @SQL = @SQL + ' ORDER BY tn.FNID Desc';      
   
    EXEC sp_executesql @SQL,     
        @ParameterDef,     
        @ProjectID = @ProjectID  
END
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllProjectFlat]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[ViewAllProjectFlat]      
    @FlatID INT = NULL,    
    @FlatStatus BIT = NULL,    
    @BlockID INT = NULL,  
    @ProjectID INT=null  
AS    
BEGIN      
    SET NOCOUNT ON;      
      
    DECLARE @SQL NVARCHAR(MAX);      
    DECLARE @ParameterDef NVARCHAR(MAX);      
      
    SET @ParameterDef = '@FlatID INT, @FlatStatus BIT, @BlockID INT,@ProjectID INT';      
      
    -- Base query      
    SET @SQL = 'SELECT * FROM tblflat WHERE 1 = 1';      
      
    -- Add filters dynamically      
    IF (@FlatID IS NOT NULL AND @FlatID <> '')      
    BEGIN      
        SET @SQL = @SQL + ' AND FlatID = @FlatID';      
    END      
      
    IF (@FlatStatus IS NOT NULL AND @FlatStatus <> '')      
    BEGIN      
        SET @SQL = @SQL + ' AND FlatStatus = @FlatStatus';      
    END      
      
    IF (@BlockID IS NOT NULL  AND @BlockID <> '')      
    BEGIN      
        SET @SQL = @SQL + ' AND BlockID = @BlockID';      
    END     
      
      
    IF (@ProjectID IS NOT NULL  AND @ProjectID <> '')      
    BEGIN      
        SET @SQL = @SQL + ' AND ProjectID=@ProjectID';      
    END      
      
    -- Add ORDER BY clause      
    SET @SQL = @SQL + ' ORDER BY AddedDate Desc';      
      
    -- Execute the dynamic query      
    EXEC sp_executesql @SQL,     
        @ParameterDef,     
        @FlatID = @FlatID,     
        @FlatStatus = @FlatStatus,   
        @ProjectID=@ProjectID,  
        @BlockID = @BlockID;      
END
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllProjectFloorPlans]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[ViewAllProjectFloorPlans]
AS
BEGIN
    SET NOCOUNT ON;

    WITH CTE_FloorPlans AS
    (
        SELECT 
            *,
            ROW_NUMBER() OVER (PARTITION BY ProjectID ORDER BY AddedDate DESC) AS RowNum
        FROM tblFloorPlan
    )
    SELECT *
    FROM CTE_FloorPlans
    WHERE RowNum = 1
    ORDER BY AddedDate DESC;
END

GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllProjectFloorPlansbyProjectID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbKey2h].[ViewAllProjectFloorPlansbyProjectID]   
@ProjectID INT
AS  
BEGIN    
    SET NOCOUNT ON;    
SELECT * FROM tblFloorPlan WHERE ProjectID=@ProjectID  order by AddedDate desc 
 

END


GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllProjectHomeScreenByFilter]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[ViewAllProjectHomeScreenByFilter]
@PHID int,
@ProjectID int,
@AddedBy nvarchar(60)
As
Begin
SET NOCOUNT ON;            
            
   
    -- Declare variables for dynamic SQL      
    DECLARE @SQL NVARCHAR(MAX);            
    DECLARE @ParameterDef NVARCHAR(MAX);            
            
    -- Define the parameter definition      
    SET @ParameterDef = '@ProjectID INT, @AddedBy nvarchar(60), @PHID INT';            
                
    SET @SQL = 'Select * from tblProjectHomeScreen WHERE 1 = 1';            
             
    IF (@ProjectID IS NOT NULL and @ProjectID <> '')            
    BEGIN            
        SET @SQL = @SQL + ' AND ProjectID = @ProjectID';            
    END            
           IF (@PHID IS NOT NULL and @PHID <> '')            
    BEGIN            
        SET @SQL = @SQL + ' AND PHID = @PHID';            
    END            
            
           
            
    IF (@AddedBy IS NOT NULL And @AddedBy <> '')            
    BEGIN            
        SET @SQL = @SQL + ' AND AddedBy = @AddedBy';            
    END            
            
    -- Add an ORDER BY clause      
    SET @SQL = @SQL + ' ORDER BY AddedDate DESC';            
            
    -- Execute the dynamic SQL query      
    EXEC sp_executesql @SQL,           
        @ParameterDef,           
        @ProjectID = @ProjectID,           
        @PHID = @PHID,           
        @AddedBy = @AddedBy;   
        END
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllProjectProgress]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbKey2h].[ViewAllProjectProgress]      
    @Month VARCHAR(50) = NULL,    
    @Year INT = NULL,    
    @ProjectID INT = NULL
AS    
BEGIN      
    SET NOCOUNT ON;      
      
    DECLARE @SQL NVARCHAR(MAX);      
    DECLARE @ParameterDef NVARCHAR(MAX);      
      
    SET @ParameterDef = N'@Month VARCHAR(50), @Year INT, @ProjectID INT';      
      
    -- Base query      
    SET @SQL = 'SELECT * FROM tblProjectProgress WHERE 1 = 1';      
      
    -- Add filters dynamically      
    IF (@Month IS NOT NULL AND @Month <> '')      
    BEGIN      
        SET @SQL = @SQL + ' AND Month = @Month';      
    END      
   
    IF (@Year IS NOT NULL And @Year <> '')      
    BEGIN      
        SET @SQL = @SQL + ' AND Year = @Year';      
    END     
            
    IF (@ProjectID IS NOT NULL)      
    BEGIN      
        SET @SQL = @SQL + ' AND ProjectID = @ProjectID';      
    END      
      
    -- Add ORDER BY clause      
    SET @SQL = @SQL + ' ORDER BY AddedDate DESC';      
      
    -- Execute the dynamic query      
    EXEC sp_executesql @SQL,     
        @ParameterDef,     
        @Month = @Month,     
        @Year = @Year,   
        @ProjectID = @ProjectID; 
END
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllProjectQP]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[ViewAllProjectQP]  
AS  
BEGIN  
    SET NOCOUNT ON;  
  
    WITH CTE_FloorPlans AS  
    (  
        SELECT   
            *,  
            ROW_NUMBER() OVER (PARTITION BY ProjectID ORDER BY AddedDate DESC) AS RowNum  
        FROM tblProjectQualityReports  
    )  
    SELECT *  
    FROM CTE_FloorPlans  
    WHERE RowNum = 1  
    ORDER BY AddedDate DESC;  
END  

GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllProjectQPbyProjectID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[ViewAllProjectQPbyProjectID]     
@ProjectID INT  
AS    
BEGIN      
    SET NOCOUNT ON;      
SELECT * FROM tblProjectQualityReports WHERE ProjectID=@ProjectID  order by AddedDate desc   
   
  
END  
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllProjects]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[ViewAllProjects]          
    @ProjectID NVARCHAR(50) = NULL,  -- Changed to NVARCHAR to accept empty strings        
    @Status NVARCHAR(50) = NULL,        
    @Projectstatus INT = NULL        
AS        
BEGIN          
    SET NOCOUNT ON;          
          
    -- Convert empty strings to NULL  
    SET @ProjectID = CASE WHEN ISNULL(@ProjectID, '') = '' THEN NULL ELSE @ProjectID END;  
    SET @Status = CASE WHEN ISNULL(@Status, '') = '' THEN NULL ELSE @Status END;  
          
    -- Declare variables for dynamic SQL    
    DECLARE @SQL NVARCHAR(MAX);          
    DECLARE @ParameterDef NVARCHAR(MAX);          
          
    -- Define the parameter definition    
    SET @ParameterDef = '@ProjectID INT, @Status BIT, @Projectstatus INT';          
          
    -- Base query (always returns records if no parameters are provided)    
    SET @SQL = 'SELECT tp.*,TPS.BHK,TPS.SquareFeet FROM tblProjects tp inner join tblProjectHomeScreen TPS on tp.ProjectID=TPS.ProjectID    WHERE 1 = 1';          
          
    -- Add filters dynamically based on the presence of parameters    
    IF (@ProjectID IS NOT NULL)          
    BEGIN          
        SET @SQL = @SQL + ' AND ProjectID = @ProjectID';          
    END          
          
    IF (@Status IS NOT NULL)          
    BEGIN          
        SET @SQL = @SQL + ' AND ProjectDisplayStatus = @Status';          
    END          
          
    IF (@Projectstatus IS NOT NULL)          
    BEGIN          
        SET @SQL = @SQL + ' AND ProjectStatus = @Projectstatus';          
    END          
          
    -- Add an ORDER BY clause    
    SET @SQL = @SQL + ' ORDER BY AddedDate DESC';          
          
    -- Execute the dynamic SQL query    
    EXEC sp_executesql @SQL,         
        @ParameterDef,         
        @ProjectID = @ProjectID,         
        @Status = @Status,         
        @Projectstatus = @Projectstatus;          
END;  
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllReferralList]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[ViewAllReferralList]    
    @ProjectID INT = NULL,         
    @strsearch NVARCHAR(60) = NULL
AS    
BEGIN    
    SET NOCOUNT ON;          
        
    DECLARE @SQL NVARCHAR(MAX);          
    DECLARE @ParameterDef NVARCHAR(MAX);          
        
    -- Define the parameter types correctly          
    SET @ParameterDef = '      
        @ProjectID INT,         
        @strsearch NVARCHAR(60)';       
        
    -- Base query          
    SET @SQL = 'SELECT TFCB.*,TF.FlatName, tr.* FROM tblFlatCustomerBookingDetails TFCB 
inner join  tblFlat TF on TFCB.FlatID =TF.FlatID inner join tblProjectReferralList tr on tr.FlatID =TF.FlatID  WHERE 1 = 1';          
        
    -- Add filters dynamically          
    IF (@ProjectID IS NOT NULL AND @ProjectID<> '')          
    BEGIN          
        SET @SQL = @SQL + ' AND TFCB.ProjectID = @ProjectID';          
    END                
        
    IF (@strsearch IS NOT NULL AND @strsearch <> '')          
    BEGIN          
        SET @SQL = @SQL + ' AND (TFCB.Mobilenumber1 LIKE ''%' + @strsearch + '%'' OR TF.FlatName LIKE ''%' + @strsearch + '%'')';          
    END    
    
    -- Add ORDER BY clause          
    SET @SQL = @SQL + ' ORDER BY TFCB.AddedDate DESC';          
        
    -- Execute the dynamic query          
    EXEC sp_executesql @SQL,         
        @ParameterDef,         
        @ProjectID = @ProjectID,          
        @strsearch = @strsearch;
END    
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllRMDetails]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbKey2h].[ViewAllRMDetails]   

AS  
BEGIN    
    SET NOCOUNT ON;    
SELECT * FROM tblClientUsers WHERE Role='RM'  order by AddedDate desc 
 

END


GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllState]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[ViewAllState]
As
Begin
select * from  tblState Where StateStatus='1'
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllUserDetails]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbKey2h].[ViewAllUserDetails]   

AS  
BEGIN    
    SET NOCOUNT ON;    
SELECT * FROM tblClientUsers WHERE 1=1  order by AddedDate desc 
 

END


GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllWhatshappening]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbKey2h].[ViewAllWhatshappening]   

AS  
BEGIN    
    SET NOCOUNT ON;    
SELECT * FROM tblProjectWhatsHappening WHERE 1 = 1  order by AddedDate desc 
 

END


GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAllWhatshappeningbyWHID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbKey2h].[ViewAllWhatshappeningbyWHID]   
@WHID INT
AS  
BEGIN    
    SET NOCOUNT ON;    
SELECT * FROM tblProjectWhatsHappening WHERE WHID=@WHID  order by AddedDate desc 
 

END


GO
/****** Object:  StoredProcedure [dbKey2h].[ViewAvailtransactionReceiptByPSID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ViewAvailtransactionReceiptByPSID]
@PSID int,
@AddedBy nvarchar(50)
As
Begin
select tbd.*,tct.* from tblFlatCustomerDemands tbd inner join tblFlatCustomerTransaction tct on tbd.DemandID=tct.DemandID where tbd.PSID=@PSID AND tct.PaymentUpdatedBy=@AddedBy
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewBasicCustomerDetailsByMobilenumber]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbKey2h].[ViewBasicCustomerDetailsByMobilenumber]
@Mobilenumber varchar(20)
as
Begin
SELECT *FROM tblCustomers where Mobilenumber=@Mobilenumber
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewBlockbyProjectID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ViewBlockbyProjectID]
@ProjectID int
As
Begin
select * from tblProjectBlock where ProjectID=@ProjectID and BlockStatus='1'
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewBlockfloorplanByID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create procedure [dbKey2h].[ViewBlockfloorplanByID]  
  @BlockID int 
    As  
    Begin  
    select * from tblBlockFloorPlan where BlockID =@BlockID  
    End  
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewBlockPlansbyFilter]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[ViewBlockPlansbyFilter]                  
    @ProjectID INT = NULL,      
    @BlockID INT = NULL,   
    @BlockFloorPlanID INT = NULL      
AS                  
BEGIN                  
    SET NOCOUNT ON;                  
  
    WITH CTE AS (    
        SELECT *,     
               ROW_NUMBER() OVER (PARTITION BY BlockID ORDER BY AddedDate DESC) AS rn    
        FROM tblBlockFloorPlan    
        WHERE (@ProjectID IS NULL OR ProjectID = @ProjectID)    
          AND (@BlockID IS NULL OR BlockID = @BlockID)    
          AND (@BlockFloorPlanID IS NULL OR BlockFloorPlanID = @BlockFloorPlanID)    
    )    
    SELECT * FROM CTE WHERE rn = 1    
    ORDER BY AddedDate DESC;     
END;  
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewCityByCityID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[ViewCityByCityID]
@CityID int
As
Begin
select * from  tblCity where CityID=@CityID and CityStatus = '1'
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewCityByID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ViewCityByID]
@CID int
As
Begin
Select * from tblCity where CityID=@CID
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewCostPaymentStagesByFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ViewCostPaymentStagesByFlatID]
@FlatID int
As
Begin
select * from tblFlatCostDetails where FlatID=@FlatID
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewCustomerPaymentStagesByFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ViewCustomerPaymentStagesByFlatID]
@FlatID int
As
Begin
Select tblps.FlatID,tblps.PaymentLabelID,tblpl.PaymentLabel,tblpl.PID from tblCustomerPaymentSchedule tblps right join   tblPaymentLabels tblpl  on tblps.PaymentLabelID =tblpl.PID   where FlatID=@FlatID order by tblpl.PID Asc
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewCustomisationWorkApprovalAmountByWorkTitle]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
     CREATE Procedure [dbKey2h].[ViewCustomisationWorkApprovalAmountByWorkTitle]
     @WorkTitle nvarchar(256),
     @ClientApprovedstatus Nvarchar(60),
     @FlatID nvarchar(50),  
     @AddedBy nvarchar(60) 
    As
    Begin
    Select * from tblCustomisationWorkApproval where FlatID=@FlatID And AddedBy=@AddedBy  and ClientApprovedstatus=@ClientApprovedstatus and CWAID=@WorkTitle
    ENd
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewCustomisationWorkApprovalBystatus]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
     Create Procedure [dbKey2h].[ViewCustomisationWorkApprovalBystatus]
     @ClientApprovedstatus Nvarchar(60),
     @FlatID nvarchar(50),  
     @AddedBy nvarchar(60) 
    As
    Begin
    Select * from tblCustomisationWorkApproval where FlatID=@FlatID And AddedBy=@AddedBy  and ClientApprovedstatus=@ClientApprovedstatus
    ENd
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewCustomizationDemandTypeByFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbKey2h].[ViewCustomizationDemandTypeByFlatID]        
    @FlatID INT,      
    @CDemandID INT = NULL,    
    @AddedBy NVARCHAR(50)      
AS        
BEGIN        
    SET NOCOUNT ON;  
  
SELECT   
        TBLD.CDemandID,  
        TBLD.PDFName,  
        TFW.Amount,  
        TBLD.FlatID,  
        TFW.AddedBy,  
        TCA.CustomizationWork  
    FROM tblFlatCustomisationDemands TBLD  
    LEFT JOIN tblFlatCustomisationWorks TFW   
        ON TBLD.CWID = TFW.CWID  
    inner JOIN tblCustomisationWorkApproval TCA   
        ON TFW.WorkTitle = TCA.CWAID   
          
  
  
    WHERE TFW.FlatID = @FlatID    
      AND TFW.AddedBy = @AddedBy    
      AND (@CDemandID IS NULL OR @CDemandID = '' OR TBLD.CDemandID = @CDemandID);  
END;  
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewCustomizationWorkProgressStatus]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbKey2h].[ViewCustomizationWorkProgressStatus]
  @ID NVARCHAR(50) = NULL     
As
Begin
select * from tblCustomizationWorkProgressStatus where (@ID IS NULL OR @ID = '' OR WorkProgressID = @ID)   
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewDemandTypeByFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ViewDemandTypeByFlatID]
@FlatID Int
As
Begin
Select TBLD.DemandID, TPL.PaymentLabel FROM tblFlatCustomerDemands TBLD left join tblPaymentLabels TPL on TBLD.PaymentLabelID=TPL.PID where TBLD.FlatID=@FlatID
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewDocumentsbyFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ViewDocumentsbyFlatID]
@FlatID INT
As
Begin

select * from tblFlatCustomerKYCDocs where FlatID=@FlatID


End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewFilterCustomerPaymentSchedule]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[ViewFilterCustomerPaymentSchedule]  
    @ProjectID NVARCHAR(50) = NULL,       
    @FlatID NVARCHAR(50) = NULL,          
    @PSID NVARCHAR(50) = NULL,        
    @BlockID NVARCHAR(50) = NULL          
AS  
BEGIN 
    -- Treat empty strings as NULL
    SET @ProjectID = NULLIF(@ProjectID, '');
    SET @FlatID = NULLIF(@FlatID, '');
    SET @PSID = NULLIF(@PSID, '');
    SET @BlockID = NULLIF(@BlockID, '');

    WITH RankedDemands AS (  
        SELECT   
            f.FlatID,   
            f.PSID,  
            f.AddedBy,  
            p.ProjectID,  
            p.BlockID,
            p.applicantFirstName,
            ROW_NUMBER() OVER (PARTITION BY f.FlatID ORDER BY f.PSID) AS RowNum  
        FROM tblCustomerPaymentSchedule f
        INNER JOIN tblFlatCustomerBookingDetails p ON f.FlatID = p.FlatID  
        WHERE   
            (@ProjectID IS NULL OR p.ProjectID = @ProjectID) AND  
            (@FlatID IS NULL OR f.FlatID = @FlatID) AND  
            (@PSID IS NULL OR f.PSID = @PSID) AND  
            (@BlockID IS NULL OR p.BlockID = @BlockID)  
    )  
    SELECT FlatID, ProjectID, BlockID, PSID, applicantFirstName, AddedBy  
    FROM RankedDemands  
    WHERE RowNum = 1;  -- Fetch only the first FlatID from each group
END
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewFilterFlatCustomerTransaction]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbKey2h].[ViewFilterFlatCustomerTransaction]
    @ProjectID NVARCHAR(50) = NULL,         
    @FlatID NVARCHAR(50) = NULL,                
    @BlockID NVARCHAR(50) = NULL,
    @TransactionID NVARCHAR(50) = NULL
AS    
BEGIN
    -- Treat empty strings as NULL  
    SET @ProjectID = NULLIF(@ProjectID, '');  
    SET @FlatID = NULLIF(@FlatID, '');  
    SET @TransactionID = NULLIF(@TransactionID, '');  
    SET @BlockID = NULLIF(@BlockID, '');  

    -- Common Table Expression (CTE) to get the first row per FlatID
    WITH FirstFlatTransaction AS (
        SELECT 
            tblct.TransactionID,  
            tblct.PaymentUpdatedBy,  
            tblct.PaymentUpdatedDate,  
            tblct.FlatID,  
            tblct.PaymentStatus,  
            tblct.ReceiptPDF,  
            tblct.PaidAmount,  
            tblct.PaymentMode,
            ROW_NUMBER() OVER (PARTITION BY tblct.FlatID ORDER BY tblct.PaymentUpdatedDate ASC) AS RowNum
        FROM 
            tblFlatCustomerTransaction tblct
    )
    
    -- Select the first row per FlatID along with the ApplicantFirstName
    SELECT 
        fft.TransactionID,  
        fft.PaymentUpdatedBy,  
        fft.PaymentUpdatedDate,  
        fft.FlatID,  
        fft.PaymentStatus,  
        fft.ReceiptPDF,  
        fft.PaidAmount,  
        fft.PaymentMode, 
        customer.ProjectID,
        Customer.BlockID,
        customer.ApplicantFirstName
    FROM 
        FirstFlatTransaction fft
    LEFT JOIN 
        tblFlatCustomerBookingDetails customer
        ON fft.FlatID = customer.FlatID
    WHERE 
        fft.RowNum = 1 AND
        (@ProjectID IS NULL OR customer.ProjectID = @ProjectID) AND    
        (@FlatID IS NULL OR fft.FlatID = @FlatID) AND    
        (@TransactionID IS NULL OR fft.TransactionID = @TransactionID) AND    
        (@BlockID IS NULL OR customer.BlockID = @BlockID) order by fft.PaymentUpdatedDate,fft.TransactionID Desc;
END;
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewFlatBookingReferedby]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ViewFlatBookingReferedby]
As
Begin
select * from tblcustomerFlatBookingReferedby
ENd
GO
/****** Object:  StoredProcedure [dbKey2h].[viewFlatCostDetailsByFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbKey2h].[viewFlatCostDetailsByFlatID]      
        @FlatID int      
        As      
        Begin      
        select tblcd.*,tblc.* from tblFlatCostDetails tblcd left join tblProjectCostLabels tblc on tblc.CostlabelID = tblcd.CostLabelID Where FlatID=@FlatID   Order By tblcd.AddedDate Desc,tblcd.CostID Desc  
        End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewFlatCustomerbyFlatLoginID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE Procedure [dbKey2h].[ViewFlatCustomerbyFlatLoginID]  
        @Flatloginid NVARCHAR (256)
        As  
        Begin  
        select COUNT(*)  from tblFlatCustomerBookingDetails tfc left join tblflat tf on tf.FlatID = tfc.FlatID Where FlatLoginID =@Flatloginid
        End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewFlatCustomerbyFlatLoginID1]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE Procedure [dbKey2h].[ViewFlatCustomerbyFlatLoginID1] 
        @Flatloginid NVARCHAR (256),
        @Mpin varchar(4)
        As  
        Begin  
        select * from tblFlatCustomerBookingDetails tfc left join tblflat tf on tf.FlatID = tfc.FlatID Where FlatLoginID =@Flatloginid and MPIN=@Mpin  
        End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewFlatCustomerbyFlatName]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE Procedure [dbKey2h].[ViewFlatCustomerbyFlatName]  
        @Flatname NVARCHAR (256)
        As  
        Begin  
        select COUNT(*)  from tblFlatCustomerBookingDetails tfc left join tblflat tf on tf.FlatID = tfc.FlatID Where Flatname=@Flatname
        End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewFlatCustomerbyFlatName1]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE Procedure [dbKey2h].[ViewFlatCustomerbyFlatName1] 
        @Flatname NVARCHAR (256),
        @Mpin varchar(4)
        As  
        Begin  
        select * from tblFlatCustomerBookingDetails tfc left join tblflat tf on tf.FlatID = tfc.FlatID Where Flatname=@Flatname and MPIN=@Mpin  
        End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewFlatCustomerDemandsByFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbKey2h].[ViewFlatCustomerDemandsByFlatID] 
@FlatID int
As
Begin
 Select * from tblFlatCustomerDemands  where FlatID=@FlatID
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewFlatCustomisationTransactionListByFlatIDandPUpdatedBy]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE Procedure [dbKey2h].[ViewFlatCustomisationTransactionListByFlatIDandPUpdatedBy]      
@FlatID Int,    
@PaymentUpdatedBy nvarchar(50)    
As      
Begin      
Select TBCT.CTID,TBCT.FlatID,TBCT.CDemandID,TBCT.PaidAmount,TBCT.ReceiptPDF,  TCA.CustomizationWork, TPM.PaymentMode,TBCT.PaymentUpdatedBy,TBCT.PaymentUpdatedDate FROM tblFlatCustomisationTransaction TBCT   
Left Join tblFlatCustomisationDemands TBLD on TBLD.CDemandID=TBCT.CDemandID  
Left Join tblPaymentMode TPM on TBCT.PaymentMode = TPM.PaymentModeID  
left join tblFlatCustomisationWorks TFW on TBLD.CWID=TFW.CWID
LEFT JOIN tblCustomisationWorkApproval TCA 
        ON TFW.WorkTitle = TCA.CWAID 


where TBCT.FlatID=@FlatID  and TBCT.PaymentUpdatedBy=@PaymentUpdatedBy  Order by TBCT.RecAddedDate Desc  
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewFlatDemandPaymentLabelNameByPLID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure  [dbKey2h].[ViewFlatDemandPaymentLabelNameByPLID]
@PaymentLabelID int
As
Begin
Select * from tblPaymentLabels where PID=@PaymentLabelID
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewflatfloorplanByID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create procedure [dbKey2h].[ViewflatfloorplanByID]
    @FlatID int
    As
    Begin
    select * from tblFlatFloorPlan where FlatID=@FlatID
    End

GO
/****** Object:  StoredProcedure [dbKey2h].[ViewflatFloorPlansbyFilter]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbKey2h].[ViewflatFloorPlansbyFilter]                
    @ProjectID INT = NULL,    
    @BlockID INT = NULL,    
    @FlatID INT = NULL,    
    @FlatFloorPlanID INT = NULL    
AS                
BEGIN                
    SET NOCOUNT ON;                

    WITH CTE AS (  
        SELECT *,   
               ROW_NUMBER() OVER (PARTITION BY FlatID ORDER BY AddedDate DESC) AS rn  
        FROM tblFlatFloorPlan  
        WHERE (@ProjectID IS NULL OR ProjectID = @ProjectID)  
          AND (@BlockID IS NULL OR BlockID = @BlockID)  
          AND (@FlatID IS NULL OR FlatID = @FlatID)  
          AND (@FlatFloorPlanID IS NULL OR FlatFloorPlanID = @FlatFloorPlanID)  
    )  
    SELECT * FROM CTE WHERE rn = 1  
    ORDER BY AddedDate DESC;   
END;
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewFlatHouseFacing]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ViewFlatHouseFacing]
As
Begin
Select * from tblFlatHouseFacing
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewFlatImageByprogressID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[ViewFlatImageByprogressID]  
@FlatProgressID int  
As  
Begin  
  select * from tblProjectFlatProgressImage where FlatProgressID =@FlatProgressID  
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewFlatImageByprogressImageID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[ViewFlatImageByprogressImageID]    
@FlatProgressImageID int    
As    
Begin    
  select * from tblProjectFlatProgressImage where FlatProgressImageID =@FlatProgressImageID
End  
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewFlatLoginCodebyProjectID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[ViewFlatLoginCodebyProjectID]  
@ProjectID int  
As  
Begin  
select * from  tblProjects where ProjectID=@ProjectID  
End 
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewFlatprojectID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[ViewFlatprojectID]        
@ID int        
As        
Begin        
Select tblp.ProjectID,tblp.AddedBy,tblpi.* from tblFlatProgress  tblp  left join  tblProjectFlatProgressImage   tblpi  on tblp.FlatProgressID =tblpi.FlatProgressID   where tblpi.FlatProgressID=@ID        
ENd
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewFlatQualityReportbyFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE Procedure [dbKey2h].[ViewFlatQualityReportbyFlatID]  
        @FlatID int  
        As  
        Begin  
        select * from tblFlatQualityReports Where FlatID=@FlatID  
        End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewLatestBroadcast]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ViewLatestBroadcast]

As
Begin
SELECT TOP 1 * FROM tblBroadcasts inner join tblprojects on tblBroadcasts.ProjectID = tblprojects.ProjectID order by CreatedDate desc 
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewNotificationsbyFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ViewNotificationsbyFlatID]
@FlatID int 
As
Begin

    SELECT TOP 20 * 
    FROM tblFlatNotifications where FlatID=@FlatID and ListStatus=1
    ORDER BY CreatedDate DESC


End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewNotificationsbyID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ViewNotificationsbyID]
@FNID INT
As
Begin

select * from tblFlatNotifications  where  FNID=@FNID


End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewPaymentScheduleByFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbKey2h].[ViewPaymentScheduleByFlatID]
@FlatID int  
As  
Begin  
select tbs.*,tpl.PaymentLabel from tblCustomerPaymentSchedule tbs left join tblPaymentLabels TPL on tbs.PaymentLabelID =TPL.PID where FlatID=@FlatID
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewPaymentsheduleByFlatandPLID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ViewPaymentsheduleByFlatandPLID]
@FlatID int,
@PaymentLabelID int
As
Begin
Select * from tblCustomerPaymentSchedule where PaymentLabelID=@PaymentLabelID and FlatID=@FlatID
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewProjectCostLabels]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbKey2h].[ViewProjectCostLabels]  

        as  
        Begin  
        Select * from tblProjectCostLabels   
        End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewprojectImageByprogressID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[ViewprojectImageByprogressID]  
@progressID int  
As  
Begin  
  select * from tblProjectProgressImage where ProgressID=@progressID  order by ProgressImageID DESC
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewprojectImageByprogressImageID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[ViewprojectImageByprogressImageID]  
@progressImageID int  
As  
Begin  
  select * from tblProjectProgressImage where ProgressImageID=@progressImageID 
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewProjectPaymentStages]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbKey2h].[ViewProjectPaymentStages]

As
Begin

select * from tblPaymentLabels where 1=1 order by PID asc 

End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewProjectprogressByID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ViewProjectprogressByID]
@ID int
As
Begin
Select * from tblProjectProgress where ProgressID=@ID
ENd
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewProjectprogressImagesByID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ViewProjectprogressImagesByID]
@ID int
As
Begin

Select * from tblProjectProgressImage where ProgressID=@ID

ENd
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewProjectprojectID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbKey2h].[ViewProjectprojectID]        
@ID int        
As        
Begin        
Select tblp.ProjectID,tblp.AddedBy,tblpi.* from tblProjectProgress  tblp  left join  tblProjectProgressImage   tblpi  on tblp.ProgressID=tblpi.ProgressID   where tblpi.ProgressID=@ID        order by tblpi.ProgressImageID DESC 
ENd  
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewProjectsByID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbKey2h].[ViewProjectsByID]
@ProjectID int
As
Begin
Select * from tblProjects left join tblProjectHomeScreen on tblProjects.ProjectID = tblProjectHomeScreen.ProjectID where tblProjects.ProjectID=@ProjectID
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewProjectSpecifications]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbKey2h].[ViewProjectSpecifications]   

AS  
BEGIN    
    SET NOCOUNT ON;    
SELECT 
    ts.ProjectID,
    tp.ProjectName,
    MAX(ts.SpecificationTitle) AS SpecificationTitle,
    MAX(ts.SpecificationDetails) AS SpecificationDetails
FROM 
    tblProjectSpecificationDetails ts
INNER JOIN 
    tblProjects tp ON ts.ProjectID = tp.ProjectID
GROUP BY 
    ts.ProjectID, tp.ProjectName; 

END




GO
/****** Object:  StoredProcedure [dbKey2h].[ViewProjectSpecificationsbyProjectID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbKey2h].[ViewProjectSpecificationsbyProjectID]   
@ProjectID int
AS  
BEGIN    
    SET NOCOUNT ON;    
SELECT * FROM tblProjectSpecificationDetails ts inner join tblProjects tp on ts.ProjectID = tp.ProjectID  where ts.ProjectID = @ProjectID
 

END


GO
/****** Object:  StoredProcedure [dbKey2h].[ViewRMDetailbyRMID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbKey2h].[ViewRMDetailbyRMID]  
@RMID int  
as  
begin  
select * from tblClientUsers
 where UserID=@RMID  
End  
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewRMDetails]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbKey2h].[ViewRMDetails]
@AddedBy nvarchar(50)
As
Begin
Select * from tblClientUsers where ClientID =@AddedBy
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewStateByStateID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbKey2h].[ViewStateByStateID]
@StateID int
As
Begin
select * from  tblState where StateID=@StateID and Statestatus='1'
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewUnitdType]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ViewUnitdType]
As
Begin
Select * from tblFlatUnitdType
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViewValidClientUserLogin]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbKey2h].[ViewValidClientUserLogin]  
@Username nvarchar(100),  
@Password nvarchar(100)  
as  
begin  
select * from tblClientUsers where Username=@Username and Password=@Password   
End
GO
/****** Object:  StoredProcedure [dbKey2h].[ViStateByID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbKey2h].[ViStateByID]
@SID int
As
Begin
select * from tblState where StateID=@SID
END
GO
/****** Object:  StoredProcedure [dbo].[AlreadyExistFlatProgressByPIDandFIDandDate]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AlreadyExistFlatProgressByPIDandFIDandDate]   
@ProjectID int,  
@FlatID int,  
@Month varchar(50),  
@year int  
AS   
BEGIN  
SELECT  *  FROM   tblFlatProgress  where ProjectID=@ProjectID and Month=@Month and Year=@year and FlatID=@FlatID
End
GO
/****** Object:  StoredProcedure [dbo].[AlreadyExistProjectProgressByProjectIDandDate]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AlreadyExistProjectProgressByProjectIDandDate] 
@ProjectID int,
@Month varchar(50),
@year int
AS 
BEGIN
SELECT  *  FROM   tblProjectProgress  where ProjectID=@ProjectID and Month=@Month and Year=@year
End
GO
/****** Object:  StoredProcedure [dbo].[AlreadyExistReferScreenbyProjectID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AlreadyExistReferScreenbyProjectID] 
@ProjectID INT
  
AS      
BEGIN        
 select * from tblProjectReferScreen where ProjectID=@ProjectID
    

END
GO
/****** Object:  StoredProcedure [dbo].[dbo.AddProjects]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[dbo.AddProjects]
@ClientID int,
@ProjectName varchar(200),
@ProjectLogo varchar(200),
@Location varchar(256),
@Address varchar(256),
@State int,
@City int,
@PostalCode int,
@GoogleMapLink nvarchar(200),
@BlockCount int,
@FlatCount int,
@LandArea varchar(256),
@RERANumber nvarchar(512),
@ProjectStatus int,
@ProjectDisplayStatus bit,
@ProjectStatusPercentage int,
@SplashScreenImage nvarchar(512),
@LocationMap varchar(256),
@BankName varchar(256),
@AccountName varchar(256),
@AccountNumber int,
@IFSCNumber varchar(256),
@BranchName varchar(256),
@AddedBy varchar(256),
@AddedDate datetime
As
Begin
insert into tblProjects(ClientID,ProjectName,ProjectLogo,Location,Address,State,City,PostalCode,GoogleMapLink,BlockCount,FlatCount,LandArea,RERANumber,ProjectStatus,ProjectDisplayStatus,ProjectStatusPercentage,SplashScreenImage,LocationMap,BankName,AccountName,AccountNumber,IFSCNumber,BranchName,AddedBy,AddedDate) values(@ClientID,@ProjectName,@ProjectLogo,@Location,@Address,@State,@City,@PostalCode,@GoogleMapLink,@BlockCount,@FlatCount,@LandArea,@RERANumber,@ProjectStatus,@ProjectDisplayStatus,@ProjectStatusPercentage,@SplashScreenImage,@LocationMap,@BankName,@AccountName,@AccountNumber,@IFSCNumber,@BranchName,@AddedBy,@AddedDate)
End
GO
/****** Object:  StoredProcedure [dbo].[dbo.UpdateProjects]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[dbo.UpdateProjects]
@ProjectID int,
@ClientID int,
@ProjectName varchar(200),
@ProjectLogo varchar(200),
@Location varchar(256),
@Address varchar(256),
@State int,
@City int,
@PostalCode int,
@GoogleMapLink nvarchar(200),
@BlockCount int,
@FlatCount int,
@LandArea varchar(256),
@RERANumber nvarchar(512),
@ProjectStatus int,
@ProjectDisplayStatus bit,
@ProjectStatusPercentage int,
@SplashScreenImage nvarchar(512),
@LocationMap varchar(256),
@BankName varchar(256),
@AccountName varchar(256),
@AccountNumber int,
@IFSCNumber varchar(256),
@BranchName varchar(256),
@UpdatedBy varchar(256),
@UpdatedDate datetime
As
Begin
Update tblProjects 
set
ClientID=@ClientID,
ProjectName=@ProjectName
,ProjectLogo=@ProjectLogo,
Location=@Location,
Address=@Address,
State=@State,
City=@City,
PostalCode=@PostalCode,
GoogleMapLink=@GoogleMapLink,
BlockCount=@BlockCount,
FlatCount=@FlatCount,
LandArea=@LandArea,
RERANumber=@RERANumber,
ProjectStatus=@ProjectStatus,
ProjectDisplayStatus=@ProjectDisplayStatus,
ProjectStatusPercentage=@ProjectStatusPercentage,
SplashScreenImage=@SplashScreenImage,
LocationMap=@LocationMap,
BankName=@BankName,
AccountName=@AccountName,
AccountNumber=@AccountNumber,
IFSCNumber=@IFSCNumber,
BranchName=@BranchName,
UpdatedBy=@UpdatedBy,UpdatedDate=@UpdatedDate  where ProjectID=@ProjectID
End
GO
/****** Object:  StoredProcedure [dbo].[DeleteProjects]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[DeleteProjects]
@ProjectID int
as
Begin
Delete tblProjects where ProjectID=@ProjectID
End
GO
/****** Object:  StoredProcedure [dbo].[GetFlatDetailsByProjectAndFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetFlatDetailsByProjectAndFlatID]
    @ProjectID INT,
    @FlatID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Fetch Flat Details
    SELECT *
    FROM tblFlat fd
    WHERE fd.FlatID = @FlatID;

    -- Fetch Cost Details
    SELECT *
    FROM tblFlatCostDetails c 
    left join tblProjectCostLabels pc on c.CostLabelID= pc.CostLabelID
    WHERE c.ProjectID = @ProjectID and c.FlatID=@FlatID;

    -- Fetch Location Details
    SELECT *
    FROM tblProjects p
    WHERE p.ProjectID = @ProjectID;

    -- Fetch Floor Plan Details
    SELECT *
    FROM tblFloorPlan fp
    WHERE fp.ProjectID = @ProjectID;
    
    -- Fetch Payment Schedule Details
    select * from tblPaymentLabels tp 
    left join tblCustomerPaymentSchedule tcs on tp.PID = tcs.PaymentLabelID 
    where tcs.FlatID = @FlatID;
    
    -- Fetch Project Snapshot Details
    select * from tblSnapshots ps 
    left join tblprojects tp on ps.ProjectID = tp.ProjectID 
    where tp.ProjectID=@ProjectID ;
    
     -- Fetch Project Snapshot Highlight Details
    select * from tblSnapshotHighlights ps 
    left join tblprojects tp on ps.ProjectID = tp.ProjectID 
    where tp.ProjectID=@ProjectID ;
    
  -- Fetch Specifications with Details
    SELECT 
        *
    FROM 
        tblProjectSpecificationDetails  
 
    WHERE 
       ProjectID = @ProjectID;
       
    -- Fetch Amenities Details
    select * from tblProjectAmenities tp 
    where ProjectID = @ProjectID;
    
END;

GO
/****** Object:  StoredProcedure [dbo].[SpViewAllProjects]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SpViewAllProjects]
As
Begin
Select * from tblProjects
End
GO
/****** Object:  StoredProcedure [dbo].[ViewAllQualityReportsByFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewAllQualityReportsByFlatID]
    @FlatID INT,
    @ProjectID INT
AS
BEGIN
    -- Fetch data from tblprojectqualityreports
    SELECT 
        PDFName, 
        Title, 
        AddedDate, 
        'Project' AS ReportType
    FROM tblProjectQualityReports
    WHERE ProjectID = @ProjectID

    UNION ALL

    -- Fetch data from tblflatqualityreports
    SELECT 
        PDFName, 
        Title, 
        AddedDate, 
        'Flat' AS ReportType
    FROM tblFlatQualityReports
    WHERE FlatID = @FlatID
END
GO
/****** Object:  StoredProcedure [dbo].[ViewAllReferScreencontent]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewAllReferScreencontent] 
@ProjectID INT
  
AS      
BEGIN        
    SET NOCOUNT ON;        
        
    -- Convert empty strings to NULL
    SET @ProjectID = CASE WHEN ISNULL(@ProjectID, '') = '' THEN NULL ELSE @ProjectID END;
        
    -- Declare variables for dynamic SQL  
    DECLARE @SQL NVARCHAR(MAX);        
    DECLARE @ParameterDef NVARCHAR(MAX);        
        
    -- Define the parameter definition  
    SET @ParameterDef = '@ProjectID INT';        
        
    -- Base query (always returns records if no parameters are provided)  
    SET @SQL = 'SELECT * FROM tblProjectReferScreen WHERE 1 = 1';        
        
    -- Add filters dynamically based on the presence of parameters  
    IF (@ProjectID IS NOT NULL)        
    BEGIN        
        SET @SQL = @SQL + ' AND ProjectID = @ProjectID';        
    END        
        
   
        
    -- Add an ORDER BY clause  
    SET @SQL = @SQL + ' ORDER BY AddedDate DESC';        
        
    -- Execute the dynamic SQL query  
    EXEC sp_executesql @SQL,       
        @ParameterDef,       
        @ProjectID = @ProjectID 
    

END
GO
/****** Object:  StoredProcedure [dbo].[ViewAppVersion]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewAppVersion] 

AS
BEGIN

   SELECT * FROM tblAppVersion 

	
END
GO
/****** Object:  StoredProcedure [dbo].[ViewClientMenubyClientID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewClientMenubyClientID] 
@ClientID int 
AS
BEGIN

   SELECT * FROM tblClientAppMenu tc left join tblAppMenu ta on tc.MenuID = ta.MenuID  where ClientID=@ClientID order by DisplayOrder asc 

END

GO
/****** Object:  StoredProcedure [dbo].[ViewClientSideMenubyClientID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewClientSideMenubyClientID] 
@ClientID int, 
@FlatID INT 
AS
BEGIN

-- Declare a variable to check if the FlatID exists in tblFlatCustomisationWorks
    DECLARE @FlatExists INT;

    -- Check if the FlatID exists in tblFlatCustomisationWorks
    SELECT @FlatExists = COUNT(*) 
    FROM tblFlatCustomisationWorks 
    WHERE FlatID = @FlatID;

    -- Retrieve menu items for the client
    SELECT * 
    FROM tblClientSideMenu 
    WHERE ClientID = @ClientID
    AND (
        -- Include the "Customisation" menu if FlatID exists in tblFlatCustomisationWorks
        (DisplayOrder = 6 AND @FlatExists > 0)
        OR DisplayOrder != 6
    )
    ORDER BY DisplayOrder ASC;

END

GO
/****** Object:  StoredProcedure [dbo].[ViewClientSubAppMenubyClientID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewClientSubAppMenubyClientID] 
@ClientID int 
AS
BEGIN

   SELECT * FROM tblClientSubAppMenu tc left join tblSubAppMenu ta on tc.SubMenuID = ta.SubMenuID where ClientID=@ClientID 

END

GO
/****** Object:  StoredProcedure [dbo].[ViewContactScreenDetailsbyFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewContactScreenDetailsbyFlatID] 
@FlatID int 
AS
BEGIN

   SELECT * FROM tblClientUsers tc left join tblFlatCustomerBookingDetails tb on tc.UserID = tb.CRMID where FlatID=@FlatID 

END
GO
/****** Object:  StoredProcedure [dbo].[ViewFlatCustomisationDemandByFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewFlatCustomisationDemandByFlatID]
    @FlatID INT
AS
BEGIN

    SELECT 
      *
    FROM tblFlatCustomisationDemands tc left join tblFlatCustomisationWorks tw on tc.CWID = tw.CWID 
    WHERE tc.FlatID = @FlatID
END
GO
/****** Object:  StoredProcedure [dbo].[ViewFlatCustomisationTransactionByFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewFlatCustomisationTransactionByFlatID] 
@FlatID int 
AS
BEGIN

SELECT 
    tp.WorkTitle,
    tr.PaymentUpdatedDate,
    tr.ReceiptPDF,
    tr.PaymentStatus,
    pm.PaymentMode AS PaymentMode,
    tr.PaidAmount
FROM tblFlatCustomisationTransaction tr
LEFT JOIN tblFlatCustomisationDemands tf ON tr.CDemandID = tf.CDemandID
LEFT JOIN tblFlatCustomisationWorks tp ON tf.CWID = tp.CWID
LEFT JOIN tblPaymentMode pm ON tr.PaymentMode = pm.PaymentModeID
WHERE tr.FlatID = @FlatID;

SELECT 
    ISNULL(SUM(Amount), 0) AS TotalAmount,
    ISNULL((SELECT SUM(PaidAmount) 
            FROM tblFlatCustomisationTransaction 
            WHERE FlatID = @FlatID AND PaymentStatus = 'Paid'), 0) AS AmountPaid,
    ISNULL(SUM(Amount), 0) - 
    ISNULL((SELECT SUM(PaidAmount) 
            FROM tblFlatCustomisationTransaction 
            WHERE FlatID = @FlatID AND PaymentStatus = 'Paid'), 0) AS Balance
FROM tblFlatCustomisationDemands
WHERE FlatID = @FlatID;

END
GO
/****** Object:  StoredProcedure [dbo].[ViewFlatCustomisationWorkByFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewFlatCustomisationWorkByFlatID]
    @FlatID INT
AS
BEGIN

    SELECT 
        tp.WorkProgress as WorkStatus, 
        tw.WorkTitle, 
        tw.AddedDate, 
        tp.ColorCode as ColorCode,
        tw.Amount
    FROM tblFlatCustomisationWorks tw left join tblCustomizationWorkProgressStatus tp on tw.WorkStatus = tp.WorkProgressID 
    WHERE FlatID = @FlatID
END
GO
/****** Object:  StoredProcedure [dbo].[ViewFlatDemandDetailsbyFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewFlatDemandDetailsbyFlatID] 
@FlatID int 
AS
BEGIN

   SELECT * FROM tblFlatCustomerDemands tf left join tblPaymentLabels tp on tf.PaymentLabelID = tp.PID  where FlatID=@FlatID 

	
END
GO
/****** Object:  StoredProcedure [dbo].[ViewFlatTransactionsbyFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewFlatTransactionsbyFlatID] 
@FlatID int 
AS
BEGIN

SELECT 
    -- Summate cost from tblFlatCostDetails based on parameters a, b, d, f, g
    ISNULL(
        (SELECT SUM(fcd.Cost) 
         FROM tblFlatCostDetails fcd
         JOIN tblProjectCostLabels pcl 
           ON fcd.CostLabelID = pcl.CostLabelID -- Assuming CostLabelID links to tblProjectCostLabels
         WHERE fcd.FlatID = @FlatID  
           AND pcl.Parameter IN ('a', 'b', 'd', 'f', 'g')
        ), 0) AS TotalAmount,
    
    -- Summate PaidAmount from tblFlatCustomerTransaction where PaymentStatus is 'Paid'
    ISNULL(
        (SELECT SUM(fct.PaidAmount) 
         FROM tblFlatCustomerTransaction fct
         WHERE fct.FlatID = @FlatID
           AND fct.PaymentStatus = 'Paid'
        ), 0) AS AmountPaid,

    -- Calculate Balance as TotalAmount - AmountPaid
    ISNULL(
        (SELECT SUM(fcd.Cost) 
         FROM tblFlatCostDetails fcd
         JOIN tblProjectCostLabels pcl 
           ON fcd.CostLabelID = pcl.CostLabelID
         WHERE fcd.FlatID = @FlatID 
           AND pcl.Parameter IN ('a', 'b', 'd', 'f', 'g')
        ), 0) 
    - 
    ISNULL(
        (SELECT SUM(fct.PaidAmount) 
         FROM tblFlatCustomerTransaction fct
         WHERE fct.FlatID = @FlatID 
           AND fct.PaymentStatus = 'Paid'
        ), 0) AS Balance;
        
SELECT 
    tp.DisplayOrder,
    tp.PaymentLabel,
    tr.PaymentUpdatedDate,
    tr.ReceiptPDF,
    tr.PaymentStatus,
    pm.PaymentMode AS PaymentMode,
    tr.PaidAmount
FROM tblFlatCustomerTransaction tr
LEFT JOIN tblFlatCustomerDemands tf ON tr.DemandID = tf.DemandID
LEFT JOIN tblPaymentLabels tp ON tf.PaymentLabelID = tp.PID
LEFT JOIN tblPaymentMode pm ON tr.PaymentMode = pm.PaymentModeID
WHERE tr.FlatID = @FlatID;



END
GO
/****** Object:  StoredProcedure [dbo].[ViewProjectFlatProgressbyFlatID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewProjectFlatProgressbyFlatID] 
@FlatID int 
AS
BEGIN

     SELECT 
        *
    FROM 
        tblFlatProgress ts
    LEFT JOIN 
        tblProjectFlatProgressImage tsd 
    ON 
        ts.FlatProgressID = tsd.FlatProgressID
    WHERE 
        ts.FlatID = @FlatID

END
GO
/****** Object:  StoredProcedure [dbo].[ViewProjectHomeScreenbyProjectID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewProjectHomeScreenbyProjectID] 
@ProjectID int 
AS
BEGIN

     SELECT 
        *
    FROM 
        tblProjectHomeScreen
    WHERE 
     ProjectID = @ProjectID

END
GO
/****** Object:  StoredProcedure [dbo].[ViewProjectHomeScreenMenubyClientIDProjectID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewProjectHomeScreenMenubyClientIDProjectID] 
@ProjectID int,
@ClientID int 
AS
BEGIN

     SELECT 
        *
    FROM 
        tblProjectHomeScreen left join tblprojects on tblProjects.ProjectID = tblProjectHomeScreen.ProjectID
    WHERE 
     tblProjectHomeScreen.ProjectID = @ProjectID ;
     
    SELECT * FROM tblClientAppMenu tc left join tblAppMenu ta on tc.MenuID = ta.MenuID where ClientID=@ClientID order by DisplayOrder asc 
     

END
GO
/****** Object:  StoredProcedure [dbo].[ViewProjectProgressbyProjectID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[ViewProjectProgressbyProjectID]
@ProjectID int
As
Begin
Select * from tblProjectProgress tp left join tblprojectprogressimage tpp on tp.ProgressID = tpp.ProgressID  where ProjectID=@ProjectID
End
GO
/****** Object:  StoredProcedure [dbo].[ViewProjectsByID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[ViewProjectsByID]
@ProjectID int
As
Begin
Select * from tblProjects where ProjectID=@ProjectID
End
GO
/****** Object:  StoredProcedure [dbo].[ViewProjectSplashScreenandLogo]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewProjectSplashScreenandLogo] 
@ProjectID int 
AS
BEGIN

   SELECT * FROM tblProjects where ProjectID=@ProjectID 

	
END
GO
/****** Object:  StoredProcedure [dbo].[ViewProjectWhatshappeningbyProjectID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewProjectWhatshappeningbyProjectID] 
@ProjectID int 
AS
BEGIN

   SELECT * FROM tblProjectWhatsHappening where ProjectID=@ProjectID 

	
END
GO
/****** Object:  StoredProcedure [dbo].[ViewReferScreenContentbyProjectID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewReferScreenContentbyProjectID] 
@ProjectID int 
AS
BEGIN

   SELECT * FROM tblProjectReferScreen  where ProjectID=@ProjectID 

	
END
GO
/****** Object:  StoredProcedure [dbo].[ViewReferScreenContentbyReferID]    Script Date: 28-02-2025 19:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewReferScreenContentbyReferID] 
@ID int 
AS
BEGIN

   SELECT * FROM tblProjectReferScreen  where ReferScreenID =@ID 

	
END
GO
