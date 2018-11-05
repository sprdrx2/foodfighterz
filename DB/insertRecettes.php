#!/usr/bin/php
<?php

include('connexion.php');

foreach (glob('tmp/recettes/*.recette.php') as $recette_file) {
	include($recette_file);
	echo "insertion recette: $titre\n";

	// $titre		: titre de la recette (champ LibelleR)
	// $instructions : texte des instructions

	// insertion dans la table Recettes
	$titre = addslashes($titre); $instructions = addslashes($instructions);
	$query = sprintf("insert into Recettes (libelleR, instructions) values ('%s', '%s');", $titre, $instructions);
	mysqli_query($cnx,$query) or die('Erreur insertion recette');
	
	sleep(1);

	// recupération de l'id de la table nouvellement créée.
	$query = sprintf('select idRecette from Recettes where libelleR = \'%s\';', $titre);
	$query_result = mysqli_query($cnx,$query) or die('Erreur select idRecette');
	$idRecette = $query_result->fetch_row()[0];

	foreach ($ingredients as $ingredient) {
		$ing_name 	= $ingredient[1]; // nom de l'ingredient.
		$qte 		= $ingredient[0]; // quantité de cet ingrédient dans la recette.

		if ($qte == '0') { $qte = 'NULL'; }
		$ing_name 	= addslashes($ing_name);
		$qte		= addslashes($qte);

		// récuperation de l'id de l'ingredient
		$query = sprintf('select idIngr from Ingredients where libelleI = \'%s\';', $ing_name);
		$query_result = mysqli_query($cnx,$query) or die('Erreur select idIngr');
		$idIngredient = $query_result->fetch_row()[0];

		// insertion dans la table composer
		// (idrecette, idingredient, quantité)
	
		$query = sprintf("insert into composer (idRecette, idIngr, quantite) values (%d, %d, '%s')", $idRecette, $idIngredient, $qte);
		mysqli_query($cnx,$query) or die('Erreur insert composer:'.$query." ingredient: $ing_name");

	}
	
}

?>
