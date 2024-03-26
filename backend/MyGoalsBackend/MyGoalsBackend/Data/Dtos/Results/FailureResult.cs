namespace MyGoalsBackend.Data.Dtos.Results
{
    public class FailureResult<T>: IBaseResult

    {
        public FailureResult(
            string errorMessage,
            T value
            ) : base(errorMessage, value) { }

    }
}
