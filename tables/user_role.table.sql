-- Table: user_role
/*
summary: Stores information about user roles.
*/
CREATE TABLE IF NOT EXISTS user_role (
    userRoleId UUID NOT NULL PRIMARY KEY DEFAULT UUID(), -- Unique identifier for each user role, generated by default
    roleName VARCHAR(50) NOT NULL UNIQUE -- Name of the user role (cannot be null), must be unique
) ENGINE=INNODB;

-- Base user roles insertions
INSERT INTO user_role(userRoleId, roleName) VALUES (UUID(),'normal');
INSERT INTO user_role(userRoleId, roleName) VALUES (UUID(),'admin');