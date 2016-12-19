<?php
include 'boot/starter.php';

//disini nama database saya adalah nama_database
$result = pg_query($conn, 'SELECT gid, namamasjid,kapasitas, pictures, st_asgeojson(geom) as geom FROM Masjid');


// jika dekat dengan jalan
if (@$_GET['nearby'] && @$_GET['gid']) {
  $table_nearby = $_GET['nearby'];
  $gid = (int) $_GET['gid'];

  $radius = @$_GET['radius'] ? $_GET['radius'] : 50;

  $query = "select masjid.gid, masjid.namamasjid, masjid.kapasitas, masjid.pictures, st_asgeojson(masjid.geom) as geom from masjid, {$table_nearby} where st_dwithin(masjid.geom, {$table_nearby}.geom, {$radius}) and {$table_nearby}.gid = {$gid}";

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
      'nama' => $row->namamasjid,
      'kapasitas' => $row->kapasitas,
      'picture' => $row->pictures

    ]
  ];

  array_push($geoJson['features'], $feature);
}

// return;

header('Content-type: application/json');
echo json_encode($geoJson);
