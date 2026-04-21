# Video Caption Database for Language Learning

**Author:** Yaroslav Suprun

A web app for language learners that lets users browse Spanish-language videos, view timestamped captions, and look up English and Ukrainian translations. Built on a relational SQLite schema (5 tables, N:N relationships) designed to support arbitrary languages — adding a new language requires only data inserts, no structural changes. Includes caption search functionality and SQL scripts for database creation and sample data population.

## Tech Stack

- Node.js / Express
- Pug templates
- SQLite
- CC0-licensed dictionary data

## Database Schema

- **VIDEOS** — video metadata (title, filename, path, duration, resolution, etc.)
- **CAPTIONS** — individual words/phrases with language codes
- **TRANSLATIONS** — translated text with source dictionary and target language
- **VIDEOS_CAPTIONS** — links videos to captions with start/end timestamps (N:N)
- **CAPTIONS_TRANSLATIONS** — links captions to translations (N:N)

## How to Run

1. Open a terminal in the `main` directory
2. Install dependencies:
   ```
   npm install
   ```
3. Start the server:
   ```
   node server.js
   ```
4. Open in browser: [http://localhost:3000](http://localhost:3000)

The SQLite database file is located in the `main` folder. To recreate it from scratch, SQL scripts (`base_tables.sql` and `sample_data.sql`) are provided in the `scripts` directory.

## Demo

[YouTube demo video](https://youtu.be/2dpGmiKkEUM)
