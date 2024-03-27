using AutoMapper;
using Microsoft.EntityFrameworkCore;
using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;
using MyGoalsBackend.Data.Dtos.Results.AuthResults;
using MyGoalsBackend.Domain.IServices;
using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Data.Services
{
    public class AuthService : IAuthService
    {
        private MyGoalsDbContext _authContext;
        private IMapper _mapper;
        private ITokenService _tokenService;

        public AuthService(
            IMapper mapper,
            ITokenService tokenService,
            MyGoalsDbContext authContext)
        {
            this._mapper = mapper;
            this._tokenService = tokenService;
            this._authContext = authContext;
        }
        public async Task<IBaseResult> Register(CreateUserDto userDto)
        {

            var userExists =  _authContext.Users.FirstOrDefault(user =>user.Username.ToLower().Equals(userDto.Username.ToLower()));
            if(userExists != null)
            {
                return new FailureResult("Usuário inexistente!");
            }

            User user = _mapper.Map<User>(userDto);
            _authContext.Add(user);
            _authContext.SaveChanges();
            //return new Unauthenticated(new OtherErrorResult());
            return new SuccessResult("Cadastrado com sucesso!");
        }

        public async Task<IBaseResult> Login(LoginUserDto userDto)
        {

            var userExists = _authContext.Users.FirstOrDefault(user => user.Username.ToLower().Equals(userDto.Username.ToLower()));

            if (userExists == null)
            {
                return new FailureResult("Usuário ja existe!");
            }

            if (!userExists.Password.Equals(userDto.Password))
            {
                return new FailureResult("Senha Incorreta!");
            }

            var token = _tokenService.GenerateToken(userExists);
            var result = new SignInResult("Usuário Logado com sucesso",token,userExists.Id);
            return result;
        }

        public IBaseResult ValidateUser(int userId)
        {
            var result = _authContext.Users.FirstOrDefault(user => user.Id == userId);
            if(result == null)
            {
                return new FailureResult("Usuário inexistente");
            }
            return new SuccessResult("");
        }
    }
}
