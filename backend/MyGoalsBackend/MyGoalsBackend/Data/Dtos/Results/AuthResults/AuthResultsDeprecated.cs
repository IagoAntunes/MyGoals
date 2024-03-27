//namespace MyGoalsBackend.Data.Dtos.Results.AuthResults
//{
//    public abstract class IAuthState<T> : IBaseResult
//    {
//        protected IAuthState(string message, T? value) : base(message, value)
//        {
//        }
//    }
//    public class Unauthenticated : IAuthState<IErrorsAuth>
//    {
//        public IErrorsAuth error;
//        public Unauthenticated(IErrorsAuth error)
//       : base(error.Message,error)
//        {
//            this.error = error;
//        }
//    }
//    public class Authenticated : IAuthState<ISuccessAuth>
//    {
//        public ISuccessAuth Auth;
//        public Authenticated(ISuccessAuth auth)
//       : base(auth.Message,auth)
//        {
//            this.Auth = auth;
//        }
//    }

//    public abstract class IErrorsAuth
//    {
//        protected IErrorsAuth(string message)
//        {
//            this.Message = message;
//        }
//        public string Message { get; set; }
//    }
//    public abstract class ISuccessAuth
//    {
//        protected ISuccessAuth(string message,string token,string userId)
//        {
//            this.Message = message;
//            this.Token = token;
//            this.UserId = userId;
//        }
//        protected ISuccessAuth(string message)
//        {
//            this.Message = message;
//        }
//        public string Message { get; set; }
//        public string? Token { get; set; }
//        public string? UserId { get; set; }
//    }

//    public class UserNotFoundResult : IErrorsAuth
//    {
//        public UserNotFoundResult() : base("Usuário não encontrado!") { }
        
//    }

//    public class WrongPasswordResult : IErrorsAuth
//    {
//        public WrongPasswordResult() : base("Senha Incorreta!") { }
    
//    }
//    public class UserAlreadyExistsResult : IErrorsAuth
//    {
//        public UserAlreadyExistsResult() : base("Usuário ja existe!") { }

//    }
//    public class OtherErrorResult : IErrorsAuth
//    {
//        public OtherErrorResult() : base("Algo de errado aconteceu!") { }

//    }
//    public class UserLoggedResult : ISuccessAuth
//    {
//        public UserLoggedResult(string token,string userId) : base(message: "Usuário logado com sucesso!", token,userId) { }
//    }    public class ValidatedUserResult : ISuccessAuth
//    {
//        public ValidatedUserResult() : base(message: "Usuário Validado", null, null) { }
//    }
//    public class UserRegisteredResult : ISuccessAuth
//    {
//        public UserRegisteredResult() : base(message: "Usuário criado com sucesso!") { }
//    }
//}
