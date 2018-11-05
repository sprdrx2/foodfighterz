#!/usr/bin/php

<?php

include('connexion.php');
include('tmp/Ingredients.arrays.php');

foreach ($famillesIngredients as $famille => $ingredients) {
	
	//$famille: libellé de la famille 
	// insert de famille
	
	$sql = "INSERT INTO FamillesIngredients (LibelleF) VALUES('$famille');";
	mysqli_query($cnx, $sql) or die ('Erreur SQL insert famille!');
	$sql = "SELECT idFamille FROM FamillesIngredients WHERE LibelleF='$famille';";
	$query_result = mysqli_query($cnx,$sql) or die('Erreur SQL select idFamille');
	$idFamille = $query_result->fetch_row()[0];

	
	foreach ($ingredients as $ingredient) {
		
		//$ingredient nom de ingredient
		$ingredient = rtrim(addslashes($ingredient));
			
		$sql = "INSERT INTO Ingredients (LibelleI,IdFamille) VALUES('$ingredient',$idFamille);";
		mysqli_query($cnx, $sql) or die ('Erreur SQL insert ingredient!');
	
		// insert de ingredient, avec id de famille 
	}
}

?>
