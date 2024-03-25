using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using MyGoalsBackend.Data.Dtos;
using MyGoalsBackend.Models;
using MyGoalsBackend.Services;

namespace MyGoalsBackend.Controllers
{
    [ApiController]
    [Route("[Controller]")]
    public class UsuarioController : ControllerBase
    {
        private AuthService _authService;
        public int MyProperty { get; set; }

        public UsuarioController(AuthService service)
        {
            _authService = service;
        }

        [HttpPost("register")]
        public async Task<IActionResult> CreateUser(CreateUserDto userDto)
        {
            await _authService.Register(userDto);
            return Ok("Usuário Cadastrado");
        }
        [HttpPost("login")]
        public async Task<IActionResult> SignInUser(LoginUserDto userDto)
        {
            var token = await _authService.Login(userDto);
            return Ok(token);
        }
    }
}
