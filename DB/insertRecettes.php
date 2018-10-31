#!/usr/bin/php
<?php

foreach (glob('tmp/recettes/*.recette.php') as $recette_file) {
	include($recette_file);

	echo "titre: $titre\n";
	echo "Ingredients:\n";
	foreach ($ingredients as $ingredient) {
		$ing = $ingredient[1];
		$qte = $ingredient[0];
		echo "\t$ing, qte: $qte\n";
	}
	echo "Instructions:\n";
	echo $instructions;
}

?>
