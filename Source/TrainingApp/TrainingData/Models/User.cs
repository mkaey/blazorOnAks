using System;
using System.Collections.Generic;

namespace TrainingApp.Models
{
    public partial class User
    {
        public int UserId { get; set; }
        public string Prename { get; set; } = null!;
        public string Surname { get; set; } = null!;
        public DateTime? Birthdate { get; set; }
    }
}
