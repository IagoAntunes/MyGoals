using System.ComponentModel.DataAnnotations;

namespace MyGoalsBackend.Domain.Models
{
    public class TransactionModel
    {
        [Key]
        [Required]
        public int Id { get; set; }
        public string UserId { get; set; }
        public string MetaId { get; set; }
        public string Value { get; set; }
        public string Date { get; set; }
        public string Type { get; set; }
        public UserModel User { get; set; }
        public GoalModel Goal { get; set; }
    }
}
