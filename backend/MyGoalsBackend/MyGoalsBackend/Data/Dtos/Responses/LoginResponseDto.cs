namespace MyGoalsBackend.Data.Dtos.Results
{
    public class LoginResponseDto : IResponseDto
    {
        public string? Token { get; set; }
        ///Success Login
        public LoginResponseDto(
            string message,
            string token
            ) : base(message)
        {
            Token = token;
        }
        //Failure Login
        public LoginResponseDto(
            string errorMessage
            ) : base(errorMessage)
        {
        }
  
    }
}
