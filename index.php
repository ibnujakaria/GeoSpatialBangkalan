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
	<div id="map-covers" style="display: none"></div>
		<button id="btn-full-screen"><i class="fa fa-arrows-alt"></i></button>
	</div>
	<div id="vue-app">
		<div class="sidebar" style="display: none">
			<h1>Fasilitas Bangkalan</h1>
			<p>
				Temukan fasilitas-fasilitas umum di kota Bangkalan. Dan jangan tersesat!
			</p>
			<p>
				{{menu_aktif}}
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
			<ul class="list-group" style="margin-bottom: 10px" v-if="menu_aktif !== 'fasilitas-umum'">
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
								<option :value="fasilitas.key" v-for="fasilitas in listFasilitas">{{fasilitas.title}}</option>
							</select>
						</div>
						<div v-if="search.type">
							<h4>Cari <span style="text-transform: capitalize;">{{getFasilitasTitle(search.type)}}</span> di sekitar?</h4>
							<div class="form-group">
								<select class="form-control" v-model="search.nearby" @change="getNearbyFasilitasSelected">
									<option :value="fasilitas.key" v-for="fasilitas in listFasilitas">{{fasilitas.title}}</option>
								</select>
							</div>
						</div>
						<div v-if="search.nearby">
							<form @submit.prevent="searchGeo">
								<div class="form-group">
									<h4>Nama <span style="text-transform: capitalize;">{{getFasilitasTitle(search.nearby)}}</span></h4>
									<select class="form-control" v-model="search.gid">
										<option :value="fasilitas.properties.gid" v-for="fasilitas in dataGeoJson.features">
											{{fasilitas.properties.nama}}
										</option>
									</select>
								</div>
								<div class="form-group">
									<h4>Radius</h4>
									<input type="number" step="0.0001" v-model="search.radius" placeholder="Kilometers">
								</div>
								<div>
									<button class="btn btn-sm btn-default">Cari</button> <span>{{loading}}</span>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="box" v-show="menu_aktif == 'tentang'">
				<h4>Tentang</h4>
				<p>Aplikasi ini menghimpun dan menyajikan data-data spatial fasilitas umum yang ada di Kabupaten Bangkalan.</p>
			</div>
			<div class="box" v-show="menu_aktif == 'bantuan'">
				<h4>Bantuan</h4>
				<p>Berikut ini bebepara hal umum yang bisa dilakukan:</p>
				<h4>Pencarian</h4>
				<ol>
					<li>Klik menu pencarian</li>
					<li>Pilih fasilitas yang ingin dicari</li>
					<li>Pilih pencarian berdasarkan fasilitas apa</li>
					<li>Klik cari</li>
					<li>Maka hasil pencarian akan muncul pada peta</li>
				</ol>
				<h4>Detail Fasilitas</h4>
				<ol>
					<li>Taruh perhatian kepada peta</li>
					<li>Pilih salah satu object fasilitas</li>
					<li>Klik object tersebut</li>
					<li>Maka detail fasilitas berikut gambarnya akan muncul</li>
				</ol>
			</div>
			<div class="box" v-show="menu_aktif == 'hubungi'">
				<h4>Abdul Basith</h4>
				<p>basithdjunaedi@gmail.com</p>
				<hr>
				<h4>Nurul Huda</h4>
				<p>140411100069@student.trunojoyo.ac.id</p>
			</div>
			<div class="box" v-show="menu_aktif == 'saran'">
				<h4>Saran</h4>
				<p>Anda bisa menyampaikan saran dengan membuat issue pada repository <a href="https://github.com/basithdjunaedi/GeoSpatialBangkalan">github</a> kami.</p>
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
	<script src="https://cdn.jsdelivr.net/vue.resource/1.0.3/vue-resource.min.js"></script>
	<script type="text/javascript">
		<?php
		# load starter
		include 'api/boot/starter.php';
		?>
		var base_url = "<?php echo $base_url;?>";
	</script>

	<script src="dist/peta.js" charset="utf-8"></script>
	<script src="dist/peta-icons.js"></script>
	<!-- <script src="dist/peta-loader.js"></script> -->
	<script src="dist/controller.js"></script>

	<script src="dist/app.js"></script>
</body>
</html>
