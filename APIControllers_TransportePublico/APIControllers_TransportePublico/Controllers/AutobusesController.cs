using APIControllersData.Models;
using APIControllersData.Repositories;
using FluentValidation;
using FluentValidation.Results;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Data.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AutobusesController : ControllerBase
    {
        private readonly IAutobusRepository _autobusRepository;
        private readonly IValidator<Autobuses> _validator;

        public AutobusesController(IAutobusRepository autobusRepository, IValidator<Autobuses> validator)
        {
            _autobusRepository = autobusRepository;
            _validator = validator;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var autobuses = await _autobusRepository.GetAutobusAsync();
            return Ok(autobuses);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            try
            {
                var autobus = await _autobusRepository.GetAutobusByIdAsync(id);
                if (autobus == null)
                    return NotFound();
                return Ok(autobus);
            }
            catch(Exception ex)
            {
                return StatusCode(500, $"Se produjo un error al obtener el autobus: {ex.Message}");
            }
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Autobuses autobuses)
        {
            ValidationResult validationResult = await _validator.ValidateAsync(autobuses);

            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _autobusRepository.AddAutobusAsync(autobuses);

            return Created();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] Autobuses autobuses)
        {
            var autobusesEditable = await _autobusRepository.GetAutobusByIdAsync(id);

            if (autobusesEditable == null)
                return NotFound();

            ValidationResult validationResult = await _validator.ValidateAsync(autobuses);

            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _autobusRepository.EditAutobusAsync(autobuses);

            return Accepted();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            // Obtener el usuario por ID
            var autobuses = await _autobusRepository.GetAutobusByIdAsync(id);

            // Verificar si el usuario existe
            if (autobuses == null)
                return NotFound(); // Devolver 404 Not Found si el usuario no existe

            try
            {
                // Eliminar el usuario
                await _autobusRepository.DeleteAutobusAsync(id);

                // Devolver respuesta 204 No Content si la eliminación fue exitosa
                return NoContent();
            }
            catch (Exception ex)
            {
                // Manejar cualquier excepción y devolver un error 500 Internal Server Error
                return StatusCode(500, $"Se produjo un error al eliminar el Autobus: {ex.Message}");
            }
        }
    }
}
