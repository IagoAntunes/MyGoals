using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Data.Dtos.Responses
{
    public class GoalResponseDto
    {
        public GoalResponseDto(string message)
        {
            this.Message = message;
        }
        public string Message { get; set; }
    }

    public class GoalGetResponseDto : GoalResponseDto
    {
        public ICollection<Goal> Goals { get; set; }
        public GoalGetResponseDto(string message, ICollection<Goal> goals) : base(message)
        {
            this.Goals = goals; 
        }
    }
}
