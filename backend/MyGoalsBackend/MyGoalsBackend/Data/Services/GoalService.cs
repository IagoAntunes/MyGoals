using AutoMapper;
using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;
using MyGoalsBackend.Data.Dtos.Results.AuthResults;
using MyGoalsBackend.Domain.IServices;
using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Data.Services
{
    public class GoalService : IGoalService
    {
        MyGoalsDbContext _context;
        IMapper _mapper;
        public GoalService(
            MyGoalsDbContext context,
            IMapper mapper
            )
        {
            this._context = context;
            this._mapper = mapper;
        }
        public IBaseResult createGoal(CreateGoalDto goalDto)
        {
            var user = _context.Users.ToList().FirstOrDefault(u => u.Id.Equals(goalDto.UserId));

            if(user == null)
            {
                return new FailureResult("Usuário inexistente");
            }
            Goal goal = _mapper.Map<Goal>(goalDto);
            _context.Goals.Add(goal);
            _context.SaveChanges();
            return new SuccessResult("Meta adicionada com sucesso!");
        }

        public IBaseGetResult<ICollection<Goal>> GetGoals(GetGoalsDto goalDto)
        {
            var goals = _context.Goals.ToList();
            return new SuccessGetResult<ICollection<Goal>>("Consulta realizaa com sucesso", goals);
        }

        public IBaseResult ValidateGoal(int goalId)
        {
            var result = _context.Goals.FirstOrDefault(user => user.Id == goalId);
            if (result == null)
            {
                //TODO
                return new FailureResult("Meta Inexistente");
            }
            return new SuccessResult("");
        }
    }
}
