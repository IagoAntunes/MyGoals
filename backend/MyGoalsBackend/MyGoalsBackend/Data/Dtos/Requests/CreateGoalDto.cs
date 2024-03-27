using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Data.Dtos.Requests
{
    public class CreateGoalDto
    {

        public int UserId { get; set; }
        public string Title { get; set; }
        public int Price { get; set; }
        public int CurrentValue { get; set; }
    }
}
