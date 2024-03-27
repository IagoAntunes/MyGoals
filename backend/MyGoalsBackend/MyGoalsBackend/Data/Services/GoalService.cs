using AutoMapper;
using Microsoft.EntityFrameworkCore;
using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;
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

        public IBaseResult DeleteAllGoalsByUserId(int userId)
        {
            var goals = _context.Goals.Where(goal => goal.UserId == userId).ToList();
            if(goals.Count() > 0)
            {
                _context.RemoveRange(goals);
            }
            return new SuccessResult("Mestas removidas");
        }

        public IBaseResult DeleteGoal(int goalId)
        {
            var goal = _context.Goals.FirstOrDefault(goal => goal.Id == goalId);
            _context.Goals.Remove(goal);
            _context.SaveChanges();
            return new SuccessResult("Meta removida com sucesso");
        }

        public IBaseGetResult<ICollection<Goal>> GetGoals(GetGoalsDto goalDto)
        {
            var goals = _context.Goals.Include(g => g.User).ToList();
            return new SuccessGetResult<ICollection<Goal>>("Consulta realizaa com sucesso", goals);
        }

        public IBaseResult UpdateCurrentValueGoal(int goalid, int valueTransaction,string type)
        {
            var goal = _context.Goals.First(goal => goal.Id == goalid);

            if(type == "E")
            {
                goal.CurrentValue += valueTransaction;
            }
            else
            {
                goal.CurrentValue -= valueTransaction;
            }
            return new SuccessResult("Meta atualizada");
        }

        public IBaseTResult<Goal?> UpdateGoal(UpdateGoalDto goalDto)
        {
            var goal = _context.Goals.FirstOrDefault(goal => goal.Id == goalDto.Id);
            if(goal == null)
            {
                return new FailureTResult<Goal?>("Meta não encontrada",null);
            }
            _mapper.Map(goalDto, goal);
            _context.SaveChanges();
            return new SuccessTResult<Goal?>("Meta atualizada",goal);
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
