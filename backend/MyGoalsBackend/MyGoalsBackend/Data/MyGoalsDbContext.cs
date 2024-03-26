using Microsoft.EntityFrameworkCore;
using MyGoalsBackend.Domain.Models;
using System.Security.Cryptography.X509Certificates;

namespace MyGoalsBackend.Data
{
    public class MyGoalsDbContext : DbContext
    {
        public DbSet<TransactionModel> Transactions { get; set; }
        public DbSet<GoalModel> Goals { get; set; }
        public DbSet<UserModel> Users { get; set; }

        public MyGoalsDbContext(DbContextOptions<MyGoalsDbContext> opts) : base(opts) { }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<GoalModel>()
                       .HasOne(g => g.User)
                       .WithMany(u => u.Goals)
                       .HasForeignKey(g => g.UserId)
                       .IsRequired();

            modelBuilder.Entity<TransactionModel>()
                .HasOne(t => t.User)
                .WithMany(u => u.Transactions)
                .HasForeignKey(t => t.UserId);


        }


    }
}
