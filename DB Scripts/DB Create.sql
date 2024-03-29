USE [GameTrack]
GO
/****** Object:  User [GameTrackAdmin]    Script Date: 1/31/2014 2:52:44 PM ******/
CREATE USER [GameTrackAdmin] FOR LOGIN [GameTrackAdmin] WITH DEFAULT_SCHEMA=[GameTrack]
GO
/****** Object:  User [GameTrackerSite]    Script Date: 1/31/2014 2:52:44 PM ******/
CREATE USER [GameTrackerSite] FOR LOGIN [GameTrackerSite] WITH DEFAULT_SCHEMA=[gt]
GO
ALTER ROLE [db_datareader] ADD MEMBER [GameTrackerSite]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [GameTrackerSite]
GO
/****** Object:  Schema [gt]    Script Date: 1/31/2014 2:52:44 PM ******/
CREATE SCHEMA [gt]
GO
/****** Object:  Table [gt].[Alias]    Script Date: 1/31/2014 2:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gt].[Alias](
	[Name] [nvarchar](256) NOT NULL,
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ClanId] [bigint] NULL,
 CONSTRAINT [PK_Alias] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [gt].[AliasRating]    Script Date: 1/31/2014 2:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gt].[AliasRating](
	[AliasId] [bigint] NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[Rating] [int] NOT NULL,
 CONSTRAINT [PK_AliasRating] PRIMARY KEY CLUSTERED 
(
	[AliasId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [gt].[Clan]    Script Date: 1/31/2014 2:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gt].[Clan](
	[Name] [nvarchar](256) NOT NULL,
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [gt].[Game]    Script Date: 1/31/2014 2:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [gt].[Game](
	[Name] [varchar](526) NOT NULL,
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [gt].[Player]    Script Date: 1/31/2014 2:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gt].[Player](
	[UniqueId] [nvarchar](256) NOT NULL,
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Player] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [gt].[PlayerAlias]    Script Date: 1/31/2014 2:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gt].[PlayerAlias](
	[PlayerId] [bigint] NOT NULL,
	[AliasId] [bigint] NOT NULL,
 CONSTRAINT [PK_PlayerAlias] PRIMARY KEY CLUSTERED 
(
	[PlayerId] ASC,
	[AliasId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [gt].[PlayerGame]    Script Date: 1/31/2014 2:52:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gt].[PlayerGame](
	[PlayerId] [bigint] NOT NULL,
	[GameId] [bigint] NOT NULL
) ON [PRIMARY]

GO
ALTER TABLE [gt].[Alias]  WITH CHECK ADD  CONSTRAINT [FK_Alias_Clan] FOREIGN KEY([Id])
REFERENCES [gt].[Clan] ([Id])
GO
ALTER TABLE [gt].[Alias] CHECK CONSTRAINT [FK_Alias_Clan]
GO
ALTER TABLE [gt].[AliasRating]  WITH CHECK ADD  CONSTRAINT [FK_AliasRating_Alias] FOREIGN KEY([AliasId])
REFERENCES [gt].[Alias] ([Id])
GO
ALTER TABLE [gt].[AliasRating] CHECK CONSTRAINT [FK_AliasRating_Alias]
GO
ALTER TABLE [gt].[PlayerAlias]  WITH CHECK ADD  CONSTRAINT [FK_PlayerAlias_Alias] FOREIGN KEY([AliasId])
REFERENCES [gt].[Alias] ([Id])
GO
ALTER TABLE [gt].[PlayerAlias] CHECK CONSTRAINT [FK_PlayerAlias_Alias]
GO
ALTER TABLE [gt].[PlayerAlias]  WITH CHECK ADD  CONSTRAINT [FK_PlayerAlias_Player] FOREIGN KEY([PlayerId])
REFERENCES [gt].[Player] ([Id])
GO
ALTER TABLE [gt].[PlayerAlias] CHECK CONSTRAINT [FK_PlayerAlias_Player]
GO
ALTER TABLE [gt].[PlayerGame]  WITH CHECK ADD  CONSTRAINT [FK_PlayerGame_Game] FOREIGN KEY([GameId])
REFERENCES [gt].[Game] ([Id])
GO
ALTER TABLE [gt].[PlayerGame] CHECK CONSTRAINT [FK_PlayerGame_Game]
GO
ALTER TABLE [gt].[PlayerGame]  WITH CHECK ADD  CONSTRAINT [FK_PlayerGame_Player] FOREIGN KEY([PlayerId])
REFERENCES [gt].[Player] ([Id])
GO
ALTER TABLE [gt].[PlayerGame] CHECK CONSTRAINT [FK_PlayerGame_Player]
GO
