using MyGoalsBackend.Data.Dtos.Results;

namespace MyGoalsBackend.Data.Dtos.Responses
{
    public class BaseResponse : IResponseDto
    {
        public BaseResponse(string message,string status) : base(message,status)
        {
        }
    }
}
