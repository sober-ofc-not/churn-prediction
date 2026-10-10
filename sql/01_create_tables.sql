-- Схема таблицы customers для Telco Customer Churn
-- Источник: https://www.kaggle.com/datasets/blastchar/telco-customer-churn
-- 7043 клиента, 21 признак + целевая переменная Churn
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
	customerID TEXT PRIMARY KEY,
	gender TEXT,
	SeniorCitizen INTEGER,
	Partner TEXT,
	Dependents TEXT,
	tenure INTEGER,
	PhoneService TEXT,
	MultipleLines TEXT,
	InternetService TEXT,
	OnlineSecurity TEXT,
	OnlineBackup TEXT,
	DeviceProtection TEXT,
	TechSupport TEXT,
	StreamingTV TEXT,
	StreamingMovies TEXT,
	Contract TEXT,
	PaperlessBilling TEXT,
	PaymentMethod TEXT,
	MonthlyCharges REAL, 
	TotalCharges REAL,
	Churn TEXT
);
