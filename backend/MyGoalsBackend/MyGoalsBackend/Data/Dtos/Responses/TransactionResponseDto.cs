using MyGoalsBackend.Domain.Models;

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

    public class GetTransactionsResponseDto : BaseResponse
    {
        public ICollection<Transaction>? Transactions { get; set; }
        public GetTransactionsResponseDto(ICollection<Transaction> transactions, string message) : base(message)
        {
            this.Transactions = transactions;
        }
        public GetTransactionsResponseDto(string message) : base(message)
        {
        }
    }
}
