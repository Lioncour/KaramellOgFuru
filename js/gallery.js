(function () {
  var mount = document.getElementById('gallery-mount');
  if (!mount) return;

  function buildGrid(images) {
    mount.innerHTML = '';
    var grid = document.createElement('div');
    grid.className = 'bento';
    for (var i = 0; i < images.length; i++) {
      var item = images[i];
      if (!item || !item.src) continue;
      var fig = document.createElement('figure');
      fig.className = 'bento__cell';
      var sz = (item.size || 'small').toLowerCase();
      if (sz === 'large') fig.classList.add('bento__cell--lg');
      if (sz === 'wide') fig.classList.add('bento__cell--wide');
      var img = document.createElement('img');
      img.src = item.src;
      img.alt = item.alt || '';
      img.loading = 'lazy';
      img.decoding = 'async';
      fig.appendChild(img);
      if (item.caption) {
        var cap = document.createElement('figcaption');
        cap.className = 'bento__cap';
        cap.textContent = item.caption;
        fig.appendChild(cap);
      }
      grid.appendChild(fig);
    }
    mount.appendChild(grid);
  }

  fetch('data/gallery.json', { credentials: 'same-origin' })
    .then(function (r) {
      if (!r.ok) throw new Error();
      return r.json();
    })
    .then(function (data) {
      var list = (data && data.images) || [];
      if (list.length) buildGrid(list);
    })
    .catch(function () {
      mount.classList.add('gallery-fallback');
      mount.innerHTML =
        '<p class="gallery-fallback__text">Kunne ikke laste galleriet. Kjør siden via en lokal server, eller sjekk at <code>data/gallery.json</code> finnes.</p>';
    });
})();
