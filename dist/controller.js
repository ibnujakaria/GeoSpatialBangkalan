addListeners()

function addListeners() {
	$('.menu .item').on('click', onHomeMenuClick)
}

function onHomeMenuClick() {
	hideMenuUtama()
	geserPetaKeKanan()
}

function hideMenuUtama() {
	$('.cover.blurred').fadeOut(500)
	$('.menu-utama').fadeOut(500)
}

function geserPetaKeKanan() {
	$('#map').animate({
		top: '80px',
		left: '360px',
		bottom: '20px',
		right: '20px'
	}, function () {
		$('.sidebar').fadeIn(1000)
	})
}