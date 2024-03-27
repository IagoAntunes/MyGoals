using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;
using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Domain.IServices
{
    public interface IGoalService
    {
        IBaseResult createGoal(CreateGoalDto goalDto);
        IBaseResult DeleteGoal(int goalId);
        IBaseResult DeleteAllGoalsByUserId(int userId);
        IBaseGetResult<ICollection<Goal>> GetGoals(GetGoalsDto goalDto);
        IBaseTResult<Goal?> UpdateGoal(UpdateGoalDto goalDto);
        IBaseResult ValidateGoal(int goalId);
    }
}
