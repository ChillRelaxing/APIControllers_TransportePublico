using APIControllersData.Models;

namespace APIControllersData.Repositories
{
    public interface IUsuarioRepository
    {
        Task AddUsuarioAsync(Usuario usuario);

        Task DeleteUsuarioAsync(int id);

        Task EditUsuarioAsync(Usuario usuario);

        Task<IEnumerable<Usuario>> GetUsuarioAsync();

        Task<Usuario?> GetUsuarioByIdAsync(int id);
    }
}