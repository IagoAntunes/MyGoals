using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

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
        [JsonIgnore]
        public virtual ICollection<Transaction> Transactions { get; set; }
        [JsonIgnore]
        public virtual ICollection<Goal> Goals { get; set; }

    }
}
