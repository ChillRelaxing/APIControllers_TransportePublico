using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Models
{
        public class Autobuses
        {
            public int ID_Autobus { get; set; }

            public string Matricula { get; set; }

            public string Marca { get; set; }

            public string Modelo { get; set; }

            public int Capacidad { get; set; }
        }
    }
