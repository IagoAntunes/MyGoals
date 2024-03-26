using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using MyGoalsBackend.Data;
using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class GoalController : ControllerBase
    {
        public MyGoalsDbContext _context;
        public IMapper _mapper;
        UserManager<UserModel> userManager;
        public GoalController(
            MyGoalsDbContext context,
            IMapper mapper,
            UserManager<UserModel> userManager
            )
        {
            this._context = context;
            this._mapper = mapper;
            this.userManager = userManager;
        }


        [HttpPost]
        public IActionResult CreateGoal([FromBody] CreateGoalDto goalDto)
        {
            var user = userManager.Users.ToList().FirstOrDefault(u => u.Id == goalDto.UserId);
            if (user == null)
            {
                return BadRequest("UserId inválido.");
            }
            GoalModel goal = _mapper.Map<GoalModel>(goalDto);
            _context.Goals.Add(goal);
            _context.SaveChanges();
            return Ok();
        }

        [HttpGet]
        public async Task<IActionResult> getUsers()
        {
            return Ok(_context.Users);
        }

    }
}
