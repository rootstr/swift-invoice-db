-- Table: user_metadata
/*
summary:
    Stores metadata associated with user sessions, including refresh tokens.
*/
CREATE TABLE IF NOT EXISTS user_metadata (
    userMetaId UUID NOT NULL PRIMARY KEY DEFAULT UUID(), -- Unique identifier for each user metadata record, generated automatically
    userId UUID NOT NULL, -- ID of the user associated with the metadata
    refreshToken VARCHAR(512) NOT NULL, -- Refresh token for the user session
    assignedAt DATETIME NOT NULL, -- Timestamp indicating when the metadata was assigned
    expiresAt DATETIME NOT NULL, -- Timestamp indicating when the metadata expires
    CONSTRAINT FK_userId_user_metadata FOREIGN KEY(userId) REFERENCES user(userId) ON DELETE CASCADE -- Foreign key constraint referencing user table with CASCADE on delete
) ENGINE=INNODB;
