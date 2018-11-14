<?php

function error($message) {
		require("vues/header.php");
		include('vues/error.php');
		require("vues/footer.php");
		die();
}


?>
