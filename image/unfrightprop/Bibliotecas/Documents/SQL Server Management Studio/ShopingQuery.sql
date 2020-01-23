USE [Db_Tank]
GO
/****** Object:  Table [dbo].[tuga_shop_itens]    Script Date: 10/24/2014 1:26:02 PM ******/
DROP TABLE [dbo].[tuga_shop_itens]
GO
/****** Object:  Table [dbo].[Tuga_shop_confirmacao_doacao]    Script Date: 10/24/2014 1:26:02 PM ******/
DROP TABLE [dbo].[Tuga_shop_confirmacao_doacao]
GO
/****** Object:  Table [dbo].[Tuga_shop_categorias]    Script Date: 10/24/2014 1:26:02 PM ******/
DROP TABLE [dbo].[Tuga_shop_categorias]
GO
/****** Object:  Table [dbo].[tuga_shop_auth]    Script Date: 10/24/2014 1:26:02 PM ******/
DROP TABLE [dbo].[tuga_shop_auth]
GO
/****** Object:  Table [dbo].[Tuga_record_on]    Script Date: 10/24/2014 1:26:02 PM ******/
DROP TABLE [dbo].[Tuga_record_on]
GO
/****** Object:  Table [dbo].[Tuga_noticias]    Script Date: 10/24/2014 1:26:02 PM ******/
DROP TABLE [dbo].[Tuga_noticias]
GO
/****** Object:  Table [dbo].[tuga_enquente]    Script Date: 10/24/2014 1:26:02 PM ******/
DROP TABLE [dbo].[tuga_enquente]
GO
/****** Object:  Table [dbo].[DV_Usuarios]    Script Date: 10/24/2014 1:26:02 PM ******/
DROP TABLE [dbo].[DV_Usuarios]
GO
/****** Object:  Table [dbo].[DV_Cadastrados]    Script Date: 10/24/2014 1:26:02 PM ******/
DROP TABLE [dbo].[DV_Cadastrados]
GO
/****** Object:  Table [dbo].[DV_Cadastrados]    Script Date: 10/24/2014 1:26:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[DV_Cadastrados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[hashCod] [char](7) NOT NULL,
	[login] [char](12) NOT NULL,
	[data] [char](10) NOT NULL,
	[pontos] [int] NOT NULL CONSTRAINT [DF_DV_Usuarios_pontos]  DEFAULT ((0)),
	[ip] [char](15) NOT NULL,
	[pontos_month] [int] NOT NULL CONSTRAINT [DF_DV_Cadastrados_pontos_month]  DEFAULT ((0)),
	[pontos_week] [int] NOT NULL CONSTRAINT [DF_DV_Cadastrados_pontos_week]  DEFAULT ((0))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DV_Usuarios]    Script Date: 10/24/2014 1:26:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[DV_Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[login] [char](20) NOT NULL,
	[ip] [char](15) NOT NULL,
	[data] [char](10) NOT NULL,
	[hashCadastro] [char](7) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tuga_enquente]    Script Date: 10/24/2014 1:26:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tuga_enquente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pergunta] [varchar](250) NULL,
	[op01] [varchar](50) NULL,
	[op01_n] [int] NULL,
	[op02] [varchar](50) NULL,
	[op02_n] [int] NULL,
	[op03] [varchar](50) NULL,
	[op03_n] [int] NULL,
 CONSTRAINT [PK_tuga_enquente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tuga_noticias]    Script Date: 10/24/2014 1:26:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tuga_noticias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](100) NULL,
	[imagem] [varchar](50) NULL,
	[url] [varchar](50) NULL,
	[por] [varchar](50) NULL,
	[date] [varchar](50) NULL,
	[conteudo] [varchar](5000) NULL,
	[ativado] [int] NULL,
 CONSTRAINT [PK_Tuga_noticias] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tuga_record_on]    Script Date: 10/24/2014 1:26:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tuga_record_on](
	[record] [varchar](50) NULL,
	[data] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tuga_shop_auth]    Script Date: 10/24/2014 1:26:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tuga_shop_auth](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](50) NULL,
	[auth] [int] NULL,
 CONSTRAINT [PK_tuga_shop_admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tuga_shop_categorias]    Script Date: 10/24/2014 1:26:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tuga_shop_categorias](
	[nome] [varchar](30) NULL,
	[IDCategoria] [int] NULL,
	[mostrar] [int] NULL CONSTRAINT [DF_Tuga_shop_categorias_mostrar]  DEFAULT ((0)),
	[Texto_Hover] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tuga_shop_confirmacao_doacao]    Script Date: 10/24/2014 1:26:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tuga_shop_confirmacao_doacao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](100) NULL,
	[nickname] [varchar](150) NULL,
	[valor] [varchar](150) NULL,
	[imagem] [varchar](150) NULL,
	[email] [varchar](150) NULL,
	[situacao] [int] NULL,
	[data] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tuga_shop_itens]    Script Date: 10/24/2014 1:26:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tuga_shop_itens](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nome_Item] [varchar](250) NULL,
	[Descricao_Item] [varchar](250) NULL,
	[IdItem] [varchar](50) NULL,
	[lvlitem] [varchar](50) NULL,
	[ataque] [varchar](50) NULL,
	[defesa] [varchar](50) NULL,
	[agilidade] [varchar](50) NULL,
	[sorte] [varchar](50) NULL,
	[duracao] [varchar](50) NULL,
	[vendidos] [varchar](50) NULL,
	[imagem] [varchar](50) NULL,
	[novidade] [int] NULL CONSTRAINT [DF_tuga_shop_itens_novidade]  DEFAULT ((0)),
	[promocao] [int] NULL CONSTRAINT [DF_tuga_shop_itens_promocao]  DEFAULT ((0)),
	[preco] [int] NULL,
	[categoria] [varchar](50) NULL,
	[sexo] [varchar](50) NULL,
 CONSTRAINT [PK_tuga_shop_itens] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[DV_Cadastrados] ON 

INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (1, N'7fad091', N'DarkOzzy    ', N'09/07/14  ', 0, N'177.189.159.230', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (2, N'7283873', N'sefercan    ', N'09/07/14  ', 0, N'88.231.124.197 ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (3, N'a99e4f0', N'Yuuki       ', N'09/07/14  ', 45, N'189.48.255.195 ', 45, 45)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (4, N'48e9187', N'jpaulo      ', N'09/07/14  ', 0, N'179.178.239.174', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (5, N'dc7c031', N'leticiaft   ', N'09/07/14  ', 0, N'189.76.26.165  ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (6, N'3990d7e', N'BielDeathcor', N'09/07/14  ', 0, N'189.24.94.43   ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (7, N'ebd5c1d', N'BielDeathcor', N'09/07/14  ', 0, N'189.24.94.43   ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (8, N'0d01fcc', N'BielDeathcor', N'09/07/14  ', 0, N'189.24.94.43   ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (9, N'e8f51da', N'BielDeathcor', N'09/07/14  ', 0, N'189.24.94.43   ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (11, N'2709301', N'BielDeathcor', N'09/07/14  ', 0, N'189.24.94.43   ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (12, N'8a64814', N'BielDeathcor', N'09/07/14  ', 0, N'189.24.94.43   ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (13, N'7a2d47d', N'BielDeathcor', N'09/07/14  ', 0, N'189.24.94.43   ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (17, N'ebce9cf', N'lolzinho75  ', N'09/07/14  ', 10, N'201.95.129.3   ', 10, 10)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (18, N'fa65ab1', N'zikasilas   ', N'10/07/14  ', 0, N'200.168.43.63  ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (19, N'a0e543c', N'thuy09824527', N'10/07/14  ', 0, N'123.26.123.89  ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (20, N'999b798', N'lucasneves  ', N'10/07/14  ', 0, N'179.232.116.55 ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (21, N'c30b653', N'cabbar1234  ', N'10/07/14  ', 0, N'78.161.221.159 ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (22, N'6e9ed2e', N'darknight   ', N'10/07/14  ', 0, N'189.71.155.160 ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (23, N'69a33f0', N'Wiggle      ', N'10/07/14  ', 2, N'187.112.213.100', 2, 2)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (24, N'd144636', N'L1M1T3      ', N'10/07/14  ', 3, N'201.8.124.14   ', 3, 3)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (26, N'2890994', N'Diego19044  ', N'10/07/14  ', 12, N'179.127.155.232', 12, 12)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (30, N'6b17da3', N'magabr      ', N'11/07/14  ', 0, N'177.81.201.250 ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (33, N'5545f8d', N'loko782     ', N'11/07/14  ', 1, N'177.124.45.100 ', 1, 1)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (34, N'e358946', N'Chronecross ', N'11/07/14  ', 1, N'177.63.241.36  ', 1, 1)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (37, N'ad862b9', N'ecom007     ', N'12/07/14  ', 0, N'177.195.115.237', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (41, N'1bed475', N'BielDeathcor', N'13/07/14  ', 0, N'201.51.180.75  ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (44, N'eeafc83', N'helioro     ', N'14/07/14  ', 0, N'177.66.187.136 ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (45, N'a786bb8', N'kaka2       ', N'14/07/14  ', 1, N'201.37.237.54  ', 1, 1)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (50, N'126bc0b', N'Alexsander03', N'14/07/14  ', 0, N'200.192.211.190', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (51, N'8341177', N'warlleybrito', N'17/07/14  ', 0, N'187.6.3.81     ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (52, N'6bddba6', N'warlleybrito', N'17/07/14  ', 0, N'187.6.3.81     ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (53, N'4c0595b', N'sasukes2    ', N'21/07/14  ', 1, N'201.24.181.168 ', 1, 1)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (54, N'a6ea7fd', N'KevinSilva  ', N'22/07/14  ', 0, N'177.177.202.166', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (55, N'190138c', N'jhymmy      ', N'26/07/14  ', 0, N'186.249.123.66 ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (56, N'33a7b2e', N'BJlADoS     ', N'27/07/14  ', 0, N'62.216.41.10   ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (59, N'f6822af', N'fcboomz     ', N'05/08/14  ', 0, N'113.53.182.7   ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (60, N'a22a78f', N'deathnout   ', N'07/08/14  ', 0, N'179.122.151.126', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (62, N'9fb9d89', N'Dallalba    ', N'08/08/14  ', 3, N'177.7.189.167  ', 3, 3)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (64, N'ccd0e10', N'carlinhos   ', N'09/08/14  ', 0, N'179.180.147.235', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (65, N'2ce6d02', N'sukrata     ', N'10/08/14  ', 0, N'85.98.180.120  ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (66, N'0bbe9b8', N'darkline    ', N'10/08/14  ', 0, N'212.253.111.195', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (10, N'0372a95', N'BielDeathcor', N'09/07/14  ', 0, N'189.24.94.43   ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (67, N'01bc411', N'sakat54     ', N'10/08/14  ', 0, N'185.26.182.38  ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (14, N'f2b5fb3', N'BielDeathcor', N'09/07/14  ', 0, N'189.24.94.43   ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (15, N'a53d7a4', N'BielDeathcor', N'09/07/14  ', 0, N'189.24.94.43   ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (16, N'3a6f6b4', N'BielDeathcor', N'09/07/14  ', 0, N'189.24.94.43   ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (25, N'ad8d286', N'juniorft    ', N'10/07/14  ', 0, N'177.133.51.42  ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (27, N'baa5913', N'BielDeathcor', N'11/07/14  ', 0, N'189.24.75.154  ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (28, N'8744e45', N'BielDeathcor', N'11/07/14  ', 0, N'189.24.75.154  ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (29, N'2ee38a6', N'dfkdfkdfk   ', N'11/07/14  ', 21, N'177.193.225.208', 21, 21)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (31, N'7627886', N'sempena1    ', N'11/07/14  ', 0, N'200.199.190.233', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (32, N'a4b8ec1', N'Caxirola    ', N'11/07/14  ', 26, N'189.12.238.119 ', 26, 26)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (35, N'1ae932b', N'croomado    ', N'11/07/14  ', 2, N'177.83.121.114 ', 2, 2)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (36, N'1c3628e', N'Joaokilo    ', N'11/07/14  ', 1, N'177.129.193.134', 1, 1)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (38, N'3b4981a', N'tcpkvl      ', N'12/07/14  ', 0, N'177.87.247.239 ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (39, N'596a2f4', N'BielDeathcor', N'13/07/14  ', 0, N'201.51.180.75  ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (40, N'1646171', N'BielDeathcor', N'13/07/14  ', 0, N'201.51.180.75  ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (42, N'dbe1f41', N'BielDeathcor', N'13/07/14  ', 0, N'201.51.180.75  ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (43, N'a9a955b', N'Maiiquin    ', N'13/07/14  ', 0, N'201.51.21.252  ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (46, N'fd690ca', N'Alexsander03', N'14/07/14  ', 0, N'200.192.211.190', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (47, N'13089d5', N'Alexsander03', N'14/07/14  ', 0, N'200.192.211.190', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (48, N'07e5a33', N'Alexsander03', N'14/07/14  ', 0, N'200.192.211.190', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (49, N'7df3415', N'Alexsander03', N'14/07/14  ', 0, N'200.192.211.190', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (57, N'daaa888', N'zeroor      ', N'01/08/14  ', 0, N'201.88.66.110  ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (58, N'793c3d5', N'Guigox10    ', N'05/08/14  ', 0, N'187.113.3.181  ', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (61, N'208ef60', N'Doougllass  ', N'08/08/14  ', 0, N'191.253.218.166', 0, 0)
INSERT [dbo].[DV_Cadastrados] ([Id], [hashCod], [login], [data], [pontos], [ip], [pontos_month], [pontos_week]) VALUES (63, N'df83c7c', N'yFlaayers   ', N'08/08/14  ', 0, N'189.68.175.33  ', 0, 0)
SET IDENTITY_INSERT [dbo].[DV_Cadastrados] OFF
SET IDENTITY_INSERT [dbo].[DV_Usuarios] ON 

INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1, N'Killerssss          ', N'200.149.74.9   ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (2, N'Chequi              ', N'177.184.116.194', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (3, N'XgoldX              ', N'191.180.162.40 ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (4, N'LordSystem1         ', N'200.138.3.203  ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (5, N'jonathan23578       ', N'177.129.145.201', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (6, N'olifell             ', N'187.105.37.149 ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (10, N'pospa               ', N'187.57.81.125  ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (11, N'Diablos             ', N'189.48.255.195 ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (17, N'Junior              ', N'201.95.50.61   ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (18, N'redakaiii           ', N'201.14.120.146 ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (20, N'Ingrids2            ', N'179.213.153.236', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (22, N'pabloruan           ', N'191.173.161.214', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (26, N'RenatoGardenal      ', N'191.180.131.86 ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (35, N'AcceleratorLast     ', N'200.175.38.243 ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (36, N'Priest              ', N'187.101.69.114 ', N'10/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (38, N'askooosa            ', N'187.4.236.226  ', N'10/07/14  ', N'ebce9cf')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (39, N'Guilherme_F15       ', N'177.102.22.93  ', N'10/07/14  ', N'ebce9cf')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (42, N'dfkdfkdfk           ', N'177.193.225.208', N'10/07/14  ', N'ebce9cf')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (43, N'mihawkpxt           ', N'189.49.75.182  ', N'10/07/14  ', N'ebce9cf')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (44, N'mak_indp            ', N'177.132.22.26  ', N'10/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1045, N'branquinho0123      ', N'201.13.188.63  ', N'10/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1046, N'victorzika123       ', N'189.70.17.76   ', N'10/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1047, N'andersonpla1        ', N'191.241.39.147 ', N'10/07/14  ', N'ebce9cf')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1050, N'Snake2              ', N'187.56.12.10   ', N'10/07/14  ', N'2890994')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1052, N'kiriku              ', N'189.105.126.194', N'11/07/14  ', N'd144636')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1053, N'miguelpk            ', N'179.178.20.37  ', N'11/07/14  ', N'ebce9cf')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1055, N'gadsu4              ', N'189.63.40.141  ', N'11/07/14  ', N'2890994')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1056, N'xOzzinx             ', N'177.158.202.243', N'11/07/14  ', N'2890994')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1057, N'matheusmqw          ', N'177.5.205.172  ', N'11/07/14  ', N'2890994')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1060, N'zavboy12345         ', N'191.177.134.90 ', N'11/07/14  ', N'69a33f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1061, N'Eric007             ', N'177.183.254.55 ', N'11/07/14  ', N'2890994')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1062, N'DarknxGamer         ', N'186.216.121.57 ', N'11/07/14  ', N'2ee38a6')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1064, N'Caxirola            ', N'189.12.238.119 ', N'11/07/14  ', N'2ee38a6')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1066, N'yHiroto             ', N'186.249.176.2  ', N'11/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1068, N'allyssonk2k         ', N'201.88.122.142 ', N'11/07/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1070, N'caioxxt             ', N'189.70.4.58    ', N'11/07/14  ', N'2ee38a6')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1071, N'croomado            ', N'177.83.121.114 ', N'11/07/14  ', N'2ee38a6')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1075, N'joaokilo123         ', N'177.129.193.134', N'11/07/14  ', N'1c3628e')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1079, N'mchamer258          ', N'189.111.54.221 ', N'11/07/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1081, N'lentodms            ', N'187.14.85.95   ', N'12/07/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1082, N'sumeoka             ', N'189.78.98.221  ', N'12/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1085, N'thirte              ', N'177.21.85.14   ', N'13/07/14  ', N'2890994')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1086, N'gabrielgxx2         ', N'189.15.55.227  ', N'13/07/14  ', N'2890994')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1088, N'sasabiel            ', N'186.233.162.154', N'13/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1092, N'edsonx223           ', N'179.157.132.127', N'14/07/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1093, N'kaka3               ', N'201.37.237.54  ', N'14/07/14  ', N'a786bb8')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1094, N'MackayGamer         ', N'179.191.1.4    ', N'14/07/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1098, N'hitsuwill           ', N'177.125.32.2   ', N'15/07/14  ', N'2ee38a6')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1100, N'Ivone.              ', N'177.86.197.185 ', N'16/07/14  ', N'2ee38a6')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1102, N'BLoodRappeR         ', N'78.167.165.15  ', N'16/07/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1103, N'brandiuxxx          ', N'189.238.7.194  ', N'16/07/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1106, N'fresno              ', N'177.53.4.101   ', N'20/07/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1107, N'zeckdog             ', N'186.208.148.58 ', N'20/07/14  ', N'2ee38a6')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1109, N'cshjcsc             ', N'201.24.181.168 ', N'21/07/14  ', N'4c0595b')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1110, N'andremaik           ', N'179.97.151.127 ', N'22/07/14  ', N'2ee38a6')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1112, N'LuuanMendees        ', N'179.154.57.41  ', N'23/07/14  ', N'2ee38a6')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1113, N'jaonub              ', N'177.83.136.2   ', N'25/07/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1114, N'Leyder              ', N'186.210.224.215', N'27/07/14  ', N'2ee38a6')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1115, N'natanhenrique44     ', N'201.1.205.225  ', N'03/08/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1121, N'josuejr98           ', N'201.8.199.254  ', N'09/08/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1124, N'ilordsilver         ', N'189.31.128.125 ', N'16/08/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1125, N'cpt666              ', N'78.149.90.139  ', N'23/08/14  ', N'ebce9cf')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1126, N'ffelipee12          ', N'189.26.221.19  ', N'24/08/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (7, N'richard3f           ', N'177.38.74.1    ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (8, N'mavin               ', N'179.178.186.2  ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (9, N'Trevas066           ', N'186.210.204.252', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (12, N'Eriickszx           ', N'189.24.79.122  ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (13, N'willian251          ', N'177.132.10.47  ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (14, N'lodi22              ', N'201.15.65.45   ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (15, N'pehroot0013         ', N'189.71.106.140 ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (16, N'alex2               ', N'189.61.155.7   ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (19, N'leozin              ', N'201.67.200.252 ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (21, N'JhonnyJn            ', N'179.197.19.60  ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (23, N'JhoonyF125          ', N'191.183.34.222 ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (24, N'positivo19997       ', N'191.240.76.185 ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (25, N'zGuuh               ', N'187.107.64.18  ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (27, N'edynhoviamao        ', N'201.10.21.62   ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (28, N'Jun1nBR2            ', N'189.74.55.225  ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (29, N'helioju             ', N'177.66.187.136 ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (30, N'kauankiu            ', N'177.128.138.222', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (31, N'a1f4g337            ', N'200.161.217.50 ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (32, N'leonardo6121        ', N'187.87.240.5   ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (33, N'lolzinho755         ', N'201.95.129.3   ', N'09/07/14  ', N'ebce9cf')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (34, N'darlanbb            ', N'189.82.13.114  ', N'09/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (37, N'Asmodeus11          ', N'201.95.72.248  ', N'10/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (41, N'mariacarvalho21     ', N'201.24.169.94  ', N'10/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (45, N'InfernalGamer       ', N'187.74.129.207 ', N'10/07/14  ', N'ebce9cf')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1078, N'KiritoTXD           ', N'187.53.76.200  ', N'11/07/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (40, N'BelSkateSan         ', N'201.66.57.32   ', N'10/07/14  ', N'ebce9cf')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1080, N'xLuuan              ', N'177.16.247.64  ', N'11/07/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1089, N'crossfire           ', N'189.70.27.6    ', N'13/07/14  ', N'2890994')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1095, N'zBMartins           ', N'179.191.208.142', N'14/07/14  ', N'2ee38a6')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1097, N'kaneca1             ', N'201.24.45.219  ', N'15/07/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1099, N'a?￡nathana?￡      ', N'189.127.113.35 ', N'16/07/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1111, N'Brunoohx            ', N'186.227.134.213', N'22/07/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1119, N'pablo123jkl         ', N'177.159.211.28 ', N'08/08/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1048, N'Gabriel83548        ', N'186.227.61.140 ', N'10/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1051, N'sales55             ', N'187.75.146.26  ', N'10/07/14  ', N'2890994')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1054, N'iYuuka              ', N'187.112.213.100', N'11/07/14  ', N'69a33f0')
GO
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1059, N'xxkairoxx           ', N'186.210.30.112 ', N'11/07/14  ', N'2ee38a6')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1063, N'BEluga?§?￡o       ', N'200.223.220.3  ', N'11/07/14  ', N'a99e4f0')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1065, N'pirokaaa            ', N'177.124.45.100 ', N'11/07/14  ', N'5545f8d')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1067, N'leitos              ', N'201.50.252.34  ', N'11/07/14  ', N'd144636')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1069, N'chronii             ', N'177.63.241.36  ', N'11/07/14  ', N'e358946')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1072, N'Teteu               ', N'179.208.202.150', N'11/07/14  ', N'2ee38a6')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1073, N'darkslower          ', N'177.204.136.46 ', N'11/07/14  ', N'2ee38a6')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1074, N'kevshu              ', N'177.133.144.207', N'11/07/14  ', N'2ee38a6')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1076, N'cerol123            ', N'189.80.217.22  ', N'11/07/14  ', N'1ae932b')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1077, N'dfrrgggg            ', N'179.213.54.65  ', N'11/07/14  ', N'1ae932b')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1083, N'daniloss1996        ', N'177.189.40.108 ', N'13/07/14  ', N'2890994')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1084, N'patrickluizyl       ', N'186.221.69.142 ', N'13/07/14  ', N'2890994')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1087, N'bonitaxd            ', N'187.19.53.193  ', N'13/07/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1090, N'Xdestroier1998X     ', N'201.79.220.183 ', N'13/07/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1091, N'maikim456           ', N'177.9.179.157  ', N'14/07/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1096, N'f_neres             ', N'187.23.236.217 ', N'15/07/14  ', N'2ee38a6')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1101, N'ELDORADO            ', N'189.106.116.15 ', N'16/07/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1104, N'daniel157           ', N'189.81.203.141 ', N'18/07/14  ', N'2ee38a6')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1105, N'asyif               ', N'115.133.248.134', N'18/07/14  ', N'2ee38a6')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1108, N'vicyoutube          ', N'200.158.172.34 ', N'21/07/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1116, N'Reidasarmas         ', N'189.81.154.49  ', N'04/08/14  ', N'2ee38a6')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1117, N'thallesgaia         ', N'201.55.31.15   ', N'05/08/14  ', N'a4b8ec1')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1118, N'viniciusPK          ', N'191.33.5.116   ', N'08/08/14  ', N'2ee38a6')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1120, N'whiska              ', N'186.204.188.77 ', N'08/08/14  ', N'9fb9d89')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1122, N'josec               ', N'177.154.241.175', N'10/08/14  ', N'9fb9d89')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1123, N'kikadorra           ', N'187.62.18.13   ', N'10/08/14  ', N'9fb9d89')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1128, N'geovanna357         ', N'177.87.20.246  ', N'26/08/14  ', N'2ee38a6')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1049, N'Kanarok             ', N'201.8.124.14   ', N'10/07/14  ', N'd144636')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1058, N'SonGohan            ', N'189.18.162.4   ', N'11/07/14  ', N'2890994')
INSERT [dbo].[DV_Usuarios] ([Id], [login], [ip], [data], [hashCadastro]) VALUES (1127, N'gallahard           ', N'200.158.170.56 ', N'24/08/14  ', N'a4b8ec1')
SET IDENTITY_INSERT [dbo].[DV_Usuarios] OFF
SET IDENTITY_INSERT [dbo].[Tuga_noticias] ON 

INSERT [dbo].[Tuga_noticias] ([id], [titulo], [imagem], [url], [por], [date], [conteudo], [ativado]) VALUES (11, N'Ganhe Itens!', N'http:i.imgur.comhKkLEBq.png', N'dv', N'ModPercy', N'Jul  1 2014  4:55PM', N'Ganhe itens divulgando! clique em ver mais', 1)
INSERT [dbo].[Tuga_noticias] ([id], [titulo], [imagem], [url], [por], [date], [conteudo], [ativado]) VALUES (12, NULL, NULL, NULL, NULL, NULL, N'Gunny.pt em breve on', NULL)
SET IDENTITY_INSERT [dbo].[Tuga_noticias] OFF
INSERT [dbo].[Tuga_record_on] ([record], [data]) VALUES (N'0', N'08/10/2014')
SET IDENTITY_INSERT [dbo].[tuga_shop_auth] ON 

INSERT [dbo].[tuga_shop_auth] ([id], [login], [auth]) VALUES (12, N'Naldinho', 1)
SET IDENTITY_INSERT [dbo].[tuga_shop_auth] OFF
INSERT [dbo].[Tuga_shop_categorias] ([nome], [IDCategoria], [mostrar], [Texto_Hover]) VALUES (N'Chapéu', 1, 1, N'Chapéus')
INSERT [dbo].[Tuga_shop_categorias] ([nome], [IDCategoria], [mostrar], [Texto_Hover]) VALUES (N'óculos', 2, 1, N'óculos')
INSERT [dbo].[Tuga_shop_categorias] ([nome], [IDCategoria], [mostrar], [Texto_Hover]) VALUES (N'Cabelos', 3, 1, N'Cabelos')
INSERT [dbo].[Tuga_shop_categorias] ([nome], [IDCategoria], [mostrar], [Texto_Hover]) VALUES (N'Face', 4, 1, N'Face')
INSERT [dbo].[Tuga_shop_categorias] ([nome], [IDCategoria], [mostrar], [Texto_Hover]) VALUES (N'Roupas', 5, 1, N'Roupas')
INSERT [dbo].[Tuga_shop_categorias] ([nome], [IDCategoria], [mostrar], [Texto_Hover]) VALUES (N'Olhos', 6, 1, N'Olhos')
INSERT [dbo].[Tuga_shop_categorias] ([nome], [IDCategoria], [mostrar], [Texto_Hover]) VALUES (N'Armas', 7, 1, N'Armas')
INSERT [dbo].[Tuga_shop_categorias] ([nome], [IDCategoria], [mostrar], [Texto_Hover]) VALUES (N'Pulseiras', 8, 1, N'Pulseiras')
INSERT [dbo].[Tuga_shop_categorias] ([nome], [IDCategoria], [mostrar], [Texto_Hover]) VALUES (N'Anéis', 9, 1, N'Anéis')
INSERT [dbo].[Tuga_shop_categorias] ([nome], [IDCategoria], [mostrar], [Texto_Hover]) VALUES (N'Itens', 11, 1, N'Acessórios')
INSERT [dbo].[Tuga_shop_categorias] ([nome], [IDCategoria], [mostrar], [Texto_Hover]) VALUES (N'Ternos', 13, 1, N'Ternos')
INSERT [dbo].[Tuga_shop_categorias] ([nome], [IDCategoria], [mostrar], [Texto_Hover]) VALUES (N'Asas', 15, 1, N'Asas')
SET IDENTITY_INSERT [dbo].[Tuga_shop_confirmacao_doacao] ON 

INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (2, N'Isaaack', N'Isaaack', N'1000000000000000000000', N'Lindo', N'kainaneymar@hotmail.com', 0, N'2014-06-06 16:25:27')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (3, N'coranoob237', N'XxRINKAxX', N'1000', N'PEROLO', N'leonardoalves279@gmail.com', 0, N'2014-06-06 21:12:46')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (4, N'hugocba1', N'coruja', N'1000000', N'10000000', N'hugocba2011@hotmail.com', 0, N'2014-06-08 00:36:25')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (5, N'hugocba', N'coruja', N'1000000', N'10000000', N'hugocba2011@hotmail.com', 0, N'2014-06-08 00:36:45')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (10, N'zazen', N'zazen', N'1000', N'1000', N'sukrub_1999@hotmail.com', 0, N'2014-06-11 13:01:46')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (11, N'Lemossd', N'RainOver', N'25,00', N'imageshack.usImg20140614', N'fsdigolemos_@hotmail.com', 0, N'2014-06-14 12:36:31')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (12, N'dontlike35', N'Carpediem', N'xqyphg2eqa', N'xqyphg2eqa', N'ccc3ccc@windowslive.com', 0, N'2014-06-14 17:39:31')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (13, N'dontlike355', N'Carpediem', N'xqyphg2eqa', N'xqyphg2eqa', N'ccc3ccc@windowslive.com', 0, N'2014-06-14 17:39:43')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (14, N'Carpediem', N'Carpediem', N'11111', N'sda', N'ccc3ccc@windowslive.com', 0, N'2014-06-14 17:51:33')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (17, N'asd', N'asd', N'asd', N'asdas', N'd', 0, N'2014-06-22 13:16:47')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (19, N'erhn1234', N'SquealTR', N'Akiro', N'9999999', N'06bela40@gmail.com', 0, N'2014-06-23 17:03:00')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (20, N'Skrilex', N'Skrilex', N'30,00', N'fkasew', N'ebertbahia1111@hotmail.com', 0, N'2014-06-23 19:07:56')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (21, N'Kashii', N'JAACK_', N'21000', N'123456', N'andriws_roberto@yahoo.com.br', 0, N'2014-06-23 20:14:29')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (24, N'weslleysantos', N'Lucas5G', N'8000', N'sssawwssssasa', N'nazaregama@outlook.com', 0, N'2014-06-24 13:14:06')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (6, N'WindLegend', N'a?￥Bluea?￥', N'a?￥Bluea?￥', N'baris163@outlook.com', N'baris163@outlook.com', 0, N'2014-06-10 15:05:05')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (7, N'salo1998', N'LightLeny', N'06vatan06', N'https:www.facebook.comDDTMonsterphotosa.296211513879301.1073741827.296210537212732303847633115689?type=1&theater', N'xxsalihxx_@windowslive.com', 0, N'2014-06-10 23:05:18')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (8, N'Salo998', N'LightLinos', N'06vatan06', N'https:www.facebook.comDDTMonsterphotosa.296211513879301.1073741827.296210537212732303847633115689?type=1&theater', N'semih.klasdas@evimdekiders.com', 0, N'2014-06-10 23:07:03')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (9, N'odaben', N'odaben', N'odaben', N'http:www.boomtank.com.brmodulosclassjogar.class.php?option=ndslnasf', N'odaben1@hotmail.com', 0, N'2014-06-11 08:25:15')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (25, N'caina123', N']W???????????????±?·', N'35402', N'ksaosakosa', N'caina_nanas@hotmail.com', 0, N'2014-06-24 20:26:57')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (15, N'vitordr4', N'20MATAR', N'23000', N'stwtank', N'vitorsampaio2012@hotmail.com.br', 0, N'2014-06-17 18:24:44')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (16, N'candu01', N'candu01', N'12222222', N'wqer56411', N'leonaoeduardo@hotmail.com', 0, N'2014-06-19 13:11:02')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (18, N'moonsoad', N'Paladino', N'100000000000000', N'asdas', N'd', 0, N'2014-06-22 13:17:03')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (22, N'Sloganbeta', N'??Huntera?￠', N'00,00', N'imagem.com0000', N'joao.minimundos@gmail.com', 0, N'2014-06-23 21:25:07')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (23, N'omaley', N'Rustin', N'35500', N'eu', N'brunozikadala@hotmail.com', 0, N'2014-06-23 22:45:16')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (26, N'alexzk1', N'alexzk', N'555', N'alexzk', N'alexzika32ale@hotmail.com.br', 0, N'2014-06-30 11:38:12')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (27, N'lyk1213', N'?‘?è¨€???', N'100', N'www.baidu.com', N'1213953547@qq.com', 0, N'2014-07-02 11:00:58')
INSERT [dbo].[Tuga_shop_confirmacao_doacao] ([id], [login], [nickname], [valor], [imagem], [email], [situacao], [data]) VALUES (28, N'darkfelinto', N'FRITAScomBACON', N'100000', N'12', N'kevin_leonardo2011@hotmail.com', 0, N'2014-07-02 19:04:59')
SET IDENTITY_INSERT [dbo].[Tuga_shop_confirmacao_doacao] OFF
SET IDENTITY_INSERT [dbo].[tuga_shop_itens] ON 

INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (116, N'Pistola +12', N'Pistolatica', N'70863', N'12', N'10', N'10', N'10', N'10', N'30', N'0', N'flintlock5', 0, 1, 10, N'7', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (117, N'Super Boomerang 4', N'Boomerang', N'1', N'12', N'10', N'10', N'10', N'10', N'30', N'0', N'superboomerang4', 0, 1, 0, N'7', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (118, N'Super Espada', N'Super Espada', N'79004', N'12', N'10', N'10', N'10', N'10', N'30', N'100', N'SSsword5', 0, 1, 10, N'7', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (119, N'Foice', N'Foice', N'79014', N'12', N'10', N'10', N'10', N'10', N'30', N'68', N'sickle5', 0, 1, 10, N'7', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (120, N'Asa De Ouro', N'Asa De Ouro', N'15076', N'1', N'10', N'10', N'10', N'10', N'30', N'20', N'wing76', 0, 1, 10, N'15', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (121, N'Asa Premium', N'Asa Premium', N'15061', N'1', N'10', N'10', N'10', N'10', N'30', N'7', N'wing61', 0, 1, 10, N'15', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (122, N'Asa Suprema', N'Asa Suprema', N'15075', N'1', N'10', N'10', N'10', N'10', N'30', N'102', N'wing75', 0, 1, 10, N'15', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (123, N'Supe-Arco de Drag?￡o Raivoso', N'Supe-Arco de Drag?￡o Raivoso', N'70664', N'12', N'10', N'10', N'101', N'10', N'30', N'67', N'', 0, 1, 10, N'7', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (124, N'Anel Antigo +5', N'Anel Antigo +5', N'9528', N'1', N'10', N'10', N'10', N'10', N'30', N'194', N'HyperionRing6', 0, 1, 10, N'9', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (125, N'Anel de anivers??rio platinum +5', N'Anel de anivers??rio platinum +5', N'9527', N'1', N'10', N'10', N'10', N'10', N'30', N'105', N'fiveyearjz5', 0, 1, 10, N'9', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (126, N'Amor Eterno+5', N'Amor Eterno+5', N'9522', N'1', N'10', N'10', N'10', N'10', N'30', N'135', N'ring55', 0, 1, 10, N'9', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (127, N'Anel da Eternidade+5', N'Anel da Eternidade+5', N'9523', N'1', N'10', N'10', N'10', N'10', N'30', N'4', N'eternal', 0, 1, 10, N'9', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (128, N'VIPè2′è3“?°??±?è￡?é￡?', N'VIPè2′è3“?°??±?è￡?é￡?', N'15069', N'1', N'10', N'10', N'10', N'10', N'30', N'62', N'wing69', 0, 1, 10, N'15', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (129, N'Fan??tica do Futebol', N'Fan??tica do Futebol', N'3461', N'1', N'10', N'10', N'10', N'10', N'30', N'22', N'hair161', 0, 1, 10, N'3', N'1')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (130, N'Fan??tico do Futebol', N'Fan??tico do Futebol', N'3349', N'1', N'10', N'10', N'10', N'10', N'30', N'70', N'hair149', 0, 1, 10, N'3', N'0')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (131, N'Vontade da Guerreiro', N'Vontade da Guerreiro', N'1962', N'12', N'10', N'10', N'10', N'10', N'30', N'36', N'head287', 0, 1, 10, N'1', N'0')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (132, N'Defender o Rei', N'Defender o Rei', N'1761', N'12', N'10', N'10', N'10', N'10', N'30', N'62', N'head361', 0, 1, 10, N'1', N'0')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (133, N'Defender a Ra?-nha', N'Defender a Ra?-nha', N'1861', N'12', N'10', N'10', N'10', N'10', N'30', N'11', N'head361', 0, 1, 10, N'1', N'1')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (134, N'Capacete M??gico Ca?-do', N'Capacete M??gico Ca?-do', N'1716', N'12', N'10', N'10', N'10', N'10', N'30', N'42', N'head316', 0, 1, 10, N'1', N'0')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (135, N'Brilhante passe de bola', N'Brilhante passe de bola', N'4455', N'1', N'10', N'10', N'10', N'10', N'30', N'19', N'eff155', 0, 1, 10, N'4', N'1')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (136, N'Chim Há?“ng', N'Chim Há?“ng', N'4426', N'1', N'10', N'10', N'10', N'10', N'30', N'6', N'eff126', 0, 1, 10, N'4', N'1')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (137, N'Colorido lindo', N'Colorido lindo', N'4414', N'1', N'10', N'10', N'10', N'10', N'30', N'5', N'eff114', 0, 1, 10, N'4', N'1')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (138, N'Brilhante passe de bola(Masculino)', N'Brilhante passe de bola(Masculino)', N'4355', N'1', N'10', N'10', N'10', N'10', N'30', N'62', N'eff155', 0, 1, 10, N'4', N'0')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (139, N'Pequeno Gancho', N'Pequeno Gancho', N'4338', N'1', N'10', N'10', N'10', N'10', N'30', N'12', N'eff138', 0, 1, 10, N'4', N'0')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (140, N'Colorido lindo', N'Colorido lindo', N'4314', N'1', N'10', N'10', N'10', N'10', N'30', N'10', N'eff114', 0, 1, 10, N'4', N'0')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (141, N'L?-der da equipe DD', N'L?-der da equipe DD', N'4311', N'1', N'10', N'10', N'10', N'10', N'30', N'18', N'eff111', 0, 1, 10, N'4', N'0')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (142, N'P??rola M??gica(DANO)', N'P??rola M??gica(DANO)', N'313505', N'1', N'10', N'10', N'10', N'10', N'30', N'1198', N'Magicalorb9', 0, 1, 10, N'11', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (143, N'P??rola M??gica(ARMADURA)', N'P??rola M??gica(ARMADURA)', N'313506', N'1', N'10', N'10', N'10', N'10', N'30', N'179', N'Magicalorb9', 0, 1, 10, N'11', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (144, N'P??rola M??gica(EVITA BURACO)', N'P??rola M??gica(EVITA BURACO)', N'312504', N'1', N'10', N'10', N'10', N'10', N'30', N'115', N'Magicalorb9', 0, 1, 10, N'11', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (145, N'Ataque Esfera Aben?§oada', N'Ataque Esfera Aben?§oada', N'11560', N'1', N'10', N'10', N'10', N'10', N'30', N'1655', N'Againstblessingorb', 0, 1, 10, N'11', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (146, N'Defesa Ben?§?￡o da Esfera', N'Defesa Ben?§?￡o da Esfera', N'11561', N'1', N'10', N'10', N'10', N'10', N'30', N'839', N'Defenseblessingorb', 0, 1, 10, N'11', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (147, N'Atributo da Esfera de Ben?§?￡o', N'Atributo da Esfera de Ben?§?￡o', N'11562', N'1', N'10', N'10', N'10', N'10', N'30', N'222', N'Attributeblessingorb', 0, 1, 10, N'11', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (148, N'Pedra de Energia J?onior', N'Pedra de Energia J?onior', N'11629', N'1', N'10', N'10', N'10', N'10', N'30', N'474', N'potential1', 0, 1, 10, N'11', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (149, N'ess?ancia de honra', N'ess?ancia de honra', N'11917', N'1', N'10', N'10', N'10', N'10', N'30', N'589', N'honor', 0, 1, 10, N'11', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (150, N'p?-lula do esp?-rito de luta', N'p?-lula do esp?-rito de luta', N'100100', N'1', N'10', N'10', N'10', N'10', N'30', N'308', N'soul', 0, 1, 10, N'11', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (151, N'Olhos da Vit?3ria(menina)', N'Olhos da Vit?3ria(menina)', N'2457', N'1', N'10', N'10', N'10', N'10', N'30', N'10', N'glass157', 0, 1, 10, N'2', N'1')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (152, N'M??scara do Domador Dourado', N'M??scara do Domador Dourado', N'2406', N'1', N'10', N'10', N'10', N'10', N'30', N'20', N'glass106', 0, 1, 10, N'2', N'1')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (153, N'M??scara do Domador Dourado', N'M??scara do Domador Dourado', N'2309', N'1', N'10', N'10', N'10', N'10', N'30', N'87', N'glass109', 0, 1, 10, N'2', N'0')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (154, N'Febre do Futebol(menina)', N'Febre do Futebol(menina)', N'6410', N'1', N'10', N'10', N'10', N'10', N'30', N'11', N'face110', 0, 1, 10, N'6', N'1')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (155, N'Febre do Futebol(rapaz)', N'Febre do Futebol(rapaz)', N'6305', N'1', N'10', N'10', N'10', N'10', N'30', N'56', N'face105', 0, 1, 10, N'6', N'0')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (156, N'Furioso', N'Furioso', N'6279', N'1', N'10', N'10', N'10', N'10', N'30', N'14', N'face74', 0, 1, 10, N'6', N'1')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (157, N'Raiva', N'Raiva', N'6175', N'1', N'10', N'10', N'10', N'10', N'30', N'10', N'face74', 0, 1, 10, N'6', N'0')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (158, N'Athena pulseira +5', N'Athena pulseira +5', N'8520', N'1', N'10', N'10', N'10', N'10', N'30', N'145', N'diamondbracelet6', 0, 1, 10, N'8', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (159, N'Verdadeira - Pulseira platinum', N'Verdadeira - Pulseira platinum', N'8518', N'1', N'10', N'10', N'10', N'10', N'30', N'146', N'fiveyearsz5', 0, 1, 10, N'8', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (160, N'Bracelete Furioso Dragonfire +5', N'Bracelete Furioso Dragonfire +5', N'8515', N'1', N'10', N'10', N'10', N'10', N'30', N'56', N'ShivaBracelet6', 0, 1, 10, N'8', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (161, N'Pulseira de V?anus +5', N'Pulseira de V?anus +5', N'8514', N'1', N'10', N'10', N'10', N'10', N'30', N'3', N'armlet55', 0, 1, 10, N'8', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (162, N'Deus Guerreira', N'Deus Guerreira', N'58908', N'12', N'10', N'10', N'10', N'10', N'30', N'93', N'cloth271', 0, 1, 10, N'5', N'0')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (163, N'Deusa Guerreira', N'Deusa Guerreira', N'58909', N'12', N'10', N'10', N'10', N'10', N'30', N'22', N'cloth283', 0, 1, 10, N'5', N'1')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (164, N'Cora?§?￡o do Bakufu', N'Cora?§?￡o do Bakufu', N'5696', N'12', N'10', N'10', N'10', N'10', N'30', N'32', N'cloth296', 0, 1, 10, N'5', N'1')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (165, N'Captain America', N'Captain America', N'13668', N'1', N'10', N'10', N'10', N'10', N'30', N'55', N'suits468', 0, 1, 10, N'13', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (166, N'UrsoYYFeliz', N'UrsoYYFeliz', N'13647', N'1', N'10', N'10', N'10', N'10', N'30', N'1', N'suits447', 0, 1, 10, N'13', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (167, N'Colossal Titan', N'Colossal Titan', N'13644', N'1', N'10', N'10', N'10', N'10', N'30', N'0', N'suits444', 0, 1, 10, N'13', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (168, N'Vaidoso', N'Vaidoso', N'13642', N'1', N'10', N'10', N'10', N'10', N'30', N'2', N'suits442', 0, 1, 10, N'13', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (169, N'Bola de Deus do Brasil', N'Bola de Deus do Brasil', N'13595', N'1', N'10', N'10', N'10', N'10', N'30', N'14', N'suits395', 0, 1, 10, N'13', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (170, N'Team China', N'Team China', N'13589', N'1', N'10', N'10', N'10', N'10', N'30', N'4', N'suits389', 0, 1, 10, N'13', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (171, N'Time Vietn?￡', N'Time Vietn?￡', N'13587', N'1', N'10', N'10', N'10', N'10', N'30', N'5', N'suits387', 0, 1, 10, N'13', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (172, N'Drag?￡o Raivoso guerreiro', N'Drag?￡o Raivoso guerreiro', N'13558', N'1', N'10', N'10', N'10', N'10', N'30', N'56', N'suits358', 0, 1, 10, N'13', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (173, N'espadachim invenc?-vel', N'espadachim invenc?-vel', N'13531', N'1', N'10', N'10', N'10', N'10', N'30', N'3', N'suits331', 0, 1, 10, N'13', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (174, N'Bater urso YY', N'Bater urso YY', N'13521', N'1', N'10', N'10', N'10', N'10', N'30', N'0', N'suits321', 0, 1, 10, N'13', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (175, N'Bolha Barco do Drag?￡o', N'Bolha Barco do Drag?￡o', N'16016', N'0', N'10', N'10', N'10', N'10', N'30', N'75', N'chatBall16', 0, 1, 10, N'11', N'2')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (176, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 10, NULL, NULL)
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (177, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', 0, 0, 0, N'9', N'0')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (178, N'22222', N'222', N'3', N'22', N'222', N'250', N'22', N'2', N'222', N'0', N'22222', 0, 0, 2222, N'9', N'0')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (179, N'3', N'222', N'22222222222222 ', N'22', N'222', N'250', N'22', N'2', N'222', N'0', N'22222', 0, 0, 2222, N'9', N'0')
INSERT [dbo].[tuga_shop_itens] ([id], [Nome_Item], [Descricao_Item], [IdItem], [lvlitem], [ataque], [defesa], [agilidade], [sorte], [duracao], [vendidos], [imagem], [novidade], [promocao], [preco], [categoria], [sexo]) VALUES (180, N'Ovini Eletrico', N'top', N'71284', N'12', N'50', N'50', N'50', N'50', N'30', N'0', N'Slollipop5', 0, 1, 1000, N'7', N'2')
SET IDENTITY_INSERT [dbo].[tuga_shop_itens] OFF
