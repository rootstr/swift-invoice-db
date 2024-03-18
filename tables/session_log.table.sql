-- Table: session_log
/*
summary:
    Tracks login and logout activities for users.
*/
CREATE TABLE IF NOT EXISTS session_log (
    sessionLogId UUID NOT NULL PRIMARY KEY DEFAULT UUID(), -- Unique identifier for each session log entry, generated automatically
    userId UUID NOT NULL, -- ID of the user associated with the session activity
    status ENUM("LogIn", "LogOut") NOT NULL, -- Indicates whether the session activity is a login or logout
    loggedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Timestamp indicating when the session activity occurred
    CONSTRAINT Fk_userId_session_log FOREIGN KEY(userId) REFERENCES user(userId) -- Foreign key constraint referencing user table
) ENGINE=INNODB;
