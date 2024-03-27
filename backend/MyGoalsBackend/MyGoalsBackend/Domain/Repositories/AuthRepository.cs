using MyGoalsBackend.Api.Repositories;
using MyGoalsBackend.Data.Dtos.Requests;
using MyGoalsBackend.Data.Dtos.Results;
using MyGoalsBackend.Domain.IServices;

namespace MyGoalsBackend.Domain.Repositories
{
    public class AuthRepository : IAuthRepository
    {
        private IAuthService _authService;
        private IGoalService _goalService;
        private ITransactionService _transactionService;

        public AuthRepository(
            IAuthService authService,
            IGoalService goalService,
            ITransactionService transactionService
            )
        {
            this._authService = authService;
            this._transactionService = transactionService;
            this._goalService = goalService;
        }

        public IBaseResult DeleteUser(int userId)
        {
            var userExists = _authService.ValidateUser(userId);
            if(userExists is FailureResult)
            {
                return userExists;
            }
            _goalService.DeleteAllGoalsByUserId(userId);
            _transactionService.DeleteAllTransactionsByUserId(userId);
            return _authService.DeleteUser(userId);
        }

        public Task<IBaseResult> Login(LoginUserDto userDto)
        {
            return _authService.Login(userDto);
        }

        public Task<IBaseResult> Register(CreateUserDto userDto)
        {
            return _authService.Register(userDto);
        }
    }
}
