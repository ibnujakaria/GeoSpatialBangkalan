var app = null;

app = new Vue({
	el: '#vue-app',
	data: {
		menu_aktif: 'fasilitas-umum'
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
		}
	}
})