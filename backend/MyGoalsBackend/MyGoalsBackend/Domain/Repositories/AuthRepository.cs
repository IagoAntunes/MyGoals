using MyGoalsBackend.Api.Repositories;
using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;
using MyGoalsBackend.Domain.IServices;

namespace MyGoalsBackend.Domain.Repositories
{
    public class AuthRepository : IAuthRepository
    {
        private IAuthService _authService;

        public AuthRepository(IAuthService authService)
        {
            _authService = authService;
        }
        public Task<IBaseResult> Login(LoginUserDto userDto)
        {
            return _authService.Login(userDto);
        }

        public Task<IBaseResult> Register(CreateUserDto userDto)
        {
            return _authService.Register(userDto);
        }
    }
}
