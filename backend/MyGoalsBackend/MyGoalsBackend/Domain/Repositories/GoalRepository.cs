using MyGoalsBackend.Api.Repositories;
using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;
using MyGoalsBackend.Domain.IServices;
using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Domain.Repositories
{
    public class GoalRepository : IGoalRepository
    {
        IGoalService _goalService;
        ITransactionService _transactionService;
        public GoalRepository(IGoalService goalService, ITransactionService transactionService)
        {
            this._goalService = goalService;
            this._transactionService = transactionService;
        }
        public IBaseResult createGoal(CreateGoalDto goalDto)
        {
            return _goalService.createGoal(goalDto);
        }

        public IBaseResult DeleteGoal(int goalId)
        {
            var result = _goalService.ValidateGoal(goalId);
            if (result is FailureResult)
            {
                return result;
            }
            var result2 = _transactionService.DeleteTransactionsByGoalId(goalId);
            return _goalService.DeleteGoal(goalId);
        }

        public IBaseGetResult<ICollection<Goal>> GetGoals(GetGoalsDto goalDto)
        {
            return _goalService.GetGoals(goalDto);
        }

        public IBaseTResult<Goal?> UpdateGoal(UpdateGoalDto goalDto)
        {
            return _goalService.UpdateGoal(goalDto);
        }
    }
}
