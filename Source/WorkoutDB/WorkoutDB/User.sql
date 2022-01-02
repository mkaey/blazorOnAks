CREATE TABLE [dbo].[User]
(
	[user_id] INT NOT NULL PRIMARY KEY, 
    [prename] VARCHAR(50) NOT NULL, 
    [surname] VARCHAR(50) NOT NULL, 
    [birthdate] DATE NULL
)
