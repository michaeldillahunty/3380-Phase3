USE gameworld;

-- Get counts of games by year
SELECT YEAR(release_date) as yr, COUNT(*) FROM videogame vg
GROUP BY yr
ORDER BY yr asc;

-- Add a game to a user
INSERT INTO usergamelibrary(user_id, game_id) VALUES
    (1, 4);

-- See user 1's games
SELECT game_id, title
FROM videogame vg JOIN usergamelibrary ugl
ON ugl.game_id = vg.id
WHERE ugl.user_id = 1
GROUP BY game_id;

-- See user 1's reviews
SELECT game_id, title, review, score
FROM videogame vg JOIN usergamereview ugr
ON ugr.game_id = vg.id
JOIN user u
ON ugr.user_id = u.id;

-- User 1 insert review
INSERT INTO UserGameReview(user_id, game_id, review, score) VALUES
    (1, 4, 'It was alright.', 6);

-- User 1 modifies their review
UPDATE usergamereview ugr SET ugr.score = 7 WHERE ugr.game_id = 4;

-- User 1 deletes their review
DELETE FROM usergamereview ugr WHERE ugr.game_id = 4;