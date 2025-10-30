document.addEventListener("DOMContentLoaded", async () => {
  const res = await fetch("/api/movies");
  const movies = await res.json();

  const list = document.getElementById("movieList");
  list.innerHTML = "";

  movies.forEach(m => {
    const card = document.createElement("div");
    card.className = "movie-card";
    card.innerHTML = `
      <img src="${m.image}" alt="${m.title}">
      <h3>${m.title}</h3>
      <p>${m.desc}</p>
    `;
    list.appendChild(card);
  });
});
