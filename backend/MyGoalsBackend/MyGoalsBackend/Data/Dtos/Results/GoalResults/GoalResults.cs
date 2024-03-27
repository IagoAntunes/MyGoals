namespace MyGoalsBackend.Data.Dtos.Results.GoalResults
{

    public abstract class IGoalResults : IBaseResult
    {
        protected IGoalResults(string message) : base(message)
        {
        }
    }

   
}
