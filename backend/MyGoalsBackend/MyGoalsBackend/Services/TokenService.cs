
using Microsoft.IdentityModel.Tokens;
using MyGoalsBackend.Models;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace MyGoalsBackend.Services
{
    public class TokenService
    {
        public string GenerateToken(UserModel usuario)
        {
            Claim[] claims = new Claim[]
            {
                new Claim("username", usuario.UserName),
                new Claim("id", usuario.Id),
                new Claim("id", usuario.Id),
            };

            var chave = new SymmetricSecurityKey(
                Encoding.UTF8.GetBytes("ABCABCABCABCABC")
                ) ;
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
            return new JwtSecurityTokenHandler().WriteToken( token );
        }
    }
}