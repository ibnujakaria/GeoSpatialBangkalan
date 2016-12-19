<!DOCTYPE html>
<html>
<head>
	<title>Bangkalan</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="dist/leaflet.css" />
	<link rel="stylesheet" href="dist/bootstrap/css/bootstrap.min.css" >
	<link rel="stylesheet" href="dist/css/bootstrap-circle-button.css" media="screen" title="no title">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" media="screen" title="no title">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.2.0/css/mdb.min.css" media="screen" title="no title">
	<link rel="stylesheet" href="dist/css/css-ku-dewe.css" media="screen" title="no title">
	<link rel="stylesheet" href="dist/css/css-ku-menu.css" media="screen" title="no title">
</head>
<body>
	<div id="map"></div>
	<div id="map-controls" class="left top fixed" style="margin-left: 10px; top: 80px">
		<button id="btn-full-screen"><i class="fa fa-arrows-alt"></i></button>
	</div>
	<div id="vue-app">
		<div class="sidebar" style="display: none">
			<h1>Fasilitas Bangkalan</h1>
			<p>
				Temukan fasilitas-fasilitas umum di kota Bangkalan. Dan jangan tersesat!
			</p>
			<ul class="list-group" v-if="menu_aktif === 'fasilitas-umum'">
				<li :class="getClassLists('fasilitas-umum')" @click="aksesMenu('fasilitas-umum')">
					<i class="fa fa-building" style="width: 20px"></i>
					Fasilitas Umum
				</li>
				<li :class="getClassLists('pencarian')" @click="aksesMenu('pencarian')">
					<i class="fa fa-search" style="width: 20px"></i>
					Pencarian
				</li>
				<li :class="getClassLists('tentang')" @click="aksesMenu('tentang')">
					<i class="fa fa-user" style="width: 20px"></i>
					Tentang
				</li>
				<li :class="getClassLists('bantuan')" @click="aksesMenu('bantuan')">
					<i class="fa fa-question" style="width: 20px"></i>
					Bantuan
				</li>
				<li :class="getClassLists('hubungi')" @click="aksesMenu('hubungi')">
					<i class="fa fa-phone" style="width: 20px"></i>
					Hubungi
				</li>
				<li :class="getClassLists('saran')" @click="aksesMenu('saran')">
					<i class="fa fa-envelope" style="width: 20px"></i>
					Saran
				</li>
			</ul>
			<ul class="list-group" style="margin-bottom: 10px" v-else>
				<li class="list-group-item" @click="aksesMenu('fasilitas-umum')">
					<i class="fa fa-arrow-left" style="width: 20px"></i>
					Back
				</li>
			</ul>
			<div v-show="menu_aktif === 'pencarian'">
				<div class="box">
					<div>
						<h4>Apa yang ingin anda cari?</h4>
						<div class="form-group">
							<select class="form-control" v-model="search.type">
								<option value="masjid">Masjid</option>
								<option value="mall">Mall</option>
								<option value="bank">Bank</option>
								<option value="jalan">Jalan</option>
							</select>
						</div>
						<div v-if="search.type">
							<h4>Cari <span style="text-transform: capitalize;">{{search.type}}</span> di sekitar?</h4>
							<div class="form-group">
								<select class="form-control" v-model="search.nearby">
									<option value="masjid">Masjid</option>
									<option value="mall">Mall</option>
									<option value="bank">Bank</option>
									<option value="jalan">Jalan</option>
								</select>
							</div>
						</div>
						<div v-if="search.nearby">
							<form>
								<div class="form-group">
									<h4>Nama <span style="text-transform: capitalize;">{{search.nearby}}</span></h4>
									<select id="jalan-input" class="form-control">
									</select>
								</div>
								<div class="form-group">
									<h4>Radius</h4>
									<input type="number" name="radius" step="0.0001" id="radius-input">
								</div>
								<div>
									<button class="btn btn-sm btn-default">Cari</button>
								</div>
							</form>
						</div>
					</div>
					<!-- <form id="form-cari-masjid">
						<h3>Cari masjid di sekitar</h3>
						<div class="form-group">
							<label>Nama Jalan</label>
							<select id="jalan-input" class="form-control">
							</select>
						</div>
						<div class="form-group">
							<label>Radius</label>
							<input type="number" name="radius" step="0.0001" id="radius-input">
						</div>
						<div>
							<button class="btn btn-sm btn-default">Cari</button>
						</div>
					</form>		 -->
				</div>
			</div>
		</div>
		<!-- <div class="box right top fixed and pinned" style="width: 300px">
			
		</div> -->
		<div class="cover blurred">
		</div>
		<div class="menu-utama box transparent fixed center no-padding">
			<div class="menu">
				<div class="item orange" @click="menuUtama('fasilitas-umum')">
					<p><i class="fa fa-building"></i></p>
					Fasilitas Umum
				</div>
				<div class="item green" @click="menuUtama('pencarian')">
					<p><i class="fa fa-search"></i></p>
					Pencarian
				</div>
				<div class="item grey" @click="menuUtama('tentang')">
					<p><i class="fa fa-user"></i></p>
					Tentang
				</div>
				<div class="item purple" @click="menuUtama('bantuan')">
					<p><i class="fa fa-question"></i></p>
					Bantuan
				</div>
				<div class="item blue" @click="menuUtama('hubungi')">
					<p><i class="fa fa-phone"></i></p>
					Hubungi
				</div>
				<div class="item red" @click="menuUtama('saran')">
					<p><i class="fa fa-envelope"></i></p>
					Saran
				</div>
			</div>
		</div>
	</div>

	<script src="dist/leaflet.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js" charset="utf-8"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" charset="utf-8"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.2.0/js/mdb.min.js" charset="utf-8"></script>
	<script src="https://unpkg.com/vue/dist/vue.js"></script>

	<script type="text/javascript">
		<?php
		# load starter
		include 'api/boot/starter.php';
		?>
		var base_url = "<?php echo $base_url;?>";
	</script>

	<script src="dist/peta.js" charset="utf-8"></script>
	<script src="dist/peta-icons.js"></script>
	<script src="dist/peta-loader.js"></script>
	<script src="dist/controller.js"></script>

	<script type="text/javascript">
		peta_awal()
	</script>

	<script src="dist/app.js"></script>
</body>
</html>
