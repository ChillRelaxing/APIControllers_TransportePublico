using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Models
{
    public class Usuario
    {
        public int ID_Usuario { get; set; }

        public string Nombre { get; set; }

        public string Email { get; set; }

        public DateTime FechaRegistro { get; set; }

    }
}
