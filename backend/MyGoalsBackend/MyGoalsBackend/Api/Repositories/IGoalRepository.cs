using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;

namespace MyGoalsBackend.Api.Repositories
{
    public interface IGoalRepository
    {
        IBaseResult createGoal(CreateGoalDto goalDto);
    }
}
