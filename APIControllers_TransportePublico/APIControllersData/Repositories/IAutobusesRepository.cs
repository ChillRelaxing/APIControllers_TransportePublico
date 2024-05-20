using System.Collections.Generic;
using System.Threading.Tasks;
using APIControllersData.Models;

namespace APIControllersData.Repositories
{
    public interface IAutobusRepository
    {
        Task AddAutobusAsync(Autobuses autobuses);

        Task DeleteAutobusAsync(int id);

        Task EditAutobusAsync(Autobuses autobuses);

        Task<IEnumerable<Autobuses>> GetAutobusAsync();

        Task<Autobuses?> GetAutobusByIdAsync(int id);
    }
}
