EXEC dbo.pr_budget_ins @budget_number = 202103
	,@budget_month = '03/01/2021'
	,@user_added = 'test3'

SELECT TOP 1 b.budget_id
FROM dbo.budget AS b WITH (NOLOCK)
ORDER BY b.budget_id DESC
