#mid_term_project_group_3
Title:  Data Extraction and Analysis of Diabetes Dataset

Team: Our team will anwser the following questions on how diabetes affects different races and genders,and how diabetes is diagnosed in different ways.
  Mahederemariam Dagne 
  Roles:  (Team Lead, Data Scientist, Tester)
  Github:  https://github.com/MahiLu

  Elliott Einstein 
  Roles:  (Data Scientist, Tester, Communication Specialist)
  GitHub:  https://github.com/Elliott-dev

  Leo Davis 
  Roles:  (Data Scientist, Tester, Repository Manager)
  Github: https://github.com/leo-the-virgo

  Tyrese Knight 
  Roles:  (Data Scientist, Documentation)
  Github: https://github.com/tythegoat1

Goal:  Our goal of this project is to clean a large dataset, anwser questions in the effects of diabetes and test the functionality of our code.  By performing these different analysis, patients with diabetes will have a better understanding on how it may be treated.

Project Description:  
  Perform data extraction, loading, and cleanup using pandas. Build dataset locally using PGAdmin and Postgres and run local queries.  Migrate data to a cloud computing environment and run queries utilizing pyspark.  Run queries and compare times between local, pyspark, pyspark_parquet, and pyspark_parquet_cached.  Performed quality assurance testing, and answer the following research questions.
   - Question 1: Which medication type had the least percentage of patients that were readmitted?
   - Question 2: Which Age group on diabetes medication spent the least amount of time in the hospital?
   - Question 3: Which Diabetes diagnosis group have the highest number of diagnosis based on gender
   - Question 4: Which age group and race had the highest number of diagnosis and readmitted patients within 30 days?


How to use:
  Cleaning the data files in Pandas:  
  Open the Mid_Term_Project_Netflix_Group_3 (1).ipynb file in colab.research.google.com
  Upload the following files
   - admission_source.csv
   - admission_type.csv
   - diabetic_data.csv
   - discharge_disposition.csv
   - ICD-9_code_1998.csv
----------------------------------------------
  Cleaning and analysing Data in PySpark
  Open the Netflix_Mid_Term_Project_Group_3_PySpark.ipynb file in colab.research.google.com
   - admission_source.csv
   - admission_type.csv
   - diabetic_data.csv
   - discharge_disposition.csv
   - ICD-9_code_1998.csv
  Create a tests folder
   - upload a copy of the same files into the tests folder for testing
   - admission_source.csv
   - admission_type.csv
   - diabetic_data.csv
   - discharge_disposition.csv
   - ICD-9_code_1998.csv

Conclusions:
   - Parquet files are much faster to work with when handling larger datasets. 
   - Understanding initial data is important for splits
   - Assert statements allow minimization of errors
   - In general diagnosis types are mostly not related to gender 

Future Considerations:
   - Predict whether or not a patient has diabetes using this dataset as training model.
   - In-depth analysis on the cost and effect of medications.

Problems and Limitations:
  - Splitting on multiple conditions
   - Deciding on the number of tables and the relationships between them in the logical design phase
   - Adopting pandas to pyspark framework

