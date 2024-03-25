using System.ComponentModel.DataAnnotations;

namespace MyGoalsBackend.Data.Dtos.Requests
{
    public class LoginUserDto
    {
        [Required]
        public string Username { get; set; }
        [Required]
        public string Password { get; set; }
    }
}
