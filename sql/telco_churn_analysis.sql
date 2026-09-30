USE TelcoChurn;
GO

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT customerID) AS unique_customers
FROM dbo.telco_customers;


SELECT
    StreamingTV,
    COUNT(*) AS total_customers
FROM dbo.telco_customers
GROUP BY StreamingTV;

SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0)
        AS decimal(5,2)
    ) AS churn_rate
FROM dbo.telco_customers;

SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*)
        AS decimal(5,2)
    ) AS churn_rate
FROM dbo.telco_customers
GROUP BY Contract
ORDER BY churn_rate DESC;

SELECT
    tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*)
        AS decimal(5,2)
    ) AS churn_rate
FROM dbo.telco_customers
GROUP BY tenure_group
ORDER BY MIN(tenure);

SELECT
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*)
        AS decimal(5,2)
    ) AS churn_rate
FROM dbo.telco_customers
GROUP BY InternetService
ORDER BY churn_rate DESC;

SELECT
    InternetService,
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*)
        AS decimal(5,2)
    ) AS churn_rate
FROM dbo.telco_customers
GROUP BY InternetService, Contract
ORDER BY churn_rate DESC;

SELECT
    monthly_charge_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*)
        AS decimal(5,2)
    ) AS churn_rate
FROM dbo.telco_customers
GROUP BY monthly_charge_group
ORDER BY MIN(MonthlyCharges);

SELECT
    InternetService,
    monthly_charge_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*)
        AS decimal(5,2)
    ) AS churn_rate
FROM dbo.telco_customers
GROUP BY InternetService, monthly_charge_group
ORDER BY InternetService, MIN(MonthlyCharges);


SELECT
    Contract,
    tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*)
        AS decimal(5,2)
    ) AS churn_rate
FROM dbo.telco_customers
GROUP BY Contract, tenure_group
ORDER BY
    CASE Contract
        WHEN 'Month-to-month' THEN 1
        WHEN 'One year' THEN 2
        WHEN 'Two year' THEN 3
    END,
    MIN(tenure);