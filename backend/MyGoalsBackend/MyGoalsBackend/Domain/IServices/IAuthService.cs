using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;

namespace MyGoalsBackend.Domain.IServices
{
    public interface IAuthService
    {
        Task<IBaseResult<string>> Register(CreateUserDto userDto);
        Task<IBaseResult<string>> Login(LoginUserDto userDto);
    }
}
