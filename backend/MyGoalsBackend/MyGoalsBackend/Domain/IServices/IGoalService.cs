using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;
using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Domain.IServices
{
    public interface IGoalService
    {
        IBaseResult createGoal(CreateGoalDto goalDto);
        IBaseGetResult<ICollection<Goal>> GetGoals(GetGoalsDto goalDto);
        IBaseResult ValidateGoal(int goalId);
    }
}
