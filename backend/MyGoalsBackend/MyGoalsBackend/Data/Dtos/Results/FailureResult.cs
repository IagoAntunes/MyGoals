namespace MyGoalsBackend.Data.Dtos.Results
{
    public class FailureResult: IBaseResult

    {
        public FailureResult(
            string errorMessage
            ) : base(errorMessage) { }

    }
}
