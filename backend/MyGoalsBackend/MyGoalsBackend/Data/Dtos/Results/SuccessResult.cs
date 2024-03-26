namespace MyGoalsBackend.Data.Dtos.Results
{
    public class SuccessResult<T> : IBaseResult
    {
        public SuccessResult(
            string message,
            T? value
            ) : base(message,value) { }
  

    }
}
