<?php
include 'boot/starter.php';

$result = pg_query($conn, 'SELECT gid, nama,menu,kapasitas,pictures, st_asgeojson(geom) as geom FROM Rumah_makan');

if (@$_GET['nearby'] && @$_GET['gid']) {
  $table_nearby = $_GET['nearby'];
  $gid = (int) $_GET['gid'];

  $radius = @$_GET['radius'] ? $_GET['radius'] : 50;

  $query = "select rumah_makan.gid, rumah_makan.nama, rumah_makan.menu, rumah_makan.kapasitas, rumah_makan.pictures, st_asgeojson(rumah_makan.geom) as geom from rumah_makan, {$table_nearby} where st_dwithin(rumah_makan.geom, {$table_nearby}.geom, {$radius}) and {$table_nearby}.gid = {$gid}";

  $result = pg_query($conn, $query);
}

$geoJson = [
  'type' => 'FeatureCollection',
  'features' => []
];

while ($row = pg_fetch_assoc($result)) {
  if (!$row['geom']) {
    continue;
  }
  $row['geom'] = json_decode($row['geom']);
  $row = (object) $row;

  $feature = [
    'type' => 'Feature',
    'geometry' => $row->geom,
    'properties' => [
      'gid' => $row->gid,
      'nama' => $row->nama,
      'menu' => $row->menu,
      'kapasitas' => $row->kapasitas,
      'picture' => $row ->pictures
    ]
  ];

  array_push($geoJson['features'], $feature);
}

// return;


header('Content-type: application/json');
echo json_encode($geoJson);
