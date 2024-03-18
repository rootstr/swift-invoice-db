-- Table: swift_feature_role_scope
/*
summary:
    Defines the relationship between Swift features, user roles and scope actions
*/
CREATE TABLE IF NOT EXISTS swift_feature_role_scope (
    swiftFeatureRoleScopeId UUID NOT NULL PRIMARY KEY DEFAULT UUID(), -- Unique identifier for each combination of Swift feature and user work module, generated automatically
    userRoleId UUID NOT NULL, -- ID of the user role
    swiftFeatureScopeId UUID NOT NULL,
    swiftFeatureId UUID NOT NULL, -- ID of the Swift feature
    CONSTRAINT Fk_userRoleId_swift_feature_role_scope FOREIGN KEY(userRoleId) REFERENCES user_role(userRoleId), -- Foreign key constraint referencing user_role table
    CONSTRAINT Fk_swiftFeatureId_swift_feature_role_scope FOREIGN KEY(swiftFeatureId) REFERENCES swift_feature(swiftFeatureId), -- Foreign key constraint referencing swift_feature table
    CONSTRAINT Fk_swiftFeatureScopeId_swift_feature_role_scope FOREIGN KEY(swiftFeatureScopeId) REFERENCES swift_feature_scope(swiftFeatureScopeId)

) ENGINE=INNODB;
