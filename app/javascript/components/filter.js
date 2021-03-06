const filter = () => {
  const filterButton = document.querySelector("#filter-button");
  if (filterButton) {
    filterButton.addEventListener("click", (event) => {
      const filters = document.getElementById("filters");
      filters.classList.toggle("d-none");
      filters.classList.toggle("d-flex");
    });
  }
};

export { filter };
