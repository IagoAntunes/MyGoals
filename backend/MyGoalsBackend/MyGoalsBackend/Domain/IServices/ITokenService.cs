using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Domain.IServices
{
    public interface ITokenService
    {
        string GenerateToken(UserModel usuario);
    }
}
