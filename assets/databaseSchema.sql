CREATE DATABASE TestProjectPhp;
USE TestProjectPhp;

CREATE SCHEMA userInfo;

CREATE TABLE userInfo.types (
    id INT PRIMARY KEY,
    typeName VARCHAR(255)
);

CREATE TABLE userInfo.users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fname VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL,
    lname VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL,
    phoneNum VARCHAR(11) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    userType INT,
    password VARCHAR(255) NOT NULL,
    urlToPhoto VARCHAR(255) DEFAULT NULL,
    CONSTRAINT UniqueName UNIQUE (fname, lname),
    FOREIGN KEY (userType) REFERENCES userInfo.types(id)
);



CREATE SCHEMA posts;

CREATE TABLE posts.postTypes (
    id INT PRIMARY KEY,
    typeName VARCHAR(255)
);

CREATE TABLE posts.post (
    postId INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) CHARACTER SET utf8mb4,
    body VARCHAR(1024) CHARACTER SET utf8mb4,
    creationTime DATE DEFAULT CURRENT_DATE,
    postType INT,
    numViews INT DEFAULT 0,
    urlToPhoto VARCHAR(255) DEFAULT NULL,
    likesNum INT DEFAULT 0,
    commentNum INT DEFAULT 0,
    ownerId INT,
    FOREIGN KEY (postType) REFERENCES posts.postTypes(id),
    FOREIGN KEY (ownerId) REFERENCES userInfo.users(id)
);

CREATE TABLE posts.comments (
    postId INT,
    userId INT,
    comment VARCHAR(1024) NOT NULL,
    FOREIGN KEY (postId) REFERENCES posts.post(postId),
    FOREIGN KEY (userId) REFERENCES userInfo.users(id)
);

CREATE TABLE posts.savedPost (
    postId INT,
    userId INT,
    FOREIGN KEY (postId) REFERENCES posts.post(postId),
    FOREIGN KEY (userId) REFERENCES userInfo.users(id),
    PRIMARY KEY (userId, postId)
);
CREATE TABLE posts.likes(
    postId INT,
    userId INT,
    FOREIGN KEY (postId) REFERENCES posts.post(postId),
    FOREIGN KEY (userId) REFERENCES userInfo.users(id),
    PRIMARY KEY (userId, postId)
);
