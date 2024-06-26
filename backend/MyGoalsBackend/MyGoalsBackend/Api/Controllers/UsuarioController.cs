﻿using Microsoft.AspNetCore.Mvc;
using MyGoalsBackend.Api.Repositories;
using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Responses;
using MyGoalsBackend.Data.Dtos.Results;
using MyGoalsBackend.Data.Dtos.Results.AuthResults;
using SignInResult = MyGoalsBackend.Data.Dtos.Results.AuthResults.SignInResult;

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
            string status;
            if (result is SuccessResult)
            {
                status = "Sucesso";
            }
            else
            {
                status = "Falha";
            }
            IResponseDto? response;
            response = new BaseResponse(result.Message,status);
            return Ok(response);
   
        }
        [HttpPost("login")]
        public async Task<ActionResult<IResponseDto>> SignInUser(LoginUserDto userDto)
        {
            var result = await _authRepository.Login(userDto);
            IResponseDto? response;
            string status;
            if (result is SuccessResult)
            {
                status = "Sucesso";
            }
            else
            {
                status = "Falha";
            }
            if (result is SuccessResult)
            {
                response  = new LoginResponseDto(
                    message: result.Message,
                    status: status,
                    loginUser: new LoginUserResponseDto(
                        token: (result as SignInResult).Token,
                        userId: (result as SignInResult).UserId
                    )
                );
                return Ok(response);
            }
            else
            {
                response = new LoginResponseDto(
                    status:status,
                    errorMessage: result.Message
                );
            }

            return Ok(response);
        }
        [HttpDelete("{userId}")]
        public IActionResult DeleteUser(int userId)
        {
            var result = _authRepository.DeleteUser(userId);
            string status;
            if(result is SuccessResult)
            {
                status = "Sucesso";
            }
            else
            {
                status = "Falha";
            }
            return Ok(new BaseResponse(result.Message, status));
        }
  
    }
}
