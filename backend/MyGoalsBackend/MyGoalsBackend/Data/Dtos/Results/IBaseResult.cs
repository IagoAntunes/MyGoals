namespace MyGoalsBackend.Data.Dtos.Results
{
    public abstract class IBaseResult
    {
        public IBaseResult(string message,dynamic? value)
        {
            this.Message = message;
            this.Value = value;
        }
        public IBaseResult(string message)
        {
            this.Message = message;
        }
        public string Message { get; set; }
        public dynamic? Value { get; set; }
    }
}
