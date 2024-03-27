using AutoMapper;
using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Domain.Profiles
{
    public class UserProfile : Profile
    {
        public UserProfile()
        {
            CreateMap<CreateUserDto, User>();
            CreateMap<LoginUserDto, User>();
        }
    }
}
