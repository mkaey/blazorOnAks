CREATE TABLE [dbo].[routine_exercises]
(
	[routine_id] INT NOT NULL PRIMARY KEY, 
    [exercise_id] INT NOT NULL PRIMARY KEY, 
    CONSTRAINT [routine_exercises_routine_id] FOREIGN KEY ([routine_id]) REFERENCES [Routine]([routine_id]), 
    CONSTRAINT [routine_exercises_exercise_id] FOREIGN KEY ([exercise_id]) REFERENCES [Exercise]([exercise_id])
)
