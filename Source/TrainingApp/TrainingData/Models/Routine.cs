using System;
using System.Collections.Generic;

namespace TrainingApp.Models
{
    public partial class Routine
    {
        public int RoutineId { get; set; }
        public int RoutineExercises { get; set; }
        public string Name { get; set; } = null!;
    }
}
