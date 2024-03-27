using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;
using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Api.Repositories
{
    public interface IGoalRepository
    {
        IBaseResult createGoal(CreateGoalDto goalDto);
        IBaseResult DeleteGoal(int goalId);
        IBaseGetResult<ICollection<Goal>> GetGoals(GetGoalsDto goalDto);
        IBaseTResult<Goal?> UpdateGoal(UpdateGoalDto goalDto);
    }
}
