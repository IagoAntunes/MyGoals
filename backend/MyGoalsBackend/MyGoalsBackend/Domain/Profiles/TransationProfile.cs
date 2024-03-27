using AutoMapper;
using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Domain.Profiles
{
    public class TransationProfile : Profile
    {
        public TransationProfile()
        {
            CreateMap<CreateTransactionDto, Transaction>();
        }
    }
}
