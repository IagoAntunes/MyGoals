using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using MyGoalsBackend.Domain.Models;
using System.Reflection.Emit;

namespace MyGoalsBackend.Data
{
    public class AuthDbContext : IdentityDbContext<UserModel>
    {

        public AuthDbContext(DbContextOptions<AuthDbContext> opt) : base(opt) { }
        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
            builder.Entity<UserModel>().ToTable("AspNetUsers");
        }
    }
}
