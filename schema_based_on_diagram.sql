CREATE TABLE Patients (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  date_of_birth DATE
);
CREATE TABLE MedicalHistories(
  id INT PRIMARY KEY,
  admitted_at TIMESTAMP,
  patient_id INT REFERENCES Patients(id) ON DELETE CASCADE,
  status VARCHAR(100)
);
CREATE INDEX patient_ids ON MedicalHistories (patient_id);
CREATE TABLE Invoices(
  id INT PRIMARY KEY,
  total_amount FLOAT(4),
  generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history__id INT REFERENCES MedicalHistories (id) ON DELETE CASCADE
);
CREATE INDEX medical_history__ids ON Invoices (medical_history__id);

