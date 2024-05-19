using APIControllersData.Data;
using APIControllersData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Repositories
{
    public class UsuarioRepository : IUsuarioRepository
    {
        private readonly IDbDataAccess _dataAccess;

        public UsuarioRepository(IDbDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

        public async Task<IEnumerable<Usuario>> GetUsuarioAsync()
        {
            return await _dataAccess.GetDataAsync<Usuario, dynamic>(
                "dbo.spUsuarios_GetAll",
                new { }
                );
        }

        public async Task<Usuario?> GetUsuarioByIdAsync(int id)
        {
            var product = await _dataAccess.GetDataAsync<Usuario, dynamic>(
                "dbo.spUsuarios_GetById",
                new { ID_Usuario = id }
                );

            return product.FirstOrDefault();
        }

        public async Task AddUsuarioAsync(Usuario usuario)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spUsuarios_Insert",
                new { usuario.Nombre, usuario.Email, usuario.FechaRegistro }
                );
        }

        public async Task EditUsuarioAsync(Usuario usuario)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spUsuarios_Update",
                usuario
                );
        }

        public async Task DeleteUsuarioAsync(int id)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spUsuarios_Delete",
                new { ID_Usuario = id }
                );
        }
    }
}
