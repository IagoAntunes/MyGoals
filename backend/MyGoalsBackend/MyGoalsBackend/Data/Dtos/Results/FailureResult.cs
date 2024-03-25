namespace MyGoalsBackend.Data.Dtos.Results
{
    public class FailureResult : IBaseResult<String>

    {
        public FailureResult(
        string errorMessage
        ) : base(errorMessage) { }

    }
}
