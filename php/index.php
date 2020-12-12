<?php
// ユーザー名やパスワードなどは、
$dsn = 'pgsql:dbname=pgdb;host=postgres-db';
$db = new PDO($dsn, 'pgdb', '12017');

$sql = 'SELECT * FROM test ';
echo '<pre>';
foreach ($db->query($sql) as $row) {
  var_dump($row);
}
echo '</pre>';
