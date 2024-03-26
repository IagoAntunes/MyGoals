using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;

namespace MyGoalsBackend.Domain.IServices
{
    public interface IAuthService
    {
        Task<IBaseResult> Register(CreateUserDto userDto);
        Task<IBaseResult> Login(LoginUserDto userDto);
    }
}
