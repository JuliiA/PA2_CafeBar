create table Pedido
(
	PedidoID int primary key,
	Fecha datetime,
	Cliente varchar(300),
	Menu varchar(250),
	MenuPrecio float,
	Bebida varchar(250),
	BebidaPrecio float,
	Postre varchar(250),
	PostrePrecio float,
	ConEnvio int,
	Estado int,
	FacturaID int not null,
	Baja int
)

create table Factura
(
	FacturaID int primary key,
	Fecha datetime,
	Total float,
	FormaPago int,
	Estado int,
	Baja int
)

select * from Pedido

select * from Factura

'Data Source=LAPTOP-NEVES8UH\SQLEXPRESS;Initial Catalog=CafeBarBD;Integrated Security=True'