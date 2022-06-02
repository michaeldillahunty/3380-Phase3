USE gameworld;

INSERT INTO VideoGame(release_date, genre, title, descr_s, rating) VALUES
    ('2000-06-29', 'Hack n Slash', 'Diablo II', 'Diablo II is an action role-playing hack-and-slash game developed by Blizzard North and published by Blizzard Entertainment.', 8.3),
    ('2007-10-10', 'Puzzle', 'Portal', 'Portal is a puzzle-platform game developed and published by Valve.', 9.0),
    ('1984-09-20', 'Simulator', 'Elite', 'Elite is a space flight simulator with trading, exploration, and combat.', 9.0),
    ('2010-11-24', 'Racing', 'Gran Turismo 5', 'Gran Turismo 5 is a racing simulator for the PS3.', 8.5);

INSERT INTO Console(release_date, title, manufacturer, descr) VALUES
    ('2006-10-17', 'PlayStation 3', 'Sony', 'The PlayStation 3 is the third PlayStation released by Sony.');

INSERT INTO PC(op_sys, gpu_min, cpu_min, ram_min, gpu_max, cpu_max, ram_max, disk_size) VALUES
    ('Windows or Mac', 'DirectX video card with 800 x 600 resolution', '1 GHz processor', '2 GB RAM', NULL, NULL, NULL, '2 GB hard drive space'),
    ('Windows or Mac', 'DirectX® 8.1 level Graphics Card', '1.7 GHz Processor', '512MB RAM', 'DirectX® 9 level Graphics Card', 'Pentium 4 processor (3.0GHz, or better)', '1GB RAM', '10 GB disk space'),
    ('BBC Micro', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO Requirement(game_id, pc_id, console_id) VALUES
    (1, 1, NULL),
    (2, 2, NULL),
    (3, 3, NULL),
    (4, NULL, 1);

INSERT INTO MarketActor(ma_name, link, founded_date, descr) VALUES
    ('Blizzard', 'https://www.blizzard.com/', '1991-02-01', 'Blizzard is a North American video game development studio.'),
    ('Frontier Developments', 'https://www.frontier.co.uk/', '1994-01-01', 'Frontier Developments is a British game dev studio.');

INSERT INTO Developer(ma_id, game_id) VALUES
    (1, 1),
    (2, 3);

INSERT INTO Publisher(ma_id, game_id) VALUES
    (1, 1),
    (2, 3);

INSERT INTO StorePage(game_id, price, link) VALUES
    (1, 9.99, 'https://us.shop.battle.net/en-us/product/diablo-ii'),
    (2, 9.99, 'https://store.steampowered.com/app/400/Portal/'),
    (4, NULL, 'https://www.gran-turismo.com/us/products/gt5/');

INSERT INTO User(join_date, username, display_name, email) VALUES
    (CURRENT_DATE(), 'default', 'default', NULL);

INSERT INTO UserProfile(user_id, realname, realname_visibility, picture, picture_visibility) VALUES
    (1, 'admin', 'private', NULL, 'private');

INSERT INTO UserGameLibrary(user_id, game_id) VALUES
    (1, 1);

INSERT INTO UserGameReview(user_id, game_id, review, score) VALUES
    (1, 1, 'The best game ever!', 10);