using System;
using System.Collections.Generic;

namespace TrainingApp.Models
{
    public partial class Exercise
    {
        public int ExerciseId { get; set; }
        public string Name { get; set; } = null!;
        public string? Description { get; set; }
        public string? Video { get; set; }
        public byte[]? Image { get; set; }
    }
}
