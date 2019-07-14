document.addEventListener('DOMContentLoaded', function () {
  let mapId = 'sensor-map'
  let mapElement = document.getElementById(mapId)
  if (mapElement === undefined) return

  let latitude = mapElement.dataset.latitude
  let longitude = mapElement.dataset.longitude

  let leafletMap = L.map(mapId).setView([latitude, longitude], 20);
  L.marker([latitude, longitude]).addTo(leafletMap);

  L.tileLayer('https://a.tile.openstreetmap.org/{z}/{x}/{y}.png ', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.openstreetmap.org/">OpenStreetMap</a>',
    maxZoom: 18,
    id: 'mapbox.streets'
  }).addTo(leafletMap);
});

