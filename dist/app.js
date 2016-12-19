var app = null;

app = new Vue({
	el: '#vue-app',
	data: {
		menu_aktif: 'fasilitas-umum',
		search: {
			type: null,
			nearby: null,
			radius: null,
			gid: null
		},
		listFasilitas: [
			{
				key: 'bank',
				title: 'Bank'
			},
			{
				key: 'gedung_olahraga',
				title: 'Gedung Olahraga'
			},
			{
				key: 'hotel',
				title: 'Hotel'
			},
			{
				key: 'jalan',
				title: 'Jalan'
			},
			{
				key: 'mall_dan_swalayan',
				title: 'Mall dan Swalayan'
			},
			{
				key: 'masjid',
				title: 'Masjid'
			},
			{
				key: 'rumah_makan',
				title: 'Rumah Makan'
			},
			{
				key: 'sekolahan',
				title: 'Sekolah'
			},
			{
				key: 'tempat_wisata',
				title: 'Tempat Wisata'
			}
		],
		dataGeoJson: [],
		dataGeoJsonToRender: {
			bank: null, gedung_olahraga: null, hotel: null, jalan: null, mall_dan_swalayan: null,
			masjid: null, rumah_makan: null, sekolahan: null, tempat_wisata: null
		},
		dataLeafletLayers: {
			bank: null, gedung_olahraga: null, hotel: null, jalan: null, mall_dan_swalayan: null,
			masjid: null, rumah_makan: null, sekolahan: null, tempat_wisata: null
		}
	},
	methods: {
		menuUtama: function (menu) {
			onHomeMenuClick()
			this.aksesMenu(menu)
		},
		aksesMenu: function (menu) {
			this.menu_aktif = menu
		},
		getClassLists: function (menu) {
			var isActive = this.menu_aktif == menu
			return {
				'list-group-item': true,
				'active': isActive
			}
		},
		getFasilitasTitle: function (key) {
			var title = null

			for (var i = 0; i < this.listFasilitas.length; i++) {
				if (this.listFasilitas[i].key === key) {
					title = this.listFasilitas[i].title
					break
				}
			}
			return title
		},
		getNearbyFasilitasSelected: function () {
			console.log("NEARBY: " + this.search.nearby)

			this.$http.get(base_url + '/api/' + this.search.nearby + '.php').then(function (resopnse) {
				this.dataGeoJson = resopnse.body
			})
		},
		searchGeo: function () {
			
			var params = {
				nearby: this.search.nearby,
				radius: this.search.radius,
				gid: this.search.gid
			}

			this.showToTheMap(this.search.type, params)
		},
		showToTheMap: function (key, params) {
			var url = base_url + '/api/' + key + '.php'

			this.$http.get(url, {params: params}).then(function (response) {
				this.dataGeoJsonToRender[key] = response.body

				if (this.dataLeafletLayers[key]) {
					console.log("refresh layer " + key)
					map.removeLayer(this.dataLeafletLayers[key])
				}

				this.dataLeafletLayers[key] = new L.GeoJSON(response.body, {
					pointToLayer: function (feature, latlng) {
						return L.marker(latlng, {icon: icons[key]})
					},
					onEachFeature: function (feature, layer) {
						var popup = '<img src="'+feature.properties.picture+'" width="300px" heigth="500px"></img>'
						
						for (var key in feature.properties) {
							if (key != 'gid' && key != 'picture') {
								popup += "<h4 style='text-transform: capitalize'>" + key + ": " + feature.properties[key] + "</h4>"
							}
						}

						layer.bindPopup(popup)
					},
				});

				this.dataLeafletLayers[key].addTo(map)
			})
		},
		petaAwal: function () {
			for (var i = 0; i < this.listFasilitas.length; i++) {
				this.showToTheMap(this.listFasilitas[i].key)
			}
		}
	}
})

app.petaAwal()