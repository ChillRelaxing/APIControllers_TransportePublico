using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace APIControllersData.Models
{
    public class Ruta
    {
        public int ID_Ruta { get; set; }

        public string Nombre { get; set; }

        public string Origen { get; set; }

        public string Destino { get; set; }

        public DateTime FechaViaje { get; set; }

        public int ID_Usuario { get; set; }

        public int ID_Autobus { get; set; }

    }

}
