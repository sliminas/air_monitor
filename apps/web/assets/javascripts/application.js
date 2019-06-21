document.addEventListener("DOMContentLoaded", function () {

  var mymap = L.map('map').setView([52.465036, 13.328644], 20);
  L.tileLayer('https://a.tile.openstreetmap.org/{z}/{x}/{y}.png ', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.openstreetmap.org/">OpenStreetMap</a>',
    maxZoom: 18,
    id: 'mapbox.streets'
  }).addTo(mymap);
});

