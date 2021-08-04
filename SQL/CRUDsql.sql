USE AdventureWorks2016;
GO


-- Link: https://www.sqlshack.com/crud-operations-in-sql-server/
-- Create Table
CREATE TABLE dbo.Demo
			(id   INT, 
			name VARCHAR(100)
			);

-- **CREATE DATA**

-- Insert 1 value
INSERT INTO dbo.Demo
			VALUES
			(1, 
			'Prashanth'
			);


-- Insert multiple values
INSERT INTO dbo.Demo
			(id, 
			name
			)
			VALUES
			(2, 
			'Jayaram'
			),
			(3, 
			'Pravitha'
			);

-- Insert using UNION
INSERT INTO dbo.demo
       SELECT 4, 
              'Prarthana'
       UNION ALL
       SELECT 5, 
              'Ambika';


-- **READ**

-- Select all
SELECT * FROM dbo.demo

-- Select with condition
SELECT * FROM dbo.demo
		WHERE Id = 3;
-- Select with order
SELECT * FROM dbo.demo
		ORDER BY  Name ASC; --ASC/DESC

-- **UPDATE**
UPDATE dbo.demo
SET Name = 'John'
WHERE Id = 3

/*
Be careful when updating records. If you omit the WHERE clause, ALL records will be updated!
*/
-- **DELETE**

DELETE FROM dbo.demo
WHERE Id = 3