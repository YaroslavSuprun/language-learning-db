-- Sample data for language learning video app
-- 5 Spanish videos, Spanish captions, English + Ukrainian translations

PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

-- =====================
-- VIDEOS (5 Spanish-language videos)
-- =====================
INSERT INTO VIDEOS (title, filename, path, length_seconds, upload_date, resolution, framerate, description) VALUES
('Greetings and Introductions', 'greetings.mp4', './videos/', 95, '2026-01-15', '1920x1080', 30.0, 'Common Spanish greetings and how to introduce yourself'),
('At the Market', 'market.mp4', './videos/', 140, '2026-01-18', '1920x1080', 30.0, 'Vocabulary for shopping at a market'),
('Ordering Food', 'ordering_food.mp4', './videos/', 110, '2026-01-22', '1280x720', 24.0, 'How to order food at a Spanish restaurant'),
('Asking for Directions', 'directions.mp4', './videos/', 125, '2026-02-01', '1920x1080', 30.0, 'Useful phrases for navigating a city'),
('Daily Routines', 'daily_routines.mp4', './videos/', 150, '2026-02-10', '1280x720', 24.0, 'Describing your daily activities in Spanish');

-- =====================
-- CAPTIONS (Spanish words and phrases)
-- =====================
INSERT INTO CAPTIONS (text, language) VALUES
-- Single words
('hola', 'es'),                    -- 1
('adiós', 'es'),                   -- 2
('gracias', 'es'),                 -- 3
('por favor', 'es'),               -- 4
('agua', 'es'),                    -- 5
('comida', 'es'),                  -- 6
('calle', 'es'),                   -- 7
('izquierda', 'es'),               -- 8
('derecha', 'es'),                 -- 9
('mañana', 'es'),                  -- 10
('noche', 'es'),                   -- 11
('dinero', 'es'),                  -- 12
('amigo', 'es'),                   -- 13
('casa', 'es'),                    -- 14
('trabajo', 'es'),                 -- 15
-- Multi-word phrases
('buenos días', 'es'),             -- 16
('buenas noches', 'es'),           -- 17
('me llamo', 'es'),                -- 18
('mucho gusto', 'es'),             -- 19
('cuánto cuesta', 'es'),           -- 20
('la cuenta por favor', 'es'),     -- 21
('dónde está', 'es'),              -- 22
('a la derecha', 'es'),            -- 23
('a la izquierda', 'es'),          -- 24
('todo recto', 'es'),              -- 25
('tengo hambre', 'es'),            -- 26
('me despierto temprano', 'es'),   -- 27
('voy al trabajo', 'es'),          -- 28
('nos vemos', 'es'),               -- 29
('hasta luego', 'es');             -- 30

-- =====================
-- VIDEOS_CAPTIONS (which captions appear in which videos, with timestamps)
-- =====================

-- Video 1: Greetings and Introductions (95s)
INSERT INTO VIDEOS_CAPTIONS (video_id, caption_id, start_time, end_time) VALUES
(1, 1, 0.0, 1.5),       -- hola
(1, 16, 3.0, 5.5),      -- buenos días
(1, 17, 7.0, 9.5),      -- buenas noches
(1, 18, 12.0, 14.0),    -- me llamo
(1, 19, 16.0, 18.5),    -- mucho gusto
(1, 13, 22.0, 23.5),    -- amigo
(1, 3, 28.0, 30.0),     -- gracias
(1, 2, 35.0, 37.0),     -- adiós
(1, 29, 40.0, 42.5),    -- nos vemos
(1, 30, 45.0, 47.5),    -- hasta luego
(1, 4, 50.0, 52.5),     -- por favor
(1, 1, 55.0, 56.5),     -- hola (again, repeated in video)
(1, 18, 60.0, 62.0);    -- me llamo (again)

-- Video 2: At the Market (140s)
INSERT INTO VIDEOS_CAPTIONS (video_id, caption_id, start_time, end_time) VALUES
(2, 1, 0.0, 1.5),       -- hola
(2, 16, 3.0, 5.5),      -- buenos días
(2, 20, 10.0, 13.0),    -- cuánto cuesta
(2, 12, 18.0, 20.0),    -- dinero
(2, 3, 25.0, 27.0),     -- gracias
(2, 4, 30.0, 32.5),     -- por favor
(2, 5, 38.0, 39.5),     -- agua
(2, 6, 45.0, 47.0),     -- comida
(2, 20, 55.0, 58.0),    -- cuánto cuesta (again)
(2, 3, 65.0, 67.0),     -- gracias (again)
(2, 2, 75.0, 77.0),     -- adiós
(2, 30, 80.0, 82.5);    -- hasta luego

-- Video 3: Ordering Food (110s)
INSERT INTO VIDEOS_CAPTIONS (video_id, caption_id, start_time, end_time) VALUES
(3, 1, 0.0, 1.5),       -- hola
(3, 16, 2.0, 4.5),      -- buenos días
(3, 26, 8.0, 11.0),     -- tengo hambre
(3, 6, 15.0, 17.0),     -- comida
(3, 5, 20.0, 22.0),     -- agua
(3, 4, 27.0, 29.5),     -- por favor
(3, 20, 35.0, 38.0),    -- cuánto cuesta
(3, 21, 45.0, 49.0),    -- la cuenta por favor
(3, 3, 55.0, 57.0),     -- gracias
(3, 19, 62.0, 64.5),    -- mucho gusto
(3, 2, 70.0, 72.0),     -- adiós
(3, 29, 75.0, 77.5);    -- nos vemos

-- Video 4: Asking for Directions (125s)
INSERT INTO VIDEOS_CAPTIONS (video_id, caption_id, start_time, end_time) VALUES
(4, 1, 0.0, 1.5),       -- hola
(4, 4, 3.0, 5.5),       -- por favor
(4, 22, 8.0, 11.0),     -- dónde está
(4, 7, 15.0, 17.0),     -- calle
(4, 23, 22.0, 25.0),    -- a la derecha
(4, 24, 30.0, 33.0),    -- a la izquierda
(4, 25, 38.0, 41.0),    -- todo recto
(4, 8, 46.0, 48.0),     -- izquierda
(4, 9, 52.0, 54.0),     -- derecha
(4, 22, 60.0, 63.0),    -- dónde está (again)
(4, 3, 70.0, 72.0),     -- gracias
(4, 30, 78.0, 80.5);    -- hasta luego

-- Video 5: Daily Routines (150s)
INSERT INTO VIDEOS_CAPTIONS (video_id, caption_id, start_time, end_time) VALUES
(5, 16, 0.0, 2.5),      -- buenos días
(5, 27, 5.0, 9.0),      -- me despierto temprano
(5, 14, 12.0, 14.0),    -- casa
(5, 28, 18.0, 22.0),    -- voy al trabajo
(5, 15, 26.0, 28.0),    -- trabajo
(5, 6, 33.0, 35.0),     -- comida
(5, 26, 40.0, 43.0),    -- tengo hambre
(5, 5, 48.0, 50.0),     -- agua
(5, 13, 55.0, 57.0),    -- amigo
(5, 17, 62.0, 64.5),    -- buenas noches
(5, 11, 70.0, 72.0),    -- noche
(5, 10, 78.0, 80.0),    -- mañana
(5, 2, 85.0, 87.0),     -- adiós
(5, 29, 90.0, 92.5);    -- nos vemos

-- =====================
-- TRANSLATIONS (English and Ukrainian)
-- =====================
INSERT INTO TRANSLATIONS (text, language, source, date_added) VALUES
-- English translations
('hello', 'en', 'CC0 English-Spanish dictionary', '2026-01-15'),              -- 1
('goodbye', 'en', 'CC0 English-Spanish dictionary', '2026-01-15'),            -- 2
('thank you', 'en', 'CC0 English-Spanish dictionary', '2026-01-15'),          -- 3
('please', 'en', 'CC0 English-Spanish dictionary', '2026-01-15'),             -- 4
('water', 'en', 'CC0 English-Spanish dictionary', '2026-01-15'),              -- 5
('food', 'en', 'CC0 English-Spanish dictionary', '2026-01-15'),               -- 6
('street', 'en', 'CC0 English-Spanish dictionary', '2026-01-15'),             -- 7
('left', 'en', 'CC0 English-Spanish dictionary', '2026-01-15'),               -- 8
('right', 'en', 'CC0 English-Spanish dictionary', '2026-01-15'),              -- 9
('morning', 'en', 'CC0 English-Spanish dictionary', '2026-01-15'),            -- 10
('night', 'en', 'CC0 English-Spanish dictionary', '2026-01-15'),              -- 11
('money', 'en', 'CC0 English-Spanish dictionary', '2026-01-15'),              -- 12
('friend', 'en', 'CC0 English-Spanish dictionary', '2026-01-15'),             -- 13
('house', 'en', 'CC0 English-Spanish dictionary', '2026-01-15'),              -- 14
('work', 'en', 'CC0 English-Spanish dictionary', '2026-01-15'),               -- 15
('good morning', 'en', 'CC0 English-Spanish dictionary', '2026-01-15'),       -- 16
('good night', 'en', 'CC0 English-Spanish dictionary', '2026-01-15'),         -- 17
('my name is', 'en', 'CC0 English-Spanish dictionary', '2026-01-15'),         -- 18
('nice to meet you', 'en', 'CC0 English-Spanish dictionary', '2026-01-15'),   -- 19
('how much does it cost', 'en', 'CC0 English-Spanish dictionary', '2026-01-18'), -- 20
('the bill please', 'en', 'CC0 English-Spanish dictionary', '2026-01-22'),    -- 21
('where is', 'en', 'CC0 English-Spanish dictionary', '2026-02-01'),           -- 22
('to the right', 'en', 'CC0 English-Spanish dictionary', '2026-02-01'),       -- 23
('to the left', 'en', 'CC0 English-Spanish dictionary', '2026-02-01'),        -- 24
('straight ahead', 'en', 'CC0 English-Spanish dictionary', '2026-02-01'),     -- 25
('I am hungry', 'en', 'CC0 English-Spanish dictionary', '2026-01-22'),        -- 26
('I wake up early', 'en', 'CC0 English-Spanish dictionary', '2026-02-10'),    -- 27
('I go to work', 'en', 'CC0 English-Spanish dictionary', '2026-02-10'),       -- 28
('see you', 'en', 'CC0 English-Spanish dictionary', '2026-01-15'),            -- 29
('see you later', 'en', 'CC0 English-Spanish dictionary', '2026-01-15'),      -- 30
-- Ukrainian translations
('привіт', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-01-16'),           -- 31
('до побачення', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-01-16'),     -- 32
('дякую', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-01-16'),            -- 33
('будь ласка', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-01-16'),       -- 34
('вода', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-01-16'),             -- 35
('їжа', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-01-16'),              -- 36
('вулиця', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-01-16'),           -- 37
('ліворуч', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-01-16'),          -- 38
('праворуч', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-01-16'),         -- 39
('ранок', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-01-16'),            -- 40
('ніч', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-01-16'),              -- 41
('гроші', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-01-16'),            -- 42
('друг', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-01-16'),             -- 43
('дім', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-01-16'),              -- 44
('робота', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-01-16'),           -- 45
('доброго ранку', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-01-16'),    -- 46
('добраніч', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-01-16'),         -- 47
('мене звати', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-01-16'),       -- 48
('приємно познайомитися', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-01-16'), -- 49
('скільки це коштує', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-01-18'),-- 50
('рахунок будь ласка', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-01-22'),-- 51
('де знаходиться', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-02-01'),   -- 52
('праворуч', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-02-01'),         -- 53
('ліворуч', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-02-01'),          -- 54
('прямо', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-02-01'),            -- 55
('я голодний', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-01-22'),       -- 56
('я прокидаюся рано', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-02-10'),-- 57
('я іду на роботу', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-02-10'), -- 58
('побачимось', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-01-16'),       -- 59
('до зустрічі', 'ua', 'CC0 Ukrainian-Spanish dictionary', '2026-01-16');      -- 60

-- =====================
-- CAPTIONS_TRANSLATIONS (linking captions to their translations)
-- Caption IDs 1-30 map to English translation IDs 1-30 and Ukrainian IDs 31-60
-- =====================
INSERT INTO CAPTIONS_TRANSLATIONS (caption_id, translation_id) VALUES
-- English translations (caption N -> translation N)
(1, 1),    -- hola -> hello
(2, 2),    -- adiós -> goodbye
(3, 3),    -- gracias -> thank you
(4, 4),    -- por favor -> please
(5, 5),    -- agua -> water
(6, 6),    -- comida -> food
(7, 7),    -- calle -> street
(8, 8),    -- izquierda -> left
(9, 9),    -- derecha -> right
(10, 10),  -- mañana -> morning
(11, 11),  -- noche -> night
(12, 12),  -- dinero -> money
(13, 13),  -- amigo -> friend
(14, 14),  -- casa -> house
(15, 15),  -- trabajo -> work
(16, 16),  -- buenos días -> good morning
(17, 17),  -- buenas noches -> good night
(18, 18),  -- me llamo -> my name is
(19, 19),  -- mucho gusto -> nice to meet you
(20, 20),  -- cuánto cuesta -> how much does it cost
(21, 21),  -- la cuenta por favor -> the bill please
(22, 22),  -- dónde está -> where is
(23, 23),  -- a la derecha -> to the right
(24, 24),  -- a la izquierda -> to the left
(25, 25),  -- todo recto -> straight ahead
(26, 26),  -- tengo hambre -> I am hungry
(27, 27),  -- me despierto temprano -> I wake up early
(28, 28),  -- voy al trabajo -> I go to work
(29, 29),  -- nos vemos -> see you
(30, 30),  -- hasta luego -> see you later
-- Ukrainian translations (caption N -> translation N+30)
(1, 31),   -- hola -> привіт
(2, 32),   -- adiós -> до побачення
(3, 33),   -- gracias -> дякую
(4, 34),   -- por favor -> будь ласка
(5, 35),   -- agua -> вода
(6, 36),   -- comida -> їжа
(7, 37),   -- calle -> вулиця
(8, 38),   -- izquierda -> ліворуч
(9, 39),   -- derecha -> праворуч
(10, 40),  -- mañana -> ранок
(11, 41),  -- noche -> ніч
(12, 42),  -- dinero -> гроші
(13, 43),  -- amigo -> друг
(14, 44),  -- casa -> дім
(15, 45),  -- trabajo -> робота
(16, 46),  -- buenos días -> доброго ранку
(17, 47),  -- buenas noches -> добраніч
(18, 48),  -- me llamo -> мене звати
(19, 49),  -- mucho gusto -> приємно познайомитися
(20, 50),  -- cuánto cuesta -> скільки це коштує
(21, 51),  -- la cuenta por favor -> рахунок будь ласка
(22, 52),  -- dónde está -> де знаходиться
(23, 53),  -- a la derecha -> праворуч
(24, 54),  -- a la izquierda -> ліворуч
(25, 55),  -- todo recto -> прямо
(26, 56),  -- tengo hambre -> я голодний
(27, 57),  -- me despierto temprano -> я прокидаюся рано
(28, 58),  -- voy al trabajo -> я іду на роботу
(29, 59),  -- nos vemos -> побачимось
(30, 60);  -- hasta luego -> до зустрічі

COMMIT;