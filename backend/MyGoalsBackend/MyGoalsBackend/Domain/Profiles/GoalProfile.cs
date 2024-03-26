using AutoMapper;
using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Domain.Profiles
{
    public class GoalProfile : Profile
    {
        public GoalProfile()
        {
            CreateMap<CreateGoalDto,GoalModel>();
        }


    }
}
