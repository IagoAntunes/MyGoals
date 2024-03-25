using Microsoft.AspNetCore.Mvc;
using MyGoalsBackend.Api.Repositories;
using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Responses;
using MyGoalsBackend.Data.Dtos.Results;

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
        public async Task<ActionResult<IResponseDto>> CreateUser(CreateUserDto userDto)
        {
            var result = await _authRepository.Register(userDto);
            IResponseDto? response;
            response = new BaseResponse(result.Message);
            return Ok(response);
   
        }
        [HttpPost("login")]
        public async Task<ActionResult<IResponseDto>> SignInUser(LoginUserDto userDto)
        {
            var result = await _authRepository.Login(userDto);
            IResponseDto? response;
            if(result is SuccessResult<string>)
            {
                response  = new LoginResponseDto(
                    message: result.Message,
                    token: result.Value
                );
                return Ok(response);
            }
            else
            {
                response = new LoginResponseDto(
                    errorMessage: ((FailureResult)result).Message
                );
            }

            return Ok(response);
        }
    }
}
