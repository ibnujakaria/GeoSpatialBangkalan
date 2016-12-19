<?php
include 'boot/starter.php';

$result = pg_query($conn, 'SELECT gid, nama,jam_buka,pictures, st_asgeojson(geom) as geom FROM Mall_dan_swalayan');

if (@$_GET['nearby'] && @$_GET['gid']) {
  $table_nearby = $_GET['nearby'];
  $gid = (int) $_GET['gid'];

  $radius = @$_GET['radius'] ? $_GET['radius'] : 50;

  $query = "select mall_dan_swalayan.gid, mall_dan_swalayan.nama, mall_dan_swalayan.jam_buka, mall_dan_swalayan.pictures, st_asgeojson(mall_dan_swalayan.geom) as geom from mall_dan_swalayan, {$table_nearby} where st_dwithin(mall_dan_swalayan.geom, {$table_nearby}.geom, {$radius}) and {$table_nearby}.gid = {$gid}";

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
      'jam_buka' => $row->jam_buka,
      'picture' => $row->pictures
    ]
  ];

  array_push($geoJson['features'], $feature);
}

// return;


header('Content-type: application/json');
echo json_encode($geoJson);
