using System.ComponentModel.DataAnnotations;

namespace MyGoalsBackend.Data.Dtos.Requests
{
    public class GetGoalsDto
    {
        [Required]
        public int userId { get; set; }
    }
}
