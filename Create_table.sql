CREATE TABLE Users (
    user_id NUMBER(7) 
    CONSTRAINT users_uid_pk PRIMARY KEY,
    username VARCHAR2(50) UNIQUE NOT NULL,
    password VARCHAR2(50) NOT NULL,
    role VARCHAR2(50) CHECK (role IN ('admin', 'beneficiary', 'volunteer')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Beneficiaries (
    beneficiary_id NUMBER(7) CONSTRAINT beneficiaries_bid_pk PRIMARY KEY,
    user_id NUMBER(7) CONSTRAINT beneficiaries_uid_fk REFERENCES Users(user_id),
    name VARCHAR2(50) NOT NULL,
    address VARCHAR2(50) NOT NULL,
    contact_number VARCHAR2(20) NOT NULL,
    income_level NUMBER(7) NOT NULL,
    status VARCHAR2(50) CHECK (status IN ('verified', 'unverified')) NOT NULL,
    registration_date DATE
);
 

CREATE TABLE Volunteers (
    volunteer_id NUMBER(7) CONSTRAINT volunteers_vid_pk PRIMARY KEY,
    user_id NUMBER(7) CONSTRAINT volunteers_uid_fk REFERENCES Users(user_id),
    name VARCHAR2(50) NOT NULL,
    contact_number VARCHAR2(20) NOT NULL,
    registration_date DATE NOT NULL
);
 

CREATE TABLE Programs (
    program_id NUMBER(7) CONSTRAINT programs_pid_pk PRIMARY KEY,
    program_name VARCHAR2(255) NOT NULL,
    description VARCHAR2(100) NOT NULL,
    income_limit NUMBER(7) NOT NULL,
    budget NUMBER(10) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR2(50) CHECK (status IN ('active', 'inactive')) NOT NULL
);
 

CREATE TABLE Applications (
 application_id NUMBER(7) CONSTRAINT applications_aid_pk PRIMARY KEY,
 beneficiary_id NUMBER(7) CONSTRAINT applications_bid_fk REFERENCES Beneficiaries(beneficiary_id),
 program_id NUMBER(7) CONSTRAINT applications_pid_fk REFERENCES Programs(program_id),
 application_date DATE NOT NULL,
status VARCHAR2(50) CHECK (status IN ( 'approved', 'rejected')) 
);

CREATE TABLE Notifications (
    notification_id NUMBER PRIMARY KEY,
    user_id NUMBER REFERENCES Users(user_id),
    message VARCHAR2(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE VolunteerAssignments (
    assignment_id NUMBER(7) CONSTRAINT program_assignments_aid_pk PRIMARY KEY,
    program_id NUMBER(7) CONSTRAINT program_assignments_pid_fk REFERENCES         Programs(program_id),
    volunteer_id NUMBER(7) CONSTRAINT program_assignments_vid_fk REFERENCES Volunteers(volunteer_id),
    assigned_date DATE NOT NULL
);
 

-- Trigger For adjusting the registration date

CREATE OR REPLACE TRIGGER set_registration_date
BEFORE INSERT ON Beneficiaries
FOR EACH ROW
DECLARE
    user_registration_date DATE;
BEGIN
    -- Fetch the created_at date from the Users table
    SELECT created_at INTO user_registration_date
    FROM Users
    WHERE user_id = :NEW.user_id;

    -- Assign the registration_date value
    :NEW.registration_date := user_registration_date;
END;
/

-- Sequence and Trigger for auto filling Notifications table

CREATE SEQUENCE notification_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER verify_application
BEFORE INSERT OR UPDATE ON Applications
FOR EACH ROW
DECLARE
    beneficiary_income_level NUMBER;
    program_income_limit NUMBER;
    app_message VARCHAR2(255);
BEGIN
    -- Fetch the income level of the beneficiary from the Beneficiaries table
    SELECT income_level INTO beneficiary_income_level
    FROM Beneficiaries
    WHERE beneficiary_id = :NEW.beneficiary_id;
    -- Fetch the income limit of the program from the Programs table
    SELECT income_limit INTO program_income_limit
    FROM Programs
    WHERE program_id = :NEW.program_id;
    -- Compare income level with income limit and set status and message accordingly
    IF beneficiary_income_level <= program_income_limit THEN
        :NEW.status := 'approved';
        app_message := 'Your application was approved';
    ELSE
        :NEW.status := 'rejected';
        app_message := 'Your application was rejected';
    END IF;

    -- Insert a notification with the application date as created_at
    INSERT INTO Notifications (notification_id, user_id, message, created_at)
    VALUES (notification_seq.NEXTVAL, :NEW.beneficiary_id, app_message, :NEW.application_date);
END;
/
