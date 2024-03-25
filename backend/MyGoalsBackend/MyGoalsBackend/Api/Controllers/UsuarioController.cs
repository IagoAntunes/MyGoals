using Microsoft.AspNetCore.Mvc;
using MyGoalsBackend.Api.Repositories;
using MyGoalsBackend.Data.Dtos;

namespace MyGoalsBackend.Api.Controllers
{
    [ApiController]
    [Route("[Controller]")]
    public class UsuarioController : ControllerBase
    {
        private IAuthRepository _authRepository;
        public int MyProperty { get; set; }

        public UsuarioController(IAuthRepository repository)
        {
            _authRepository = repository;
        }

        [HttpPost("register")]
        public async Task<IActionResult> CreateUser(CreateUserDto userDto)
        {
            await _authRepository.Register(userDto);
            return Ok("Usuário Cadastrado");
        }
        [HttpPost("login")]
        public async Task<IActionResult> SignInUser(LoginUserDto userDto)
        {
            var token = await _authRepository.Login(userDto);
            return Ok(token);
        }
    }
}
