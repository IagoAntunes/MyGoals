using System.ComponentModel.DataAnnotations;

namespace MyGoalsBackend.Domain.Models
{
    public class GoalModel
    {
        [Key]
        [Required]
        public int Id { get; set; }
        public string UserId { get; set; }
        public string Title { get; set; }
        public int Price { get; set; }
        public int CurrentValue { get; set; }
        public UserModel User { get; set; }
    }
}
