using MyGoalsBackend.Domain.Models;
using System.ComponentModel.DataAnnotations;

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
    public class GoalPutResponseDto : GoalResponseDto
    {
        public int? Id { get; set; }
        public int? UserId { get; set; }
        public string? Title { get; set; }
        public int? Price { get; set; }
        public int? CurrentValue { get; set; }
        public GoalPutResponseDto(
            string message
            ) : base(message)
                {
            this.Id = null;
        }
        public GoalPutResponseDto(
            string message,
            int id,
            int userId,
            string title,
            int price,
            int currentValue
            ) : base(message)
        {
            this.Id = id;
            this.UserId = userId;
            this.Title = title;
            this.Price = price;
            this.CurrentValue = currentValue;
        }
    }
}
