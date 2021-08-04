USE CRUDTest;
GO

CREATE TABLE [dbo].[Customer](
       [CustomerID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	   [FirstName] [varchar](20) NULL,
       [LastName] [varchar](20) NULL,
       [Email] [varchar](20) NULL,
       [PhoneNumber] [int] NULL
 
)    

IF OBJECT_ID('cusp_CustomerCreate') IS NOT NULL
BEGIN 
DROP PROC usp_CustomerCreate 
END
GO


-- Create Stored Procedure
CREATE PROCEDURE usp_CustomerCreate
		@CustomerID int,
	   @FirstName varchar(20),
	   @LastName varchar(20),
	   @Email	varchar(20),
	   @PhoneNumber int
	 
AS
BEGIN
INSERT INTO Customer  (
	   FirstName,
	   LastName,
	   Email,
	   PhoneNumber)
    VALUES (
	   @FirstName,
	   @LastName,
	   @Email,
	   @PhoneNumber)
 
SET @CustomerID = SCOPE_IDENTITY()
 
SELECT 
	   FirstName = @FirstName,
	   LastName = @LastName,
	   Email	= @Email,
	   PhoneNumber =@PhoneNumber
FROM Customer 
WHERE  CustomerID = @CustomerID
END


--Execute Procedure
EXECUTE usp_CustomerCreate
		@CustomerID=1,
	   @FirstName='Jane',
	   @LastName='Doe',
	   @Email='Jane.Doe@email.com',
	   @PhoneNumber=12345


-- Read procedures
CREATE PROC cusp_CustomerRead
    @CustomerID int
AS 
BEGIN 
 
    SELECT CustomerID, FirstName, LastName, Email, PhoneNumber
    FROM   Customer  
    WHERE  (CustomerID = @CustomerID) 
END
GO

--Execute Read procedures
EXECUTE cusp_CustomerRead @CustomerID =1


-- Update procedures
CREATE PROC cusp_CustomerUpdate
    @CustomerID int,
    @FirstName varchar(20),
    @LastName varchar(20),
    @Email varchar(20),
    @PhoneNumber int
  
AS 
BEGIN 
 
UPDATE Customer
SET  FirstName = @FirstName,
     LastName = @LastName, 
     Email = @Email,
     PhoneNumber = @PhoneNumber
WHERE  CustomerID = @CustomerID
END
GO

-- Execute procedures
EXECUTE cusp_CustomerUpdate
		@CustomerID=1,
	   @FirstName='John',
	   @LastName='Doe',
	   @Email='John.Doe@email.com',
	   @PhoneNumber=12345

-- Delete procedures
CREATE PROC cusp_CustomerDelete 
    @CustomerID int
AS 
BEGIN 
DELETE
FROM   Customer
WHERE  CustomerID = @CustomerID
 
END
GO

-- Execute procedures

EXECUTE cusp_CustomerDelete @CustomerID =1