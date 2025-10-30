const express = require("express");
const app = express();

app.use(express.static("public")); // ✅ serve frontend safely

// Example movie endpoint
app.get("/api/movies", (req, res) => {
  res.json([
    { title: "Inception", desc: "Dream within a dream thriller" },
    { title: "Interstellar", desc: "Journey through space and time" },
    { title: "The Dark Knight", desc: "Batman faces the Joker" }
  ]);
});

const port = process.env.PORT || 8080; // ✅ USE THIS

app.get("/", (req, res) => {
  res.send("Hello Railway Deployment Worked!");
});

app.listen(port, () => {
  console.log(`App running on port ${port}`);
});

app.get("/health", (req, res) => {
  res.json({ status: "UP" });
});
