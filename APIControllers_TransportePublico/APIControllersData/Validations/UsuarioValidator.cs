using APIControllersData.Models;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Validations
{
    public class UsuarioValidator : AbstractValidator<Usuario>
    {
        public UsuarioValidator()
        {
            RuleFor(x => x.Nombre)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("El producto es obligatorio")
                .MinimumLength(3).WithMessage("Debe contener minimo 3 letras");


            RuleFor(x => x.Email)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("El producto es obligatorio")
                .MinimumLength(3).WithMessage("Debe contener minimo 3 letras");


            RuleFor(x => x.FechaRegistro)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("La fecha de registro es obligatoria");

        }
    }
}
