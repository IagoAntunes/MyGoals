using System.ComponentModel.DataAnnotations;

namespace MyGoalsBackend.Domain.Models
{
    public class Goal
    {
        [Key]
        [Required]
        public int Id { get; set; }
        public int UserId { get; set; }
        public string Title { get; set; }
        public int Price { get; set; }
        public int CurrentValue { get; set; }
        public virtual User User { get; set; }
    }
}
