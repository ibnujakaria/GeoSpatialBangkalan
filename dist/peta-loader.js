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
            if (!jalanLayer){
              $('#jalan-input').append('<option>' + feature.properties.nama + '</option>')
              console.log("opo iki " + feature.properties.nama)
            }
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