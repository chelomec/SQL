CREATE DATABASE videogamesdb;

use videogamesdb;

-- Table for Publishers
CREATE TABLE Publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);
-- Table for Age Categories
CREATE TABLE AgeCategory (
    age_category_id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(50) NOT NULL UNIQUE
);
-- Table for Company
CREATE TABLE Company (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);
-- Table for Genres
CREATE TABLE Genre (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);
-- Table for Games
CREATE TABLE Games (
    game_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publisher_id INT,
    genre_id INT,
    age_category_id INT,
    FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id) ON DELETE SET NULL,
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id) ON DELETE SET NULL,
    FOREIGN KEY (age_category_id) REFERENCES AgeCategory(age_category_id) ON DELETE SET NULL
);
-- Table for Platforms
CREATE TABLE Platform (
    platform_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES Company(company_id) ON DELETE SET NULL
);
CREATE TABLE Game_Platform (
    game_id INT,
    platform_id INT,
    platform_game_id INT AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (game_id) REFERENCES Games(game_id) ON DELETE CASCADE,
    FOREIGN KEY (platform_id) REFERENCES Platform(platform_id) ON DELETE CASCADE
);
-- Table for Reviews
CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    game_id INT,
    rating DECIMAL(3,1) CHECK (rating BETWEEN 0 AND 10),
    comment TEXT,
    reviewer_name VARCHAR(100),
    FOREIGN KEY (game_id) REFERENCES Games(game_id) ON DELETE CASCADE
);

-- Insert sample data into Publisher table
INSERT INTO Publisher (name) VALUES
('Ubisoft'),
('Rockstar Games'),
('Electronic Arts'),
('Nintendo'),
('Sony Interactive Entertainment'),
('Microsoft Studios'),
('Square Enix');
-- Insert sample data into AgeCategory table
INSERT INTO AgeCategory (category) VALUES
('E'),
('E+10'),
('T'),
('M'),
('A');
-- Insert sample data into Genre table
INSERT INTO Genre (name) VALUES
('Action'),
('Adventures'),
('Platform'),
('Shooter'),
('RPG'),
('Fighting'),
('Beat em up'),
('Terror'),
('Sports'),
('Battle Royale'),
('Puzzle'),
('Simulation'),
('Rhythm');
-- Insert sample data into Company table
INSERT INTO Company (name) VALUES 
('Sony'),
('Microsoft'),
('Nintendo'),
('Valve'),
('Google'),
('Amazon'),
('Meta'),
('Sega'),
('Atari'),
('SNK'),
('Commodore'),
('Apple');
-- Insert sample data into Platform table
INSERT INTO Platform (name, company_id) VALUES 
('PlayStation 5', (SELECT company_id FROM Company WHERE name = 'Sony')),
('Xbox Series X', (SELECT company_id FROM Company WHERE name = 'Microsoft')),
('Nintendo Switch', (SELECT company_id FROM Company WHERE name = 'Nintendo')),
('PC', NULL),
('Steam Deck', (SELECT company_id FROM Company WHERE name = 'Valve')),
('PlayStation 4', (SELECT company_id FROM Company WHERE name = 'Sony')),
('Xbox One', (SELECT company_id FROM Company WHERE name = 'Microsoft')),
('Google Stadia', (SELECT company_id FROM Company WHERE name = 'Google')),
('Amazon Luna', (SELECT company_id FROM Company WHERE name = 'Amazon')),
('Meta Quest 2', (SELECT company_id FROM Company WHERE name = 'Meta')),
('PlayStation 3', (SELECT company_id FROM Company WHERE name = 'Sony')),
('Xbox 360', (SELECT company_id FROM Company WHERE name = 'Microsoft')),
('Nintendo Wii', (SELECT company_id FROM Company WHERE name = 'Nintendo')),
('Nintendo Wii U', (SELECT company_id FROM Company WHERE name = 'Nintendo')),
('PlayStation 2', (SELECT company_id FROM Company WHERE name = 'Sony')),
('Xbox', (SELECT company_id FROM Company WHERE name = 'Microsoft')),
('Nintendo GameCube', (SELECT company_id FROM Company WHERE name = 'Nintendo')),
('Sega Dreamcast', (SELECT company_id FROM Company WHERE name = 'Sega')),
('PlayStation', (SELECT company_id FROM Company WHERE name = 'Sony')),
('Nintendo 64', (SELECT company_id FROM Company WHERE name = 'Nintendo')),
('Super Nintendo Entertainment System (SNES)', (SELECT company_id FROM Company WHERE name = 'Nintendo')),
('Nintendo Entertainment System (NES)', (SELECT company_id FROM Company WHERE name = 'Nintendo')),
('Sega Genesis', (SELECT company_id FROM Company WHERE name = 'Sega')),
('Sega Saturn', (SELECT company_id FROM Company WHERE name = 'Sega')),
('Game Boy', (SELECT company_id FROM Company WHERE name = 'Nintendo')),
('Game Boy Color', (SELECT company_id FROM Company WHERE name = 'Nintendo')),
('Game Boy Advance', (SELECT company_id FROM Company WHERE name = 'Nintendo')),
('Nintendo DS', (SELECT company_id FROM Company WHERE name = 'Nintendo')),
('Nintendo 3DS', (SELECT company_id FROM Company WHERE name = 'Nintendo')),
('PlayStation Portable (PSP)', (SELECT company_id FROM Company WHERE name = 'Sony')),
('PlayStation Vita', (SELECT company_id FROM Company WHERE name = 'Sony')),
('Atari 2600', (SELECT company_id FROM Company WHERE name = 'Atari')),
('Atari 7800', (SELECT company_id FROM Company WHERE name = 'Atari')),
('Neo Geo', (SELECT company_id FROM Company WHERE name = 'SNK')),
('TurboGrafx-16', (SELECT company_id FROM Company WHERE name = 'Commodore')),
('Commodore 64', (SELECT company_id FROM Company WHERE name = 'Commodore')),
('MS-DOS', NULL),
('Apple II', (SELECT company_id FROM Company WHERE name = 'Apple'));
-- Insert sample data into Games table
INSERT INTO Games (title, publisher_id, genre_id, age_category_id) VALUES
('Super Mario Bros.', 5, 12, 2),
('The Legend of Zelda', 2, 4, 2),
('Halo', 4, 5, 4),
('The Last of Us', 5, 11, 2),
('Grand Theft Auto V', 4, 4, 5),
('Call of Duty: Modern Warfare', 1, 5, 4),
('FIFA 23', 2, 5, 4),
('Final Fantasy VII', 5, 4, 5),
('Resident Evil 4', 3, 12, 3),
('Minecraft', 6, 6, 3),
('Cyberpunk 2077', 2, 4, 3),
('Red Dead Redemption 2', 2, 1, 1),
('God of War', 2, 10, 5),
('Street Fighter V', 3, 12, 3),
('Tekken 7', 5, 5, 5),
('Fortnite', 2, 6, 1),
('PUBG', 5, 7, 1),
('Tetris', 3, 6, 4),
('The Sims 4', 2, 3, 1),
('Guitar Hero', 6, 3, 1),
('Dark Souls III', 2, 10, 4),
('Bloodborne', 7, 9, 3),
('Metal Gear Solid V', 1, 9, 4),
('Assassin\'s Creed Valhalla', 4, 13, 4),
('Splatoon 3', 2, 13, 2),
('Elden Ring', 3, 13, 3),
('Doom Eternal', 2, 1, 1),
('Overwatch 2', 5, 4, 4),
('Battlefield 2042', 2, 9, 4),
('StarCraft II', 7, 6, 5),
('World of Warcraft', 1, 12, 5),
('Diablo IV', 1, 11, 5),
('League of Legends', 2, 8, 3),
('Dota 2', 6, 7, 4),
('Among Us', 3, 10, 2),
('Hollow Knight', 5, 9, 3),
('Celeste', 2, 12, 3),
('Metroid Dread', 6, 4, 2),
('Animal Crossing: New Horizons', 2, 13, 1),
('Pikmin 4', 7, 9, 2),
('Bayonetta 3', 5, 10, 4),
('Dragon Quest XI', 1, 11, 3),
('Persona 5', 3, 12, 3),
('Monster Hunter Rise', 4, 7, 4),
('Xenoblade Chronicles 3', 2, 9, 3),
('Kirby and the Forgotten Land', 6, 13, 2),
('Fire Emblem Engage', 5, 12, 3),
('Super Smash Bros. Ultimate', 2, 5, 3),
('Fall Guys', 1, 8, 2),
('Dead Space Remake', 4, 11, 5),
('Horizon Forbidden West', 3, 4, 3),
('Ghost of Tsushima', 2, 4, 4),
('Sekiro: Shadows Die Twice', 5, 10, 4),
('Marvel\'s Spider-Man', 6, 6, 3),
('Returnal', 4, 5, 4),
('Death Stranding', 1, 9, 4),
('Control', 3, 10, 3),
('Yakuza: Like a Dragon', 7, 8, 3),
('Octopath Traveler', 5, 11, 3),
('Bravely Default II', 2, 12, 3),
('Triangle Strategy', 3, 10, 2),
('Catherine: Full Body', 6, 13, 4),
('The Outer Worlds', 4, 9, 3),
('No Man\'s Sky', 7, 6, 3),
('Subnautica', 5, 13, 2),
('Terraria', 2, 6, 2),
('Stardew Valley', 3, 13, 1),
('Cuphead', 7, 8, 3),
('Ori and the Blind Forest', 6, 12, 2),
('Donkey Kong Country', 1, 12, 2),
('Luigi\'s Mansion 3', 5, 12, 2),
('Crash Bandicoot 4', 4, 12, 3),
('Spyro Reignited Trilogy', 6, 12, 2),
('Ratchet & Clank: Rift Apart', 3, 6, 3),
('Little Nightmares II', 7, 11, 3),
('Inside', 2, 10, 2),
('Limbo', 1, 10, 2),
('Hades', 3, 8, 3),
('Disco Elysium', 7, 11, 4),
('Detroit: Become Human', 4, 11, 3),
('Heavy Rain', 2, 11, 4),
('Beyond: Two Souls', 1, 11, 4),
('Mass Effect Legendary Edition', 6, 9, 4),
('Dragon Age: Inquisition', 5, 9, 4),
('Skyrim', 2, 9, 5),
('Oblivion', 3, 9, 5),
('Morrowind', 4, 9, 5),
('Fallout 4', 7, 9, 4),
('Fallout: New Vegas', 5, 9, 4),
('The Evil Within', 2, 11, 5),
('Outlast', 6, 11, 5),
('Amnesia: The Dark Descent', 7, 11, 5),
('Five Nights at Freddy’s', 1, 11, 2),
('Baldur\'s Gate 3', 4, 9, 5),
('Starfield', 3, 9, 5),
('Alan Wake 2', 5, 11, 5),
('Hogwarts Legacy', 6, 9, 3),
('Pac-Man', 2, 13, 1),
('Silent Hill 2', 7, 11, 5), 	
('Metroid Prime', 6, 4, 3),
('The Binding of Isaac', 2, 11, 4),
('Banjo-Kazooie', 5, 12, 2),
('GoldenEye 007', 3, 5, 3),
('Left 4 Dead 2', 7, 5, 4),
('Portal 2', 4, 13, 2),
('Half-Life 2', 1, 4, 4),
('Team Fortress 2', 2, 5, 3),
('The Stanley Parable', 6, 10, 2),
('Monkey Island 2', 5, 10, 2),
('Grim Fandango', 7, 10, 2),
('Psychonauts 2', 3, 12, 3),
('Okami', 1, 12, 2),
('Journey', 4, 10, 2),
('Shadow of the Colossus', 3, 10, 3),
('ICO', 5, 10, 3),
('Papers, Please', 2, 13, 3),
('This War of Mine', 6, 13, 4),
('XCOM 2', 4, 9, 4),
('Civilization VI', 7, 13, 3),
('Total War: Three Kingdoms', 2, 9, 4),
('Europa Universalis IV', 5, 13, 4),
('Age of Empires IV', 3, 13, 3),
('Warhammer 40,000: Dawn of War', 1, 9, 4),
('The Banner Saga', 6, 9, 3),
('Divinity: Original Sin 2', 7, 9, 4),
('Star Wars: Knights of the Old Republic', 4, 9, 4),
('Star Wars Jedi: Fallen Order', 2, 4, 3),
('LEGO Star Wars: The Skywalker Saga', 3, 12, 2),
('Mario Kart 8 Deluxe', 5, 5, 2),
('F-Zero GX', 7, 5, 3),
('Need for Speed: Most Wanted', 6, 5, 3),
('Burnout Paradise', 4, 5, 3),
('Gran Turismo 7', 1, 5, 3),
('Forza Horizon 5', 2, 5, 3),
('SSX Tricky', 5, 5, 3),
('Tony Hawk’s Pro Skater 2', 6, 5, 3),
('Skate 3', 3, 5, 3),
('NBA 2K23', 7, 5, 2),
('Madden NFL 23', 4, 5, 2),
('MLB The Show 23', 1, 5, 2),
('NHL 23', 2, 5, 2),
('WWE 2K23', 3, 5, 3),
('F1 23', 5, 5, 3),
('Guilty Gear Strive', 7, 5, 4),
('BlazBlue: Central Fiction', 6, 5, 4),
('Mortal Kombat 11', 4, 5, 5),
('Killer Instinct', 1, 5, 4),
('Samurai Shodown', 2, 5, 4);
-- Insert sample data into Game_Platform table
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Super Mario Bros.' AND name IN ('Nintendo Entertainment System');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'The Legend of Zelda' AND name IN ('Nintendo Entertainment System');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Halo' AND name IN ('Xbox', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'The Last of Us' AND name IN ('PlayStation 3', 'PlayStation 4', 'PlayStation 5');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Grand Theft Auto V' AND name IN ('PC', 'PlayStation 3', 'PlayStation 4', 'PlayStation 5', 'Xbox 360', 'Xbox One', 'Xbox Series X');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Call of Duty: Modern Warfare' AND name IN ('PC', 'PlayStation 4', 'PlayStation 5', 'Xbox One', 'Xbox Series X');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'FIFA 23' AND name IN ('PC', 'PlayStation 4', 'PlayStation 5', 'Xbox One', 'Xbox Series X', 'Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Final Fantasy VII' AND name IN ('PlayStation');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Resident Evil 4' AND name IN ('PC', 'PlayStation 2', 'PlayStation 4', 'PlayStation 5', 'Xbox One', 'Xbox Series X', 'Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Minecraft' AND name IN ('PC', 'PlayStation 4', 'PlayStation 5', 'Xbox One', 'Xbox Series X', 'Nintendo Switch', 'Mobile');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Cyberpunk 2077' AND name IN ('PC', 'PlayStation 4', 'PlayStation 5', 'Xbox One', 'Xbox Series X');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Red Dead Redemption 2' AND name IN ('PC', 'PlayStation 4', 'Xbox One');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'God of War' AND name IN ('PlayStation 4', 'PlayStation 5', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Street Fighter V' AND name IN ('PC', 'PlayStation 4', 'PlayStation 5');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Tekken 7' AND name IN ('PC', 'PlayStation 4', 'Xbox One');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Fortnite' AND name IN ('PC', 'PlayStation 4', 'PlayStation 5', 'Xbox One', 'Xbox Series X', 'Nintendo Switch', 'Mobile');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'PUBG' AND name IN ('PC', 'PlayStation 4', 'Xbox One', 'Mobile');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Tetris' AND name IN ('Multiple Platforms');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'The Sims 4' AND name IN ('PC', 'PlayStation 4', 'Xbox One');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Guitar Hero' AND name IN ('PlayStation 2', 'Xbox 360', 'Wii');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Dark Souls III' AND name IN ('PC', 'PlayStation 4', 'Xbox One');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Bloodborne' AND name IN ('PlayStation 4');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Metal Gear Solid V' AND name IN ('PC', 'PlayStation 3', 'PlayStation 4', 'Xbox 360', 'Xbox One');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Assassin\'s Creed Valhalla' AND name IN ('PC', 'PlayStation 4', 'PlayStation 5', 'Xbox One', 'Xbox Series X');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Splatoon 3' AND name IN ('Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Elden Ring' AND name IN ('PC', 'PlayStation 4', 'PlayStation 5', 'Xbox One', 'Xbox Series X');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Doom Eternal' AND name IN ('PC', 'PlayStation 4', 'PlayStation 5', 'Xbox One', 'Xbox Series X', 'Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Overwatch 2' AND name IN ('PC', 'PlayStation 4', 'PlayStation 5', 'Xbox One', 'Xbox Series X', 'Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Battlefield 2042' AND name IN ('PC', 'PlayStation 4', 'PlayStation 5', 'Xbox One', 'Xbox Series X');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'StarCraft II' AND name IN ('PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'World of Warcraft' AND name IN ('PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Diablo IV' AND name IN ('PC', 'PlayStation 5', 'Xbox Series X');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'League of Legends' AND name IN ('PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Dota 2' AND name IN ('PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Among Us' AND name IN ('PC', 'Nintendo Switch', 'PlayStation 4', 'Xbox One');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Hollow Knight' AND name IN ('PC', 'Nintendo Switch', 'PlayStation 4', 'Xbox One');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Celeste' AND name IN ('PC', 'Nintendo Switch', 'PlayStation 4', 'Xbox One');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Metroid Dread' AND name IN ('Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Animal Crossing: New Horizons' AND name IN ('Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Pikmin 4' AND name IN ('Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Bayonetta 3' AND name IN ('Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Dragon Quest XI' AND name IN ('PC', 'Nintendo Switch', 'PlayStation 4', 'Xbox One');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Persona 5' AND name IN ('PlayStation 4', 'PlayStation 5', 'Nintendo Switch', 'PC', 'Xbox One', 'Xbox Series X');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Monster Hunter Rise' AND name IN ('PC', 'Nintendo Switch', 'PlayStation 4', 'Xbox One');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Xenoblade Chronicles 3' AND name IN ('Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Kirby and the Forgotten Land' AND name IN ('Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Fire Emblem Engage' AND name IN ('Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Super Smash Bros. Ultimate' AND name IN ('Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Fall Guys' AND name IN ('PC', 'Nintendo Switch', 'PlayStation 4', 'Xbox One');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Dead Space Remake' AND name IN ('PC', 'PlayStation 5', 'Xbox Series X');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Horizon Forbidden West' AND name IN ('PlayStation 4', 'PlayStation 5');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Ghost of Tsushima' AND name IN ('PlayStation 4', 'PlayStation 5');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Sekiro: Shadows Die Twice' AND name IN ('PC', 'PlayStation 4', 'Xbox One');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Marvel\'s Spider-Man' AND name IN ('PlayStation 4', 'PlayStation 5', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Returnal' AND name IN ('PlayStation 5', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Death Stranding' AND name IN ('PlayStation 4', 'PlayStation 5', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Control' AND name IN ('PC', 'PlayStation 4', 'PlayStation 5', 'Xbox One', 'Xbox Series X');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Yakuza: Like a Dragon' AND name IN ('PC', 'PlayStation 4', 'PlayStation 5', 'Xbox One', 'Xbox Series X');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Octopath Traveler' AND name IN ('PC', 'Nintendo Switch', 'Xbox One');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Bravely Default II' AND name IN ('PC', 'Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Triangle Strategy' AND name IN ('PC', 'Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Catherine: Full Body' AND name IN ('PC', 'PlayStation 4', 'Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'The Outer Worlds' AND name IN ('PC', 'PlayStation 4', 'Xbox One', 'Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'No Man\'s Sky' AND name IN ('PC', 'PlayStation 4', 'PlayStation 5', 'Xbox One', 'Xbox Series X', 'Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Subnautica' AND name IN ('PC', 'PlayStation 4', 'PlayStation 5', 'Xbox One', 'Xbox Series X', 'Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Terraria' AND name IN ('PlayStation 4', 'Xbox One');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Stardew Valley' AND name IN ('Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Cuphead' AND name IN ('Xbox One', 'Nintendo Switch', 'PlayStation 4');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Ori and the Blind Forest' AND name IN ('Nintendo Switch', 'Xbox One');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Donkey Kong Country' AND name IN ('Super Nintendo Entertainment System', 'Game Boy Advance');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Luigi\'s Mansion 3' AND name IN ('Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Crash Bandicoot 4' AND name IN ('PlayStation 4', 'Xbox One', 'Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Spyro Reignited Trilogy' AND name IN ('PlayStation 4', 'Xbox One');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Ratchet & Clank: Rift Apart' AND name IN ('PlayStation 5');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Little Nightmares II' AND name IN ('PlayStation 4', 'Xbox One', 'Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Inside' AND name IN ('PlayStation 4', 'Xbox One');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Limbo' AND name IN ('PlayStation 4', 'Xbox One');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Hades' AND name IN ('PlayStation 4', 'Nintendo Switch', 'Xbox One');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Disco Elysium' AND name IN ('PlayStation 4', 'Xbox One', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Detroit: Become Human' AND name IN ('PlayStation 4', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Heavy Rain' AND name IN ('PlayStation 4', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Beyond: Two Souls' AND name IN ('PlayStation 4', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Mass Effect Legendary Edition' AND name IN ('PlayStation 4', 'Xbox One');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Dragon Age: Inquisition' AND name IN ('PlayStation 4', 'Xbox One');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Skyrim' AND name IN ('PlayStation 4', 'Xbox One', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Oblivion' AND name IN ('Xbox 360', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Morrowind' AND name IN ('Xbox', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Fallout 4' AND name IN ('PlayStation 4', 'Xbox One', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Fallout: New Vegas' AND name IN ('PlayStation 3', 'Xbox 360', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'The Evil Within' AND name IN ('PlayStation 4', 'Xbox One', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Outlast' AND name IN ('PlayStation 4', 'Xbox One', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Amnesia: The Dark Descent' AND name IN ('PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Five Nights at Freddy’s' AND name IN ('PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Baldur\'s Gate 3' AND name IN ('PC', 'PlayStation 5');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Starfield' AND name IN ('PC', 'Xbox Series X');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Alan Wake 2' AND name IN ('PC', 'PlayStation 5', 'Xbox Series X');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Hogwarts Legacy' AND name IN ('PC', 'PlayStation 5', 'Xbox Series X', 'Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Pac-Man' AND name IN ('PC', 'PlayStation 5', 'Xbox Series X', 'Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Silent Hill 2' AND name IN ('PC', 'PlayStation 5');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Metroid Prime' AND name IN ('Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'The Binding of Isaac' AND name IN ('PC', 'PlayStation 5', 'Xbox Series X', 'Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Banjo-Kazooie' AND name IN ('Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'GoldenEye 007' AND name IN ('Nintendo Switch', 'Xbox Series X');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Left 4 Dead 2' AND name IN ('PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Portal 2' AND name IN ('PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Half-Life 2' AND name IN ('PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Team Fortress 2' AND name IN ('PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'The Stanley Parable' AND name IN ('PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Monkey Island 2' AND name IN ('PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Grim Fandango' AND name IN ('PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Psychonauts 2' AND name IN ('PC', 'PlayStation 5', 'Xbox Series X');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Okami' AND name IN ('Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Journey' AND name IN ('PlayStation 5');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Shadow of the Colossus' AND name IN ('PlayStation 5');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'ICO' AND name IN ('PlayStation 5');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Papers, Please' AND name IN ('PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'This War of Mine' AND name IN ('PC', 'Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'XCOM 2' AND name IN ('PC', 'PlayStation 5', 'Xbox Series X', 'Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Civilization VI' AND name IN ('PC', 'PlayStation 5', 'Xbox Series X', 'Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Total War: Three Kingdoms' AND name IN ('PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Europa Universalis IV' AND name IN ('PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Age of Empires IV' AND name IN ('PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Warhammer 40,000: Dawn of War' AND name IN ('PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'The Banner Saga' AND name IN ('PC', 'Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Divinity: Original Sin 2' AND name IN ('PC', 'PlayStation 5', 'Xbox Series X', 'Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Star Wars: Knights of the Old Republic' AND name IN ('PC', 'Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Star Wars Jedi: Fallen Order' AND name IN ('PC', 'PlayStation 5', 'Xbox Series X');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'LEGO Star Wars: The Skywalker Saga' AND name IN ('PC', 'PlayStation 5', 'Xbox Series X', 'Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Mario Kart 8 Deluxe' AND name IN ('Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'F-Zero GX' AND name IN ('Nintendo GameCube');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Need for Speed: Most Wanted' AND name IN ('PlayStation 2', 'Xbox', 'GameCube', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Burnout Paradise' AND name IN ('PlayStation 3', 'Xbox 360', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Gran Turismo 7' AND name IN ('PlayStation 5', 'PlayStation 4');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Forza Horizon 5' AND name IN ('Xbox Series X', 'Xbox One', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'SSX Tricky' AND name IN ('PlayStation 2', 'Xbox', 'GameCube');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Tony Hawk’s Pro Skater 2' AND name IN ('PlayStation', 'Nintendo 64', 'Dreamcast', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Skate 3' AND name IN ('PlayStation 3', 'Xbox 360');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'NBA 2K23' AND name IN ('PlayStation 5', 'Xbox Series X', 'Nintendo Switch', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Madden NFL 23' AND name IN ('PlayStation 5', 'Xbox Series X', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'MLB The Show 23' AND name IN ('PlayStation 5', 'Xbox Series X', 'Nintendo Switch');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'NHL 23' AND name IN ('PlayStation 5', 'Xbox Series X');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'WWE 2K23' AND name IN ('PlayStation 5', 'Xbox Series X', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'F1 23' AND name IN ('PlayStation 5', 'Xbox Series X', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Guilty Gear Strive' AND name IN ('PlayStation 5', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'BlazBlue: Central Fiction' AND name IN ('PlayStation 4', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Mortal Kombat 11' AND name IN ('PlayStation 5', 'Xbox Series X', 'Nintendo Switch', 'PC');
INSERT INTO Game_Platform (game_id, platform_id) SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Killer Instinct' AND name IN ('Xbox One', 'PC');
INSERT INTO Game_Platform (game_id, platform_id)SELECT game_id, platform_id FROM Games, Platform WHERE title = 'Samurai Shodown' AND name IN ('PlayStation 4', 'Xbox Series X', 'Nintendo Switch', 'PC');
-- Insert sample data into Reviews table
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.5, 'Un clásico atemporal que definió el género de plataformas.', 'GameSpot' FROM Games WHERE title = 'Super Mario Bros.';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.8, 'Una aventura épica que sentó las bases del género RPG de acción.', 'IGN' FROM Games WHERE title = 'The Legend of Zelda';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.7, 'Un shooter revolucionario con mecánicas y narrativa impactantes.', 'Polygon' FROM Games WHERE title = 'Halo';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.5, 'Una obra maestra narrativa con personajes memorables.', 'Eurogamer' FROM Games WHERE title = 'The Last of Us';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.9, 'Un mundo abierto vibrante con infinitas posibilidades.', 'Kotaku' FROM Games WHERE title = 'Grand Theft Auto V';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.5, 'Una experiencia intensa con acción y realismo militar.', 'Game Informer' FROM Games WHERE title = 'Call of Duty: Modern Warfare';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.0, 'Un simulador de fútbol sólido con mejoras iterativas.', 'IGN' FROM Games WHERE title = 'FIFA 23';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.7, 'Una historia inolvidable con un sistema de combate legendario.', 'GameSpot' FROM Games WHERE title = 'Final Fantasy VII';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.3, 'Un survival horror reinventado con jugabilidad impecable.', 'Destructoid' FROM Games WHERE title = 'Resident Evil 4';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.5, 'Un fenómeno cultural que fomenta la creatividad y exploración.', 'PC Gamer' FROM Games WHERE title = 'Minecraft';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.8, 'Un mundo cyberpunk impresionante pero plagado de problemas técnicos.', 'GamesRadar+' FROM Games WHERE title = 'Cyberpunk 2077';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.6, 'Un western de mundo abierto con una historia absorbente.', 'The Verge' FROM Games WHERE title = 'Red Dead Redemption 2';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.6, 'Una reinvención espectacular con combates épicos.', 'GameSpot' FROM Games WHERE title = 'God of War';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.0, 'Un título de lucha sólido con buena variedad de personajes.', 'IGN' FROM Games WHERE title = 'Street Fighter V';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.5, 'Una entrega pulida con mecánicas clásicas mejoradas.', 'Game Informer' FROM Games WHERE title = 'Tekken 7';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.5, 'Una sensación global que redefine los battle royale.', 'Kotaku' FROM Games WHERE title = 'Fortnite';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.0, 'Un battle royale táctico con gran tensión en cada partida.', 'Polygon' FROM Games WHERE title = 'PUBG';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.0, 'Un juego de puzles que ha trascendido generaciones.', 'Eurogamer' FROM Games WHERE title = 'Tetris';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.8, 'Un simulador social divertido con infinitas opciones.', 'PC Gamer' FROM Games WHERE title = 'The Sims 4';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.2, 'Un juego revolucionario con una banda sonora icónica y jugabilidad adictiva.', 'GameSpot' FROM Games WHERE title = 'Guitar Hero';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.0, 'Un desafío brutalmente justo con un diseño de niveles excepcional.', 'IGN' FROM Games WHERE title = 'Dark Souls III';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.3, 'Una obra maestra del terror gótico con combate visceral y atmósfera única.', 'Kotaku' FROM Games WHERE title = 'Bloodborne';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.2, 'Una historia épica con mecánicas de sigilo impecables.', 'Polygon' FROM Games WHERE title = 'Metal Gear Solid V';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.1, 'Un vasto mundo vikingo con muchas actividades y combates intensos.', 'Eurogamer' FROM Games WHERE title = 'Assassin\'s Creed Valhalla';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.5, 'Una experiencia colorida y frenética en el mundo de la tinta.', 'Destructoid' FROM Games WHERE title = 'Splatoon 3';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 10.0, 'Una obra maestra moderna con exploración sin igual y jefes impresionantes.', 'Game Informer' FROM Games WHERE title = 'Elden Ring';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.8, 'Acción trepidante y mecánicas de combate satisfactorias.', 'PC Gamer' FROM Games WHERE title = 'Doom Eternal';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.5, 'Un shooter divertido aunque con algunos problemas de balance.', 'Rock Paper Shotgun' FROM Games WHERE title = 'Overwatch 2';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 6.5, 'Problemas técnicos y decisiones cuestionables empañan la experiencia.', 'Forbes' FROM Games WHERE title = 'Battlefield 2042';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.6, 'Un referente del género RTS con estrategias profundas.', 'PC Gamer' FROM Games WHERE title = 'StarCraft II';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.9, 'Un MMORPG legendario que sigue ofreciendo contenido de calidad.', 'GameSpot' FROM Games WHERE title = 'World of Warcraft';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.7, 'Un oscuro y desafiante regreso de la saga con un mundo infernalmente bello.', 'IGN' FROM Games WHERE title = 'Diablo IV';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.3, 'Un MOBA dinámico con una comunidad competitiva y actualizaciones constantes.', 'Kotaku' FROM Games WHERE title = 'League of Legends';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.8, 'Estrategia profunda y acción intensa en este legendario MOBA.', 'Polygon' FROM Games WHERE title = 'Dota 2';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.0, 'Diversión sencilla y caótica, pero depende mucho de los compañeros de juego.', 'Eurogamer' FROM Games WHERE title = 'Among Us';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.1, 'Un metroidvania de arte hermoso y mecánicas pulidas.', 'Destructoid' FROM Games WHERE title = 'Hollow Knight';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.0, 'Un viaje emocionalmente desafiante con una jugabilidad precisa.', 'Game Informer' FROM Games WHERE title = 'Celeste';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.9, 'Un regreso impresionante para Samus con una jugabilidad fluida y desafiante.', 'IGN' FROM Games WHERE title = 'Metroid Dread';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.5, 'Un refugio pacífico y encantador para la creatividad y la socialización.', 'GameSpot' FROM Games WHERE title = 'Animal Crossing: New Horizons';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.7, 'Una adorable y estratégica aventura que expande la fórmula clásica.', 'Kotaku' FROM Games WHERE title = 'Pikmin 4';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.2, 'Acción frenética y espectacular que mantiene la esencia de la saga.', 'Polygon' FROM Games WHERE title = 'Bayonetta 3';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.0, 'Un JRPG tradicional con una historia conmovedora y un hermoso mundo.', 'Eurogamer' FROM Games WHERE title = 'Dragon Quest XI';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.7, 'Uno de los mejores RPGs de todos los tiempos con una historia absorbente.', 'Game Informer' FROM Games WHERE title = 'Persona 5';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.8, 'Una caza emocionante con mecánicas ágiles y un diseño innovador.', 'Destructoid' FROM Games WHERE title = 'Monster Hunter Rise';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.1, 'Una aventura épica con personajes memorables y un mundo vasto.', 'VG247' FROM Games WHERE title = 'Xenoblade Chronicles 3';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.5, 'Kirby brilla en una aventura en 3D creativa y divertida.', 'GameSpot' FROM Games WHERE title = 'Kirby and the Forgotten Land';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.3, 'Un combate táctico sólido con personajes carismáticos.', 'PC Gamer' FROM Games WHERE title = 'Fire Emblem Engage';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.8, 'El crossover definitivo con una jugabilidad increíblemente pulida.', 'IGN' FROM Games WHERE title = 'Super Smash Bros. Ultimate';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.2, 'Un battle royale caótico y divertido que garantiza risas.', 'Kotaku' FROM Games WHERE title = 'Fall Guys';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.4, 'Terror espacial llevado a la perfección con mejoras modernas.', 'Game Informer' FROM Games WHERE title = 'Dead Space Remake';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.9, 'Un mundo bellísimo con una historia envolvente y mecánicas mejoradas.', 'Polygon' FROM Games WHERE title = 'Horizon Forbidden West';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.3, 'Un homenaje visual y narrativo al Japón feudal con un combate exquisito.', 'Eurogamer' FROM Games WHERE title = 'Ghost of Tsushima';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.5, 'Desafiante, gratificante y con un combate sublime.', 'Destructoid' FROM Games WHERE title = 'Sekiro: Shadows Die Twice';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.0, 'La mejor representación de Spider-Man en videojuegos.', 'VG247' FROM Games WHERE title = 'Marvel\'s Spider-Man';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.6, 'Un roguelike tenso y adictivo con una atmósfera impresionante.', 'GameSpot' FROM Games WHERE title = 'Returnal';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.8, 'Una experiencia única y contemplativa que divide opiniones.', 'PC Gamer' FROM Games WHERE title = 'Death Stranding';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.7, 'Un thriller sobrenatural con una jugabilidad innovadora.', 'Polygon' FROM Games WHERE title = 'Control';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.9, 'Un RPG innovador que reinventa la franquicia Yakuza.', 'IGN' FROM Games WHERE title = 'Yakuza: Like a Dragon';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.7, 'Un RPG clásico con un hermoso estilo visual y combates por turnos profundos.', 'GameSpot' FROM Games WHERE title = 'Octopath Traveler';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.5, 'Una secuela digna con mecánicas de rol envolventes.', 'Polygon' FROM Games WHERE title = 'Bravely Default II';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.8, 'Un RPG táctico desafiante con una narrativa intrigante.', 'PC Gamer' FROM Games WHERE title = 'Triangle Strategy';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.6, 'Una aventura psicológica única con una historia inquietante.', 'Eurogamer' FROM Games WHERE title = 'Catherine: Full Body';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.9, 'Un RPG de ciencia ficción con una historia ramificada y decisiones impactantes.', 'Game Informer' FROM Games WHERE title = 'The Outer Worlds';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.5, 'Exploración espacial mejorada con actualizaciones constantes.', 'Kotaku' FROM Games WHERE title = 'No Man\'s Sky';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 6.9, 'Un juego de supervivencia submarina cautivador y bien diseñado.', 'Destructoid' FROM Games WHERE title = 'Subnautica';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.0, 'Un giro refrescante en la saga Yakuza con un combate por turnos sorprendente.', 'IGN' FROM Games WHERE title = 'Yakuza: Like a Dragon';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.5, 'Una estética preciosa y una jugabilidad clásica con un toque moderno.', 'GameSpot' FROM Games WHERE title = 'Octopath Traveler';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.3, 'Un JRPG sólido con un sistema de combate desafiante.', 'Polygon' FROM Games WHERE title = 'Bravely Default II';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.7, 'Estrategia y narrativa se combinan en una experiencia única.', 'Eurogamer' FROM Games WHERE title = 'Triangle Strategy';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.8, 'Una historia adulta con mecánicas únicas de puzles y romance.', 'Kotaku' FROM Games WHERE title = 'Catherine: Full Body';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.9, 'Un RPG espacial con diálogos afilados y decisiones impactantes.', 'PC Gamer' FROM Games WHERE title = 'The Outer Worlds';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.5, 'Un ambicioso juego de exploración que ha mejorado con los años.', 'Rock Paper Shotgun' FROM Games WHERE title = 'No Man\'s Sky';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.2, 'Una de las mejores experiencias de exploración submarina.', 'Game Informer' FROM Games WHERE title = 'Subnautica';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.0, 'Un sandbox increíblemente versátil y adictivo.', 'IGN' FROM Games WHERE title = 'Terraria';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.5, 'Una obra maestra narrativa con personajes memorables.', 'Eurogamer' FROM Games WHERE title = 'The Last of Us';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.9, 'Un mundo abierto vibrante con infinitas posibilidades.', 'Kotaku' FROM Games WHERE title = 'Grand Theft Auto V';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.5, 'Una experiencia intensa con acción y realismo militar.', 'Game Informer' FROM Games WHERE title = 'Call of Duty: Modern Warfare';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.0, 'Un simulador de fútbol sólido con mejoras iterativas.', 'IGN' FROM Games WHERE title = 'FIFA 23';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.7, 'Una historia inolvidable con un sistema de combate legendario.', 'GameSpot' FROM Games WHERE title = 'Final Fantasy VII';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.3, 'Un survival horror reinventado con jugabilidad impecable.', 'Destructoid' FROM Games WHERE title = 'Resident Evil 4';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.5, 'Un fenómeno cultural que fomenta la creatividad y exploración.', 'PC Gamer' FROM Games WHERE title = 'Minecraft';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.8, 'Un mundo cyberpunk impresionante pero plagado de problemas técnicos.', 'GamesRadar+' FROM Games WHERE title = 'Cyberpunk 2077';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.6, 'Un western de mundo abierto con una historia absorbente.', 'The Verge' FROM Games WHERE title = 'Red Dead Redemption 2';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.6, 'Una reinvención espectacular con combates épicos.', 'GameSpot' FROM Games WHERE title = 'God of War';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.0, 'Un título de lucha sólido con buena variedad de personajes.', 'IGN' FROM Games WHERE title = 'Street Fighter V';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.5, 'Una entrega pulida con mecánicas clásicas mejoradas.', 'Game Informer' FROM Games WHERE title = 'Tekken 7';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.5, 'Una sensación global que redefine los battle royale.', 'Kotaku' FROM Games WHERE title = 'Fortnite';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.0, 'Un battle royale táctico con gran tensión en cada partida.', 'Polygon' FROM Games WHERE title = 'PUBG';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.0, 'Un juego de puzles que ha trascendido generaciones.', 'Eurogamer' FROM Games WHERE title = 'Tetris';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.8, 'Un simulador social divertido con infinitas opciones.', 'PC Gamer' FROM Games WHERE title = 'The Sims 4';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.2, 'Un juego revolucionario con una banda sonora icónica y jugabilidad adictiva.', 'GameSpot' FROM Games WHERE title = 'Guitar Hero';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.0, 'Un desafío brutalmente justo con un diseño de niveles excepcional.', 'IGN' FROM Games WHERE title = 'Dark Souls III';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.3, 'Una obra maestra del terror gótico con combate visceral y atmósfera única.', 'Kotaku' FROM Games WHERE title = 'Bloodborne';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.2, 'Una historia épica con mecánicas de sigilo impecables.', 'Polygon' FROM Games WHERE title = 'Metal Gear Solid V';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.1, 'Un vasto mundo vikingo con muchas actividades y combates intensos.', 'Eurogamer' FROM Games WHERE title = 'Assassin\'s Creed Valhalla';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.5, 'Una experiencia colorida y frenética en el mundo de la tinta.', 'Destructoid' FROM Games WHERE title = 'Splatoon 3';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 10.0, 'Una obra maestra moderna con exploración sin igual y jefes impresionantes.', 'Game Informer' FROM Games WHERE title = 'Elden Ring';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.8, 'Acción trepidante y mecánicas de combate satisfactorias.', 'PC Gamer' FROM Games WHERE title = 'Doom Eternal';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.5, 'Un shooter divertido aunque con algunos problemas de balance.', 'Rock Paper Shotgun' FROM Games WHERE title = 'Overwatch 2';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 6.5, 'Problemas técnicos y decisiones cuestionables empañan la experiencia.', 'Forbes' FROM Games WHERE title = 'Battlefield 2042';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.6, 'Un referente del género RTS con estrategias profundas.', 'PC Gamer' FROM Games WHERE title = 'StarCraft II';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.9, 'Un MMORPG legendario que sigue ofreciendo contenido de calidad.', 'GameSpot' FROM Games WHERE title = 'World of Warcraft';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.7, 'Un oscuro y desafiante regreso de la saga con un mundo infernalmente bello.', 'IGN' FROM Games WHERE title = 'Diablo IV';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.3, 'Un MOBA dinámico con una comunidad competitiva y actualizaciones constantes.', 'Kotaku' FROM Games WHERE title = 'League of Legends';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.8, 'Estrategia profunda y acción intensa en este legendario MOBA.', 'Polygon' FROM Games WHERE title = 'Dota 2';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.0, 'Diversión sencilla y caótica, pero depende mucho de los compañeros de juego.', 'Eurogamer' FROM Games WHERE title = 'Among Us';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.1, 'Un metroidvania de arte hermoso y mecánicas pulidas.', 'Destructoid' FROM Games WHERE title = 'Hollow Knight';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.0, 'Un viaje emocionalmente desafiante con una jugabilidad precisa.', 'Game Informer' FROM Games WHERE title = 'Celeste';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.9, 'Un regreso impresionante para Samus con una jugabilidad fluida y desafiante.', 'IGN' FROM Games WHERE title = 'Metroid Dread';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.5, 'Un refugio pacífico y encantador para la creatividad y la socialización.', 'GameSpot' FROM Games WHERE title = 'Animal Crossing: New Horizons';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.7, 'Una adorable y estratégica aventura que expande la fórmula clásica.', 'Kotaku' FROM Games WHERE title = 'Pikmin 4';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.2, 'Acción frenética y espectacular que mantiene la esencia de la saga.', 'Polygon' FROM Games WHERE title = 'Bayonetta 3';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.0, 'Un JRPG tradicional con una historia conmovedora y un hermoso mundo.', 'Eurogamer' FROM Games WHERE title = 'Dragon Quest XI';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.7, 'Uno de los mejores RPGs de todos los tiempos con una historia absorbente.', 'Game Informer' FROM Games WHERE title = 'Persona 5';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.8, 'Una caza emocionante con mecánicas ágiles y un diseño innovador.', 'Destructoid' FROM Games WHERE title = 'Monster Hunter Rise';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.1, 'Una aventura épica con personajes memorables y un mundo vasto.', 'VG247' FROM Games WHERE title = 'Xenoblade Chronicles 3';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.5, 'Kirby brilla en una aventura en 3D creativa y divertida.', 'GameSpot' FROM Games WHERE title = 'Kirby and the Forgotten Land';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.3, 'Un combate táctico sólido con personajes carismáticos.', 'PC Gamer' FROM Games WHERE title = 'Fire Emblem Engage';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.8, 'El crossover definitivo con una jugabilidad increíblemente pulida.', 'IGN' FROM Games WHERE title = 'Super Smash Bros. Ultimate';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.2, 'Un battle royale caótico y divertido que garantiza risas.', 'Kotaku' FROM Games WHERE title = 'Fall Guys';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.4, 'Terror espacial llevado a la perfección con mejoras modernas.', 'Game Informer' FROM Games WHERE title = 'Dead Space Remake';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.9, 'Un mundo bellísimo con una historia envolvente y mecánicas mejoradas.', 'Polygon' FROM Games WHERE title = 'Horizon Forbidden West';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.3, 'Un homenaje visual y narrativo al Japón feudal con un combate exquisito.', 'Eurogamer' FROM Games WHERE title = 'Ghost of Tsushima';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.5, 'Desafiante, gratificante y con un combate sublime.', 'Destructoid' FROM Games WHERE title = 'Sekiro: Shadows Die Twice';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.0, 'La mejor representación de Spider-Man en videojuegos.', 'VG247' FROM Games WHERE title = 'Marvel\'s Spider-Man';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.6, 'Un roguelike tenso y adictivo con una atmósfera impresionante.', 'GameSpot' FROM Games WHERE title = 'Returnal';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.8, 'Una experiencia única y contemplativa que divide opiniones.', 'PC Gamer' FROM Games WHERE title = 'Death Stranding';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.7, 'Un thriller sobrenatural con una jugabilidad innovadora.', 'Polygon' FROM Games WHERE title = 'Control';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.9, 'Un RPG innovador que reinventa la franquicia Yakuza.', 'IGN' FROM Games WHERE title = 'Yakuza: Like a Dragon';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.7, 'Un RPG clásico con un hermoso estilo visual y combates por turnos profundos.', 'GameSpot' FROM Games WHERE title = 'Octopath Traveler';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.5, 'Una secuela digna con mecánicas de rol envolventes.', 'Polygon' FROM Games WHERE title = 'Bravely Default II';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.8, 'Un RPG táctico desafiante con una narrativa intrigante.', 'PC Gamer' FROM Games WHERE title = 'Triangle Strategy';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.6, 'Una aventura psicológica única con una historia inquietante.', 'Eurogamer' FROM Games WHERE title = 'Catherine: Full Body';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.9, 'Un RPG de ciencia ficción con una historia ramificada y decisiones impactantes.', 'Game Informer' FROM Games WHERE title = 'The Outer Worlds';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.5, 'Exploración espacial mejorada con actualizaciones constantes.', 'Kotaku' FROM Games WHERE title = 'No Man\'s Sky';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 6.9, 'Un juego de supervivencia submarina cautivador y bien diseñado.', 'Destructoid' FROM Games WHERE title = 'Subnautica';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.0, 'Un giro refrescante en la saga Yakuza con un combate por turnos sorprendente.', 'IGN' FROM Games WHERE title = 'Yakuza: Like a Dragon';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.5, 'Una estética preciosa y una jugabilidad clásica con un toque moderno.', 'GameSpot' FROM Games WHERE title = 'Octopath Traveler';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.3, 'Un JRPG sólido con un sistema de combate desafiante.', 'Polygon' FROM Games WHERE title = 'Bravely Default II';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.7, 'Estrategia y narrativa se combinan en una experiencia única.', 'Eurogamer' FROM Games WHERE title = 'Triangle Strategy';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.8, 'Una historia adulta con mecánicas únicas de puzles y romance.', 'Kotaku' FROM Games WHERE title = 'Catherine: Full Body';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.9, 'Un RPG espacial con diálogos afilados y decisiones impactantes.', 'PC Gamer' FROM Games WHERE title = 'The Outer Worlds';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.5, 'Un ambicioso juego de exploración que ha mejorado con los años.', 'Rock Paper Shotgun' FROM Games WHERE title = 'No Man\'s Sky';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.2, 'Una de las mejores experiencias de exploración submarina.', 'Game Informer' FROM Games WHERE title = 'Subnautica';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.0, 'Un sandbox increíblemente versátil y adictivo.', 'IGN' FROM Games WHERE title = 'Terraria';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.9, 'Un juego relajante y adictivo con un gran sentido de progresión.', 'GameSpot' FROM Games WHERE title = 'Stardew Valley';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.3, 'Una obra de arte en animación y dificultad desafiante.', 'Polygon' FROM Games WHERE title = 'Cuphead';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.4, 'Una historia emocional con una dirección artística impresionante.', 'Eurogamer' FROM Games WHERE title = 'Ori and the Blind Forest';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.5, 'Plataformas clásicas con un gran diseño de niveles.', 'Kotaku' FROM Games WHERE title = 'Donkey Kong Country';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.6, 'Un juego encantador con mecánicas innovadoras de exploración.', 'PC Gamer' FROM Games WHERE title = 'Luigi\'s Mansion 3';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.4, 'Una revitalización moderna y desafiante de un clásico.', 'Rock Paper Shotgun' FROM Games WHERE title = 'Crash Bandicoot 4';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.2, 'Un remake que mantiene la magia de la trilogía original.', 'Game Informer' FROM Games WHERE title = 'Spyro Reignited Trilogy';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.1, 'Acción frenética y un espectáculo visual impresionante.', 'IGN' FROM Games WHERE title = 'Ratchet & Clank: Rift Apart';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.9, 'Una secuela intensa que amplía los horrores del original.', 'GameSpot' FROM Games WHERE title = 'Little Nightmares II';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.0, 'Minimalista pero impactante, una joya del terror psicológico.', 'Polygon' FROM Games WHERE title = 'Inside';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.8, 'Un viaje oscuro y melancólico con mecánicas ingeniosas.', 'Eurogamer' FROM Games WHERE title = 'Limbo';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.5, 'Un roguelike excepcionalmente bien diseñado.', 'Kotaku' FROM Games WHERE title = 'Hades';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.6, 'Una de las mejores narrativas en videojuegos.', 'PC Gamer' FROM Games WHERE title = 'Disco Elysium';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.1, 'Un thriller interactivo con una historia atrapante.', 'Rock Paper Shotgun' FROM Games WHERE title = 'Detroit: Become Human';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.7, 'Un thriller lleno de decisiones difíciles.', 'Game Informer' FROM Games WHERE title = 'Heavy Rain';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.5, 'Narrativa profunda con múltiples desenlaces.', 'IGN' FROM Games WHERE title = 'Beyond: Two Souls';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.3, 'Una de las mejores trilogías de ciencia ficción.', 'GameSpot' FROM Games WHERE title = 'Mass Effect Legendary Edition';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.9, 'Una historia épica con gran profundidad de personajes.', 'Polygon' FROM Games WHERE title = 'Dragon Age: Inquisition';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.7, 'Un mundo abierto sin igual en la fantasía medieval.', 'Eurogamer' FROM Games WHERE title = 'Skyrim';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.0, 'Un clásico atemporal del RPG occidental.', 'Kotaku' FROM Games WHERE title = 'Oblivion';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 5.7, 'Un RPG occidental revolucionario con una historia envolvente.', 'IGN' FROM Games WHERE title = 'Morrowind';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.7, 'Un vasto mundo postapocalíptico lleno de posibilidades.', 'GameSpot' FROM Games WHERE title = 'Fallout 4';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.9, 'La mejor narrativa de la saga con una jugabilidad mejorada.', 'Polygon' FROM Games WHERE title = 'Fallout: New Vegas';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.2, 'Un survival horror con una atmósfera aterradora.', 'Game Informer' FROM Games WHERE title = 'The Evil Within';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 6.5, 'Terror y suspenso en su máxima expresión.', 'PC Gamer' FROM Games WHERE title = 'Outlast';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.5, 'Una obra maestra del horror psicológico.', 'Eurogamer' FROM Games WHERE title = 'Amnesia: The Dark Descent';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 6.8, 'Sustos inesperados en un concepto simple pero efectivo.', 'Kotaku' FROM Games WHERE title = 'Five Nights at Freddy’s';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 5.3, 'Un RPG moderno que redefine el género.', 'Game Informer' FROM Games WHERE title = 'Baldur\'s Gate 3';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 5.8, 'Exploración espacial ambiciosa pero con fallos técnicos.', 'GameSpot' FROM Games WHERE title = 'Starfield';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 6.1, 'Un thriller sobrenatural impresionante.', 'IGN' FROM Games WHERE title = 'Alan Wake 2';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.9, 'Magia y aventura en el mundo de Harry Potter.', 'PC Gamer' FROM Games WHERE title = 'Hogwarts Legacy';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.1, 'El clásico arcade que nunca pasa de moda.', 'Polygon' FROM Games WHERE title = 'Pac-Man';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 9.7, 'Terror y suspenso con una historia icónica.', 'Eurogamer' FROM Games WHERE title = 'Silent Hill 2';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.7, 'Exploración y disparos en un mundo alienígena.', 'IGN' FROM Games WHERE title = 'Metroid Prime';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 6.1, 'Un roguelike desafiante con una historia profunda.', 'PC Gamer' FROM Games WHERE title = 'The Binding of Isaac';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.9, 'Un clásico de plataformas con gran carisma.', 'GameSpot' FROM Games WHERE title = 'Banjo-Kazooie';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.1, 'Acción y disparos con nostalgia de los 90.', 'Game Informer' FROM Games WHERE title = 'GoldenEye 007';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 5.6, 'Cooperativo frenético con zombis.', 'Polygon' FROM Games WHERE title = 'Left 4 Dead 2';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 5.1, 'Un clásico de la lógica y el humor.', 'IGN' FROM Games WHERE title = 'Portal 2';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.3, 'Un shooter revolucionario para su tiempo.', 'PC Gamer' FROM Games WHERE title = 'Half-Life 2';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 6.3, 'Divertido shooter en equipo.', 'GameSpot' FROM Games WHERE title = 'Team Fortress 2';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 5.5, 'Una experiencia filosófica e innovadora.', 'Eurogamer' FROM Games WHERE title = 'The Stanley Parable';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 6.5, 'Aventura gráfica con humor memorable.', 'Game Informer' FROM Games WHERE title = 'Monkey Island 2';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 4.3, 'Narrativa excepcional en una historia de época.', 'Kotaku' FROM Games WHERE title = 'Grim Fandango';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 6.7, 'Plataformas con gran diseño de niveles.', 'Polygon' FROM Games WHERE title = 'Psychonauts 2';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 4.4, 'Arte visual impresionante y mecánicas creativas.', 'IGN' FROM Games WHERE title = 'Okami';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 4.1, 'Un viaje emocional inolvidable.', 'PC Gamer' FROM Games WHERE title = 'Journey';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 8.4, 'Un cuento épico en un mundo místico.', 'Eurogamer' FROM Games WHERE title = 'Shadow of the Colossus';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 4.5, 'Precursor de una gran saga de aventuras.', 'GameSpot' FROM Games WHERE title = 'ICO';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 4.1, 'Un simulador de moralidad en un mundo opresivo.', 'Game Informer' FROM Games WHERE title = 'Papers, Please';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 5.7, 'Estrategia de supervivencia con gran impacto emocional.', 'Polygon' FROM Games WHERE title = 'This War of Mine';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 3.5, 'Estrategia táctica por turnos con profundidad.', 'IGN' FROM Games WHERE title = 'XCOM 2';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 3.6, 'Estrategia y simulación de imperios.', 'PC Gamer' FROM Games WHERE title = 'Civilization VI';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 3.2, 'Batallas históricas con gran realismo.', 'GameSpot' FROM Games WHERE title = 'Total War: Three Kingdoms';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 2.8, 'Gran estrategia con gestión política profunda.', 'Game Informer' FROM Games WHERE title = 'Europa Universalis IV';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.8, 'Estrategia en tiempo real con historia rica.', 'Polygon' FROM Games WHERE title = 'Age of Empires IV';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 7.9, 'Batallas tácticas en el universo Warhammer.', 'IGN' FROM Games WHERE title = 'Warhammer 40,000: Dawn of War';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 2.1, 'Narrativa fuerte en un mundo nórdico.', 'PC Gamer' FROM Games WHERE title = 'The Banner Saga';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 2.0, 'Un RPG que expande las posibilidades de elección.', 'Game Informer' FROM Games WHERE title = 'Divinity: Original Sin 2';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 4.0, 'Una historia de Star Wars inolvidable con decisiones impactantes.', 'IGN' FROM Games WHERE title = 'Star Wars: Knights of the Old Republic';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 3.0, 'Un viaje cinemático con combates satisfactorios.', 'PC Gamer' FROM Games WHERE title = 'Star Wars Jedi: Fallen Order';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 2.0, 'Diversión para toda la familia en la galaxia LEGO.', 'GameSpot' FROM Games WHERE title = 'LEGO Star Wars: The Skywalker Saga';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 2.0, 'El mejor juego de carreras arcade.', 'Polygon' FROM Games WHERE title = 'Mario Kart 8 Deluxe';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 3.0, 'Velocidad extrema y desafíos intensos.', 'Game Informer' FROM Games WHERE title = 'F-Zero GX';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 3.0, 'Carreras callejeras con gran nostalgia.', 'Eurogamer' FROM Games WHERE title = 'Need for Speed: Most Wanted';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 3.0, 'Mundo abierto y acrobacias en la conducción.', 'Kotaku' FROM Games WHERE title = 'Burnout Paradise';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 3.0, 'Simulación de carreras con realismo impresionante.', 'IGN' FROM Games WHERE title = 'Gran Turismo 7';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 3.0, 'El juego de carreras más accesible y entretenido.', 'PC Gamer' FROM Games WHERE title = 'Forza Horizon 5';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 3.0, 'Trucos y snowboard extremo.', 'GameSpot' FROM Games WHERE title = 'SSX Tricky';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 3.0, 'El mejor juego de skate de todos los tiempos.', 'Game Informer' FROM Games WHERE title = 'Tony Hawk’s Pro Skater 2';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 3.0, 'Un simulador de skate con gran comunidad.', 'Eurogamer' FROM Games WHERE title = 'Skate 3';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 2.0, 'El mejor simulador de baloncesto.', 'Polygon' FROM Games WHERE title = 'NBA 2K23';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 2.0, 'Auténtico fútbol americano con licencias oficiales.', 'IGN' FROM Games WHERE title = 'Madden NFL 23';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 5.8, 'El mejor juego de béisbol con gran realismo.', 'PC Gamer' FROM Games WHERE title = 'MLB The Show 23';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 5.6, 'Hockey sobre hielo con gran presentación.', 'GameSpot' FROM Games WHERE title = 'NHL 23';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 6.7, 'El regreso triunfal de la lucha libre.', 'Game Informer' FROM Games WHERE title = 'WWE 2K23';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 5.6, 'Simulación de carreras con intensidad.', 'Eurogamer' FROM Games WHERE title = 'F1 23';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 2.1, 'El mejor juego de lucha de la saga.', 'Polygon' FROM Games WHERE title = 'Guilty Gear Strive';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 3.2, 'Acción rápida y combates espectaculares.', 'IGN' FROM Games WHERE title = 'BlazBlue: Central Fiction';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 6.5, 'Una entrega brutal con gran narrativa.', 'PC Gamer' FROM Games WHERE title = 'Mortal Kombat 11';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 2.9, 'Un juego de lucha que redefinió el género.', 'GameSpot' FROM Games WHERE title = 'Killer Instinct';
INSERT INTO Reviews (game_id, rating, comment, reviewer_name)
SELECT game_id, 4.6, 'La lucha con espadas en su máxima expresión.', 'Game Informer' FROM Games WHERE title = 'Samurai Shodown';