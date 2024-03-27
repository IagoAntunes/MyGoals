using MyGoalsBackend.Api.Repositories;
using MyGoalsBackend.Data;
using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;
using MyGoalsBackend.Data.Dtos.Results.AuthResults;
using MyGoalsBackend.Domain.IServices;
using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Domain.Repositories
{
    public class TransactionRepository : ITransactionRepository
    {
        ITransactionService _service;
        IAuthService _authService;
        IGoalService _goalService;
        public TransactionRepository(
            ITransactionService service,
            IAuthService authService,
            IGoalService goalService)
        {
            this._service = service;
            this._authService = authService;
            this._goalService = goalService;
        }
        public IBaseResult CreateTransition(CreateTransactionDto transactionDto)
        {
            var result = _authService.ValidateUser(transactionDto.UserId);
            if (result is SuccessResult)
            {
                var result2 = _goalService.ValidateGoal(transactionDto.GoalId);
                if(result2 is SuccessResult)
                {
                    return _service.CreateTransition(transactionDto);
                }
                else
                {
                    return result2;
                }
            }
            else
            {
                return result;
            }
        }

        public IBaseResult GetTransactions(int userId)
        {
            throw new NotImplementedException();
        }

        public IBaseTResult<ICollection<Transaction>?> GetTransactionsByUserId(int userId)
        {
            var result = _authService.ValidateUser(userId);
            if(result  is FailureResult)
            {
                return new FailureTResult<ICollection<Transaction>?>("Usuário não encontrado",null);
            }
            return _service.GetTransactionsByUserId(userId);
        }
    }
}
