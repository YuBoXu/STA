CREATE TABLE test
(
    username VARCHAR(45),
    password VARCHAR(45),
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT
);
CREATE UNIQUE INDEX unique_ID ON test (ID);
