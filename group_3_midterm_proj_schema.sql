-- Question #1: Which medication type had the least amount of patients that were readmitted?
-- Answer:  troglitazone
SELECT m.medication_type, e.readmitted, COUNT(e.readmitted) AS "number_of_patients"
FROM encounter_table AS e
JOIN patient_medication_table AS pm
ON (pm.encounter_id = e.encounter_id)
JOIN medication_table AS m
ON (m.medication_id = pm.medication_id)
GROUP by m.medication_type,e.readmitted
ORDER BY number_of_patients
 

-- Question #2:  Which Age group on diabetes medication spent the least amount of time in the hospital?
-- Answer:  0-10 age group
SELECT p.age, ROUND((AVG(e.time_in_hospital)),2) AS "average_time_in_hospital"
FROM encounter_table AS e
JOIN patients AS p
ON (p.patient_nbr = e.patient_nbr)
WHERE e."diabtesMed" = 'Yes'
GROUP BY p.age
ORDER BY average_time_in_hospital ASC

-- Question #3: Which diagnosis group have the highest number of diagnosis based on gender
SELECT p.gender, d.diagnosis_name, COUNT(d.diagnosis_name) AS "count",
RANK ()OVER(ORDER BY COUNT(d.diagnosis_name) DESC) 
FROM encounter_table AS e
JOIN diagnosis_table AS d
ON (e.diag_1 = d.diagnosis_code OR e.diag_2 = d.diagnosis_code OR e.diag_3 = d.diagnosis_code)
JOIN patients AS p
ON (e.patient_nbr = p.patient_nbr)
WHERE d.diagnosis_name LIKE LOWER('Diabetes%')
GROUP BY p.gender, d.diagnosis_name
 
-- Question #4: Which age group and race had the highest number of diagnosis and readmitted within 30 days?
-- Answer:  70-80 Caucasian had the highest number of diagnosis and were readmitted within 30 days
SELECT p.age, p.race, COUNT(d.diagnosis_name) AS "count",
RANK() OVER(ORDER BY COUNT(d.diagnosis_name) DESC) 
FROM encounter_table AS e
JOIN diagnosis_table AS d
ON (e.diag_1 = d.diagnosis_code OR e.diag_2 = d.diagnosis_code OR e.diag_3 = d.diagnosis_code)
JOIN patients AS p
ON (e.patient_nbr = p.patient_nbr)
WHERE e.readmitted = '<30'
GROUP BY p.age, p.race

DROP TABLE "patient_medication_table"
CREATE TABLE IF NOT EXISTS public.patient_medication_table
(
    encounter_id integer NOT NULL,
    medication_id integer NOT NULL,
    change_in_dosage character varying(80) COLLATE pg_catalog."default" NOT NULL,
    FOREIGN KEY (encounter_id) REFERENCES encounter_table(encounter_id),
    FOREIGN KEY (medication_id) REFERENCES medication_table(medication_id),
    CONSTRAINT pk_medication_encounter_id PRIMARY KEY (medication_id, encounter_id)
);