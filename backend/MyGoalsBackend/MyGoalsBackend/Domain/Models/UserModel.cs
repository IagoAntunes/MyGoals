using Microsoft.AspNetCore.Identity;

namespace MyGoalsBackend.Domain.Models
{
    public class UserModel : IdentityUser
    {
        public DateTime DateBirth { get; set; }

        public UserModel() : base() { }

    }
}
