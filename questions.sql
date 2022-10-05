-- Question #1: Which medication type had the least amount of patients that were readmitted?
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
Select * from patient_medication_table

-- Question #3: Which diagnosis group have the highest number of diagnosis based on gender
SELECT diagnosis_name
FROM diagnosis_table AS d
JOIN encounter_table AS e
ON (e.diag_1 = d.diagnosis_name)
SELECT diag_1
FROM encounter_table
-- Question #4: Which age group and race had the highest number of diagnosis and readmittance?
