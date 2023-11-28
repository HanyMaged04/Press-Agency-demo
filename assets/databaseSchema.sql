CREATE DATABASE TestProjectPhp;
USE TestProjectPhp;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(255) NOT NULL,
    fname VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL,
    lname VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL,
    phoneNum VARCHAR(11) NOT NULL,
    email email NOT NULL UNIQUE,
    userType INT,
    password VARCHAR(255) NOT NULL,
    urlToPhoto VARCHAR(255) DEFAULT NULL,
    CONSTRAINT UniqueName UNIQUE (fname, lname)
);


CREATE TABLE postTypes (
    id INT PRIMARY KEY,
    typeName VARCHAR(255)
);

CREATE TABLE post (
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
    FOREIGN KEY (postType) REFERENCES  postTypes(id),
    FOREIGN KEY (ownerId) REFERENCES  users(id)
);

CREATE TABLE comments (
    postId INT,
    userId INT,
    comment VARCHAR(1024) NOT NULL,
    FOREIGN KEY (postId) REFERENCES  post(postId),
    FOREIGN KEY (userId) REFERENCES  users(id)
);

CREATE TABLE savedPost (
    postId INT,
    userId INT,
    FOREIGN KEY (postId) REFERENCES  post(postId),
    FOREIGN KEY (userId) REFERENCES  users(id),
    PRIMARY KEY (userId, postId)
);
CREATE TABLE likes(
    postId INT,
    userId INT,
    FOREIGN KEY (postId) REFERENCES  post(postId),
    FOREIGN KEY (userId) REFERENCES  users(id),
    PRIMARY KEY (userId, postId)
);
