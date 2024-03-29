using System.ComponentModel.DataAnnotations;

namespace MyGoalsBackend.Data.Dtos.Requests
{
    public class CreateUserDto
    {
        [Required]
        public string Username { get; set; }
        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }
}
