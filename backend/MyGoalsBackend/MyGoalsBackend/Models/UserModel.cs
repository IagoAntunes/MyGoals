using Microsoft.AspNetCore.Identity;

namespace MyGoalsBackend.Models
{
    public class UserModel : IdentityUser
    {
        public DateTime DateBirth { get; set; }

        public UserModel(): base() { } 
        
    }
}
