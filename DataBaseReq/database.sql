USE [PassControl]
GO
/****** Object:  Table [dbo].[Pass]    Script Date: 23.01.2023 8:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pass](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PassAuthenticator] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Pass] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 23.01.2023 8:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[SecondName] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersPass]    Script Date: 23.01.2023 8:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersPass](
	[PassID] [int] NOT NULL,
	[PassTimeEnter] [datetime] NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_UsersPass_1] PRIMARY KEY CLUSTERED 
(
	[PassID] ASC,
	[PassTimeEnter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Pass] ON 

INSERT [dbo].[Pass] ([ID], [PassAuthenticator]) VALUES (6, N'АР-011-19ФВ')
INSERT [dbo].[Pass] ([ID], [PassAuthenticator]) VALUES (7, N'РО-014-01ЛЙ')
INSERT [dbo].[Pass] ([ID], [PassAuthenticator]) VALUES (8, N'ДВ-201-11БР')
INSERT [dbo].[Pass] ([ID], [PassAuthenticator]) VALUES (9, N'ЖУ-400-20ТР')
SET IDENTITY_INSERT [dbo].[Pass] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Role], [Password], [FirstName], [SecondName]) VALUES (5, N'Пользователь', N'JSfdgw134**1', N'Илья', N'Громов')
INSERT [dbo].[Users] ([ID], [Role], [Password], [FirstName], [SecondName]) VALUES (6, N'Пользователь', N'dfhSLS131(!', N'Диана', N'Соболева')
INSERT [dbo].[Users] ([ID], [Role], [Password], [FirstName], [SecondName]) VALUES (7, N'Системный администратор', N';hfg!!QDD', N'Александр', N'Болдырев')
INSERT [dbo].[Users] ([ID], [Role], [Password], [FirstName], [SecondName]) VALUES (8, N'Секретарь', N'DGKd!*le', N'Елисей', N'Соболев')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[UsersPass] ([PassID], [PassTimeEnter], [UserID]) VALUES (6, CAST(N'2015-04-20T15:33:00.000' AS DateTime), 5)
INSERT [dbo].[UsersPass] ([PassID], [PassTimeEnter], [UserID]) VALUES (7, CAST(N'2020-07-21T11:09:00.000' AS DateTime), 6)
INSERT [dbo].[UsersPass] ([PassID], [PassTimeEnter], [UserID]) VALUES (8, CAST(N'2019-11-15T14:21:00.000' AS DateTime), 7)
INSERT [dbo].[UsersPass] ([PassID], [PassTimeEnter], [UserID]) VALUES (9, CAST(N'2016-03-01T12:45:00.000' AS DateTime), 8)
GO
ALTER TABLE [dbo].[UsersPass]  WITH CHECK ADD  CONSTRAINT [FK_UsersPass_Pass] FOREIGN KEY([PassID])
REFERENCES [dbo].[Pass] ([ID])
GO
ALTER TABLE [dbo].[UsersPass] CHECK CONSTRAINT [FK_UsersPass_Pass]
GO
ALTER TABLE [dbo].[UsersPass]  WITH CHECK ADD  CONSTRAINT [FK_UsersPass_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UsersPass] CHECK CONSTRAINT [FK_UsersPass_Users]
GO
