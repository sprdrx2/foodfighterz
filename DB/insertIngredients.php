#!/usr/bin/php

<?php

include('tmp/Ingredients.arrays.php');

foreach ($famillesIngredients as $famille => $ingredients) {
	
	//$famille: libellé de la famille 
	// insert de famille
	
	$sql = "INSERT INTO FamillesIngredients (LibelleF) VALUES('$famille');";
	mysqli_query($cnx,$sql);
	mysql_query ($sql) or die ('Erreur SQL !');
	$sql = "SELECT idFamille FROM FamillesIngredients WHERE LibelleF='$famille';";
	$idFamille = mysqli_query($cnx,$sql);
	mysql_query ($sql) or die ('Erreur SQL !');
	// recuperation de id de famille
	
	
	foreach ($ingredients as $ingredient) {
		//$ingredient nom de ingredient

		$ingredient = rtrim(addslashes($ingredient));
			
		$sql = "INSERT INTO Ingredients (LibelleI,IdFamille) VALUES('$ingredient','$idFamille');";
		mysqli_query($cnx,$sql);
		mysql_query ($sql) or die ('Erreur SQL !');
	
		// insert de ingredient, avec id de famille 
	}
}

?>
