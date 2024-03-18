-- Table: user_work_module
/*
    summary:   
        Stores work modules assigned to different departments within the company.
        Each department corresponds to a specific area within the company, such as accounting, administration, and billing.
*/
CREATE TABLE IF NOT EXISTS user_work_module (
    userWorkModuleId UUID NOT NULL PRIMARY KEY DEFAULT UUID(), -- Unique identifier for each user work module, generated automatically
    workModule VARCHAR(50) NOT NULL UNIQUE -- Name of the work module (cannot be null), must be unique
) ENGINE=INNODB;

-- Default work module insertion
INSERT INTO user_work_module(userWorkModuleId, workModule) VALUES (UUID(), 'none');
