using APIControllersData.Data;
using APIControllersData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Repositories
{
    public class RutaRepository : IRutaRepository
    {
        private readonly IDbDataAccess _dataAccess;

        public RutaRepository(IDbDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

        public async Task<IEnumerable<Ruta>> GetRutasAsync()
        {
            return await _dataAccess.GetDataAsync<Ruta, dynamic>(
                "dbo.spRutas_GetAll",
                new { }
                );
        }

        public async Task<Ruta?> GetRutaByIdAsync(int id)
        {
            var ruta = await _dataAccess.GetDataAsync<Ruta, dynamic>(
                "dbo.spRutas_GetById",
                new { ID_Ruta = id }
                );

            return ruta.FirstOrDefault();
        }

        public async Task AddRutaAsync(Ruta ruta)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spRutas_Insert",
                new { ruta.Nombre, ruta.Origen, ruta.Destino, ruta.FechaViaje, ruta.ID_Usuario, ruta.ID_Autobus }
                );
        }

        public async Task EditRutaAsync(Ruta ruta)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spRutas_Update",
                ruta
                );
        }

        public async Task DeleteRutaAsync(int id)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spRutas_Delete",
                new { ID_Ruta = id }
                );
        }
    }
}
