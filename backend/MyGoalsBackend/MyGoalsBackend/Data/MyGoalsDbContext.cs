using Microsoft.EntityFrameworkCore;
using MyGoalsBackend.Domain.Models;
using System.Security.Cryptography.X509Certificates;

namespace MyGoalsBackend.Data
{
    public class MyGoalsDbContext : DbContext
    {
        public DbSet<User> Users { get; set; }
        public DbSet<Transaction> Transactions { get; set; }
        public DbSet<Goal> Goals { get; set; }
        public MyGoalsDbContext(DbContextOptions<MyGoalsDbContext> opts) : base(opts) { }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<Goal>()
                   .HasOne(g => g.User)                     // Um Goal tem um User
                   .WithMany(u => u.Goals)                  // Um User pode ter muitos Goals
                   .HasForeignKey(g => g.UserId);          // A chave estrangeira em Goal é UserId

            modelBuilder.Entity<Transaction>()
                 .HasOne(t => t.User)
                 .WithMany(u => u.Transactions)
                 .HasForeignKey(t => t.UserId);

        }
    }
}
