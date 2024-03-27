using AutoMapper;
using Microsoft.AspNetCore.Http.HttpResults;
using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;
using MyGoalsBackend.Domain.IServices;
using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Data.Services
{
    public class TransactionService : ITransactionService
    {
        MyGoalsDbContext _dbContext;
        IMapper _mapper;
        public TransactionService(
            MyGoalsDbContext context,
            IMapper mapper)
        {
            this._dbContext = context;
            this._mapper = mapper;
        }
        public IBaseResult CreateTransition(CreateTransactionDto transactionDto)
        {
            Transaction transaction = _mapper.Map<Transaction>(transactionDto);
            _dbContext.Transactions.Add(transaction);
            _dbContext.SaveChanges();
            return new SuccessResult("Transação realizada com sucesso!");
        }
    }
}
