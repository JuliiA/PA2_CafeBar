USE [CafeBarBD]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 11/24/2019 12:34:47 AM ******/
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
	[Baja] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 11/24/2019 12:34:47 AM ******/
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

INSERT [dbo].[Facturas] ([FacturaID], [Fecha], [Total], [FormaPago], [Estado], [Pedido_PedidoID], [Baja]) VALUES (1, CAST(N'2019-11-08T23:28:43.507' AS DateTime), CAST(130.00 AS Decimal(5, 2)), 1, 0, 3, NULL)
INSERT [dbo].[Facturas] ([FacturaID], [Fecha], [Total], [FormaPago], [Estado], [Pedido_PedidoID], [Baja]) VALUES (2, CAST(N'2019-11-09T00:01:28.000' AS DateTime), CAST(270.00 AS Decimal(5, 2)), 1, 1, 4, 1)
INSERT [dbo].[Facturas] ([FacturaID], [Fecha], [Total], [FormaPago], [Estado], [Pedido_PedidoID], [Baja]) VALUES (3, CAST(N'2019-11-09T00:07:47.110' AS DateTime), CAST(220.00 AS Decimal(5, 2)), 1, 1, 5, 1)
INSERT [dbo].[Facturas] ([FacturaID], [Fecha], [Total], [FormaPago], [Estado], [Pedido_PedidoID], [Baja]) VALUES (4, CAST(N'2019-11-09T00:09:42.263' AS DateTime), CAST(110.00 AS Decimal(5, 2)), 1, 0, 6, NULL)
INSERT [dbo].[Facturas] ([FacturaID], [Fecha], [Total], [FormaPago], [Estado], [Pedido_PedidoID], [Baja]) VALUES (5, CAST(N'2019-11-09T22:03:15.587' AS DateTime), CAST(340.00 AS Decimal(5, 2)), 1, 0, 7, 0)
INSERT [dbo].[Facturas] ([FacturaID], [Fecha], [Total], [FormaPago], [Estado], [Pedido_PedidoID], [Baja]) VALUES (6, CAST(N'2019-11-09T22:15:12.120' AS DateTime), CAST(125.00 AS Decimal(5, 2)), 1, 0, 8, 0)
INSERT [dbo].[Facturas] ([FacturaID], [Fecha], [Total], [FormaPago], [Estado], [Pedido_PedidoID], [Baja]) VALUES (7, CAST(N'2019-11-09T23:00:46.457' AS DateTime), CAST(140.00 AS Decimal(5, 2)), 1, 1, 9, 1)
INSERT [dbo].[Facturas] ([FacturaID], [Fecha], [Total], [FormaPago], [Estado], [Pedido_PedidoID], [Baja]) VALUES (8, CAST(N'2019-11-09T23:04:20.527' AS DateTime), CAST(130.00 AS Decimal(5, 2)), 1, 1, 10, 1)
INSERT [dbo].[Facturas] ([FacturaID], [Fecha], [Total], [FormaPago], [Estado], [Pedido_PedidoID], [Baja]) VALUES (9, CAST(N'2019-11-09T23:07:36.790' AS DateTime), CAST(180.00 AS Decimal(5, 2)), 1, 1, 11, 1)
INSERT [dbo].[Facturas] ([FacturaID], [Fecha], [Total], [FormaPago], [Estado], [Pedido_PedidoID], [Baja]) VALUES (10, CAST(N'2019-11-11T19:58:09.153' AS DateTime), CAST(110.00 AS Decimal(5, 2)), 1, 0, 12, 0)
INSERT [dbo].[Facturas] ([FacturaID], [Fecha], [Total], [FormaPago], [Estado], [Pedido_PedidoID], [Baja]) VALUES (11, CAST(N'2019-11-11T20:40:14.883' AS DateTime), CAST(250.00 AS Decimal(5, 2)), 1, 1, 13, 0)
INSERT [dbo].[Facturas] ([FacturaID], [Fecha], [Total], [FormaPago], [Estado], [Pedido_PedidoID], [Baja]) VALUES (12, CAST(N'2019-11-23T21:10:04.100' AS DateTime), CAST(240.00 AS Decimal(5, 2)), 1, 1, 14, 0)
SET IDENTITY_INSERT [dbo].[Facturas] OFF
SET IDENTITY_INSERT [dbo].[Pedidos] ON 

INSERT [dbo].[Pedidos] ([PedidoID], [Fecha], [Cliente], [Menu], [MenuPrecio], [Bebida], [BebidaPrecio], [Postre], [PostrePrecio], [ConEnvio], [Estado], [FacturaID], [Baja]) VALUES (3, CAST(N'2019-09-11T00:00:00.000' AS DateTime), N'MesaII', N'Capuccino + Tostado', CAST(130.00 AS Decimal(5, 2)), N'Sin Pedir', CAST(0.00 AS Decimal(5, 2)), N'Sin Pedir', CAST(0.00 AS Decimal(5, 2)), 1, 0, 0, 0)
INSERT [dbo].[Pedidos] ([PedidoID], [Fecha], [Cliente], [Menu], [MenuPrecio], [Bebida], [BebidaPrecio], [Postre], [PostrePrecio], [ConEnvio], [Estado], [FacturaID], [Baja]) VALUES (4, CAST(N'2019-09-11T00:00:00.000' AS DateTime), N'MesaIV', N'Capuccino + Tostado', CAST(150.00 AS Decimal(5, 2)), N'Jugo (500ml)', CAST(60.00 AS Decimal(5, 2)), N'Ensalada de Frutas', CAST(60.00 AS Decimal(5, 2)), 1, 1, 0, 1)
INSERT [dbo].[Pedidos] ([PedidoID], [Fecha], [Cliente], [Menu], [MenuPrecio], [Bebida], [BebidaPrecio], [Postre], [PostrePrecio], [ConEnvio], [Estado], [FacturaID], [Baja]) VALUES (5, CAST(N'2019-09-11T00:00:00.000' AS DateTime), N'MesaV', N'Tallarines', CAST(160.00 AS Decimal(5, 2)), N'Jugo (500ml)', CAST(60.00 AS Decimal(5, 2)), N'Sin Pedir', CAST(0.00 AS Decimal(5, 2)), 1, 1, 0, 1)
INSERT [dbo].[Pedidos] ([PedidoID], [Fecha], [Cliente], [Menu], [MenuPrecio], [Bebida], [BebidaPrecio], [Postre], [PostrePrecio], [ConEnvio], [Estado], [FacturaID], [Baja]) VALUES (6, CAST(N'2019-11-09T00:00:00.000' AS DateTime), N'MesaI', N'Café + Medialunas', CAST(110.00 AS Decimal(5, 2)), N'Sin Pedir', CAST(0.00 AS Decimal(5, 2)), N'Sin Pedir', CAST(0.00 AS Decimal(5, 2)), 1, 0, 0, 0)
INSERT [dbo].[Pedidos] ([PedidoID], [Fecha], [Cliente], [Menu], [MenuPrecio], [Bebida], [BebidaPrecio], [Postre], [PostrePrecio], [ConEnvio], [Estado], [FacturaID], [Baja]) VALUES (7, CAST(N'2019-11-09T00:00:00.000' AS DateTime), N'Juliana', N'Arroz con Pollo', CAST(180.00 AS Decimal(5, 2)), N'Gaseosa (1.5ml)', CAST(90.00 AS Decimal(5, 2)), N'Flan', CAST(70.00 AS Decimal(5, 2)), 1, 0, 0, 0)
INSERT [dbo].[Pedidos] ([PedidoID], [Fecha], [Cliente], [Menu], [MenuPrecio], [Bebida], [BebidaPrecio], [Postre], [PostrePrecio], [ConEnvio], [Estado], [FacturaID], [Baja]) VALUES (8, CAST(N'2019-09-11T00:00:00.000' AS DateTime), N'Eva', N'Capuccino + Tostado', CAST(125.00 AS Decimal(5, 2)), N'Sin Pedir', CAST(0.00 AS Decimal(5, 2)), N'Sin Pedir', CAST(0.00 AS Decimal(5, 2)), 1, 0, 0, 0)
INSERT [dbo].[Pedidos] ([PedidoID], [Fecha], [Cliente], [Menu], [MenuPrecio], [Bebida], [BebidaPrecio], [Postre], [PostrePrecio], [ConEnvio], [Estado], [FacturaID], [Baja]) VALUES (9, CAST(N'2019-11-09T00:00:00.000' AS DateTime), N'MesaX', N'Té + Tostado', CAST(140.00 AS Decimal(5, 2)), N'Sin Pedir', CAST(0.00 AS Decimal(5, 2)), N'Sin Pedir', CAST(0.00 AS Decimal(5, 2)), 1, 1, 0, 1)
INSERT [dbo].[Pedidos] ([PedidoID], [Fecha], [Cliente], [Menu], [MenuPrecio], [Bebida], [BebidaPrecio], [Postre], [PostrePrecio], [ConEnvio], [Estado], [FacturaID], [Baja]) VALUES (10, CAST(N'2019-11-09T00:00:00.000' AS DateTime), N'MesaII', N'Capuccino + Tostado', CAST(130.00 AS Decimal(5, 2)), N'Sin Pedir', CAST(0.00 AS Decimal(5, 2)), N'Sin Pedir', CAST(0.00 AS Decimal(5, 2)), 1, 1, 0, 1)
INSERT [dbo].[Pedidos] ([PedidoID], [Fecha], [Cliente], [Menu], [MenuPrecio], [Bebida], [BebidaPrecio], [Postre], [PostrePrecio], [ConEnvio], [Estado], [FacturaID], [Baja]) VALUES (11, CAST(N'2019-09-11T00:00:00.000' AS DateTime), N'MesaIII', N'Tallarines', CAST(180.00 AS Decimal(5, 2)), N'Sin Pedir', CAST(0.00 AS Decimal(5, 2)), N'Sin Pedir', CAST(0.00 AS Decimal(5, 2)), 1, 1, 0, 1)
INSERT [dbo].[Pedidos] ([PedidoID], [Fecha], [Cliente], [Menu], [MenuPrecio], [Bebida], [BebidaPrecio], [Postre], [PostrePrecio], [ConEnvio], [Estado], [FacturaID], [Baja]) VALUES (12, CAST(N'2019-10-11T00:00:00.000' AS DateTime), N'MesaX', N'Café + Medialunas', CAST(110.00 AS Decimal(5, 2)), N'Sin Pedir', CAST(0.00 AS Decimal(5, 2)), N'Sin Pedir', CAST(0.00 AS Decimal(5, 2)), 1, 0, 0, 0)
INSERT [dbo].[Pedidos] ([PedidoID], [Fecha], [Cliente], [Menu], [MenuPrecio], [Bebida], [BebidaPrecio], [Postre], [PostrePrecio], [ConEnvio], [Estado], [FacturaID], [Baja]) VALUES (13, CAST(N'2019-11-09T00:00:00.000' AS DateTime), N'Juanq', N'Café', CAST(80.00 AS Decimal(5, 2)), N'Gaseosa (1.5ml)', CAST(90.00 AS Decimal(5, 2)), N'Flan', CAST(80.00 AS Decimal(5, 2)), 1, 1, 0, 0)
INSERT [dbo].[Pedidos] ([PedidoID], [Fecha], [Cliente], [Menu], [MenuPrecio], [Bebida], [BebidaPrecio], [Postre], [PostrePrecio], [ConEnvio], [Estado], [FacturaID], [Baja]) VALUES (14, CAST(N'2019-11-23T00:00:00.000' AS DateTime), N'MesaII', N'Lasagna', CAST(150.00 AS Decimal(5, 2)), N'Gaseosa (1.5ml)', CAST(90.00 AS Decimal(5, 2)), N'Sin Pedir', CAST(0.00 AS Decimal(5, 2)), 1, 1, 0, 0)
SET IDENTITY_INSERT [dbo].[Pedidos] OFF
