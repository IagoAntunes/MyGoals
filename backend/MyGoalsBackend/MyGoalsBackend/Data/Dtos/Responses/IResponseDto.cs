namespace MyGoalsBackend.Data.Dtos.Results
{
    public abstract class IResponseDto
    {
        //Success Response
        protected IResponseDto(string message,string status)
        {
            Message = message;
            Status = status;
        }
        public string Message { get; set; }
        public string Status { get; set; }
    }
}
