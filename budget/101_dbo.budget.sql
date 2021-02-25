/*
TODO:
	dbo.budget
	dbo.budget_fund_type
	dbo.budget_fund
	dbo.budget_fund_event
	dbo.budget_group
	dbo.budget_category
	dbo.budget_pay_frequency
	dbo.budget_pay_method
	dbo.budget_pay_type
	dbo.budget_pay_cycle
	dbo.budget_merchant
	dbo.budget_calendar
	dbo.budget_income
	dbo.budget_expense
	dbo.budget_flat
	dbo.budget_rollup
	dbo.budget_transaction_type
	dbo.budget_transaction
	dbo.budget_transaction_tag
	dbo.budget_transaction_queue
	dbo.budget_transaction_queue_log
	dbo.budget_transaction_sms
	dbo.budget_transaction_sms_log
	dbo.budget_transaction_rollup
*/

/*
	dbo.budget 
*/

IF (OBJECT_ID('dbo.budget') IS NOT NULL)
	DROP TABLE dbo.budget
GO

CREATE TABLE dbo.budget (
	budget_id INT IDENTITY(1, 1) NOT NULL
	,budget_number INT NOT NULL
	,budget_month DATETIME NOT NULL
	,user_added VARCHAR(255) NULL
	,datetime_added DATETIME NOT NULL
	,user_modified VARCHAR(255) NULL
	,datetime_modified DATETIME NULL
	,is_active BIT NOT NULL 
	CONSTRAINT pk_budget_id PRIMARY KEY CLUSTERED (budget_id ASC) WITH (
		PAD_INDEX = OFF
		,STATISTICS_NORECOMPUTE = OFF
		,IGNORE_DUP_KEY = OFF
		,ALLOW_ROW_LOCKS = ON
		,ALLOW_PAGE_LOCKS = ON
		,FILLFACTOR = 90
		)
	ON [primary]
	) ON [primary]
GO

ALTER TABLE dbo.budget ADD DEFAULT(getdate())
FOR datetime_added
GO

ALTER TABLE dbo.budget ADD DEFAULT(1)
FOR is_active
GO

ALTER TABLE dbo.budget ADD CONSTRAINT uc_budget_number UNIQUE (budget_number)
GO

-- indexes
CREATE NONCLUSTERED INDEX [ix_budget_1] ON dbo.budget (budget_number ASC)
	WITH (
			PAD_INDEX = OFF
			,STATISTICS_NORECOMPUTE = OFF
			,SORT_IN_TEMPDB = OFF
			,DROP_EXISTING = OFF
			,ONLINE = OFF
			,ALLOW_ROW_LOCKS = ON
			,ALLOW_PAGE_LOCKS = ON
			,FILLFACTOR = 90
			) ON [primary]

-- data
INSERT INTO dbo.budget (
	budget_number
	,budget_month
	,user_added
	)
VALUES (
	202102
	,'02/01/2021'
	,'azinger3'
	)

-- verify
SELECT TOP 1 budget_id
FROM dbo.budget
