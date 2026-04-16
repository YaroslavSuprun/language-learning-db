PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

DROP TABLE IF EXISTS CAPTIONS_TRANSLATIONS;
DROP TABLE IF EXISTS TRANSLATIONS;
DROP TABLE IF EXISTS VIDEOS_CAPTIONS;
DROP TABLE IF EXISTS CAPTIONS;
DROP TABLE IF EXISTS VIDEOS;

CREATE TABLE VIDEOS ( -- all uploaded videos and their metadata
    video_id INTEGER PRIMARY KEY NOT NULL, -- auto incrementing id
    title TEXT, -- name given by user
    filename TEXT NOT NULL, -- file name (e.g. video.mp4)
    path TEXT NOT NULL, -- full file path (can be relative)
    length_seconds INTEGER NOT NULL, -- duration of video in seconds
    upload_date TEXT, -- date the video was added
    resolution TEXT, -- e.g. "1920x1080"
    framerate REAL, -- fps
    description TEXT, -- description for the video
    UNIQUE(filename, path)
);

CREATE TABLE CAPTIONS ( -- all the extracted words/phrases from videos
    caption_id INTEGER PRIMARY KEY NOT NULL, -- auto incrementing id
    text TEXT NOT NULL, -- the caption
    language TEXT NOT NULL -- language indicator
);

CREATE TABLE VIDEOS_CAPTIONS ( -- linking videos to captions (many-to-many)
    video_id INTEGER NOT NULL,
    caption_id INTEGER NOT NULL,
    start_time REAL NOT NULL, -- caption start time in seconds
    end_time REAL NOT NULL, -- caption end time in seconds
    PRIMARY KEY (video_id, caption_id, start_time, end_time), -- both times to separate words and phrases
    FOREIGN KEY (video_id) REFERENCES VIDEOS (video_id),
    FOREIGN KEY (caption_id) REFERENCES CAPTIONS (caption_id)
);

CREATE TABLE TRANSLATIONS ( -- translations of captions (in a chosen language)
    translation_id INTEGER PRIMARY KEY NOT NULL, -- autoincrementing id
    text TEXT NOT NULL, -- the translation
    language TEXT NOT NULL DEFAULT 'en', -- language indicator
    source TEXT, -- e.g. "CC0 *name* dictionary" or "user"
    date_added TEXT -- e.g. "2026-01-17"
);

CREATE TABLE CAPTIONS_TRANSLATIONS ( -- linking captions to translations (many-to-many)
    caption_id INTEGER NOT NULL,
    translation_id INTEGER NOT NULL,
    PRIMARY KEY (caption_id, translation_id),
    FOREIGN KEY (caption_id) REFERENCES CAPTIONS (caption_id),
    FOREIGN KEY (translation_id) REFERENCES TRANSLATIONS (translation_id)
);


COMMIT;