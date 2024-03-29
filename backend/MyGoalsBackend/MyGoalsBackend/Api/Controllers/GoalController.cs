using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using MyGoalsBackend.Api.Repositories;
using MyGoalsBackend.Data;
using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Responses;
using MyGoalsBackend.Data.Dtos.Results;

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
            var response = new GoalResponseDto(result.Message);

            return Ok(response);
        }
        [HttpGet]
        public IActionResult GetGoals([FromQuery] GetGoalsDto goalDto)
        {
            var result = _repository.GetGoals(goalDto);
            var response = new GoalGetResponseDto(result.Message,result.Value);
            return Ok(response);
        }
        [HttpPut]
        public IActionResult UpdateGoal([FromBody] UpdateGoalDto goalDto)
        {
            var result = _repository.UpdateGoal(goalDto);
            GoalPutResponseDto response;
            if(result.Value == null)
            {
                return Ok(new GoalPutResponseDto(result.Message));
            }
             response = new GoalPutResponseDto(result.Message,
                result.Value.Id,
                result.Value.UserId,
                result.Value.Title,
                result.Value.Price,
                result.Value.CurrentValue
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
