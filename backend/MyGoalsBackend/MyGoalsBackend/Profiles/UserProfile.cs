using AutoMapper;
using MyGoalsBackend.Data.Dtos;
using MyGoalsBackend.Models;

namespace MyGoalsBackend.Profiles
{
    public class UserProfile : Profile
    {
        public UserProfile()
        {
            CreateMap<CreateUserDto,UserModel>();
            CreateMap<LoginUserDto,UserModel>();
        }
    }
}
