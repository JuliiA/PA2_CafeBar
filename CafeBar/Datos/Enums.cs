using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class Enums
    {
        public enum Menues
        {
            CafeSolo = 80,
            CafeConLecheSolo = 80,
            CapuccinoSolo = 80,
            TeSolo = 80,
            CafeConMedialunas = 110,
            CafeConLecheConMedialunas = 120,
            CapuccinoConMedialunas = 120,
            TeConMedialunas = 110,
            CafeConTostado = 140,
            CafeConLecheConTostado = 150,
            CapuccinoConTostado = 150,
            TeConTostado = 140,
            ArrozConPollo = 180,
            MilanesaConGuarnicion = 190,
            Tallarines = 160,
            Tarta = 150,
            Lasagna = 150
        }

        public enum Bebida
        {
            SinPedir = 0,
            GasesosaChica = 70,
            GasesosaGrande = 90,
            JugoChico = 60,
            JugoGrande = 80,
            Cerveza = 90,
            Vino = 130
        }

        public enum Postre
        {
            SinPedir = 0,
            Cafe = 80,
            Flan = 70,
            Helado = 70,
            EnsaladaFrutas = 60
        }
    }
}
