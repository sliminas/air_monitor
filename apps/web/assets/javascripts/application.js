function initializeSensorMap() {
  const mapId = 'sensor-map';
  const mapElement = document.getElementById(mapId);
  if (!mapElement) return;

  const latitude = mapElement.dataset.latitude;
  const longitude = mapElement.dataset.longitude;

  const markerIcon = L.icon({ iconUrl: mapElement.dataset.markerIcon })

  const leafletMap = L.map(mapId).setView([latitude, longitude], 20);
  L.marker([latitude, longitude], { icon: markerIcon }).addTo(leafletMap);

  L.tileLayer('https://a.tile.openstreetmap.org/{z}/{x}/{y}.png ', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.openstreetmap.org/">OpenStreetMap</a>',
    maxZoom: 18,
    id: 'mapbox.streets',
    gestureHandling: true
  }).addTo(leafletMap);
}
InstantClick.on('change', function () { initializeSensorMap() });
document.addEventListener('DOMContentLoaded', function () { initializeSensorMap() });

