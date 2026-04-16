const express = require("express");
const Database = require("better-sqlite3");
const path = require("path");

const app = express();
const db = new Database("database.db");
const PORT = 3000;

// enable foreign keys
db.pragma("foreign_keys = 1");

// set pug as template engine and serve static files from public/
app.set("view engine", "pug");
app.use(express.static(path.join(__dirname, "public")));

// home page - list all videos
app.get("/", (req, res) => {
    // get all videos for main page
    const videos = db.prepare("SELECT * FROM VIDEOS").all();
    res.render("index", { videos, formatTime });
});

// video detail page - show video metadata and all its captions with timestamps
app.get("/videos/:id", (req, res) => {
    const video = db.prepare('SELECT * FROM VIDEOS WHERE video_id = ?').get(req.params.id);
    
    // join through VIDEOS_CAPTIONS (N:N) to get captions for this video
    const captions = db.prepare(`
        SELECT c.caption_id, c.text, vc.start_time, vc.end_time
        FROM VIDEOS_CAPTIONS vc
        JOIN CAPTIONS c ON vc.caption_id = c.caption_id
        WHERE vc.video_id = ?
        ORDER BY vc.start_time
    `).all(req.params.id);

    res.render("video", { video, captions, formatTime });
});

// caption detail page - show translations and all videos this caption appears in
app.get('/captions/:id', (req, res) => {
    const caption = db.prepare('SELECT * FROM CAPTIONS WHERE caption_id = ?').get(req.params.id);

    // join through CAPTIONS_TRANSLATIONS (N:N) to get translations
    const translations = db.prepare(`
        SELECT t.translation_id, t.text, t.language, t.source
        FROM CAPTIONS_TRANSLATIONS ct
        JOIN TRANSLATIONS t ON ct.translation_id = t.translation_id
        WHERE ct.caption_id = ?
    `).all(req.params.id);

    // join through VIDEOS_CAPTIONS (N:N) to get all videos containing this caption
    const videos = db.prepare(`
        SELECT v.video_id, v.title, vc.start_time, vc.end_time
        FROM VIDEOS_CAPTIONS vc
        JOIN VIDEOS v ON vc.video_id = v.video_id
        WHERE vc.caption_id = ?
        ORDER BY v.title
    `).all(req.params.id);

    res.render('caption', { caption, translations, videos, formatTime });
});

// search captions by text (partial match)
app.get("/search", (req, res) => {
    const query = req.query.q || "";
    const results = db.prepare(`
        SELECT DISTINCT c.caption_id, c.text, c.language
        FROM CAPTIONS c
        WHERE c.text LIKE ?
    `).all(`%${query}%`);
    res.render('search', { query, results });
});

// format seconds into m:ss for display
function formatTime(seconds) {
    const mins = Math.floor(seconds / 60);
    const secs = Math.floor(seconds % 60);
    return `${mins}:${secs.toString().padStart(2, '0')}`;
}

app.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}`);
});