namespace MyGoalsBackend.Data.Dtos.Results
{
    public abstract class IBaseResult
    {
        public IBaseResult(string message)
        {
            this.Message = message;
        }
        public string Message { get; set; }
    }
    public abstract class IBaseTResult<T>
    {
        public T Value { get; set; }
        public IBaseTResult(string message, T value)
        {
            this.Message = message;
            this.Value = value;
        }
        public string Message { get; set; }
    }
    public abstract class IBaseGetResult<T> : IBaseResult
    {
        public T? Value { get; set; }
        public IBaseGetResult(string message, T value) : base(message)
        {
            this.Value = value;
        }
        public IBaseGetResult(string message) : base(message)
        {
        }
    }
}
