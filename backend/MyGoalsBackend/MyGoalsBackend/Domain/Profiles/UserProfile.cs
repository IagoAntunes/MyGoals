using AutoMapper;
using MyGoalsBackend.Data.Dtos;
using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Domain.Profiles
{
    public class UserProfile : Profile
    {
        public UserProfile()
        {
            CreateMap<CreateUserDto, UserModel>();
            CreateMap<LoginUserDto, UserModel>();
        }
    }
}
