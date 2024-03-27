using MyGoalsBackend.Data.Dtos.Responses;

namespace MyGoalsBackend.Data.Dtos.Results
{
    public class LoginResponseDto : IResponseDto
    {
        public LoginUserResponseDto? User { get;set; }
        ///Success Login
        public LoginResponseDto(
            string message,
            LoginUserResponseDto loginUser
            ) : base(message)
        {
            this.User = loginUser;
        }
        //Failure Login
        public LoginResponseDto(
            string errorMessage
            ) : base(errorMessage)
        {
            this.User = null;
        }
  
    }
}
