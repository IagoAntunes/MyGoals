namespace MyGoalsBackend.Data.Dtos.Results.AuthResults
{
    public class AuthResult : IBaseResult
    {
        public string Token { get; set; }
        public string UserId { get; set; }
        public AuthResult(string message, string token, string userId) : base(message)
        {
            this.Token = token;
            this.UserId = userId;
        }
    }
    public class SignInResult : SuccessResult
    {
        public string Token { get; set; }
        public int UserId { get; set; }
        public SignInResult(string message, string token, int userId) : base(message)
        {
            this.Token = token;
            this.UserId = userId;
        }
    }
}
