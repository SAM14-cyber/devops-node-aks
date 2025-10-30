const express = require("express");
const app = express();

const port = process.env.PORT || 8080;

// Serve public folder
app.use(express.static("public"));

app.get("/", (req, res) => {
  res.send("Hello Railway Deployment Worked!");
});

app.get("/health", (req, res) => {
  res.json({ status: "UP" });
});

app.get("/api/movies", (req, res) => {
  res.json([
    {
      title: "Inception",
      desc: "Dream within a dream thriller",
      image: "/images/inception.jpg"
    },
    {
      title: "Interstellar",
      desc: "Journey through space and time",
      image: "/images/interstellar.jpg"
    },
    {
      title: "The Dark Knight",
      desc: "Batman faces the Joker",
      image: "/images/darkknight.jpg"
    }
  ]);
});

app.listen(port, () => {
  console.log(`App running on port ${port}`);
});
