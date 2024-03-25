namespace MyGoalsBackend.Data.Dtos.Results
{
    public abstract class IResponseDto
    {
        //Success Response
        protected IResponseDto(string message)
        {
            Message = message;
        }
        public string Message { get; set; }
    }
}
