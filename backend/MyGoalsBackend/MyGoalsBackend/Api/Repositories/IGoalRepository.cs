using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;
using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Api.Repositories
{
    public interface IGoalRepository
    {
        IBaseResult createGoal(CreateGoalDto goalDto);
        IBaseGetResult<ICollection<Goal>> GetGoals(GetGoalsDto goalDto);
    }
}
