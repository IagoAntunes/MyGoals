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
        public GoalRepository(IGoalService goalService)
        {
            this._goalService = goalService;
        }
        public IBaseResult createGoal(CreateGoalDto goalDto)
        {
            return _goalService.createGoal(goalDto);
        }

        public IBaseGetResult<ICollection<Goal>> GetGoals(GetGoalsDto goalDto)
        {
            return _goalService.GetGoals(goalDto);
        }
    }
}
