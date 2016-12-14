<?php
include 'config.php';

//disini nama database saya adalah nama_database
$result = pg_prepare($conn, "my_query", 'SELECT gid, nama,jam_buka,pictures, st_asgeojson(geom) as geom FROM Bank');

// disini saya membuat table dengan nama Gazebo
$result = pg_execute($conn, "my_query",array());

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
