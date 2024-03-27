using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;
using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Api.Repositories
{
    public interface ITransactionRepository
    {
        IBaseResult CreateTransition(CreateTransactionDto transactionDto);
        IBaseResult GetTransactions(int userId);
        IBaseTResult<ICollection<Transaction>?> GetTransactionsByUserId(int userId);
    }
}
