using APIControllersData.Models;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Validations
{
    public class RutaValidator : AbstractValidator<Ruta>
    {
        public RutaValidator()
        {
            RuleFor(x => x.Nombre)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("El nombre es obligatorio")
                .MinimumLength(3).WithMessage("Debe contener minimo 3 letras");

            RuleFor(x => x.Origen)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("El origen es obligatorio")
                .MinimumLength(5).WithMessage("Debe contener minimo 5 letras");

            RuleFor(x => x.Destino)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("El destino es obligatorio")
                .MinimumLength(5).WithMessage("Debe contener minimo 5 letras");

            RuleFor(x => x.FechaViaje)
                 .Cascade(CascadeMode.Stop)
                 .NotEmpty().WithMessage("La fecha de registro es obligatoria");

            RuleFor(x => x.ID_Usuario)
                .GreaterThan(0).WithMessage("El id usaurio debe ser un número entero positivo")
                .NotEmpty().WithMessage("El id es obligatorio");

            RuleFor(x => x.ID_Autobus)
            .GreaterThan(0).WithMessage("La id autobus debe ser un número entero positivo")
            .NotEmpty().WithMessage("El id es obligatorio");

        }
    }
}
