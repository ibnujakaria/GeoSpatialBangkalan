<?php
include 'boot/starter.php';

$result = pg_query($conn, 'SELECT gid, nama,tiket,jam_buka,pictures, st_asgeojson(geom) as geom FROM Tempat_wisata');

if (@$_GET['nearby'] && @$_GET['gid']) {
  $table_nearby = $_GET['nearby'];
  $gid = (int) $_GET['gid'];

  $radius = @$_GET['radius'] ? $_GET['radius'] : 50;

  $query = "select tempat_wisata.gid, tempat_wisata.nama, tempat_wisata.tiket, tempat_wisata.jam_buka, tempat_wisata.pictures, st_asgeojson(tempat_wisata.geom) as geom from tempat_wisata, {$table_nearby} where st_dwithin(tempat_wisata.geom, {$table_nearby}.geom, {$radius}) and {$table_nearby}.gid = {$gid}";

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
      'tiket' => $row->tiket,
      'jam_buka' => $row->jam_buka,
      'picture' => $row->pictures
    ]
  ];

  array_push($geoJson['features'], $feature);
}

// return;


header('Content-type: application/json');
echo json_encode($geoJson);
