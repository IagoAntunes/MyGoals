using MyGoalsBackend.Data.Dtos.Results;

namespace MyGoalsBackend.Data.Dtos.Responses
{
    public class BaseResponse : IResponseDto
    {
        public BaseResponse(string message) : base(message)
        {
        }
    }
}
