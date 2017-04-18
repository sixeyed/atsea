PRINT N'Inserting product data...';

INSERT INTO [$(DatabaseName)].[dbo].[Product] (Name, Description, Price, Image) 
 VALUES ('Big Moby', 'Moby', 25, '/images/moby_art.png')
GO

INSERT INTO [$(DatabaseName)].[dbo].[Product] (Name, Description, Price, Image) 
 VALUES ('On the dock', 'Working together', 25, '/images/on_the_dock.jpg')
GO

INSERT INTO [$(DatabaseName)].[dbo].[Product] (Name, Description, Price, Image) 
 VALUES ('Compose', 'Compose', 25, '/images/1.png')
GO

INSERT INTO [$(DatabaseName)].[dbo].[Product] (Name, Description, Price, Image) 
 VALUES ('Gordon', 'Gordon the Turtle', 25, '/images/2.png')
GO

INSERT INTO [$(DatabaseName)].[dbo].[Product] (Name, Description, Price, Image) 
 VALUES ('Containerd', 'Containerd for the people', 25, '/images/3.png')
GO

INSERT INTO [$(DatabaseName)].[dbo].[Product] (Name, Description, Price, Image) 
 VALUES ('Registry', 'Where to put your containers', 25, '/images/4.png')
GO

INSERT INTO [$(DatabaseName)].[dbo].[Product] (Name, Description, Price, Image) 
 VALUES ('DockerMachine', 'Working like a well oiled machine', 25, '/images/5.png')
GO

INSERT INTO [$(DatabaseName)].[dbo].[Product] (Name, Description, Price, Image) 
 VALUES ('Swarm', 'Orchestrating work loads', 25, '/images/6.png')
GO

INSERT INTO [$(DatabaseName)].[dbo].[Product] (Name, Description, Price, Image) 
 VALUES ('Trusted Registry', 'Keeping it safe and secure', 25, '/images/7.jpg')
GO

PRINT N'Product data inserted.';