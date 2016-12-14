var geojsonFeature = null

var map = L.map('map').setView([-7.115440, 112.850846], 12);
var masjidLayer = null
var jalanLayer = null

L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  maxZoom: 81,
  attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>, Modified © <a href="http://elcicko.web.id">ElCickoBlog</a>'
}).addTo(map);