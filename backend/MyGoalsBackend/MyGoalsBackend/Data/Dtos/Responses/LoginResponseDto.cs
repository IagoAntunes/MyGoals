using MyGoalsBackend.Data.Dtos.Responses;

namespace MyGoalsBackend.Data.Dtos.Results
{
    public class LoginResponseDto : IResponseDto
    {
        public LoginUserResponseDto? User { get;set; }
        ///Success Login
        public LoginResponseDto(
            string message,
            string status,
            LoginUserResponseDto loginUser
            ) : base(message,status)
        {
            this.User = loginUser;
        }
        //Failure Login
        public LoginResponseDto(
            string errorMessage,
            string status
            ) : base(errorMessage, status)
        {
            this.User = null;
        }
  
    }
}
