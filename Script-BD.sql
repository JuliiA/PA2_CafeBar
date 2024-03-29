USE [CafeBarBD]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 12/2/2019 12:01:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[FacturaID] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Total] [decimal](5, 2) NULL,
	[FormaPago] [int] NULL,
	[Estado] [int] NULL,
	[Pedido_PedidoID] [int] NOT NULL,
	[Baja] [int] NULL,
 CONSTRAINT [PK_Facturas] PRIMARY KEY CLUSTERED 
(
	[FacturaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menues]    Script Date: 12/2/2019 12:01:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](150) NULL,
	[Precio] [decimal](8, 2) NULL,
	[Tipo] [int] NULL,
	[Baja] [int] NULL,
 CONSTRAINT [PK_Menues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 12/2/2019 12:01:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[PedidoID] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Cliente] [varchar](300) NOT NULL,
	[Menu] [varchar](250) NOT NULL,
	[MenuPrecio] [decimal](5, 2) NOT NULL,
	[Bebida] [varchar](250) NULL,
	[BebidaPrecio] [decimal](5, 2) NULL,
	[Postre] [varchar](250) NULL,
	[PostrePrecio] [decimal](5, 2) NULL,
	[ConEnvio] [int] NULL,
	[Estado] [int] NOT NULL,
	[FacturaID] [int] NOT NULL,
	[Baja] [int] NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[PedidoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Facturas] ON 

INSERT [dbo].[Facturas] ([FacturaID], [Fecha], [Total], [FormaPago], [Estado], [Pedido_PedidoID], [Baja]) VALUES (1, CAST(N'2019-12-01T00:55:53.937' AS DateTime), CAST(120.00 AS Decimal(5, 2)), 1, 1, 1, 1)
INSERT [dbo].[Facturas] ([FacturaID], [Fecha], [Total], [FormaPago], [Estado], [Pedido_PedidoID], [Baja]) VALUES (2, CAST(N'2019-12-01T01:01:23.557' AS DateTime), CAST(270.00 AS Decimal(5, 2)), 1, 0, 2, 0)
INSERT [dbo].[Facturas] ([FacturaID], [Fecha], [Total], [FormaPago], [Estado], [Pedido_PedidoID], [Baja]) VALUES (3, CAST(N'2019-12-01T23:45:09.573' AS DateTime), CAST(360.00 AS Decimal(5, 2)), 1, 1, 3, 0)
SET IDENTITY_INSERT [dbo].[Facturas] OFF
SET IDENTITY_INSERT [dbo].[Menues] ON 

INSERT [dbo].[Menues] ([Id], [Nombre], [Precio], [Tipo], [Baja]) VALUES (1, N'Cafe', CAST(80.00 AS Decimal(8, 2)), 1, 1)
INSERT [dbo].[Menues] ([Id], [Nombre], [Precio], [Tipo], [Baja]) VALUES (2, N'Cafe con Leche', CAST(90.00 AS Decimal(8, 2)), 1, 1)
INSERT [dbo].[Menues] ([Id], [Nombre], [Precio], [Tipo], [Baja]) VALUES (3, N'Cappuccino', CAST(90.00 AS Decimal(8, 2)), 1, 1)
INSERT [dbo].[Menues] ([Id], [Nombre], [Precio], [Tipo], [Baja]) VALUES (4, N'Te', CAST(80.00 AS Decimal(8, 2)), 1, 0)
INSERT [dbo].[Menues] ([Id], [Nombre], [Precio], [Tipo], [Baja]) VALUES (7, N'Cafe + Medialunas', CAST(110.00 AS Decimal(8, 2)), 1, 1)
INSERT [dbo].[Menues] ([Id], [Nombre], [Precio], [Tipo], [Baja]) VALUES (8, N'Cafe con Leche + Medialunas', CAST(120.00 AS Decimal(8, 2)), 1, 1)
INSERT [dbo].[Menues] ([Id], [Nombre], [Precio], [Tipo], [Baja]) VALUES (9, N'Cappuccino + Medialunas', CAST(120.00 AS Decimal(8, 2)), 1, 1)
INSERT [dbo].[Menues] ([Id], [Nombre], [Precio], [Tipo], [Baja]) VALUES (10, N'Te + Medialunas', CAST(110.00 AS Decimal(8, 2)), 1, 0)
INSERT [dbo].[Menues] ([Id], [Nombre], [Precio], [Tipo], [Baja]) VALUES (11, N'Cafe con Leche + Tostado', CAST(140.00 AS Decimal(8, 2)), 1, 1)
INSERT [dbo].[Menues] ([Id], [Nombre], [Precio], [Tipo], [Baja]) VALUES (12, N'Cappuccino + Tostado', CAST(150.00 AS Decimal(8, 2)), 1, 1)
INSERT [dbo].[Menues] ([Id], [Nombre], [Precio], [Tipo], [Baja]) VALUES (13, N'Te + Tostado', CAST(140.00 AS Decimal(8, 2)), 1, 0)
INSERT [dbo].[Menues] ([Id], [Nombre], [Precio], [Tipo], [Baja]) VALUES (14, N'Arroz con Pollo', CAST(180.00 AS Decimal(8, 2)), 3, 0)
INSERT [dbo].[Menues] ([Id], [Nombre], [Precio], [Tipo], [Baja]) VALUES (15, N'Milanesa + Guarnicion', CAST(190.00 AS Decimal(8, 2)), 3, 0)
INSERT [dbo].[Menues] ([Id], [Nombre], [Precio], [Tipo], [Baja]) VALUES (16, N'Tallarines', CAST(160.00 AS Decimal(8, 2)), 2, 0)
INSERT [dbo].[Menues] ([Id], [Nombre], [Precio], [Tipo], [Baja]) VALUES (17, N'Tarta', CAST(150.00 AS Decimal(8, 2)), 2, 0)
INSERT [dbo].[Menues] ([Id], [Nombre], [Precio], [Tipo], [Baja]) VALUES (18, N'Lasagna', CAST(150.00 AS Decimal(8, 2)), 2, 0)
INSERT [dbo].[Menues] ([Id], [Nombre], [Precio], [Tipo], [Baja]) VALUES (19, N'Pizza Grande', CAST(200.00 AS Decimal(8, 2)), 3, 0)
INSERT [dbo].[Menues] ([Id], [Nombre], [Precio], [Tipo], [Baja]) VALUES (20, N'Ensalada Rusa Chica', CAST(120.00 AS Decimal(8, 2)), 2, 0)
INSERT [dbo].[Menues] ([Id], [Nombre], [Precio], [Tipo], [Baja]) VALUES (21, N'Te con Leche', CAST(90.00 AS Decimal(8, 2)), 1, 0)
SET IDENTITY_INSERT [dbo].[Menues] OFF
SET IDENTITY_INSERT [dbo].[Pedidos] ON 

INSERT [dbo].[Pedidos] ([PedidoID], [Fecha], [Cliente], [Menu], [MenuPrecio], [Bebida], [BebidaPrecio], [Postre], [PostrePrecio], [ConEnvio], [Estado], [FacturaID], [Baja]) VALUES (1, CAST(N'2019-11-30T00:00:00.000' AS DateTime), N'Juliana Eva', N'Cappuccino + Medialunas', CAST(120.00 AS Decimal(5, 2)), N'Sin Pedir', CAST(0.00 AS Decimal(5, 2)), N'Sin Pedir', CAST(0.00 AS Decimal(5, 2)), 1, 1, 0, 1)
INSERT [dbo].[Pedidos] ([PedidoID], [Fecha], [Cliente], [Menu], [MenuPrecio], [Bebida], [BebidaPrecio], [Postre], [PostrePrecio], [ConEnvio], [Estado], [FacturaID], [Baja]) VALUES (2, CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'MesaX', N'Arroz con Pollo', CAST(180.00 AS Decimal(5, 2)), N'Gaseosa (1.5ml)', CAST(90.00 AS Decimal(5, 2)), N'Sin Pedir', CAST(0.00 AS Decimal(5, 2)), 1, 0, 0, 0)
INSERT [dbo].[Pedidos] ([PedidoID], [Fecha], [Cliente], [Menu], [MenuPrecio], [Bebida], [BebidaPrecio], [Postre], [PostrePrecio], [ConEnvio], [Estado], [FacturaID], [Baja]) VALUES (3, CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'MesaI', N'Pizza Grande', CAST(200.00 AS Decimal(5, 2)), N'Cerveza', CAST(90.00 AS Decimal(5, 2)), N'Helado', CAST(70.00 AS Decimal(5, 2)), 1, 1, 0, 0)
SET IDENTITY_INSERT [dbo].[Pedidos] OFF
