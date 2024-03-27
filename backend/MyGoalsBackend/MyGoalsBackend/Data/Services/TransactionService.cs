using AutoMapper;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.EntityFrameworkCore;
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

        public IBaseResult DeleteAllTransactionsByUserId(int userId)
        {
            var transactions = _dbContext.Transactions.Where(t => t.UserId == userId).ToList();
            if (transactions.Count() > 0)
            {

                _dbContext.RemoveRange(transactions);
                _dbContext.SaveChanges();
            }
            return new SuccessResult("Transações removidas");
        }

        public IBaseResult DeleteTransactionsByGoalId(int goalId)
        {
            var transactions = _dbContext.Transactions.Where(t => t.GoalId == goalId).ToList();
            if (transactions.Count() > 0)
            {

                _dbContext.RemoveRange(transactions);
                _dbContext.SaveChanges();
            }
            return new SuccessResult("Transações removidas");
        }

        public IBaseTResult<ICollection<Transaction>?> GetTransactionsByUserId(int userId)
        {
            var result = _dbContext.Transactions.Where(t => t.UserId == userId).ToList();
            return new SuccessTResult<ICollection<Transaction>>("Consulta realizada com sucesso",result);
        }
    }
}
