using MyGoalsBackend.Data.Dtos;

namespace MyGoalsBackend.Domain.IServices
{
    public interface IAuthService
    {
        Task Register(CreateUserDto userDto);
        Task<string> Login(LoginUserDto userDto);
    }
}
