const express = require("express");
const app = express();

const port = process.env.PORT || 8080; // ✅ USE THIS

app.get("/", (req, res) => {
  res.send("Hello Railway Deployment Worked!");
});

app.listen(port, () => {
  console.log(`App running on port ${port}`);
});
