<?php
include 'boot/starter.php';

$result = pg_query($conn, 'SELECT gid, nama,kapasitas,pictures, st_asgeojson(geom) as geom FROM Sekolahan');

if (@$_GET['nearby'] && @$_GET['gid']) {
  $table_nearby = $_GET['nearby'];
  $gid = (int) $_GET['gid'];

  $radius = @$_GET['radius'] ? $_GET['radius'] : 50;

  $query = "select sekolahan.gid, sekolahan.nama, sekolahan.kapasitas, sekolahan.pictures, st_asgeojson(sekolahan.geom) as geom from sekolahan, {$table_nearby} where st_dwithin(sekolahan.geom, {$table_nearby}.geom, {$radius}) and {$table_nearby}.gid = {$gid}";

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
      'kapasitas' => $row->kapasitas,
      'picture' => $row->pictures
    ]
  ];

  array_push($geoJson['features'], $feature);
}

// return;


header('Content-type: application/json');
echo json_encode($geoJson);
