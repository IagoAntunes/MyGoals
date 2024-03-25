using MyGoalsBackend.Api.Repositories;
using MyGoalsBackend.Domain.IServices;
using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Domain.Repositories
{
    public class TokenRepository : ITokenRepository
    {
        private ITokenService _tokenService;
        public TokenRepository(ITokenService token)
        {
            _tokenService = token;
        }

        public string GenerateToken(UserModel usuario)
        {
            return _tokenService.GenerateToken(usuario);
        }
    }
}
