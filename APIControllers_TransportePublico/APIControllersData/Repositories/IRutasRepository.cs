using APIControllersData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Repositories
{
    public interface IRutaRepository
    {
        Task AddRutaAsync(Ruta ruta);

        Task DeleteRutaAsync(int id);

        Task EditRutaAsync(Ruta ruta);

        Task<IEnumerable<Ruta>> GetRutasAsync();

        Task<Ruta?> GetRutaByIdAsync(int id);
    }
}
