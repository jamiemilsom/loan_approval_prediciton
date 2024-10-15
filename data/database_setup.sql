-- Create the credit_risk_dataset table
CREATE TABLE credit_risk_dataset (
    person_age INTEGER,
    person_income INTEGER,
    person_home_ownership TEXT,
    person_emp_length REAL,
    loan_intent TEXT,
    loan_grade TEXT,
    loan_amnt INTEGER,
    loan_int_rate REAL,
    loan_status INTEGER,
    loan_percent_income REAL,
    cb_person_default_on_file TEXT,
    cb_person_cred_hist_length INTEGER
);

-- Create the train_dataset table
CREATE TABLE train_dataset (
    id INTEGER,
    person_age INTEGER,
    person_income INTEGER,
    person_home_ownership TEXT,
    person_emp_length REAL,
    loan_intent TEXT,
    loan_grade TEXT,
    loan_amnt INTEGER,
    loan_int_rate REAL,
    loan_percent_income REAL,
    cb_person_default_on_file TEXT,
    cb_person_cred_hist_length INTEGER,
    loan_status INTEGER
);

-- Import data from CSV files
.mode csv
.import credit_risk_dataset.csv credit_risk_dataset
.import train.csv train_dataset

-- Remove header rows from imported data
DELETE FROM credit_risk_dataset WHERE person_age = 'person_age';
DELETE FROM train_dataset WHERE person_age = 'person_age';

-- Clean up the credit_risk_dataset
DELETE FROM credit_risk_dataset
WHERE
    person_age IS NULL OR person_age = '' OR
    person_income IS NULL OR person_income = '' OR
    person_home_ownership IS NULL OR person_home_ownership = '' OR
    person_emp_length IS NULL OR person_emp_length = '' OR
    loan_intent IS NULL OR loan_intent = '' OR
    loan_grade IS NULL OR loan_grade = '' OR
    loan_amnt IS NULL OR loan_amnt = '' OR
    loan_int_rate IS NULL OR loan_int_rate = '' OR
    loan_percent_income IS NULL OR loan_percent_income = '' OR
    cb_person_default_on_file IS NULL OR cb_person_default_on_file = '' OR
    cb_person_cred_hist_length IS NULL OR cb_person_cred_hist_length = '' OR
    loan_status IS NULL OR loan_status = '';

-- Clean up the train_dataset
DELETE FROM train_dataset
WHERE
    person_age IS NULL OR person_age = '' OR
    person_income IS NULL OR person_income = '' OR
    person_home_ownership IS NULL OR person_home_ownership = '' OR
    person_emp_length IS NULL OR person_emp_length = '' OR
    loan_intent IS NULL OR loan_intent = '' OR
    loan_grade IS NULL OR loan_grade = '' OR
    loan_amnt IS NULL OR loan_amnt = '' OR
    loan_int_rate IS NULL OR loan_int_rate = '' OR
    loan_percent_income IS NULL OR loan_percent_income = '' OR
    cb_person_default_on_file IS NULL OR cb_person_default_on_file = '' OR
    cb_person_cred_hist_length IS NULL OR cb_person_cred_hist_length = '' OR
    loan_status IS NULL OR loan_status = '';

-- Create the merged_dataset
CREATE TABLE merged_dataset AS
SELECT
    NULLIF(person_age, '') AS person_age,
    NULLIF(person_income, '') AS person_income,
    NULLIF(person_home_ownership, '') AS person_home_ownership,
    NULLIF(person_emp_length, '') AS person_emp_length,
    NULLIF(loan_intent, '') AS loan_intent,
    NULLIF(loan_grade, '') AS loan_grade,
    NULLIF(loan_amnt, '') AS loan_amnt,
    NULLIF(loan_int_rate, '') AS loan_int_rate,
    NULLIF(loan_percent_income, '') AS loan_percent_income,
    NULLIF(cb_person_default_on_file, '') AS cb_person_default_on_file,
    NULLIF(cb_person_cred_hist_length, '') AS cb_person_cred_hist_length,
    NULLIF(loan_status, '') AS loan_status
FROM train_dataset
UNION ALL
SELECT
    NULLIF(person_age, '') AS person_age,
    NULLIF(person_income, '') AS person_income,
    NULLIF(person_home_ownership, '') AS person_home_ownership,
    NULLIF(person_emp_length, '') AS person_emp_length,
    NULLIF(loan_intent, '') AS loan_intent,
    NULLIF(loan_grade, '') AS loan_grade,
    NULLIF(loan_amnt, '') AS loan_amnt,
    NULLIF(loan_int_rate, '') AS loan_int_rate,
    NULLIF(loan_percent_income, '') AS loan_percent_income,
    NULLIF(cb_person_default_on_file, '') AS cb_person_default_on_file,
    NULLIF(cb_person_cred_hist_length, '') AS cb_person_cred_hist_length,
    NULLIF(loan_status, '') AS loan_status
FROM credit_risk_dataset;

-- Export the merged_dataset to CSV
.headers on
.mode csv
.output merged_dataset.csv
SELECT * FROM merged_dataset;
.output stdout