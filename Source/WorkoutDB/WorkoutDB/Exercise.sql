CREATE TABLE [dbo].[Exercise]
(
	[exercise_id] INT NOT NULL PRIMARY KEY, 
    [name] VARCHAR(50) NOT NULL, 
    [description] VARCHAR(300) NULL, 
    [video] VARCHAR(100) NULL, 
    [image] IMAGE NULL
)
