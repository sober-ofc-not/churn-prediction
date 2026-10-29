-- Аналитические запросы к таблице customers
-- Задача: исследовать, какие факторы связаны с оттоком клиентов

--сколько клиентов в базе?
SELECT COUNT(*) AS total_customers 
FROM customers;

--сколько ушло и суолько осталось?
SELECT Churn, COUNT(*) AS cnt
FROM customers 
GROUP BY Churn;

--отток по типу контракта
SELECT Contract,
    COUNT(*) AS total,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY Contract
ORDER BY churn_rate DESC;

--доля оттока в процентах
SELECT Churn, 
    COUNT(*) AS cnt,
    ROUND(100.0*COUNT(*)/(SELECT COUNT(*) FROM customers), 2);

--отток по интернетуслуге
SELECT 
    InternetService,
    COUNT(*) AS total,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY InternetService
ORDER BY churn_rate DESC;

--отток по способы оплаты
SELECT 
    PaymentMethod,
    COUNT(*) AS total,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;

-- отток по paperless
SELECT 
    PaperlessBilling,
    COUNT(*) AS total,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY PaperlessBilling
ORDER BY churn_rate DESC;


-- cредний чек и стаж у ушедших и оставшихся
SELECT 
    Churn,
    COUNT(*) AS cnt,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly,
    ROUND(AVG(tenure), 2) AS avg_tenure
FROM customers
GROUP BY Churn;

-- когортный анализ по tenure
SELECT 
    CASE 
        WHEN tenure <= 12 THEN '0-12'
        WHEN tenure <= 24 THEN '13-24'
        WHEN tenure <= 48 THEN '25-48'
        ELSE '49+'
    END AS tenure_group,
    COUNT(*) AS total,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY tenure_group
ORDER BY MIN(tenure);
