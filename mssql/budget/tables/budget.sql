/*
	dbo.budget 
*/

IF (object_id('dbo.budget') IS NOT NULL)
	DROP TABLE dbo.budget
GO

CREATE TABLE dbo.budget (
	budget_id INT IDENTITY(1, 1) NOT NULL
	,budget_number INT NOT NULL
	,is_active BIT NOT NULL
	,datetime_added DATETIME NOT NULL
	,datetime_modified DATETIME NOT NULL CONSTRAINT [pk_budget_id] PRIMARY KEY CLUSTERED (budget_id ASC) WITH (
		pad_index = OFF
		,statistics_norecompute = OFF
		,ignore_dup_key = OFF
		,allow_row_locks = ON
		,allow_page_locks = ON
		,FILLFACTOR = 90
		)
	ON [primary]
	) ON [primary]
GO

ALTER TABLE dbo.budget ADD DEFAULT(getdate())
FOR datetime_added
GO

ALTER TABLE dbo.budget ADD DEFAULT(getdate())
FOR datetime_modified
GO

ALTER TABLE dbo.budget ADD DEFAULT(1)
FOR is_active
GO

-- indexes
CREATE NONCLUSTERED INDEX [ix_budget_1] ON dbo.budget (budget_number ASC)
	WITH (
			pad_index = OFF
			,statistics_norecompute = OFF
			,sort_in_tempdb = OFF
			,drop_existing = OFF
			,online = OFF
			,allow_row_locks = ON
			,allow_page_locks = ON
			,FILLFACTOR = 90
			) ON [primary]

-- data
INSERT INTO dbo.budget (budget_number)
VALUES (202102)

-- verify
SELECT *
FROM dbo.budget
