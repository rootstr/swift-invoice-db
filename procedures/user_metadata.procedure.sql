DELIMITER $$

/*
    Summary:
        Adds a new refresh token associated with a user.
    Params:
        (IN) _userMetaId: primary key is optional. If null then a UUID() will be generated.
        (IN) _userId: Unique identifier of the user.
        (IN) _refreshToken: The refresh token to be associated with the user.
        (IN) _assignedAt: Date and time when the refresh token is assigned.
        (IN) _expiresAt: Date and time when the refresh token expires.
*/
CREATE PROCEDURE IF NOT EXISTS addRefreshToken(
    IN _userMetaId UUID,
    IN _userId UUID,
    IN _refreshToken VARCHAR(256),
    IN _assignedAt DATETIME,
    IN _expiresAt DATETIME
)
BEGIN
    INSERT INTO user_metadata (userMetaId, userId, refreshToken, assignedAt, expiresAt)
    VALUES (_userMetaId, _userId, _refreshToken, _assignedAt, _expiresAt);
END$$

/*
    Summary:
        Retrieves refresh tokens by username.
    Params:
        (IN) _nickname: Username associated with the account.
*/
CREATE PROCEDURE IF NOT EXISTS getRefreshTokensByNickname(
    IN _nickname VARCHAR(50)
)
BEGIN
    SELECT refreshToken as token, assignedAt as issued, expiresAt as expires  
    FROM user_metadata
    LEFT JOIN user
    ON user_metadata.userId = user.userId
    WHERE user.nickname = _nickname;
END$$


CREATE PROCEDURE IF NOT EXISTS getRefreshTokensByUserId(
    IN _userId UUID
)
BEGIN
    SELECT refreshToken as token, assignedAt as issued, expiresAt as expires  
    FROM user_metadata
    LEFT JOIN user
    ON user_metadata.userId = user.userId
    WHERE user.userId = _userId;
END$$


/*
    Summary:
        Deletes a refresh token.
    Params:
        (IN) _refreshToken: The refresh token to be deleted.
*/
CREATE PROCEDURE IF NOT EXISTS deleteRefreshToken(
    IN _refreshToken VARCHAR(512)
)
BEGIN
    DELETE FROM user_metadata
    WHERE user_metadata.refreshToken = _refreshToken;
END$$

/*
    Summary:
        Clears all refresh tokens for a specific user.
    Params:
        (IN) _nickname: associated with the account.
*/
CREATE PROCEDURE IF NOT EXISTS clearRefreshTokensByNickname(
    IN _nickname VARCHAR(50)
)
BEGIN
    DELETE FROM user_metadata
    WHERE user_metadata.userId = (SELECT userId FROM user WHERE user.nickname = _nickname);
END$$


CREATE PROCEDURE IF NOT EXISTS clearRefreshTokensByUserId(
    IN _userId UUID
)
BEGIN
    DELETE FROM user_metadata
    WHERE user_metadata.userId = _userId;
END$$


/*
    Summary:
        Retrieves user information based on a refresh token.
    Params:
        (IN) _refreshToken: The refresh token associated with the user.
*/
CREATE PROCEDURE IF NOT EXISTS getUserByRefreshToken(
    IN _refreshToken VARCHAR(512)
)
BEGIN
    SELECT u.*
    FROM user u
    INNER JOIN user_metadata um ON u.userId = um.userId
    WHERE um.refreshToken = _refreshToken;
END$$

DELIMITER ;

