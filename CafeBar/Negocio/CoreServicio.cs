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
        class Menu
        {
            public String Nombre { get; set; }
            public Int64 Precio { get; set; }
        }

        class Bebida
        {
            public String Nombre { get; set; }
            public Int64 Precio { get; set; }
        }

        class Postre
        {
            public String Nombre { get; set; }
            public Int64 Precio { get; set; }
        }
        #endregion
        
        public static object GetMenu()
        {
            return new List<Menu>()
           //listaMenu.Add(new Menu { Nombre = "Café", Precio = Enums.Menues.CafeSolo.ToString() });
            {
                new Menu { Nombre = "Café", Precio = Convert.ToInt64(Enums.Menues.CafeSolo)},
                new Menu { Nombre = "Café con Leche", Precio = Convert.ToInt64(Enums.Menues.CafeConLecheSolo)},
                new Menu { Nombre = "Capuccino", Precio = Convert.ToInt64(Enums.Menues.CapuccinoSolo)},
                new Menu { Nombre = "Té", Precio = Convert.ToInt64(Enums.Menues.TeSolo)},
                new Menu { Nombre = "Café + Medialunas", Precio = Convert.ToInt64(Enums.Menues.CafeConMedialunas)},
                new Menu { Nombre = "Café con leche + Medaialunas", Precio = Convert.ToInt64(Enums.Menues.CafeConLecheConMedialunas)},
                new Menu { Nombre = "Capuccino + Medialunas", Precio = Convert.ToInt64(Enums.Menues.CapuccinoConMedialunas)},
                new Menu { Nombre = "Té + Medialunas", Precio = Convert.ToInt64(Enums.Menues.TeConMedialunas)},
                new Menu { Nombre = "Café con lecha + Tostado", Precio = Convert.ToInt64(Enums.Menues.CafeConLecheConMedialunas)},
                new Menu { Nombre = "Capuccino + Tostado", Precio = Convert.ToInt64(Enums.Menues.CapuccinoConTostado)},
                new Menu { Nombre = "Té + Tostado", Precio = Convert.ToInt64(Enums.Menues.TeConTostado)},
                new Menu { Nombre = "Arroz con Pollo", Precio = Convert.ToInt64(Enums.Menues.ArrozConPollo)},
                new Menu { Nombre = "Milanesa + Guarnicion", Precio = Convert.ToInt64(Enums.Menues.MilanesaConGuarnicion)},
                new Menu { Nombre = "Tallarines", Precio = Convert.ToInt64(Enums.Menues.Tallarines)},
                new Menu { Nombre = "Tarta", Precio = Convert.ToInt64(Enums.Menues.Tarta)},
                new Menu { Nombre = "Lasagna", Precio = Convert.ToInt64(Enums.Menues.Lasagna)}
            };
        }

        public static object GetBebidas()
        {
            return new List<Bebida>()
            {
                new Bebida { Nombre = "Sin Pedir", Precio = Convert.ToInt64(Enums.Bebida.SinPedir)},
                new Bebida { Nombre = "Gaseosa (500ml)", Precio = Convert.ToInt64(Enums.Bebida.GasesosaChica)},
                new Bebida { Nombre = "Gaseosa (1.5ml)", Precio = Convert.ToInt64(Enums.Bebida.GasesosaGrande)},
                new Bebida { Nombre = "Jugo (500ml)", Precio = Convert.ToInt64(Enums.Bebida.JugoChico)},
                new Bebida { Nombre = "Jugo (1.5ml)", Precio = Convert.ToInt64(Enums.Bebida.JugoGrande)},
                new Bebida { Nombre = "Cerveza", Precio = Convert.ToInt64(Enums.Bebida.Cerveza)},
                new Bebida { Nombre = "Vino", Precio = Convert.ToInt64(Enums.Bebida.Vino)}
            };
        }

        public static object GetPostre()
        {
            return new List<Postre>()
            {
                new Postre { Nombre = "Sin Pedir", Precio = Convert.ToInt64(Enums.Postre.SinPedir) },
                new Postre { Nombre = "Café", Precio = Convert.ToInt64(Enums.Postre.Cafe)},
                new Postre { Nombre = "Flan", Precio = Convert.ToInt64(Enums.Postre.Flan)},
                new Postre { Nombre = "Helado", Precio = Convert.ToInt64(Enums.Postre.Helado)},
                new Postre { Nombre = "Ensalada de Frutas", Precio = Convert.ToInt64(Enums.Postre.EnsaladaFrutas) }
            };
        }

    }
}
