namespace MyGoalsBackend.Data.Dtos.Results
{
    public class SuccessResult : IBaseResult
    {
        public SuccessResult(
            string message
            ) : base(message) { }
    }

    public class SuccessGetResult<T> : IBaseGetResult<T>
    {
        public SuccessGetResult(string message,T value) : base(message,value)
        {
        }
    }
}
