CREATE DATABASE IF NOT EXISTS gameworld;
USE gameworld;

CREATE TABLE IF NOT EXISTS VideoGame (
    release_date DATE,
    genre VARCHAR(50),
    title VARCHAR(50) NOT NULL,
    descr_s TEXT,
    descr_l TEXT,
    rating DECIMAL(2, 1) CHECK (rating > 0),
    id SERIAL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS PC (
    id SERIAL,
    op_sys VARCHAR(100),
    gpu_min VARCHAR(50),
    cpu_min VARCHAR(50),
    ram_min VARCHAR(50),
    gpu_max VARCHAR(50),
    cpu_max VARCHAR(50),
    ram_max VARCHAR(50),
    disk_size VARCHAR(50),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Console (
    id SERIAL,
    release_date DATE,
    title VARCHAR(50),
    manufacturer VARCHAR(50),
    descr VARCHAR(250),
    PRIMARY KEY(id)
);

-- Renamed from Platform.
CREATE TABLE IF NOT EXISTS Requirement (
    game_id BIGINT UNSIGNED,
    pc_id BIGINT UNSIGNED,
    console_id BIGINT UNSIGNED,
    FOREIGN KEY(game_id) REFERENCES VideoGame(id),
    CONSTRAINT CHECK (pc_id IS NOT NULL OR console_id IS NOT NULL),
    FOREIGN KEY(pc_id) REFERENCES PC(id),
    FOREIGN KEY(console_id) REFERENCES Console(id)
);

CREATE TABLE IF NOT EXISTS User (
    id SERIAL NOT NULL,
    join_date DATETIME,
    username VARCHAR(50) NOT NULL,
    display_name VARCHAR(50),
    email VARCHAR(50),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS UserGameLibrary (
    user_id BIGINT UNSIGNED,
    game_id BIGINT UNSIGNED,
    FOREIGN KEY(user_id)
        REFERENCES User(id),
    FOREIGN KEY(game_id)
        REFERENCES VideoGame(id)
);

CREATE TABLE IF NOT EXISTS UserGameReview (
    user_id BIGINT UNSIGNED,
    game_id BIGINT UNSIGNED,
    review TEXT(1000),
    score TINYINT UNSIGNED 
        CHECK (score <= 10),
    FOREIGN KEY(user_id)
        REFERENCES User(id),
    FOREIGN KEY(game_id)
        REFERENCES VideoGame(id)
);

CREATE TABLE IF NOT EXISTS UserProfile (
    user_id BIGINT UNSIGNED,
    realname VARCHAR(50),
    realname_visibility ENUM('public', 'friends', 'private'),
    picture BLOB,
    picture_visibility ENUM('public', 'friends', 'private'),
    FOREIGN KEY(user_id)
        REFERENCES User(id)
);

CREATE TABLE IF NOT EXISTS MarketActor (
    id SERIAL,
    ma_name VARCHAR(50),
    link VARCHAR(100),
    founded_date DATE,
    descr VARCHAR(250),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Publisher (
    ma_id BIGINT UNSIGNED,
    game_id BIGINT UNSIGNED,
    FOREIGN KEY(ma_id) REFERENCES MarketActor(id),
    FOREIGN KEY(game_id) REFERENCES VideoGame(id)
);

CREATE TABLE IF NOT EXISTS Developer (
    ma_id BIGINT UNSIGNED,
    game_id BIGINT UNSIGNED,
    FOREIGN KEY(ma_id) REFERENCES MarketActor(id),
    FOREIGN KEY(game_id) REFERENCES VideoGame(id)
);

CREATE TABLE IF NOT EXISTS StorePage (
    game_id SERIAL,
    price DECIMAL,
    link VARCHAR(100),
    FOREIGN KEY(game_id) REFERENCES VideoGame(id)
);