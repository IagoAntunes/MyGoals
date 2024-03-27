namespace MyGoalsBackend.Data.Dtos.Results
{
    public class FailureResult: IBaseResult

    {
        public FailureResult(
            string errorMessage
            ) : base(errorMessage) { }

    }
    public class FailureTResult<T> : IBaseTResult<T>

    {
        public T Value { get; set; }
        public FailureTResult(
            string errorMessage,
            T value
            ) : base(errorMessage,value) { }

    }
}
