using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class MenuDatos
    {
        private static CafeBarContext context = new CafeBarContext();

        public object ObtenerTodosLosMenues()
        {
            var qMenu = from m in context.Menues
                        //where m.Baja == 0
                        select m;

            return qMenu.ToList();                        
        }

        public object ObtenerTodosLosMenuesShow()
        {
            var qMenu = from m in context.Menues
                        where m.Baja == 0
                        select m;

            return qMenu.ToList();
        }

        public string ObtenerTodosLosMenues(int menu)
        {
            var qItemMenu = from im in context.Menues
                            where im.Id == menu && im.Baja == 0
                            select im.Nombre;

            return qItemMenu.FirstOrDefault();
        }

        public void EliminaLogica(int idMenu)
        {
            Menue menu = GetMenu(idMenu);
            menu.Baja = 1;
            context.Entry(menu).State = EntityState.Modified;
            context.SaveChanges();
        }

        private Menue GetMenu(int idMenu)
        {
            var qItemMenu = from im in context.Menues
                            where im.Id == idMenu && im.Baja == 0
                            select im;

            return qItemMenu.FirstOrDefault();
        }

        private Menue GetMenuTrue(int idMenu)
        {
            var qItemMenu = from im in context.Menues
                            where im.Id == idMenu 
                            select im;

            return qItemMenu.FirstOrDefault();
        }

        public void ActualizarLista(List<Menue> list)
        {
            foreach (Menue item in list)
            {
                Menue menu = GetMenuTrue(item.Id);
                menu.Nombre = item.Nombre;
                menu.Precio = item.Precio;
                menu.Tipo = item.Tipo;
                menu.Baja = item.Baja;
                context.Entry(menu).State = EntityState.Modified;
            }
        }

        public bool AltaMenu(Menue nuevoMenu)
        {
            try
            {
                context.Menues.Add(nuevoMenu);
                context.SaveChanges();
                return true;
            }
            catch (Exception x)
            {
                return false;
            }
           
        }
    }
}
