SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Rob Azinger
-- Create Date: 02/25/2021
-- Description: Create a budget
-- =============================================

CREATE OR ALTER PROCEDURE dbo.pr_budget_ins (
	@budget_number INT
	,@budget_month DATETIME
	,@user_added VARCHAR(255)
	)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.budget (
		budget_number
		,budget_month
		,user_added
		)
	VALUES (
		@budget_number
		,@budget_month
		,@user_added
		)
END
GO


