﻿using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using MyGoalsBackend.Api.Repositories;
using MyGoalsBackend.Data;
using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Responses;
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
            var response = new TransactionResponseDto(result.Message);
            return Ok(response);
        }
        [HttpGet]
        public IActionResult GetTransactionsByUserId([FromQuery] int userId)
        {
            var result = _repository.GetTransactionsByUserId(userId);
            if(result.Value == null)
            {
                return Ok(new GetTransactionsResponseDto(result.Message));
            }
            var response = new GetTransactionsResponseDto(result.Value,result.Message);
            return Ok(response);
        }
    }
}