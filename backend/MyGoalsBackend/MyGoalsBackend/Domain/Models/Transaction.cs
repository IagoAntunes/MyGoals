using System.ComponentModel.DataAnnotations;

namespace MyGoalsBackend.Domain.Models
{
    public class Transaction
    {
        [Key]
        [Required]
        public int Id { get; set; }
        public int UserId { get; set; }
        public int GoalId { get; set; }
        public string Value { get; set; }
        public string Date { get; set; }
        public string Type { get; set; }
        public User User { get; set; }
        public Goal Goal { get; set; }
    }
}
