using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace TrainingApp.Models
{
    public partial class sqldbmkaeyContext : DbContext
    {
        public sqldbmkaeyContext()
        {
        }

        public sqldbmkaeyContext(DbContextOptions<sqldbmkaeyContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Exercise> Exercises { get; set; } = null!;
        public virtual DbSet<Routine> Routines { get; set; } = null!;
        public virtual DbSet<RoutineExercise> RoutineExercises { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=tcp:sql-mkaey.database.windows.net,1433;Database=sqldb-mkaey;Persist Security Info=False;User ID=aksSqlAdmin;Password=kubSQpw123!;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Exercise>(entity =>
            {
                entity.ToTable("Exercise");

                entity.Property(e => e.ExerciseId)
                    .ValueGeneratedNever()
                    .HasColumnName("exercise_id");

                entity.Property(e => e.Description)
                    .HasMaxLength(300)
                    .IsUnicode(false)
                    .HasColumnName("description");

                entity.Property(e => e.Image)
                    .HasColumnType("image")
                    .HasColumnName("image");

                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("name");

                entity.Property(e => e.Video)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("video");
            });

            modelBuilder.Entity<Routine>(entity =>
            {
                entity.ToTable("Routine");

                entity.Property(e => e.RoutineId)
                    .ValueGeneratedNever()
                    .HasColumnName("routine_id");

                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("name");

                entity.Property(e => e.RoutineExercises).HasColumnName("routine_exercises");
            });

            modelBuilder.Entity<RoutineExercise>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("routine_exercises");

                entity.Property(e => e.ExerciseId).HasColumnName("exercise_id");

                entity.Property(e => e.RoutineExercisesId).HasColumnName("routine_exercises_id");

                entity.Property(e => e.RoutineId).HasColumnName("routine_id");

                entity.HasOne(d => d.Exercise)
                    .WithMany()
                    .HasForeignKey(d => d.ExerciseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("routine_exercises_exercise_id");

                entity.HasOne(d => d.Routine)
                    .WithMany()
                    .HasForeignKey(d => d.RoutineId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("routine_exercises_routine_id");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("User");

                entity.Property(e => e.UserId)
                    .ValueGeneratedNever()
                    .HasColumnName("user_id");

                entity.Property(e => e.Birthdate)
                    .HasColumnType("date")
                    .HasColumnName("birthdate");

                entity.Property(e => e.Prename)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("prename");

                entity.Property(e => e.Surname)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("surname");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
