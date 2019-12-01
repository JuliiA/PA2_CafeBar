using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;
using Datos;

namespace Negocio
{
    public class CoreServicio
    {
        #region internalClass
        public class Opcion
        {
            public String Nombre { get; set; }
            public Int64 Precio { get; set; }
            public int Id { get; set; }
            public int Tipo { get; set; }
            public bool Baja { get; set; }
        }
        #endregion

        public static object GetMenu()
        {
            var listaMenu = new MenuDatos().ObtenerTodosLosMenues();
            List<Opcion> lstMenu = new List<Opcion>();

            foreach (var item in listaMenu as List<Menue>)
            {
                Opcion op = new Opcion();
                op.Id = item.Id;
                op.Nombre = item.Nombre;
                op.Precio = Convert.ToInt64(item.Precio);
                op.Tipo = item.Tipo.Value;
                op.Baja = item.Baja.Value == 0 ? true : false;
                lstMenu.Add(op);
            }

            return lstMenu;
            // return new List<Opcion>()
            ////listaMenu.Add(new Opcion{ Nombre = "Café", Precio = Enums.Menues.CafeSolo.ToString() });
            // {
            //     new Opcion{ Id = 1, Nombre = "Café", Precio = Convert.ToInt64(Enums.Menues.CafeSolo)},
            //     new Opcion{ Id = 2, Nombre = "Café con Leche", Precio = Convert.ToInt64(Enums.Menues.CafeConLecheSolo)},
            //     new Opcion{ Id = 3, Nombre = "Capuccino", Precio = Convert.ToInt64(Enums.Menues.CapuccinoSolo)},
            //     new Opcion{ Id = 4, Nombre = "Té", Precio = Convert.ToInt64(Enums.Menues.TeSolo)},
            //     new Opcion{ Id = 5, Nombre = "Café + Medialunas", Precio = Convert.ToInt64(Enums.Menues.CafeConMedialunas)},
            //     new Opcion{ Id = 6, Nombre = "Café con leche + Medaialunas", Precio = Convert.ToInt64(Enums.Menues.CafeConLecheConMedialunas)},
            //     new Opcion{ Id = 7, Nombre = "Capuccino + Medialunas", Precio = Convert.ToInt64(Enums.Menues.CapuccinoConMedialunas)},
            //     new Opcion{ Id = 8, Nombre = "Té + Medialunas", Precio = Convert.ToInt64(Enums.Menues.TeConMedialunas)},
            //     new Opcion{ Id = 9, Nombre = "Café con lecha + Tostado", Precio = Convert.ToInt64(Enums.Menues.CafeConLecheConMedialunas)},
            //     new Opcion{ Id = 10, Nombre = "Capuccino + Tostado", Precio = Convert.ToInt64(Enums.Menues.CapuccinoConTostado)},
            //     new Opcion{ Id = 11, Nombre = "Té + Tostado", Precio = Convert.ToInt64(Enums.Menues.TeConTostado)},
            //     new Opcion{ Id = 12, Nombre = "Arroz con Pollo", Precio = Convert.ToInt64(Enums.Menues.ArrozConPollo)},
            //     new Opcion{ Id = 13, Nombre = "Milanesa + Guarnicion", Precio = Convert.ToInt64(Enums.Menues.MilanesaConGuarnicion)},
            //     new Opcion{ Id = 14, Nombre = "Tallarines", Precio = Convert.ToInt64(Enums.Menues.Tallarines)},
            //     new Opcion{ Id = 15, Nombre = "Tarta", Precio = Convert.ToInt64(Enums.Menues.Tarta)},
            //     new Opcion{ Id = 16, Nombre = "Lasagna", Precio = Convert.ToInt64(Enums.Menues.Lasagna)}
            // };
        }

        public static void ActualizarMenues(List<Opcion> list)
        {
            List<Menue> losMenues = new List<Menue>();
            foreach (var item in list)
            {
                Menue nMenu = new Menue {
                    Id = item.Id,
                    Nombre = item.Nombre,
                    Precio = item.Precio,
                    Tipo = item.Tipo,
                    Baja = item.Baja ? 0 : 1
                };

                losMenues.Add(nMenu);
            }
            new MenuDatos().ActualizarLista(losMenues);
        }       

        public static object GetBebidas()
        {
            return new List<Opcion>()
            {
                new Opcion { Id = 1, Nombre = "Sin Pedir", Precio = Convert.ToInt64(Enums.Bebida.SinPedir)},
                new Opcion { Id = 2, Nombre = "Gaseosa (500ml)", Precio = Convert.ToInt64(Enums.Bebida.GasesosaChica)},
                new Opcion { Id = 3, Nombre = "Gaseosa (1.5ml)", Precio = Convert.ToInt64(Enums.Bebida.GasesosaGrande)},
                new Opcion { Id = 4, Nombre = "Jugo (500ml)", Precio = Convert.ToInt64(Enums.Bebida.JugoChico)},
                new Opcion { Id = 5, Nombre = "Jugo (1.5ml)", Precio = Convert.ToInt64(Enums.Bebida.JugoGrande)},
                new Opcion { Id = 6, Nombre = "Cerveza", Precio = Convert.ToInt64(Enums.Bebida.Cerveza)},
                new Opcion { Id = 7, Nombre = "Vino", Precio = Convert.ToInt64(Enums.Bebida.Vino)}
            };
        }

        public static object GetPostre()
        {
            return new List<Opcion>()
            {
                new Opcion { Id = 1, Nombre = "Sin Pedir", Precio = Convert.ToInt64(Enums.Postre.SinPedir) },
                new Opcion { Id = 2, Nombre = "Café", Precio = Convert.ToInt64(Enums.Postre.Cafe)},
                new Opcion { Id = 3, Nombre = "Flan", Precio = Convert.ToInt64(Enums.Postre.Flan)},
                new Opcion { Id = 4, Nombre = "Helado", Precio = Convert.ToInt64(Enums.Postre.Helado)},
                new Opcion { Id = 5, Nombre = "Ensalada de Frutas", Precio = Convert.ToInt64(Enums.Postre.EnsaladaFrutas) }
            };
        }

    }
}
