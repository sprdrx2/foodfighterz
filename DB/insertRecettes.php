#!/usr/bin/php
<?php

include('db_connect.php');

foreach (glob('tmp/recettes/*.recette.php') as $recette_file) {
	include($recette_file);

	// $titre		: titre de la recette (champ LibelleR)
	// $instructions : texte des instructions

	// insertion dans la table Recettes
	$titre = addslashes($titre); $instructions = addslashes($instructions);
	$query = sprintf("insert into Recettes (libelleR, instructions) values ('%s', '%s');", $titre, $instructions);

	// recupération de l'id de la table nouvellement créée.
	$query = sprintf('select id from Recettes where libelleR = \'%s\';', $titre);

	foreach ($ingredients as $ingredient) {
		$ing_name 	= $ingredient[1]; // nom de l'ingredient.
		$qte 		= $ingredient[0]; // quantité de cet ingrédient dans la recette.

		$ing_name 	= addslashes($ing_name);
		$qte		= addslashes($qte);

		// récuperation de l'id de l'ingredient
		$query = sprintf('select id from Ingredients where libelleI = \'%s\';', $ing_name);

		// insertion dans la table composer
		// (idrecette, idingredient, quantité



	}
	
}

?>
