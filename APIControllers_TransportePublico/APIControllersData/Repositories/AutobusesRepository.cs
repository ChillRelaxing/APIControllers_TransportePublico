using APIControllersData.Data;
using APIControllersData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

    namespace APIControllersData.Repositories
    {
        public class AutobusRepository : IAutobusRepository
        {
            private readonly IDbDataAccess _dataAccess;

            public AutobusRepository(IDbDataAccess dataAccess)
            {
                _dataAccess = dataAccess;
            }

            public async Task<IEnumerable<Autobuses>> GetAutobusAsync()
            {
                return await _dataAccess.GetDataAsync<Autobuses, dynamic>(
                    "dbo.spAutobuses_GetAll",
                    new { }
                    );
            }

            public async Task<Autobuses?> GetAutobusByIdAsync(int id)
            {
                var autobuses = await _dataAccess.GetDataAsync<Autobuses, dynamic>(
                    "dbo.spAutobuses_GetById",
                    new { ID_Autobus = id }
                    );

                return autobuses.FirstOrDefault();
            }

            public async Task AddAutobusAsync(Autobuses autobuses)
            {
                await _dataAccess.SaveDataAsync(
                    "dbo.spAutobuses_Insert",
                    new { autobuses.Matricula, autobuses.Marca, autobuses.Modelo, autobuses.Capacidad }
                    );
            }

            public async Task EditAutobusAsync(Autobuses autobuses)
            {
                await _dataAccess.SaveDataAsync(
                    "dbo.spAutobuses_Update",
                     new { autobuses.ID_Autobus, autobuses.Matricula, autobuses.Marca, autobuses.Modelo, autobuses.Capacidad }
                    );
            }

            public async Task DeleteAutobusAsync(int id)
            {
                await _dataAccess.SaveDataAsync(
                    "dbo.spAutobuses_Delete",
                    new { ID_Autobus = id }
                    );
            }
        }
    }