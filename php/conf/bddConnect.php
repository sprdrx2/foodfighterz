<?php

define('MYSQL_USER','foodfighterz');
define('MYSQL_PASSWORD','foodfighterz');
define('MYSQL_HOST','localhost');
define('MYSQL_DB','foodfighterz');

$dsn = sprintf("mysql:host=%s;dbname=%s;", MYSQL_HOST, MYSQL_DB);
$bdd = mysqli_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DB);

global $bdd;
$cnx =& $bdd;


?>
