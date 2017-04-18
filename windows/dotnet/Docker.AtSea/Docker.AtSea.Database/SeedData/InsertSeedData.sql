PRINT N'Inserting product data...';

INSERT INTO [$(DatabaseName)].[dbo].[Product] (Name, Description, Price, Image) 
 VALUES ('Big Moby', 'Moby', 25, '/images/moby_art.png')
GO

INSERT INTO [$(DatabaseName)].[dbo].[Product] (Name, Description, Price, Image) 
 VALUES ('On the dock', 'Working together', 25, '/images/on_the_dock.jpg')
GO

INSERT INTO [$(DatabaseName)].[dbo].[Product] (Name, Description, Price, Image) 
 VALUES ('Compose', 'Compose', 25, '/images/Compose.png')
GO

INSERT INTO [$(DatabaseName)].[dbo].[Product] (Name, Description, Price, Image) 
 VALUES ('Gordon', 'Gordon the Turtle', 25, '/images/gordon.png')
GO

INSERT INTO [$(DatabaseName)].[dbo].[Product] (Name, Description, Price, Image) 
 VALUES ('Containerd', 'Containerd for the people', 25, '/images/containerd.png')
GO

INSERT INTO [$(DatabaseName)].[dbo].[Product] (Name, Description, Price, Image) 
 VALUES ('Registry', 'Where to put your containers', 25, '/images/Registry.png')
GO

INSERT INTO [$(DatabaseName)].[dbo].[Product] (Name, Description, Price, Image) 
 VALUES ('DockerMachine', 'Working like a well oiled machine', 25, '/images/Docker_machine.png')
GO

INSERT INTO [$(DatabaseName)].[dbo].[Product] (Name, Description, Price, Image) 
 VALUES ('Swarm', 'Orchestrating work loads', 25, '/images/swarm.png')
GO

INSERT INTO [$(DatabaseName)].[dbo].[Product] (Name, Description, Price, Image) 
 VALUES ('Trusted Registry', 'Keeping it safe and secure', 25, '/images/trusted_registry.jpg')
GO

PRINT N'Product data inserted.';