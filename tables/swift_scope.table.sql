-- Table: swift_scope
/*
    summary:
        Stores scopes associated with Swift features, defining specific actions or permissions.
*/
CREATE TABLE IF NOT EXISTS swift_scope (
    swiftScopeId UUID NOT NULL PRIMARY KEY, -- Unique identifier for each Swift scope
    scopeName VARCHAR(50) NOT NULL -- Name of the scope (cannot be null), must be unique
) ENGINE=INNODB;

-- Essential CRUD scope insertions
INSERT INTO swift_scope(swiftScopeId, scopeName) VALUES (UUID(), 'read');
INSERT INTO swift_scope(swiftScopeId, scopeName) VALUES (UUID(), 'update');
INSERT INTO swift_scope(swiftScopeId, scopeName) VALUES (UUID(), 'delete');
INSERT INTO swift_scope(swiftScopeId, scopeName) VALUES (UUID(), 'create');
