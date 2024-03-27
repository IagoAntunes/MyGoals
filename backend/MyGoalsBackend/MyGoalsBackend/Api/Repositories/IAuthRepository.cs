using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;

namespace MyGoalsBackend.Api.Repositories
{
    public interface IAuthRepository
    {
        Task<IBaseResult> Register(CreateUserDto userDto);
        Task<IBaseResult> Login(LoginUserDto userDto);
        IBaseResult DeleteUser(int userId);
    }
}
