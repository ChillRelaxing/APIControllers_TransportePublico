using APIControllersData.Data;
using FluentValidation;
using APIControllersData.Repositories;
using APIControllersData.Validations;
using APIControllersData.Models;


var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddSingleton<IDbDataAccess, DbDataAccess>();
builder.Services.AddScoped<IUsuarioRepository, UsuarioRepository>();
builder.Services.AddScoped<IAutobusRepository, AutobusRepository>();
builder.Services.AddScoped<IRutaRepository, RutaRepository>();

//validations
builder.Services.AddScoped<IValidator<Usuario>, UsuarioValidator>();
builder.Services.AddScoped<IValidator<Autobuses>, AutobusValidator>();
builder.Services.AddScoped<IValidator<Ruta>, RutaValidator>();




builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
