CREATE TABLE [dbo].[routine_exercises]
(
    [routine_exercises_id] INT NOT NULL,
	[routine_id] INT NOT NULL, 
    [exercise_id] INT NOT NULL, 
    CONSTRAINT [routine_exercises_routine_id] FOREIGN KEY ([routine_id]) REFERENCES [Routine]([routine_id]), 
    CONSTRAINT [routine_exercises_exercise_id] FOREIGN KEY ([exercise_id]) REFERENCES [Exercise]([exercise_id])
)
