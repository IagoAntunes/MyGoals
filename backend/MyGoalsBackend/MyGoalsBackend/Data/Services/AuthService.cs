using AutoMapper;
using Microsoft.AspNetCore.Identity;
using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;
using MyGoalsBackend.Data.Dtos.Results.AuthResults;
using MyGoalsBackend.Domain.IServices;
using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Data.Services
{
    public class AuthService : IAuthService
    {
        private IMapper _mapper;
        private UserManager<UserModel> _userManager;
        private SignInManager<UserModel> _signInManager;
        private ITokenService _tokenService;

        public AuthService(
            UserManager<UserModel> userManager,
            IMapper mapper,
            SignInManager<UserModel> signInManager,
            ITokenService tokenService)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _mapper = mapper;
            _tokenService = tokenService;
        }
        public async Task<IBaseResult> Register(CreateUserDto userDto)
        {

            var userExists = await _userManager.FindByNameAsync(userDto.Username);
            if(userExists != null)
            {
                return new Unauthenticated(new UserAlreadyExistsResult());
            }

            UserModel user = _mapper.Map<UserModel>(userDto);
            var result = await _userManager.CreateAsync(user, userDto.Password);

            if (!result.Succeeded)
            {
                return new Unauthenticated(new OtherErrorResult());
            }
            return new Authenticated(new UserRegisteredResult());
        }

        public async Task<IBaseResult> Login(LoginUserDto userDto)
        {

            var userExists = await _userManager.FindByNameAsync(userDto.Username);

            if(userExists == null)
            {
                return new FailureResult<Unauthenticated>("Usuário inexistente",
                    new Unauthenticated(
                        new UserNotFoundResult()));
            }
            var resultSignIn = await _signInManager.CheckPasswordSignInAsync(userExists, userDto.Password, false);


            if (!resultSignIn.Succeeded)
            {
                return new FailureResult<Unauthenticated>("Senha Incorreta",
                    new Unauthenticated(
                        new WrongPasswordResult()));
            }
            var user = _signInManager
                .UserManager
                .Users
                .FirstOrDefault(
                user => user.NormalizedUserName == userDto.Username.ToUpper()
                );

            var token = _tokenService.GenerateToken(user);
            var result = new SuccessResult<Authenticated>("Usuário Logado com sucesso",
                new Authenticated(
                    new UserLoggedResult(token, user.Id)));
            return result;
        }
    }
}
