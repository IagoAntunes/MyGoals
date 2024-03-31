using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using MyGoalsBackend.Api.Repositories;
using MyGoalsBackend.Data;
using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Responses;
using MyGoalsBackend.Data.Dtos.Results;
using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class TransactionController : ControllerBase
    {
        ITransactionRepository _repository;
        public TransactionController(
            ITransactionRepository repository)
        {
            this._repository = repository;
        }

        [HttpPost]
        public IActionResult CreateTransaction([FromBody] CreateTransactionDto transactionDto)
        {
            var result = _repository.CreateTransition(transactionDto);
            string status;
            if (result is SuccessResult)
            {
                status = "Sucesso";
            }
            else
            {
                status = "Falha";
            }
            var response = new TransactionResponseDto(result.Message,status);
            return Ok(response);
        }
        [HttpGet]
        public IActionResult GetTransactionsByUserId([FromQuery] int userId, [FromQuery] int? goalId)
        {
            var result = _repository.GetTransactionsByUserId(userId, goalId);
            string status;
            if (result is SuccessTResult<ICollection<Transaction>>)
            {
                status = "Sucesso";
            }
            else
            {
                status = "Falha";
            }
            if (result.Value == null)
            {
                return Ok(new GetTransactionsResponseDto(result.Message,status));
            }
            var response = new GetTransactionsResponseDto(result.Value,result.Message,status);
            return Ok(response);
        }
    }
}
