BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS bugs (
    bug_id INTEGER PRIMARY KEY,
    project_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    description TEXT,
    status TEXT NOT NULL,
    priority TEXT NOT NULL,
    created_at TEXT NOT NULL,

    FOREIGN KEY (project_id)
        REFERENCES projects(project_id),

    FOREIGN KEY (author_id)
        REFERENCES users(user_id)
);
CREATE TABLE IF NOT EXISTS comments (
    comment_id INTEGER PRIMARY KEY,
    bug_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    text TEXT NOT NULL,
    created_at TEXT NOT NULL,

    FOREIGN KEY (bug_id)
        REFERENCES bugs(bug_id),

    FOREIGN KEY (user_id)
        REFERENCES users(user_id)
);
CREATE TABLE IF NOT EXISTS projects (
    project_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    status TEXT NOT NULL,
    created_at TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS users (
    user_id INTEGER PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    role TEXT NOT NULL
);
INSERT INTO "bugs" ("bug_id","project_id","author_id","title","description","status","priority","created_at") VALUES (1,1,2,'Character disappears after loading','Character becomes invisible after loading a save.','Открыт','Высокий','2026-06-05'),
 (2,2,5,'Oxygen counter shows wrong value','Oxygen counter sometimes displays an incorrect value.','В работе','Высокий','2026-06-06'),
 (3,3,7,'NPC gets stuck near the door','NPC cannot find a path around the door.','Исправлен','Средний','2026-06-07'),
 (4,4,10,'Dragon animation freezes','Dragon animation freezes during the attack.','Открыт','Критический','2026-06-08'),
 (5,5,12,'Seeds cannot be planted','The player cannot plant seeds on some tiles.','Открыт','Высокий','2026-06-09'),
 (6,6,15,'Matchmaking takes too long','Players wait more than five minutes for a match.','В работе','Средний','2026-06-10'),
 (7,7,17,'Card effect does not activate','The special effect of one card does not activate.','Исправлен','Высокий','2026-06-11'),
 (8,8,2,'Player gets stuck underwater','Player movement stops near underwater rocks.','Открыт','Средний','2026-06-12'),
 (9,9,5,'Factory production stops','Production stops after changing the work schedule.','В работе','Высокий','2026-06-13'),
 (10,10,7,'Castle wall texture is missing','One of the castle wall textures is missing.','Исправлен','Низкий','2026-06-14'),
 (11,11,10,'Score resets after restart','Player score resets after restarting the game.','Открыт','Высокий','2026-06-15'),
 (12,12,12,'Station lights flicker','Several lights flicker unexpectedly.','В работе','Низкий','2026-06-16'),
 (13,13,15,'Horse disappears from stable','The horse disappears after entering the stable.','Открыт','Средний','2026-06-17'),
 (14,14,17,'Spell button does not respond','Spell button stops responding after opening inventory.','Открыт','Высокий','2026-06-18'),
 (15,15,2,'Sound disappears in forest','Background sound disappears after entering the forest.','Исправлен','Средний','2026-06-19'),
 (16,16,5,'Robot falls through floor','Robot falls through the floor in the arena.','Критический','Критический','2026-06-20'),
 (17,17,7,'Room price is calculated incorrectly','The hotel room price is sometimes incorrect.','Исправлен','Средний','2026-06-21'),
 (18,18,10,'Island disappears after teleport','One of the islands disappears after teleportation.','Открыт','Высокий','2026-06-22');
INSERT INTO "comments" ("comment_id","bug_id","user_id","text","created_at") VALUES (1,1,1,'I will investigate the loading system.','2026-06-05'),
 (2,2,3,'The problem may be related to the oxygen calculation.','2026-06-06'),
 (3,3,6,'I reproduced this issue on the latest build.','2026-06-07'),
 (4,4,8,'The animation controller needs to be checked.','2026-06-08'),
 (5,5,11,'I found the same issue on two different maps.','2026-06-09'),
 (6,6,13,'We should check the matchmaking server.','2026-06-10'),
 (7,7,16,'The card effect works correctly in the previous build.','2026-06-11'),
 (8,8,18,'I will check the collision settings.','2026-06-12'),
 (9,9,1,'The production system may not update the schedule correctly.','2026-06-13'),
 (10,10,3,'The texture reference is missing from the asset.','2026-06-14'),
 (11,11,6,'I managed to reproduce this issue.','2026-06-15'),
 (12,12,8,'The lighting settings were recently changed.','2026-06-16'),
 (13,13,11,'The horse is still present in the save file.','2026-06-17'),
 (14,14,13,'The inventory seems to block the input.','2026-06-18'),
 (15,15,16,'This happens only in the forest location.','2026-06-19'),
 (16,16,18,'This is a critical physics issue.','2026-06-20'),
 (17,17,4,'The price calculation should be reviewed.','2026-06-21'),
 (18,18,9,'I will test teleportation on other islands.','2026-06-22');
INSERT INTO "projects" ("project_id","name","description","status","created_at") VALUES (1,'Dark Forest','Fantasy adventure game','В разработке','2026-01-15'),
 (2,'Space Colony','Space survival simulator','В разработке','2026-01-20'),
 (3,'City Life','Urban life simulation','Завершён','2025-11-10'),
 (4,'Dragon Quest','Fantasy RPG about dragons','В разработке','2026-02-01'),
 (5,'Pixel Farm','Pixel farming simulator','В разработке','2026-02-12'),
 (6,'Cyber Arena','Competitive action game','Тестирование','2026-03-05'),
 (7,'Mystic Cards','Fantasy card game','В разработке','2026-03-14'),
 (8,'Ocean Explorer','Underwater exploration game','В разработке','2026-03-20'),
 (9,'Robot Factory','Factory management simulator','Тестирование','2026-04-01'),
 (10,'Castle Builder','Medieval construction simulator','В разработке','2026-04-10'),
 (11,'Neon Runner','Arcade running game','Завершён','2025-10-15'),
 (12,'Moon Station','Science fiction management game','В разработке','2026-04-20'),
 (13,'Wild West','Western adventure game','Тестирование','2026-05-01'),
 (14,'Magic Academy','School of magic simulator','В разработке','2026-05-08'),
 (15,'Forest Spirits','Atmospheric exploration game','В разработке','2026-05-15'),
 (16,'Battle Robots','Multiplayer robot game','В разработке','2026-05-20'),
 (17,'Dream Hotel','Hotel management simulator','Завершён','2025-09-12'),
 (18,'Sky Islands','Adventure game on floating islands','В разработке','2026-06-01');
INSERT INTO "users" ("user_id","username","email","role") VALUES (1,'alex_dev','alex@example.com','Разработчик'),
 (2,'maria_test','maria@example.com','Тестировщик'),
 (3,'ivan_dev','ivan@example.com','Разработчик'),
 (4,'anna_pm','anna@example.com','Менеджер'),
 (5,'max_test','max@example.com','Тестировщик'),
 (6,'olga_dev','olga@example.com','Разработчик'),
 (7,'daniel_test','daniel@example.com','Тестировщик'),
 (8,'kate_dev','kate@example.com','Разработчик'),
 (9,'nikita_pm','nikita@example.com','Менеджер'),
 (10,'sophie_test','sophie@example.com','Тестировщик'),
 (11,'roman_dev','roman@example.com','Разработчик'),
 (12,'elena_test','elena@example.com','Тестировщик'),
 (13,'pavel_dev','pavel@example.com','Разработчик'),
 (14,'victor_pm','victor@example.com','Менеджер'),
 (15,'lisa_test','lisa@example.com','Тестировщик'),
 (16,'mark_dev','mark@example.com','Разработчик'),
 (17,'julia_test','julia@example.com','Тестировщик'),
 (18,'sergey_dev','sergey@example.com','Разработчик');
COMMIT;
