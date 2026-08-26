document.querySelectorAll(".mobile-menu").forEach((menu) => {
  menu.querySelectorAll("a").forEach((link) => {
    link.addEventListener("click", () => menu.removeAttribute("open"));
  });

  document.addEventListener("click", (event) => {
    if (menu.open && !menu.contains(event.target)) {
      menu.removeAttribute("open");
    }
  });
});

document.addEventListener("keydown", (event) => {
  if (event.key !== "Escape") return;

  const openMenu = document.querySelector(".mobile-menu[open]");
  if (!openMenu) return;

  openMenu.removeAttribute("open");
  openMenu.querySelector("summary").focus();
});
