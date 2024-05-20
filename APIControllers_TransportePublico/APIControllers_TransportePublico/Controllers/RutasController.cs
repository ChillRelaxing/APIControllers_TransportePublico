using APIControllersData.Models;
using APIControllersData.Repositories;
using FluentValidation;
using FluentValidation.Results;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace APIControllers_TransportePublico.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RutasController : ControllerBase
    {
        private readonly IRutaRepository _rutaRepository;
        private readonly IValidator<Ruta> _validator;

        public RutasController(

            IRutaRepository rutaRepository,
            IValidator<Ruta> validator
            )
        {
            _rutaRepository = rutaRepository;
            _validator = validator;
        }

        // GET: api/<UsuarioController>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var ruta = await _rutaRepository.GetRutasAsync();

            return Ok(ruta);
        }

        // GET api/<UsuarioController>/5
        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            try
            {
                var ruta = await _rutaRepository.GetRutaByIdAsync(id);
                if (ruta == null)
                    return NotFound(); // Devolver 404 Not Found si el usuario no existe
                return Ok(ruta); // Devolver el usuario si se encuentra
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Se produjo un error al obtener la ruta: {ex.Message}");
            }
        }

        // POST api/<UsuarioController>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Ruta ruta)
        {
            ValidationResult validationResult = await _validator.ValidateAsync(ruta);

            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _rutaRepository.AddRutaAsync(ruta);

            return Created();
        }

        // PUT api/<UsuarioController>/5
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] Ruta ruta)
        {
            var rutaEditable = await _rutaRepository.GetRutaByIdAsync(id);

            if (rutaEditable == null)
                return NotFound();

            ValidationResult validationResult = await _validator.ValidateAsync(ruta);

            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _rutaRepository.EditRutaAsync(ruta);

            return Accepted();
        }


        // DELETE api/<UsuarioController>/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            // Obtener el usuario por ID
            var ruta = await _rutaRepository.GetRutaByIdAsync(id);

            // Verificar si el usuario existe
            if (ruta == null)
                return NotFound(); // Devolver 404 Not Found si el usuario no existe

            try
            {
                // Eliminar el usuario
                await _rutaRepository.DeleteRutaAsync(id);

                // Devolver respuesta 204 No Content si la eliminación fue exitosa
                return NoContent();
            }
            catch (Exception ex)
            {
                // Manejar cualquier excepción y devolver un error 500 Internal Server Error
                return StatusCode(500, $"Se produjo un error al eliminar el usuario: {ex.Message}");
            }
        }
    }
}
