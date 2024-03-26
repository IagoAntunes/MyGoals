using MyGoalsBackend.Api.Repositories;
using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;
using MyGoalsBackend.Domain.IServices;

namespace MyGoalsBackend.Domain.Repositories
{
    public class GoalRepository : IGoalRepository
    {
        IGoalService _goalService;
        public GoalRepository(IGoalService goalService)
        {
            this._goalService = goalService;
        }
        public IBaseResult createGoal(CreateGoalDto goalDto)
        {
            return _goalService.createGoal(goalDto);
        }
    }
}
