using System.ComponentModel.DataAnnotations;

namespace MyGoalsBackend.Domain.Models
{
    public class TokenControll
    {
        [Key]
        public int Id { get; set; }
        public string Token { get; set; }
    }
}
