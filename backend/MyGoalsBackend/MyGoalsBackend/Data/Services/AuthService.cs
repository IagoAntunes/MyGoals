using AutoMapper;
using Microsoft.AspNetCore.Identity;
using MyGoalsBackend.Data.Dtos;
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
        public async Task Register(CreateUserDto userDto)
        {
            UserModel user = _mapper.Map<UserModel>(userDto);
            var result = await _userManager.CreateAsync(user, userDto.Password);

            if (!result.Succeeded)
            {
                throw new ApplicationException("Falha ao cadastrar Usuario");
            }
        }

        public async Task<string> Login(LoginUserDto userDto)
        {
            var result = await _signInManager.PasswordSignInAsync(
                userDto.Username,
                userDto.Password,
                false,
                false
                );

            if (!result.Succeeded)
            {
                throw new ApplicationException("Usuário não autenticado");
            }
            var user = _signInManager
                .UserManager
                .Users
                .FirstOrDefault(
                user => user.NormalizedUserName == userDto.Username.ToUpper()
                );

            var token = _tokenService.GenerateToken(user);

            return token;
        }
    }
}
