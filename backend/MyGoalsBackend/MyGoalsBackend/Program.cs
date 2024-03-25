using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MyGoalsBackend.Data;
using MyGoalsBackend.Models;
using MyGoalsBackend.Services;

var builder = WebApplication.CreateBuilder(args);

//DbConnection
var connectionString = builder.Configuration.GetConnectionString("UserConnection");
builder.Services.AddDbContext<AuthDbContext>(
    opts =>
    {
        opts.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString));
    }
    );

//Identity Configuration
builder.Services
    .AddIdentity<UserModel, IdentityRole>()
    .AddEntityFrameworkStores<AuthDbContext>()
    .AddDefaultTokenProviders();

//AutoMapper
builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

//Dependency Injection
builder.Services.AddScoped<AuthService>();
builder.Services.AddScoped<TokenService>();


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
