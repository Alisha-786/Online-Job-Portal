-- Updated Database Relationships: - 
-- Users → Job Seekers (1 :1) 
-- Users → Employers (1 :1) 
-- Users → Admins (1 :1) 
-- Users → Notifications (1 :M) 
-- Users → Messages (M :M) 

-- Employers → Jobs (1 :M) 
-- Employers → Payments (1 :M) 
-- Employers → Subscriptions (1 :M) 

-- Jobs → Applications (1 :M) 
-- Job Seekers → Applications (1 :M) 
-- Job Seekers → Reviews → Employers (M :M) 
-- Job Seekers → Saved Jobs (M :M) 
-- Job Seekers → Job Alerts (1 :M) 
-- Job Seekers → Resume Parsing (1 :1) 
-- Job Seekers → Skill Matching (M :M) 
-- Applications → Interviews (1 :1) 
-- Applications → Job Results (1 :1) 
-- Subscription Plans → Employer Subscriptions (1 :M) 

CREATE TABLE users (
    user_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    email VARCHAR2(150) UNIQUE NOT NULL,
    password VARCHAR2(255) NOT NULL,
    phone VARCHAR2(15),
    role VARCHAR2(20) CHECK (role IN ('job_seekers', 'employers', 'admins'))
);
CREATE TABLE user_actions (
    action_id NUMBER PRIMARY KEY,
    user_id NUMBER,
    action_type VARCHAR2(50) CHECK (
        action_type IN ('Login', 'Logout', 'Register', 'Update', 'View')
    ),
    timestamp DATE DEFAULT SYSDATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
CREATE TABLE employers (
    employer_id NUMBER PRIMARY KEY,
    user_id NUMBER UNIQUE,
    company_name VARCHAR2(255) NOT NULL,
    industry VARCHAR2(100),
    website VARCHAR2(255),
    location VARCHAR2(150),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
CREATE TABLE job_seekers (
    seeker_id NUMBER PRIMARY KEY,
    user_id NUMBER UNIQUE,
    resume VARCHAR2(255),
    linkedin VARCHAR2(255),
    portfolio VARCHAR2(255),
    skills CLOB,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
CREATE TABLE admins (
    admin_id NUMBER PRIMARY KEY,
    user_id NUMBER UNIQUE,
    login_key VARCHAR2(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
CREATE TABLE moderation (
    moderation_id NUMBER PRIMARY KEY,
    admin_id NUMBER,
    job_id NUMBER NULL,
    job_seeker_id NUMBER NULL,
    employer_id NUMBER NULL,
    action VARCHAR2(50) CHECK (
        action IN ('Approve', 'Reject', 'Edit', 'Delete')
    ),
    timestamp DATE DEFAULT SYSDATE,
    FOREIGN KEY (admin_id) REFERENCES admins(admin_id) ON DELETE CASCADE,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id) ON DELETE CASCADE,
    FOREIGN KEY (job_seeker_id) REFERENCES job_seekers(seeker_id) ON DELETE CASCADE,
    FOREIGN KEY (employer_id) REFERENCES employers(employer_id) ON DELETE CASCADE
);
CREATE TABLE jobs (
    job_id NUMBER PRIMARY KEY,
    employer_id NUMBER,
    title VARCHAR2(255) NOT NULL,
    description CLOB NOT NULL,
    category VARCHAR2(100),
    salary NUMBER,
    location VARCHAR2(150),
    experience NUMBER,
    job_type VARCHAR2(50) CHECK (
        job_type IN ('Full-Time','Part-Time','Contract','Internship')),
    posted_date DATE DEFAULT SYSDATE,
    application_deadline DATE,
    FOREIGN KEY (employer_id) REFERENCES employers(employer_id) ON DELETE CASCADE
);
CREATE TABLE applications (
    application_id NUMBER PRIMARY KEY,
    job_id NUMBER,
    job_seeker_id NUMBER,
    resume VARCHAR2(255),
    cover_letter CLOB,
    status VARCHAR2(50) CHECK (
        status IN (
            'Pending',
            'Reviewed',
            'Shortlisted',
            'Rejected',
            'Hired'
        )
    ),
    applied_date DATE DEFAULT SYSDATE,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id) ON DELETE CASCADE,
    FOREIGN KEY (job_seeker_id) REFERENCES job_seekers(seeker_id) ON DELETE CASCADE
);


