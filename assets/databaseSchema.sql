create database TestProjectPhp;
use TestProjectPhp;
create schema userInfo;


create table userInfo.types(
    id int primary key,
    typeName varchar(255)
);


create table userInfo.users (
    id int AUTO_INCREMENT primary key,
    fname varchar(255) CHARACTER SET utf8mb4 not null,
    lname varchar(255) CHARACTER SET utf8mb4 not null,
    phoneNum varchar(11) not null,
    email varchar(255) not null unique ,
    userType int foreign key references userInfo.types(id),
    password varchar(255) not null,
    urlToPhoto varchar(255) default NULL,
    constraint UniqueName unique (fname, lname)
);



create schema posts;
create table posts.postTypes(
    id int primary key,
    typeName varchar(255)
);
create table posts.post(
    postId int AUTO_INCREMENT primary key,
    title varchar(255) CHARACTER SET utf8mb4,
    body varchar(1024) CHARACTER SET utf8mb4,
    creationTime  DATE DEFAULT CURRENT_DATE,
    postType int foreign key references posts.post(id);
    numViews int default(0),
    urlToPhoto varchar(255) default NULL,
    likesNum int default(0),
    commentNum int default(0),
    ownerId int foreign key references users(id),
);

create table posts.comments(
    postId int foreign key references posts.post(postId),
    userId int foreign key references users(id),
    comment varchar(1024) not null,
);

create table posts.savedPost(
    postId int foreign key references posts.post(postId),
    userId int foreign key references users(id)
    primary key (userId,postId)
);
