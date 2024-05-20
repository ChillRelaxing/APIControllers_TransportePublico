using APIControllersData.Models;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Validations
{
    public class AutobusValidator : AbstractValidator<Autobuses>
    {
        public AutobusValidator()
        {
            RuleFor(x => x.Matricula)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("La Matricula es obligatorio")
                .MinimumLength(8).WithMessage("Debe contener minimo 8 letras o caracteres");


            RuleFor(x => x.Marca)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("La Marca es obligatorio")
                .MinimumLength(3).WithMessage("Debe contener minimo 3 letras");

            RuleFor(x => x.Modelo)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("El Modelo es obligatorio")
                .MinimumLength(6).WithMessage("Debe contener minimo 6 letras");

            RuleFor(x => x.Capacidad)
             .GreaterThan(0).WithMessage("La Capacidad debe ser un número entero positivo")
             .LessThanOrEqualTo(500).WithMessage("La Capacidad no debe ser mayor a 80");


        }
    }
}
