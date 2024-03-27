using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

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
        [JsonIgnore]
        public virtual User User { get; set; }
        [JsonIgnore]
        public virtual Goal Goal { get; set; }
    }
}
