using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using MyGoalsBackend.Api.Repositories;
using MyGoalsBackend.Data;
using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Responses;

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

    }
}
