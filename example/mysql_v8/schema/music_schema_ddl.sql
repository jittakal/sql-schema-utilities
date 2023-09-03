-- Artist definition

CREATE TABLE `Artist` (
    `ArtistId` INT NOT NULL,
    `Name` NVARCHAR(120),
    CONSTRAINT `PK_Artist` PRIMARY KEY (`ArtistId`)
);

CREATE UNIQUE INDEX `IPK_Artist` ON `Artist`(`ArtistId`);

-- Album definition

CREATE TABLE `Album` (
    `AlbumId` INT NOT NULL,
    `Title` NVARCHAR(160) NOT NULL,
    `ArtistId` INT NOT NULL,
    `Column1` BLOB NULL,
    CONSTRAINT `PK_Album` PRIMARY KEY (`AlbumId`),
    FOREIGN KEY (`ArtistId`) REFERENCES `Artist` (`ArtistId`) 
    ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE UNIQUE INDEX `IPK_Album` ON `Album`(`AlbumId`);
CREATE INDEX `IFK_AlbumArtistId` ON `Album` (`ArtistId`);


-- Employee definition

CREATE TABLE `Employee` (
    `EmployeeId` INT NOT NULL,
    `LastName` NVARCHAR(20) NOT NULL,
    `FirstName` NVARCHAR(20) NOT NULL,
    `Title` NVARCHAR(30),
    `ReportsTo` INT,
    `BirthDate` DATETIME,
    `HireDate` DATETIME,
    `Address` NVARCHAR(70),
    `City` NVARCHAR(40),
    `State` NVARCHAR(40),
    `Country` NVARCHAR(40),
    `PostalCode` NVARCHAR(10),
    `Phone` NVARCHAR(24),
    `Fax` NVARCHAR(24),
    `Email` NVARCHAR(60),
    CONSTRAINT `PK_Employee` PRIMARY KEY (`EmployeeId`),
    FOREIGN KEY (`ReportsTo`) REFERENCES `Employee` (`EmployeeId`) 
    ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE UNIQUE INDEX `IPK_Employee` ON `Employee`(`EmployeeId`);
CREATE INDEX `IFK_EmployeeReportsTo` ON `Employee` (`ReportsTo`);


-- Customer definition

CREATE TABLE `Customer` (
    `CustomerId` INT NOT NULL,
    `FirstName` NVARCHAR(40) NOT NULL,
    `LastName` NVARCHAR(20) NOT NULL,
    `Company` NVARCHAR(80),
    `Address` NVARCHAR(70),
    `City` NVARCHAR(40),
    `State` NVARCHAR(40),
    `Country` NVARCHAR(40),
    `PostalCode` NVARCHAR(10),
    `Phone` NVARCHAR(24),
    `Fax` NVARCHAR(24),
    `Email` NVARCHAR(60) NOT NULL,
    `SupportRepId` INT,
    CONSTRAINT `PK_Customer` PRIMARY KEY (`CustomerId`),
    FOREIGN KEY (`SupportRepId`) REFERENCES `Employee` (`EmployeeId`) 
    ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE UNIQUE INDEX `IPK_Customer` ON `Customer`(`CustomerId`);
CREATE INDEX `IFK_CustomerSupportRepId` ON `Customer` (`SupportRepId`);


-- Genre definition

CREATE TABLE `Genre` (
    `GenreId` INT NOT NULL,
    `Name` NVARCHAR(120),
    CONSTRAINT `PK_Genre` PRIMARY KEY (`GenreId`)
);

CREATE UNIQUE INDEX `IPK_Genre` ON `Genre`(`GenreId`);

-- Invoice definition

CREATE TABLE `Invoice` (
    `InvoiceId` INT NOT NULL,
    `CustomerId` INT NOT NULL,
    `InvoiceDate` DATETIME NOT NULL,
    `BillingAddress` NVARCHAR(70),
    `BillingCity` NVARCHAR(40),
    `BillingState` NVARCHAR(40),
    `BillingCountry` NVARCHAR(40),
    `BillingPostalCode` NVARCHAR(10),
    `Total` NUMERIC(10,2) NOT NULL,
    CONSTRAINT `PK_Invoice` PRIMARY KEY (`InvoiceId`),
    FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`CustomerId`) 
    ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE UNIQUE INDEX `IPK_Invoice` ON `Invoice`(`InvoiceId`);
CREATE INDEX `IFK_InvoiceCustomerId` ON `Invoice` (`CustomerId`);

-- MediaType definition

CREATE TABLE `MediaType` (
    `MediaTypeId` INT NOT NULL,
    `Name` NVARCHAR(120),
    CONSTRAINT `PK_MediaType` PRIMARY KEY (`MediaTypeId`)
);

CREATE UNIQUE INDEX `IPK_MediaType` ON `MediaType`(`MediaTypeId`);

-- Track definition

CREATE TABLE `Track` (
    `TrackId` INT NOT NULL,
    `Name` NVARCHAR(200) NOT NULL,
    `AlbumId` INT,
    `MediaTypeId` INT NOT NULL,
    `GenreId` INT,
    `Composer` NVARCHAR(220),
    `Milliseconds` INT NOT NULL,
    `Bytes` INT,
    `UnitPrice` NUMERIC(10,2) NOT NULL,
    CONSTRAINT `PK_Track` PRIMARY KEY (`TrackId`),
    FOREIGN KEY (`AlbumId`) REFERENCES `Album` (`AlbumId`) 
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`GenreId`) REFERENCES `Genre` (`GenreId`) 
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`MediaTypeId`) REFERENCES `MediaType` (`MediaTypeId`) 
    ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE UNIQUE INDEX `IPK_Track` ON `Track`(`TrackId`);
CREATE INDEX `IFK_TrackAlbumId` ON `Track` (`AlbumId`);
CREATE INDEX `IFK_TrackGenreId` ON `Track` (`GenreId`);
CREATE INDEX `IFK_TrackMediaTypeId` ON `Track` (`MediaTypeId`);


-- InvoiceLine definition

CREATE TABLE `InvoiceLine` (
    `InvoiceLineId` INT NOT NULL,
    `InvoiceId` INT NOT NULL,
    `TrackId` INT NOT NULL,
    `UnitPrice` NUMERIC(10,2) NOT NULL,
    `Quantity` INT NOT NULL,
    CONSTRAINT `PK_InvoiceLine` PRIMARY KEY (`InvoiceLineId`),
    FOREIGN KEY (`InvoiceId`) REFERENCES `Invoice` (`InvoiceId`) 
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`TrackId`) REFERENCES `Track` (`TrackId`) 
    ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE UNIQUE INDEX `IPK_InvoiceLine` ON `InvoiceLine`(`InvoiceLineId`);
CREATE INDEX `IFK_InvoiceLineInvoiceId` ON `InvoiceLine` (`InvoiceId`);
CREATE INDEX `IFK_InvoiceLineTrackId` ON `InvoiceLine` (`TrackId`);



-- Playlist definition

CREATE TABLE `Playlist` (
    `PlaylistId` INT NOT NULL,
    `Name` NVARCHAR(120),
    CONSTRAINT `PK_Playlist` PRIMARY KEY (`PlaylistId`)
);

CREATE UNIQUE INDEX `IPK_Playlist` ON `Playlist`(`PlaylistId`);


-- PlaylistTrack definition

CREATE TABLE `PlaylistTrack` (
    `PlaylistId` INT NOT NULL,
    `TrackId` INT NOT NULL,
    CONSTRAINT `PK_PlaylistTrack` PRIMARY KEY (`PlaylistId`, `TrackId`),
    FOREIGN KEY (`PlaylistId`) REFERENCES `Playlist` (`PlaylistId`) 
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`TrackId`) REFERENCES `Track` (`TrackId`) 
    ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE UNIQUE INDEX `IPK_PlaylistTrack` ON `PlaylistTrack`(`PlaylistId`, `TrackId`);
CREATE INDEX `IFK_PlaylistTrackTrackId` ON `PlaylistTrack` (`TrackId`);

