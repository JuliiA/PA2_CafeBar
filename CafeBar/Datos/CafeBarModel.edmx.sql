
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/09/2019 21:47:47
-- Generated from EDMX file: C:\Users\evaju\Documents\Visual Studio 2017\PA2_CafeBar\CafeBar\Datos\CafeBarModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CafeBarBD];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Pedidos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pedidos];
GO
IF OBJECT_ID(N'[CafeBarBDModelStoreContainer].[Facturas]', 'U') IS NOT NULL
    DROP TABLE [CafeBarBDModelStoreContainer].[Facturas];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Facturas'
CREATE TABLE [dbo].[Facturas] (
    [FacturaID] int IDENTITY(1,1) NOT NULL,
    [Fecha] datetime  NOT NULL,
    [Total] decimal(5,2)  NULL,
    [FormaPago] int  NULL,
    [Estado] int  NULL,
    [Baja] int  NULL,
    [Pedido_PedidoID] int  NOT NULL
);
GO

-- Creating table 'Pedidos'
CREATE TABLE [dbo].[Pedidos] (
    [PedidoID] int IDENTITY(1,1) NOT NULL,
    [Fecha] datetime  NOT NULL,
    [Cliente] varchar(300)  NOT NULL,
    [Menu] varchar(250)  NOT NULL,
    [MenuPrecio] decimal(5,2)  NOT NULL,
    [Bebida] varchar(250)  NULL,
    [BebidaPrecio] decimal(5,2)  NULL,
    [Postre] varchar(250)  NULL,
    [PostrePrecio] decimal(5,2)  NULL,
    [ConEnvio] int  NULL,
    [Estado] int  NOT NULL,
    [FacturaID] int  NOT NULL,
    [Baja] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [FacturaID] in table 'Facturas'
ALTER TABLE [dbo].[Facturas]
ADD CONSTRAINT [PK_Facturas]
    PRIMARY KEY CLUSTERED ([FacturaID] ASC);
GO

-- Creating primary key on [PedidoID] in table 'Pedidos'
ALTER TABLE [dbo].[Pedidos]
ADD CONSTRAINT [PK_Pedidos]
    PRIMARY KEY CLUSTERED ([PedidoID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Pedido_PedidoID] in table 'Facturas'
ALTER TABLE [dbo].[Facturas]
ADD CONSTRAINT [FK_FacturaPedido]
    FOREIGN KEY ([Pedido_PedidoID])
    REFERENCES [dbo].[Pedidos]
        ([PedidoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FacturaPedido'
CREATE INDEX [IX_FK_FacturaPedido]
ON [dbo].[Facturas]
    ([Pedido_PedidoID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------