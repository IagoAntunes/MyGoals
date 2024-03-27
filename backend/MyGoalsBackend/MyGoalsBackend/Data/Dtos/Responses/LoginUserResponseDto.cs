namespace MyGoalsBackend.Data.Dtos.Responses
{
    public class LoginUserResponseDto
    {
        public LoginUserResponseDto(string token, int userId)
        {
            this.Token = token;
            this.UserId = userId;
        }
        public string Token { get; set; }
        public int UserId { get; set; }
    }
}
