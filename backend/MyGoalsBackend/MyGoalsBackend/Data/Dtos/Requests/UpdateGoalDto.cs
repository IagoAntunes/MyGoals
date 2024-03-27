namespace MyGoalsBackend.Data.Dtos.Requests
{
    public class UpdateGoalDto
    {
        public int Id { get; set; }
        public string? Title { get; set; }
        public int? Price { get; set; }

        public UpdateGoalDto(int id,int? price,string? title)
        {
            this.Id = id;
            this.Price = price;
            this.Title = title;
        }
    }
}
