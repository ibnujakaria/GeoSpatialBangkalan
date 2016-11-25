<?php

$aksi = @$_GET['aksi'];
$nama = @$_GET['nama'];
$jam_buka = @$_GET['jam_buka'];
$gid = @$_GET['gid'];


$conn = pg_connect("host=localhost port=5432 dbname=bangkalan user='postgres'
password='basit'");



if (!$aksi) {
  echo "Not found";
}

if ($aksi == 'tambah') {
  echo "nambah data ";
} elseif ($aksi == 'edit') {
  $query = "update Bank set nama='{$nama}',jam_buka='{$jam_buka}' where gid = {$gid}";
  $result = pg_prepare($conn, "my_query", $query);
  $result = pg_execute($conn, "my_query",array());
}
