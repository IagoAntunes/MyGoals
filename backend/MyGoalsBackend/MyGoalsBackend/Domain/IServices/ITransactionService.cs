using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;

namespace MyGoalsBackend.Domain.IServices
{
    public interface ITransactionService
    {
        IBaseResult CreateTransition(CreateTransactionDto transactionDto);
    }
}
