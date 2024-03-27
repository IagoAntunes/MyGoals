namespace MyGoalsBackend.Data.Dtos.Responses
{
    public class TransactionResponseDto : BaseResponse
    {
        public TransactionResponseDto(string message): base(message)
        {
            this.Message = message;
        }
        public string Message { get; set; }
    }
}
