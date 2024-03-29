using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Data.Dtos.Responses
{
    public class TransactionResponseDto : BaseResponse
    {
        public TransactionResponseDto(string message,string status): base(message,status)
        {
            this.Message = message;
        }
        public string Message { get; set; }
    }

    public class GetTransactionsResponseDto : BaseResponse
    {
        public ICollection<Transaction>? Transactions { get; set; }
        public GetTransactionsResponseDto(ICollection<Transaction> transactions, string message,string status) : base(message,status)
        {
            this.Transactions = transactions;
        }
        public GetTransactionsResponseDto(string message,string status) : base(message,status)
        {
        }
    }
}
