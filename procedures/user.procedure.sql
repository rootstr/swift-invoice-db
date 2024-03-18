DELIMITER $$

CREATE PROCEDURE IF NOT EXISTS createOrUpdateUser(
    IN _userId UUID,
    IN _userRoleId UUID,
    IN _userWorkModuleId UUID,
    IN _nickname VARCHAR(50),
    IN _name VARCHAR(30),
    IN _lastname VARCHAR(30),
    IN _description VARCHAR(250),
    IN _password VARCHAR(256),
    IN _createdAt DATETIME,
    IN _isActive BOOLEAN
)
BEGIN
    INSERT INTO user (userId, userRoleId, userWorkModuleId, nickname, name, lastname, description, password, createdAt, isActive)
    VALUES (_userId, _userRoleId, _userWorkModuleId, _nickname, _name, _lastname, _description, _password, _createdAt, _isActive)
    ON DUPLICATE KEY UPDATE
        userRoleId = VALUES(userRoleId),
        userWorkModuleId = VALUES(userWorkModuleId),
        nickname = VALUES(nickname),
        name = VALUES(name),
        lastname = VALUES(lastname),
        description = VALUES(description),
        password = VALUES(password),
        createdAt = VALUES(createdAt),
        isActive = VALUES(isActive);
END$$


/*
    Summary:
        Find a user account by email.
    Params:
        (IN) _nickname: associated with the account.
*/
CREATE PROCEDURE IF NOT EXISTS getUserByNickname(
    IN _nickname VARCHAR(50)
)
BEGIN
    SELECT * 
    FROM user
    WHERE user._nickname = _nickname;
END$$


CREATE PROCEDURE IF NOT EXISTS getUserByUserId(
    IN _userId UUID
)
BEGIN
    SELECT * 
    FROM user
    WHERE user.userId = _userId;
END$$

DELIMITER ;
