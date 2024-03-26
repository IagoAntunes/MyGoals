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
}
