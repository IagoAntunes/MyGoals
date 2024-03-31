using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;
using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Domain.IServices
{
    public interface ITransactionService
    {
        IBaseResult CreateTransition(CreateTransactionDto transactionDto);
        IBaseResult DeleteTransactionsByGoalId(int goalId);
        IBaseResult DeleteAllTransactionsByUserId(int userId);
        IBaseTResult<ICollection<Transaction>?> GetTransactionsByUserId(int userId);
        IBaseTResult<ICollection<Transaction>?> GetTransactionsByGoal(int userId, int? goalId);
    }
}
