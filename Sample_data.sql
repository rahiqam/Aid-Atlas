-- Users Table

INSERT INTO Users (user_id, username, password, role) VALUES (1, 'anisur01', 'pass1234', 'admin');
INSERT INTO Users (user_id, username, password, role) VALUES (2, 'salma02', 'pass5678', 'beneficiary');
INSERT INTO Users (user_id, username, password, role) VALUES (3, 'fahim03', 'pass9012', 'beneficiary');
INSERT INTO Users (user_id, username, password, role) VALUES (4, 'raju04', 'pass3456', 'beneficiary');
INSERT INTO Users (user_id, username, password, role) VALUES (5, 'mili05', 'pass7890', 'beneficiary');
INSERT INTO Users (user_id, username, password, role) VALUES (6, 'koli06', 'pass1234', 'beneficiary');
INSERT INTO Users (user_id, username, password, role) VALUES (7, 'sumon07', 'pass5678', 'volunteer');
INSERT INTO Users (user_id, username, password, role) VALUES (8, 'shanta08', 'pass9012', 'volunteer');
INSERT INTO Users (user_id, username, password, role) VALUES (9, 'rahim09', 'pass1234', 'volunteer');
INSERT INTO Users (user_id, username, password, role) VALUES (10, 'hasina10', 'pass5678', 'volunteer');
INSERT INTO Users (user_id, username, password, role) VALUES (11, 'kamal11', 'pass9012', 'volunteer');
 


-- Beneficiaries table

INSERT INTO Beneficiaries (beneficiary_id, user_id, name, address, contact_number, income_level, status, registration_date)
VALUES (1, 2, 'Salma Akter', 'Mirpur, Dhaka', '01712345678', 25000, 'verified', TO_DATE('2024-12-01', 'YYYY-MM-DD'));

INSERT INTO Beneficiaries (beneficiary_id, user_id, name, address, contact_number, income_level, status, registration_date)
VALUES (2, 3, 'Fahim Ahmed', 'Uttara, Dhaka', '01887654321', 20000, 'unverified', TO_DATE('2024-11-15', 'YYYY-MM-DD'));

INSERT INTO Beneficiaries (beneficiary_id, user_id, name, address, contact_number, income_level, status, registration_date)
VALUES (3, 4, 'Raju Hossain', 'Dhanmondi, Dhaka', '01798765432', 18000, 'verified', TO_DATE('2024-10-20', 'YYYY-MM-DD'));

INSERT INTO Beneficiaries (beneficiary_id, user_id, name, address, contact_number, income_level, status, registration_date)
VALUES (4, 5, 'Mili Begum', 'Gulshan, Dhaka', '01912345678', 15000, 'verified', TO_DATE('2024-09-10', 'YYYY-MM-DD'));

INSERT INTO Beneficiaries (beneficiary_id, user_id, name, address, contact_number, income_level, status, registration_date)
VALUES (5, 6, 'Koli Akter', 'Banani, Dhaka', '01887654320', 22000, 'unverified', TO_DATE('2024-08-25', 'YYYY-MM-DD'));
 


-- Volunteers Table

INSERT INTO Volunteers (volunteer_id, user_id, name, contact_number, registration_date)
VALUES (1, 7, 'Sumon Mia', '01787654321', TO_DATE('2024-12-01', 'YYYY-MM-DD'));

INSERT INTO Volunteers (volunteer_id, user_id, name, contact_number, registration_date)
VALUES (2, 8, 'Shanta Akter', '01876543210', TO_DATE('2024-12-02', 'YYYY-MM-DD'));

INSERT INTO Volunteers (volunteer_id, user_id, name, contact_number, registration_date)
VALUES (3, 9, 'Rahim Uddin', '01912345678', TO_DATE('2024-12-03', 'YYYY-MM-DD'));

INSERT INTO Volunteers (volunteer_id, user_id, name, contact_number, registration_date)
VALUES (4, 10, 'Hasina Begum', '01754321098', TO_DATE('2024-12-04', 'YYYY-MM-DD'));

INSERT INTO Volunteers (volunteer_id, user_id, name, contact_number, registration_date)
VALUES (5, 11, 'Kamal Hossain', '01891234567', TO_DATE('2024-12-05', 'YYYY-MM-DD'));
 

-- Programs Table

INSERT INTO Programs (program_id, program_name, description, income_limit, budget, start_date, end_date, status)
VALUES (1, 'Winter Aid 2024', 'Warm clothes distribution', 30000, 500000, TO_DATE('2024-12-10', 'YYYY-MM-DD'), TO_DATE('2025-01-10', 'YYYY-MM-DD'), 'active');

INSERT INTO Programs (program_id, program_name, description, income_limit, budget, start_date, end_date, status)
VALUES (2, 'Education Support 2024', 'Scholarship for students', 25000, 700000, TO_DATE('2024-11-01', 'YYYY-MM-DD'), TO_DATE('2025-03-01', 'YYYY-MM-DD'), 'active');

INSERT INTO Programs (program_id, program_name, description, income_limit, budget, start_date, end_date, status)
VALUES (3, 'Health Camp 2024', 'Free medical services', 20000, 300000, TO_DATE('2024-12-15', 'YYYY-MM-DD'), TO_DATE('2025-02-01', 'YYYY-MM-DD'), 'active');

INSERT INTO Programs (program_id, program_name, description, income_limit, budget, start_date, end_date, status)
VALUES (4, 'Food Support 2024', 'Food package distribution', 25000, 400000, TO_DATE('2024-12-05', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'), 'active');

INSERT INTO Programs (program_id, program_name, description, income_limit, budget, start_date, end_date, status)
VALUES (5, 'Skill Training 2024', 'Job-oriented training', 15000, 800000, TO_DATE('2024-11-15', 'YYYY-MM-DD'), TO_DATE('2025-04-30', 'YYYY-MM-DD'), 'active');
 

-- Applications table
INSERT INTO Applications (application_id, beneficiary_id, program_id, application_date)
VALUES (1, 1, 1, TO_DATE('2024-12-05', 'YYYY-MM-DD'));

INSERT INTO Applications (application_id, beneficiary_id, program_id, application_date)
VALUES (2, 2, 2, TO_DATE('2024-11-20', 'YYYY-MM-DD'));

INSERT INTO Applications (application_id, beneficiary_id, program_id, application_date)
VALUES (3, 3, 3, TO_DATE('2024-12-12', 'YYYY-MM-DD'));

INSERT INTO Applications (application_id, beneficiary_id, program_id, application_date)
VALUES (4, 4, 4, TO_DATE('2024-12-08', 'YYYY-MM-DD'));

INSERT INTO Applications (application_id, beneficiary_id, program_id, application_date)
VALUES (5, 5, 5, TO_DATE('2024-11-30', 'YYYY-MM-DD'));
 
Volunteer Assignment table

INSERT INTO VolunteerAssignments (assignment_id, program_id, volunteer_id, assigned_date)
VALUES (1, 1, 1, TO_DATE('2024-12-05', 'YYYY-MM-DD'));

INSERT INTO VolunteerAssignments (assignment_id, program_id, volunteer_id, assigned_date)
VALUES (2, 2, 2, TO_DATE('2024-12-06', 'YYYY-MM-DD'));

INSERT INTO VolunteerAssignments (assignment_id, program_id, volunteer_id, assigned_date)
VALUES (3, 3, 3, TO_DATE('2024-12-07', 'YYYY-MM-DD'));

INSERT INTO VolunteerAssignments (assignment_id, program_id, volunteer_id, assigned_date)
VALUES (4, 4, 4, TO_DATE('2024-12-08', 'YYYY-MM-DD'));

INSERT INTO VolunteerAssignments (assignment_id, program_id, volunteer_id, assigned_date)
VALUES (5, 5, 5, TO_DATE('2024-12-09', 'YYYY-MM-DD'));
 






/* Notifications Table 

 *This will be auto generated 
*/
