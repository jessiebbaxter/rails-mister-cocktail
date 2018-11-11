function initAddCocktailOnClick() {
  const form = document.querySelector('#new_cocktail');
  if (form) {
    document.querySelector('#add-button').addEventListener('click', () => {
      form.submit();
    });
  }
}

export { initAddCocktailOnClick };