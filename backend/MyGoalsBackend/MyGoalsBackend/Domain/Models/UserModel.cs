using Microsoft.AspNetCore.Identity;
using System.Transactions;

namespace MyGoalsBackend.Domain.Models
{
    public class UserModel : IdentityUser
    {
        public DateTime DateBirth { get; set; }

        public UserModel() : base() { }
        public ICollection<TransactionModel> Transactions { get; set; }
        public ICollection<GoalModel> Goals { get; set; }

    }
}
