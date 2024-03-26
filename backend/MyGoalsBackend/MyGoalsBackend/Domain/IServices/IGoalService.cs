using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;

namespace MyGoalsBackend.Domain.IServices
{
    public interface IGoalService
    {
        IBaseResult createGoal(CreateGoalDto goalDto);
    }
}
