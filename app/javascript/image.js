function imagePreview() {
  const input = document.getElementById('cosmetic_image');
  const preview = document.getElementById('image-preview');

  if (input && preview) {
    input.addEventListener('change', function(e) {
      const file = e.target.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
          preview.innerHTML = `<img src="${e.target.result}" style="max-width: 200px; margin-top: 10px; border-radius: 5px;">`;
        };
        reader.readAsDataURL(file);
      } else {
        preview.innerHTML = '';
      }
    });
  }
}

window.addEventListener('turbo:load', imagePreview);