using System.ComponentModel.DataAnnotations;

namespace MyGoalsBackend.Domain.Models
{
    public class User 
    {
        [Key]
        [Required]
        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public DateTime DateBirth { get; set; }
        public ICollection<Transaction> Transactions { get; set; }
        public ICollection<Goal> Goals { get; set; }

    }
}
