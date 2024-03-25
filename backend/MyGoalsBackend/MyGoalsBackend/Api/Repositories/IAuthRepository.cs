using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;

namespace MyGoalsBackend.Api.Repositories
{
    public interface IAuthRepository
    {
        Task<IBaseResult<string>> Register(CreateUserDto userDto);
        Task<IBaseResult<string>> Login(LoginUserDto userDto);
    }
}
