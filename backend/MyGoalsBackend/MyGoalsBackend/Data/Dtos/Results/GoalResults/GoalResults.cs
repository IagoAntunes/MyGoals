namespace MyGoalsBackend.Data.Dtos.Results.GoalResults
{

    public abstract class IGoalResults<T> : IBaseResult
    {
        protected IGoalResults(string message, T value) : base(message, value)
        {
        }
    }

   
}
