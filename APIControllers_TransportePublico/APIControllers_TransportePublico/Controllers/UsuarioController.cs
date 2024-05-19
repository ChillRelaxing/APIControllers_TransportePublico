using APIControllersData.Models;
using APIControllersData.Repositories;
using FluentValidation;
using FluentValidation.Results;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace APIControllers_TransportePublico.Controllers
{
    [Route("api/Usuarios")]  //[Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        private readonly IUsuarioRepository _usuarioRepository;
        private readonly IValidator<Usuario> _validator;

        public UsuarioController(

            IUsuarioRepository usuarioRepository,
            IValidator<Usuario> validator
            )
        {
            _usuarioRepository = usuarioRepository;
            _validator = validator;
        }

        // GET: api/<UsuarioController>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var usuario = await _usuarioRepository.GetUsuarioAsync();

            return Ok(usuario);
        }

        // GET api/<UsuarioController>/5
        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            try
            {
                var usuario = await _usuarioRepository.GetUsuarioByIdAsync(id);
                if (usuario == null)
                    return NotFound(); // Devolver 404 Not Found si el usuario no existe
                return Ok(usuario); // Devolver el usuario si se encuentra
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Se produjo un error al obtener el usuario: {ex.Message}");
            }
        }

        // POST api/<UsuarioController>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Usuario usuario)
        {
            ValidationResult validationResult = await _validator.ValidateAsync(usuario);

            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _usuarioRepository.AddUsuarioAsync(usuario);

            return Created();
        }

        // PUT api/<UsuarioController>/5
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] Usuario usuario)
        {
            var usuarioEditable = await _usuarioRepository.GetUsuarioByIdAsync(id);

            if (usuarioEditable == null)
                return NotFound();

            ValidationResult validationResult = await _validator.ValidateAsync(usuario);

            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _usuarioRepository.EditUsuarioAsync(usuario);

            return Accepted();
        }



        // DELETE api/<UsuarioController>/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            // Obtener el usuario por ID
            var usuario = await _usuarioRepository.GetUsuarioByIdAsync(id);

            // Verificar si el usuario existe
            if (usuario == null)
                return NotFound(); // Devolver 404 Not Found si el usuario no existe

            try
            {
                // Eliminar el usuario
                await _usuarioRepository.DeleteUsuarioAsync(id);

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
