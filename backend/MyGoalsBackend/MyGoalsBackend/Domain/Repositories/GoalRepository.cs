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
        IAuthService _authService;
        public GoalRepository(IGoalService goalService,
            ITransactionService transactionService,
            IAuthService _authService)
        {
            this._goalService = goalService;
            this._transactionService = transactionService;
            this._authService = _authService;
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
            var result = _authService.ValidateUser(goalDto.userId);
            if(result is SuccessResult)
            {
                return _goalService.GetGoals(goalDto);
            }
            else
            {
                return new FailureGetResult<ICollection<Goal>>(result.Message);
            }
   
        }

        public IBaseTResult<Goal?> UpdateGoal(UpdateGoalDto goalDto)
        {
            return _goalService.UpdateGoal(goalDto);
        }
    }
}
