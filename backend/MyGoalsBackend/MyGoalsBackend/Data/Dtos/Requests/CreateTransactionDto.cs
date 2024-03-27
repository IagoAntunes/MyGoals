namespace MyGoalsBackend.Data.Dtos.Requests
{
    public class CreateTransactionDto
    {
        public int UserId { get; set; }
        public int GoalId { get; set; }
        public int Value { get; set; }
        public string Date { get; set; }
        public string Type { get; set; }
    }
}
