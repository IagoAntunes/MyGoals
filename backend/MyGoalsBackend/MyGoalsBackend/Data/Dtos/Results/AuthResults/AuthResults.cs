namespace MyGoalsBackend.Data.Dtos.Results.AuthResults
{

    public class Unauthenticated : FailureResult
    {
        IErrorsAuth error;
        public Unauthenticated(IErrorsAuth error)
       : base(error.Message)
        {
            this.error = error;
        }
    }
    public class Authenticated : SuccessResult<string>
    {
        ISuccessAuth Auth;
        public Authenticated(ISuccessAuth auth)
       : base(auth.Message,auth.Token)
        {
            this.Auth = auth;
        }
    }

    public abstract class IErrorsAuth
    {
        protected IErrorsAuth(string message)
        {
            this.Message = message;
        }
        public string Message { get; set; }
    }
    public abstract class ISuccessAuth
    {
        protected ISuccessAuth(string message,string token)
        {
            this.Message = message;
            this.Token = token;
        }
        protected ISuccessAuth(string message)
        {
            this.Message = message;
        }
        public string Message { get; set; }
        public string? Token { get; set; }
    }

    public class UserNotFoundResult : IErrorsAuth
    {
        public UserNotFoundResult() : base("Usuário não encontrado!") { }
        
    }

    public class WrongPasswordResult : IErrorsAuth
    {
        public WrongPasswordResult() : base("Senha Incorreta!") { }
    
    }
    public class UserAlreadyExistsResult : IErrorsAuth
    {
        public UserAlreadyExistsResult() : base("Usuário ja existe!") { }

    }
    public class OtherErrorResult : IErrorsAuth
    {
        public OtherErrorResult() : base("Algo de errado aconteceu!") { }

    }
    public class UserLoggedResult : ISuccessAuth
    {
        public UserLoggedResult(string token) : base(message: "Usuário logado com sucesso!", token) { }
    }
    public class UserRegisteredResult : ISuccessAuth
    {
        public UserRegisteredResult() : base(message: "Usuário criado com sucesso!") { }
    }
}
