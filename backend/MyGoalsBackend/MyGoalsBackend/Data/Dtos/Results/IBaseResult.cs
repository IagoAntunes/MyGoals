namespace MyGoalsBackend.Data.Dtos.Results
{
    public abstract class IBaseResult<T>
    {
        public IBaseResult(string message,T value)
        {
            this.Message = message;
            this.Value = value;
        }
        public IBaseResult(string message)
        {
            this.Message = message;
        }
        public string Message { get; set; }
        public T? Value { get; set; }
    }
}
