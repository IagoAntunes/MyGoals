using AutoMapper;
using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Responses;
using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Domain.Profiles
{
    public class GoalProfile : Profile
    {
        public GoalProfile()
        {
            CreateMap<CreateGoalDto,Goal>();
            CreateMap<GetGoalsDto,Goal>();
            CreateMap<UpdateGoalDto,Goal>();
        }


    }
}
