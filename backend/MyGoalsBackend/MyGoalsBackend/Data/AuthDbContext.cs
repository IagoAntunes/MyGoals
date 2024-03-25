using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Data
{
    public class AuthDbContext : IdentityDbContext<UserModel>
    {

        public AuthDbContext(DbContextOptions<AuthDbContext> opt) : base(opt) { }   
        
    }
}
