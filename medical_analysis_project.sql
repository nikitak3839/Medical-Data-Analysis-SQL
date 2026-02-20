CREATE DATABASE IF NOT EXISTS hospital_db;
USE hospital_db;

CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    age INT,
    gender ENUM('M', 'F'),
    diagnosis VARCHAR(50),
    insurance_type VARCHAR(20),
    visit_date DATE,
    treatment_cost DECIMAL(10, 2)
);
INSERT INTO patients (full_name, age, gender, diagnosis, insurance_type, visit_date, treatment_cost) VALUES
('John Doe', 45, 'M', 'Hypertension', 'Private', '2026-01-10', 150.00),
('Maria Garcia', 32, 'F', 'Diabetes', 'Public', '2026-01-12', 200.50),
('Robert Brown', 68, 'M', 'Hypertension', 'Private', '2026-01-15', 120.00),
('Anna Smith', 25, 'F', 'Flu', 'Public', '2026-01-20', 50.00),
('Peter Parker', 54, 'M', 'Diabetes', 'Private', '2026-01-22', 310.00),
('Elena Vog', 41, 'F', 'Gastritis', 'Public', '2026-01-25', 180.00),
('Linda Hamilton', 72, 'F', 'Hypertension', 'Public', '2026-02-01', 140.00);


-- 1. Средняя стоимость лечения по диагнозам
SELECT diagnosis, ROUND(AVG(treatment_cost), 2) AS average_price
FROM patients
GROUP BY diagnosis
ORDER BY average_price DESC
LIMIT 3;

-- 2. Подсчет количества пациентов по полу
SELECT gender, COUNT(*) AS patient_count
FROM patients
GROUP BY gender;

-- 3. Анализ доходов по типу страховки
SELECT insurance_type, 
       COUNT(*) AS visits, 
       SUM(treatment_cost) AS total_revenue
FROM patients
GROUP BY insurance_type;



