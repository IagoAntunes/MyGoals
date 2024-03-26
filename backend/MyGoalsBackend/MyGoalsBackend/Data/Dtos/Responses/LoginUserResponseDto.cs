namespace MyGoalsBackend.Data.Dtos.Responses
{
    public class LoginUserResponseDto
    {
        public LoginUserResponseDto(string token,string userId)
        {
            this.Token = token;
            this.UserId = userId;
        }
        public string Token { get; set; }
        public string UserId { get; set; }
    }
}
