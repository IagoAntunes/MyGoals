using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;
using MyGoalsBackend.Data.Dtos.Results.AuthResults;
using MyGoalsBackend.Domain.IServices;
using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Data.Services
{
    public class GoalService : IGoalService
    {
        UserManager<UserModel> _userManager;
        MyGoalsDbContext _context;
        IMapper _mapper;
        public GoalService(
            UserManager<UserModel> userManager,
            MyGoalsDbContext context,
            IMapper mapper
            )
        {
            this._userManager = userManager;
            this._context = context;
            this._mapper = mapper;
        }
        public IBaseResult createGoal(CreateGoalDto goalDto)
        {
            var user =  _userManager.Users.ToList().FirstOrDefault(u => u.Id == goalDto.UserId);

            if(user == null)
            {
                return new FailureResult<Unauthenticated>("Usuário inexistente",
                    new Unauthenticated(
                        new UserNotFoundResult()));
            }
            GoalModel goal = _mapper.Map<GoalModel>(goalDto);
            _context.Goals.Add(goal);
            _context.SaveChanges();
            return new SuccessResult<string?>("Meta adicionada com sucesso!",null);
        }
    }
}
