USE [aspnet-QLTour-20230308090130]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 3/19/2023 11:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/19/2023 11:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/19/2023 11:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/19/2023 11:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/19/2023 11:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/19/2023 11:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202303090948080_InitialCreate', N'QLTour.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3B6127E2F70FE83A0A7738AD4CAA5BBD813D82D52276983E676D6D9E2BC2D68897684952855A2D204457F591FFA93CE5F3843DD2CDE24CA566CA758606191C36F86C321391C0EF3BF3FFF1A7FFF1C06D6134E523F2213FB6874685B98B891E793E5C4CEE8E29B0FF6F7DFFDE3ABF185173E5BBF5474278C0E5A9274623F521A9F3A4EEA3EE210A5A3D07793288D1674E446A183BCC8393E3CFCB77374E46080B001CBB2C61F3342FD10E71FF0398D888B639AA1E026F2709096E55033CB51AD5B14E234462E9ED8FFB97E88B2645410DAD659E02310628683856D2142228A288878FA29C5339A4464398BA100050F2F3106BA050A525C8A7EBA2237EDC5E131EB85B36A5841B9594AA3B027E0D149A916476CBE9672ED5A6DA0B80B50307D61BDCE9537B1AF3C9C177D8C025080C8F0741A248C7862DFD42CCED2F816D351D57054405E2600F75B947C1935110F2CE37607B5191D8F0ED9BF036B9A05344BF084E08C262838B0EEB379E0BB3FE39787E80B269393A3F9E2E4C3BBF7C83B79FF2D3E79D7EC29F415E8B80228BA4FA21827201B5ED4FDB72D876FE7880DEB668D368556C0966046D8D60D7ABEC664491F61AE1C7FB0AD4BFF197B5549695C9F880F13081AD12483CFDB2C08D03CC075BDD3CA93FDDFC2F5F8DDFB41B8DEA2277F990FBDC01F264E02F3EA230EF2DAF4D18F8BE9C58DF7E792EC328942F6CDDB5751FB790613D5659D89B4240F285962CA4B377656C66B64D20C6A78B3AE50F7DFB499A4B2792B495987D69909158B6DCF864ADED7E56B6C7167710C83979B16D3489BC171FBD44868786015D52B8339323518021DF93BAF7F1721F283011640032EE0762CFC24C4752F7F88C0DC10E92DF33D4A5398FFDE4F287D6C111D7E0E20FA0CBB59026639A3288C5F9DDBFD6344F06D16CE99B56F8FD76043F3F05B74895C1A251784B5DA18EF3A72BF4419BD20DE39A2F813752B40F6F9E087E600838873E6BA384D2FC198B1378DC0ABAE00AF083D39EE0DC7D6A65D3B20D300F9A1DA031156D1CF15E9CA0B5153489E88864CE58DB4897A1D2D7D62266A45AA17B5A0E814B524EB2B2A033393B4A4D40B9A1374CA59500DE6DFE52334BC8397C3EEBF87B7D9E6AD5B0B1A6A9CC10A897FC40427B08C79F788529C90D50898AC1BBB7016F2E1634C5F7D6FCA39FD82826C68566BCD867C11187E36E4B0FB3F1B7231A1F8C9F798576270ECA98801DE885E7DA2EA9E738264DB9E0E5C37B7CD7C3B6B806EBA9CA569E4FAF92C5004BCCA70052F3FF8705677ECA2E88D18FF808E81A1FB6CCB8312E89B2D1AD51D39C701A6D83A738B80E014A52EF264354287BC1E82553BAA42B0551C8417EE6B8927583A4E5823C40E4129CC549F50795AF8C4F56314746A496869B885B1BED73CC49A731C63C218766AC284B93AECC104A8F90883D2A5A1B1D3B0B87643D478ADBA31EF726157E32E4523B662931DBEB3C62E4BFFED550CB35D635B30CE76959808A00DE1EDC240CBB38AA9018807977D3350E1C4A431D0D2A5DA8A81F21ADB8181F22A7973065A1C514DC75F38AFEE9B79F207E5ED6FEBADEADA816D72FAD833D32C7C4F6843A1054E64F33C9FB34AFC4C15873390B33C9FA5A5AB2B9A08039F61CA876C56FEAED20F75DA4144236A035C195A076879F927014913AA8770552CAF55BAD28BE8015BC5DD5A61CBB55F806DD8808CDDBC046D10EAAF4A45E3343A7DD43DABAD413272A3C34203476110E2E2C577DC4029BAB8ACAC18135FB88F37DCE85839182D0AEAF05C354AAA3A33B8962AD3ECD692CA21EBE3926DA425C17DD268A9EACCE05A2A6DB45B490AA7A0875BB0918AF82D7CA0C956453AEADDA6AE1B3B455A5459307634F953E31B14C73E5936F2A9CA126B5624534DBF99F54F350A0B0CC74D151947B5B435271A256889855A600D925EFA494ACF114573C4E23C532F94C8947BAB66F9AF5836B74F7910AB7DA0A266BF8B16FC953DB7CDCA7E48D9FC123A173267268FA02B865EDDDC62A96D28408922683F8D822C247ADF4ADFBAB8BA6BB62F4A6484B123C82FF94E92A2240F97D7BAD198C8F361F3F1A9BD96F5C7480FA1D374E5733675ADF343F5285558AA89A20B55ED6CCC74EE8BE938894E61FF61EA44789DD95466A23401CAA29E188D640609AC51678ECAE79B3431F91A734421A9A4092954F590B2993AC209D9AC580B4FA351358539073959A4892ED79A232BD2469AD08AEA35B015328B75E6A88ACC9226B0A2DA1C7B956622AE9F7BBC5F698F2AEB6C58C54176B31D4B83F13A8BE1301B5EE3BEBE09D428EE8955DEC84B6065F95E1A92F634B78E2115A18BCD0C4983A15F6FB84B6E7EB969BD99D7637237D7DC92DE7673AFC7EB67AEAF6A14D2394E24A9B9D7E739E1DC362ECF50DD8F63A4435541625B951A613B7F49290E478C6034FB3598063E668B7745708388BFC0292DB235ECE3C3A363E191CDFE3C7871D2D40B146750DDAB177ECCB69078459E50E23EA2444E83D8E051C80A548A305F110F3F4FECDFF356A779B082FDCA8B0FACABF413F17FCDA0E221C9B0F5879CD6394C92BCC1B38C5AD03FDEC47B0773955FFDF773D1F4C0BA4B603A9D5A8782A2D7197EFE15442F698AA61B48B3F6DB88B73BDBB827084A5461B6ACFFE260EED3415E1B5452FE3344CFFFEA2B9AF245C146888A570343E10DA242DDAB8075B0B42F023CF8A4F98B807E9D55BF10584734EDEB009FF40713DF06982F4355CB1DEE438AB3D23696A45CCF9DB9D51B255AEE7A6F9252B0379AE8729A750FB84153A9377351DE588AF2605BA722037930EC5DDAFDABA71DEF4BA6F1CA69DF6D82F136738A5B6E90FE56A9C47B90FCA648E6D97DC2F0B66D4D17FCDDF3ACCB7E69C17B666CE536BFFBE4DF6D1B9B2E40BCE7C6D62BC577CF6C6D57FBE78E2DCD780BDD79C2AE9C7BA4B9C4514591BB12728B903B1CFFE7111841E15116EF28D519606DD9AB1D0C57247AA6FAD43391B1347124BE12453BDB7E7D2D37FCD6CE9634ED6C35099B6DBCCBF5BF957749D3CE5B9306B98B54626522A22ABDBB631D6BCB977A4BA9C35C4F3A32D5BB7CD6D61BF9B794293C8852B8D9A3B95D7E3B89C183A864C8A9D3231158BE2886BDB3F1B71661FF4EFDE50A82FDE545825D6ED7AC69AEC822AA366F41A28A4488D0DC608A3CD852CF12EA2F904BA19A05A0F387E079508F5D83CCB17745EE321A6714BA8CC379C005BC9813D0C63FCF76E6651EDFC5EC2B1DA20B20A6CF02F777E487CC0FBC5AEE4B454C4803C1BC8B32DCCBC692B2B0EFF2A546BA8D882150A9BEDA297AC0611C00587A4766E809AF231B98DF355E22F7651501D481740F04AFF6F1B98F96090AD31263D51E3EC186BDF0F9BBFF0314EEA9A972540000, N'6.4.4')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3253e2ea-49dd-4afa-b514-0f0583270cc8', N'Admin')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7087198e-ed96-4574-905b-6dce809d3c2d', N'3253e2ea-49dd-4afa-b514-0f0583270cc8')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cffe5e71-a20d-4a57-a0f0-4e76d018b1fb', N'3253e2ea-49dd-4afa-b514-0f0583270cc8')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'11b7fe15-0283-4386-baf4-eb079802961b', N'test@gmail.com', 0, N'AB5zC6KX0/+rf8kW+5cGfp7FuScTiSaheOTIqWKc9dzG6zBIDfdvTlg9nDhXnaMRmQ==', N'da28a05c-e034-43ba-a9fb-f76b7fa835ea', NULL, 0, 0, NULL, 1, 0, N'test@gmail.com')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2b903089-3843-4dca-92f0-dd519f235c9b', N'admin1@gmail.com', 0, N'AP0EqZAAMRy3kPtP1gcpWQ67PrN+Jg++1wIGHXzAtY+pbFSrLmn6qZ9mDzQaXyHByQ==', N'2621a2d2-f0b6-41e8-9e66-0408486856fe', NULL, 0, 0, NULL, 1, 0, N'admin1@gmail.com')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7087198e-ed96-4574-905b-6dce809d3c2d', N'admin@gmail.com', 0, N'APZboA5jSlodY0rfQd92l+eCIskFPaabITQ5v8NKflc5uLZvlpdIyklU8/SxHc1F7w==', N'f8040a8a-be5f-44b9-b658-c3e93420c30c', NULL, 0, 0, NULL, 1, 0, N'admin@gmail.com')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'cffe5e71-a20d-4a57-a0f0-4e76d018b1fb', N'duy@gmail.com', 0, N'AHK/ivCgLXIsFZUzZz3katO4rHyx/TAxnlB+1+oJyWYEHxmEdCLUEzhHhymPclE1FA==', N'ec7abd35-09dc-488f-92f0-a7c8cc1b7d45', NULL, 0, 0, NULL, 1, 0, N'duy@gmail.com')
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
