
using Microsoft.IdentityModel.Tokens;
using MyGoalsBackend.Domain.IServices;
using MyGoalsBackend.Domain.Models;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace MyGoalsBackend.Data.Services
{
    public class TokenService : ITokenService
    {
        public string GenerateToken(User usuario)
        {
            Claim[] claims =
            [
                new Claim("username", usuario.Username),
                new Claim("id", usuario.Id.ToString()),
            ];

            var chave = new SymmetricSecurityKey(
                Encoding.UTF8.GetBytes("ABCABCABCABCABCABCABCABCABCABCABCABC")
                );
            var signinCredentials = new SigningCredentials(
                chave,
                SecurityAlgorithms.HmacSha256
                );

            var token = new JwtSecurityToken(
                expires: DateTime.Now.AddDays(1),
                claims: claims,
                signingCredentials: signinCredentials
                );

            //Convert JWT type to string
            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}