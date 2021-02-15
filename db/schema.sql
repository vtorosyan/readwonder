CREATE DATABASE IF NOT EXISTS `readwonder`;
USE `readwonder`;

DROP TABLE IF EXISTS `readwonder`.`books`;
CREATE TABLE IF NOT EXISTS `readwonder`.`books`
(
    id          BIGINT       NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(256) NOT NULL,
    description TEXT,
    pages       INT                   DEFAULT NULL,
    updated_at  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_at  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS `readwonder`.`creators`;
CREATE TABLE IF NOT EXISTS `readwonder`.`creators`
(
    id         BIGINT    NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(256),
    last_name  VARCHAR(256),
    birthday   DATE               DEFAULT NULL,
    story      TEXT,
    website    VARCHAR(256),
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS `readwonder`.`shelfs`;
CREATE TABLE IF NOT EXISTS `readwonder`.`shelfs`
(
    id         BIGINT    NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title      VARCHAR(256),
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS `readwonder`.`shelfs_books`;
CREATE TABLE IF NOT EXISTS `readwonder`.`shelfs_books`
(
    book_id  BIGINT NOT NULL,
    shelf_id BIGINT NOT NULL,
    PRIMARY KEY (`book_id`, `shelf_id`),
    FOREIGN KEY (book_id) REFERENCES books (id),
    FOREIGN KEY (shelf_id) REFERENCES shelfs (id)
);

DROP TABLE IF EXISTS `readwonder`.`creators_books`;
CREATE TABLE IF NOT EXISTS `readwonder`.`creators_books`
(
    book_id    BIGINT  NOT NULL,
    creator_id BIGINT  NOT NULL,
    role       TINYINT NOT NULL,
    PRIMARY KEY (`book_id`, `creator_id`),
    FOREIGN KEY (book_id) REFERENCES books (id),
    FOREIGN KEY (creator_id) REFERENCES creators (id)
);
