using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;

namespace MyGoalsBackend.Api.Repositories
{
    public interface ITransactionRepository
    {
        IBaseResult CreateTransition(CreateTransactionDto transactionDto);
    }
}
