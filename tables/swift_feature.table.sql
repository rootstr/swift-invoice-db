-- Table: swift_feature
/*
    summary:   
        Stores essential features of the application 
        to be assigned to user roles for access control purposes.
*/
CREATE TABLE IF NOT EXISTS swift_feature (
    swiftFeatureId UUID NOT NULL PRIMARY KEY DEFAULT UUID(), -- Unique identifier for each Swift feature, generated automatically
    featureName VARCHAR(50) NOT NULL UNIQUE -- Name of the feature (cannot be null), must be unique
) ENGINE=INNODB;
