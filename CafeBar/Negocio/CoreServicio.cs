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
        }
        #endregion

        public static object GetMenu()
        {
            return new List<Opcion>()
           //listaMenu.Add(new Opcion{ Nombre = "Café", Precio = Enums.Menues.CafeSolo.ToString() });
            {
                new Opcion{ Nombre = "Café", Precio = Convert.ToInt64(Enums.Menues.CafeSolo)},
                new Opcion{ Nombre = "Café con Leche", Precio = Convert.ToInt64(Enums.Menues.CafeConLecheSolo)},
                new Opcion{ Nombre = "Capuccino", Precio = Convert.ToInt64(Enums.Menues.CapuccinoSolo)},
                new Opcion{ Nombre = "Té", Precio = Convert.ToInt64(Enums.Menues.TeSolo)},
                new Opcion{ Nombre = "Café + Medialunas", Precio = Convert.ToInt64(Enums.Menues.CafeConMedialunas)},
                new Opcion{ Nombre = "Café con leche + Medaialunas", Precio = Convert.ToInt64(Enums.Menues.CafeConLecheConMedialunas)},
                new Opcion{ Nombre = "Capuccino + Medialunas", Precio = Convert.ToInt64(Enums.Menues.CapuccinoConMedialunas)},
                new Opcion{ Nombre = "Té + Medialunas", Precio = Convert.ToInt64(Enums.Menues.TeConMedialunas)},
                new Opcion{ Nombre = "Café con lecha + Tostado", Precio = Convert.ToInt64(Enums.Menues.CafeConLecheConMedialunas)},
                new Opcion{ Nombre = "Capuccino + Tostado", Precio = Convert.ToInt64(Enums.Menues.CapuccinoConTostado)},
                new Opcion{ Nombre = "Té + Tostado", Precio = Convert.ToInt64(Enums.Menues.TeConTostado)},
                new Opcion{ Nombre = "Arroz con Pollo", Precio = Convert.ToInt64(Enums.Menues.ArrozConPollo)},
                new Opcion{ Nombre = "Milanesa + Guarnicion", Precio = Convert.ToInt64(Enums.Menues.MilanesaConGuarnicion)},
                new Opcion{ Nombre = "Tallarines", Precio = Convert.ToInt64(Enums.Menues.Tallarines)},
                new Opcion{ Nombre = "Tarta", Precio = Convert.ToInt64(Enums.Menues.Tarta)},
                new Opcion{ Nombre = "Lasagna", Precio = Convert.ToInt64(Enums.Menues.Lasagna)}
            };
        }

        public static object GetBebidas()
        {
            return new List<Opcion>()
            {
                new Opcion { Nombre = "Sin Pedir", Precio = Convert.ToInt64(Enums.Bebida.SinPedir)},
                new Opcion { Nombre = "Gaseosa (500ml)", Precio = Convert.ToInt64(Enums.Bebida.GasesosaChica)},
                new Opcion { Nombre = "Gaseosa (1.5ml)", Precio = Convert.ToInt64(Enums.Bebida.GasesosaGrande)},
                new Opcion { Nombre = "Jugo (500ml)", Precio = Convert.ToInt64(Enums.Bebida.JugoChico)},
                new Opcion { Nombre = "Jugo (1.5ml)", Precio = Convert.ToInt64(Enums.Bebida.JugoGrande)},
                new Opcion { Nombre = "Cerveza", Precio = Convert.ToInt64(Enums.Bebida.Cerveza)},
                new Opcion { Nombre = "Vino", Precio = Convert.ToInt64(Enums.Bebida.Vino)}
            };
        }

        public static object GetPostre()
        {
            return new List<Opcion>()
            {
                new Opcion { Nombre = "Sin Pedir", Precio = Convert.ToInt64(Enums.Postre.SinPedir) },
                new Opcion { Nombre = "Café", Precio = Convert.ToInt64(Enums.Postre.Cafe)},
                new Opcion { Nombre = "Flan", Precio = Convert.ToInt64(Enums.Postre.Flan)},
                new Opcion { Nombre = "Helado", Precio = Convert.ToInt64(Enums.Postre.Helado)},
                new Opcion { Nombre = "Ensalada de Frutas", Precio = Convert.ToInt64(Enums.Postre.EnsaladaFrutas) }
            };
        }

    }
}
