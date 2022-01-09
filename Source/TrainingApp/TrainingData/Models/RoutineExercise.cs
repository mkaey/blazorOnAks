using System;
using System.Collections.Generic;

namespace TrainingApp.Models
{
    public partial class RoutineExercise
    {
        public int RoutineExercisesId { get; set; }
        public int RoutineId { get; set; }
        public int ExerciseId { get; set; }

        public virtual Exercise Exercise { get; set; } = null!;
        public virtual Routine Routine { get; set; } = null!;
    }
}
