require('./boot/boot.js')

var Map = require('./components/Map.vue')

var app = new Vue ({
	el: '#vue-instance',
	data: {
		message: 'Hello vue!'
	},
	components: {Map}
})