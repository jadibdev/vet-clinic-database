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

CREATE TABLE Treatments(
  id INT PRIMARY KEY,
  type VARCHAR(225),
  name VARCHAR(255)
);
CREATE TABLE InvoiceItems(
  id INT PRIMARY KEY,
  unit_price FLOAT(4),
  quantity INT,
  total_price FLOAT(4),
  invoice_id INT REFERENCES Invoices(id) ON DELETE CASCADE,
  treatment_id INT REFERENCES Treatments (id) ON DELETE CASCADE
);
CREATE INDEX invoice_ids ON InvoiceItems (invoice_id);
CREATE INDEX treatment_ids ON InvoiceItems (treatment_id);
-- Join tables 
CREATE TABLE MedicalHistories_Treatments (
  id INT PRIMARY KEY,
  medical_history_id INT REFERENCES MedicalHistories(id) ON DELETE CASCADE,
  treatment_id INT REFERENCES Treatments(id) ON DELETE CASCADE
);
CREATE INDEX medical_history_ids ON MedicalHistories_Treatments (medical_history_id);
CREATE INDEX join_treatment_ids ON MedicalHistories_Treatments (treatment_id);
