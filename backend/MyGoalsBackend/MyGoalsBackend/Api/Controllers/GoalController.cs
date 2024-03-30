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
    public class GoalController : ControllerBase
    {
        public MyGoalsDbContext _context;
        public IMapper _mapper;
        public IGoalRepository _repository;

        public GoalController(
            MyGoalsDbContext context,
            IMapper mapper,
            IGoalRepository repository
            )
        {
            this._context = context;
            this._mapper = mapper;
            this._repository = repository;
        }


        [HttpPost]
        public IActionResult CreateGoal([FromBody] CreateGoalDto goalDto)
        {
            var result = _repository.createGoal(goalDto);
            string status;
            if (result is SuccessResult)
            {
                status = "Sucesso";
            }
            else
            {
                status = "Falha";
            }
            var response = new GoalResponseDto(result.Message,status);

            return Ok(response);
        }
        [HttpGet]
        public IActionResult GetGoals([FromQuery] GetGoalsDto goalDto)
        {
            var result = _repository.GetGoals(goalDto);
            string status;
            if (result is SuccessGetResult<ICollection<Goal>>)
            {
                status = "Sucesso";
            }
            else
            {
                status = "Falha";
            }
            var response = new GoalGetResponseDto(result.Message,result.Value,status);
            return Ok(response);
        }
        [HttpPut]
        public IActionResult UpdateGoal([FromBody] UpdateGoalDto goalDto)
        {
            var result = _repository.UpdateGoal(goalDto);
            GoalPutResponseDto response;
            string status;
            if (result is SuccessResult)
            {
                status = "Sucesso";
            }
            else
            {
                status = "Falha";
            }
            if (result.Value == null)
            {
                return Ok(new GoalPutResponseDto(result.Message,status));
            }
             response = new GoalPutResponseDto(result.Message,
                result.Value.Id,
                result.Value.UserId,
                result.Value.Title,
                result.Value.Price,
                result.Value.CurrentValue,
                status
                );
            return Ok(response);
        }
        [HttpDelete("{goalId}")]
        public IActionResult DeleteGoal(int goalId )
        {
            var result = _repository.DeleteGoal(goalId);
            string status;
            if (result is SuccessResult)
            {
                status = "Sucesso";
            }
            else
            {
                status = "Falha";
            }
            return Ok(new BaseResponse(result.Message, status));
        }

    }
}
