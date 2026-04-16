# Language Learning Video Caption Database

**Author:** Yaroslav Suprun

A language learning database with a web UI, built for COMP 3005 at Carleton University. Users can browse Spanish-language videos, view timestamped captions, and look up translations in English and Ukrainian. Includes caption search functionality.

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
