using MyGoalsBackend.Data.Dtos;

namespace MyGoalsBackend.Api.Repositories
{
    public interface IAuthRepository
    {
        Task Register(CreateUserDto userDto);
        Task<string> Login(LoginUserDto userDto);
    }
}
