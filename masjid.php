<?php
include 'config.php';
header('Content-type: application/json');

//disini nama database saya adalah nama_database
$result = pg_query($conn, 'SELECT gid, namamasjid,kapasitas, st_asgeojson(geom) as geom FROM Masjid');


// jika dekat dengan jalan
if (@$_GET['jalan'] && $_GET['jalan'] != 'semua') {
  $query = "select nama, st_astext(geom) from jalan where nama = '{$_GET['jalan']}'";

  $jalan = pg_query($conn, $query);

  $jalan = pg_fetch_assoc($jalan);
  $jalan_geom_text = $jalan['st_astext'];

  $radius = @$_GET['radius'] ? $_GET['radius'] : 50;

  $query = "select gid, namamasjid, kapasitas, st_asgeojson(geom) as geom from masjid where st_dwithin(geom, st_geomfromtext('{$jalan_geom_text}'), {$radius})";
  
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
      'kapasitas' => $row->kapasitas
    ]
  ];

  array_push($geoJson['features'], $feature);
}

// return;


echo json_encode($geoJson);
