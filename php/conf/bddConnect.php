<?php

define('MYSQL_USER','ff_saami');
define('MYSQL_PASSWORD','ff_saami');
define('MYSQL_HOST','localhost');
define('MYSQL_DB','ff_saami');

$dsn = sprintf("mysql:host=%s;dbname=%s;", MYSQL_HOST, MYSQL_DB);
$bdd = mysqli_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DB);

global $bdd;
$cnx =& $bdd;


?>
