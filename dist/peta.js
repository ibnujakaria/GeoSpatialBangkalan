var geojsonFeature = null

var map = L.map('map').setView([-7.126440, 112.722846], 12);
var masjidLayer = null
var jalanLayer = null

//var map = L.map('map').setView([-7.13045833460832, 112.724274204192 ], 18);
// ini adalah copyright, bisa dicopot tapi lebih baik kita hargai sang penciptanya ya :)

//L.tileLayer('http://{s}.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/997/256/{z}/{x}/{y}.png', {
L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  maxZoom: 81,
  attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>, Modified © <a href="http://elcicko.web.id">ElCickoBlog</a>'
}).addTo(map);

var masjidIcon = new L.icon({
  iconUrl: 'https://masjidabubakarcawang.files.wordpress.com/2015/04/abu-bakar.png',
  shadowUrl: 'https://masjidabubakarcawang.files.wordpress.com/2015/04/abu-bakar.png',

  iconSize:     [20, 20], // size of the icon
  shadowSize:   [20, 20], // size of the shadow
  iconAnchor:   [10, 10], // point of the icon which will correspond to marker's location
  shadowAnchor: [10, 10],  // the same for the shadow
  popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
});

var restoranIcon = new L.icon({
  iconUrl: 'http://dining1.ut.ac.ir/res?id=11607&dl=false',
  shadowUrl: 'http://dining1.ut.ac.ir/res?id=11607&dl=false',

  iconSize:     [20, 20], // size of the icon
  shadowSize:   [20, 20], // size of the shadow
  iconAnchor:   [10, 10], // point of the icon which will correspond to marker's location
  shadowAnchor: [10, 10],  // the same for the shadow
  popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
});

var bankIcon = new L.icon({
  iconUrl: 'http://www.soloptik.dk/images/payment/bank-transfer.png',
  shadowUrl: 'http://www.soloptik.dk/images/payment/bank-transfer.png',

  iconSize:     [20, 20], // size of the icon
  shadowSize:   [20, 20], // size of the shadow
  iconAnchor:   [10, 10], // point of the icon which will correspond to marker's location
  shadowAnchor: [10, 10],  // the same for the shadow
  popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
});

var sekolahIcon = new L.icon({
  iconUrl: 'http://zyk.ouchn.edu.cn/images/item/apic06.png',
  shadowUrl: 'http://zyk.ouchn.edu.cn/images/item/apic06.png',

  iconSize:     [20, 20], // size of the icon
  shadowSize:   [20, 20], // size of the shadow
  iconAnchor:   [10, 10], // point of the icon which will correspond to marker's location
  shadowAnchor: [10, 10],  // the same for the shadow
  popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
});

var mallIcon = new L.icon({
  iconUrl: 'http://vignette2.wikia.nocookie.net/cityville/images/6/67/Famous_Mall_Level_3.png/revision/latest?cb=20120626024128',
  shadowUrl: 'http://vignette2.wikia.nocookie.net/cityville/images/6/67/Famous_Mall_Level_3.png/revision/latest?cb=20120626024128',

  iconSize:     [20, 20], // size of the icon
  shadowSize:   [20, 20], // size of the shadow
  iconAnchor:   [10, 10], // point of the icon which will correspond to marker's location
  shadowAnchor: [10, 10],  // the same for the shadow
  popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
});

var wisataIcon = new L.icon({
  iconUrl: 'http://pulauharapankita.com/img/pulauharapankita.png',
  shadowUrl: 'http://pulauharapankita.com/img/pulauharapankita.png',

  iconSize:     [20, 20], // size of the icon
  shadowSize:   [20, 20], // size of the shadow
  iconAnchor:   [10, 10], // point of the icon which will correspond to marker's location
  shadowAnchor: [10, 10],  // the same for the shadow
  popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
});

var gedungOlarahragaIcon = new L.icon({
  iconUrl: 'https://wallazee.global.ssl.fastly.net/images/variant/20130718-ba42c0329945c2c3ee70b73285e150d9ca1f109f1005f2a45586fce-1024.png',
  shadowUrl: 'https://wallazee.global.ssl.fastly.net/images/variant/20130718-ba42c0329945c2c3ee70b73285e150d9ca1f109f1005f2a45586fce-1024.png',

  iconSize:     [20, 20], // size of the icon
  shadowSize:   [20, 20], // size of the shadow
  iconAnchor:   [10, 10], // point of the icon which will correspond to marker's location
  shadowAnchor: [10, 10],  // the same for the shadow
  popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
});

var hotelIcon = new L.icon({
  iconUrl: 'https://cdn2.iconfinder.com/data/icons/large-home-icons/512/Hotel_travel_holiday_vector_vacation_symbol.png',
  shadowUrl: 'https://cdn2.iconfinder.com/data/icons/large-home-icons/512/Hotel_travel_holiday_vector_vacation_symbol.png',

  iconSize:     [20, 20], // size of the icon
  shadowSize:   [20, 20], // size of the shadow
  iconAnchor:   [10, 10], // point of the icon which will correspond to marker's location
  shadowAnchor: [10, 10],  // the same for the shadow
  popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
});

function tampilkanMasjid() {
  if (masjidLayer) {
    map.removeLayer(masjidLayer)
  }


  var query = {}
  if ($('#jalan-input').val()) {
    query.jalan = $('#jalan-input').val();
  }

  if ($('#radius-input').val()) {
    query.radius = $('#radius-input').val();
  }

  $.ajax({
    url: 'http://localhost:8080/masjid.php',
    data: query,
    success: function (response) {
      masjidLayer = new L.GeoJSON(response, {
        pointToLayer: function (feature, latlng) {
          return L.marker(latlng, {icon: masjidIcon})
        },
        onEachFeature: function (feature, layer) {
          var popup = '<h4>nama : '+ feature.properties.nama + '</h4>'
          popup += '<h4>kapasitas : '+ feature.properties.kapasitas + '</h4>'
          popup += '<button gid="' + feature.properties.gid + '">Edit</button>'
          popup += '<button>Hapus</button>'
          layer.bindPopup(popup)
        },
      });

      masjidLayer.addTo(map)

    }
  })
}


function tampilkanJalan() {
  if (jalanLayer) {
    map.removeLayer(jalanLayer)
  } else {
    $('#jalan-input').html('<option value="semua">Pilih Jalan</option>')
  }

  $.ajax({
      url: 'http://localhost:8080/jalan.php',
      success: function (response) {
        jalanLayer = new L.GeoJSON(response, {
          onEachFeature: function (feature, layer) {
            if (!jalanLayer)
              $('#jalan-input').append('<option>' + feature.properties.nama + '</option>')
            var popup = '<h4>nama : '+ feature.properties.nama + '</h4>' 
            popup += '<button gid="' + feature.properties.gid + '">Edit</button>'
            popup += '<button>Hapus</button>'
            layer.bindPopup(popup)
          },
          style: function (feature) {
            if (feature.properties.nama == $('#jalan-input').val()) {
              return {
                "color": "#ff7800",
                "weight": 7,
                "opacity": 0.65
              }
            } else {
              return {
                "color": "blue",
                "weight": 7,
                "opacity": 0.65
              }
            }
          }
        })

        jalanLayer.addTo(map);
      }
    })
}


function peta_awal() {

  $.ajax({
    url: 'http://localhost:8080/bank.php',
    success: function (response) {
      console.log(response);
      new L.GeoJSON(response, {
        pointToLayer: function (feature, latlng) {
          return L.marker(latlng, {icon: bankIcon})
        },
        onEachFeature: function (feature, layer) {
          var popup = '<h4>nama : '+ feature.properties.nama + '</h4>'
          popup += '<h4>jam buka : '+ feature.properties.jam_buka + '</h4>'
          popup += '<button gid="' + feature.properties.gid + '">Edit</button>'
          popup += '<button>Hapus</button>'
          layer.bindPopup(popup)
        }
      }).addTo(map);
    }
  })

  $.ajax({
    url: 'http://localhost:8080/gedung_olahraga.php',
    success: function (response) {
      new L.GeoJSON(response, {
        pointToLayer: function (feature, latlng) {
          return L.marker(latlng, {icon: gedungOlarahragaIcon})
        },
        onEachFeature: function (feature, layer) {
          var popup = '<h4>nama : '+ feature.properties.nama + '</h4>'
          popup += '<h4>kapasitas : '+ feature.properties.kapasitas + '</h4>'
          popup += '<button gid="' + feature.properties.gid + '">Edit</button>'
          popup += '<button>Hapus</button>'
          layer.bindPopup(popup)
        }
      }).addTo(map);
    }
  })

  $.ajax({
    url: 'http://localhost:8080/hotel.php',
    success: function (response) {
      new L.GeoJSON(response, {
        pointToLayer: function (feature, latlng) {
          return L.marker(latlng, {icon: hotelIcon})
        },
        onEachFeature: function (feature, layer) {
          var popup = '<h4>nama : '+ feature.properties.nama + '</h4>'
          popup += '<h4>kapasitas : '+ feature.properties.kapasitas + '</h4>'
          popup += '<button gid="' + feature.properties.gid + '">Edit</button>'
          popup += '<button>Hapus</button>'
          layer.bindPopup(popup)
        }
      }).addTo(map);
    }
  })

  $.ajax({
    url: 'http://localhost:8080/mall_dan_swalayan.php',
    success: function (response) {
      new L.GeoJSON(response, {
        pointToLayer: function (feature, latlng) {
          return L.marker(latlng, {icon: mallIcon})
        },
        onEachFeature: function (feature, layer) {
          var popup = '<h4>nama : '+ feature.properties.nama + '</h4>'
          popup += '<h4>jam buka : '+ feature.properties.jam_buka + '</h4>'
          popup += '<button gid="' + feature.properties.gid + '">Edit</button>'
          popup += '<button>Hapus</button>'
          layer.bindPopup(popup)
        }
      }).addTo(map);
    }
  })

  $.ajax({
    url: 'http://localhost:8080/rumah_makan.php',
    success: function (response) {
      console.log(response);
      new L.GeoJSON(response, {
        pointToLayer: function (feature, latlng) {
          return L.marker(latlng, {icon: restoranIcon})
        },
        onEachFeature: function (feature, layer) {
          var popup = '<h4>nama : '+ feature.properties.nama + '</h4>'
          popup += '<h4>menu : '+ feature.properties.menu + '</h4>'
          popup += '<h4>kapasitas : '+ feature.properties.kapasitas + '</h4>'
          popup += '<button gid="' + feature.properties.gid + '">Edit</button>'
          popup += '<button>Hapus</button>'
          layer.bindPopup(popup)
        }
      }).addTo(map);
    }
  })

  $.ajax({
    url: 'http://localhost:8080/sekolahan.php',
    success: function (response) {
      new L.GeoJSON(response, {
        pointToLayer: function (feature, latlng) {
          return L.marker(latlng, {icon: sekolahIcon})
        },
        onEachFeature: function (feature, layer) {
          var popup = '<h4>nama : '+ feature.properties.nama + '</h4>'
          popup += '<h4>kapasitas : '+ feature.properties.kapasitas + '</h4>'
          popup += '<button gid="' + feature.properties.gid + '">Edit</button>'
          popup += '<button>Hapus</button>'
          layer.bindPopup(popup)
        }
      }).addTo(map);
    }
  })

  $.ajax({
    url: 'http://localhost:8080/tempat_wisata.php',
    success: function (response) {
      new L.GeoJSON(response, {
        pointToLayer: function (feature, latlng) {
          return L.marker(latlng, {icon: wisataIcon})
        },
        onEachFeature: function (feature, layer) {
          var popup = '<h4>nama : '+ feature.properties.nama + '</h4>'
          popup += '<h4>tiket : '+ feature.properties.tiket + '</h4>'
          popup += '<h4>jam buka : '+ feature.properties.jam_buka + '</h4>'
          popup += '<button gid="' + feature.properties.gid + '">Edit</button>'
          popup += '<button>Hapus</button>'
          layer.bindPopup(popup)
        }
      }).addTo(map);
    }
  })

  tampilkanJalan();

  $('body').on('click', '[gid]', function () {
    var gid = $(this).attr('gid')
    var nama = prompt("Masukkan nama")
    var jam_buka = prompt("Masukkan jam buka")

    $.ajax({
      url: 'http://localhost:8080/bank-crud.php',
      data: {
        gid: gid,
        nama: nama,
        jam_buka: jam_buka,
        aksi: 'edit'
      },
      success: function (response) {
        console.log(response);
        window.location = ''
      }
    })
  })

  tampilkanMasjid()

  $('body').on('submit', 'form#form-cari-masjid', function (e) {
    e.preventDefault()

    tampilkanMasjid()
    tampilkanJalan()
  })
}



peta_awal()
