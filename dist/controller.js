var isPetaFull = true;

addListeners()

function addListeners() {
	$('#btn-full-screen').on('click', fullScreenToggle)
}

function onHomeMenuClick() {
	hideMenuUtama()
	fullScreenToggle()
}

function hideMenuUtama() {
	$('.cover.blurred').fadeOut(500)
	$('.menu-utama').fadeOut(500)
}

function fullScreenToggle() {
	if (isPetaFull) {
		geserPetaKeKanan()
		console.log('geser peta ke kanan')
	} else {
		geserPetaJadiFullScreen()
		console.log('geser peta jadi fullScreen')
	}

	isPetaFull = !isPetaFull
}

function geserPetaKeKanan() {
	$('#map').animate({
		top: '20px',
		left: '360px',
		bottom: '20px',
		right: '20px'
	}, function () {
		$('.sidebar').fadeIn(1000)
	})

	$('#map-controls').animate({
		top: '100px',
		left: '360px'
	})
}

function geserPetaJadiFullScreen() {
	$('.sidebar').fadeOut(1000)

	$('#map').animate({
		top: '0',
		left: '0',
		bottom: '0',
		right: '0'
	})

	$('#map-controls').animate({
		top: '80px',
		left: '0px'
	})
}