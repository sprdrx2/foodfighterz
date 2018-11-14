#!/usr/bin/php

<?php

include('symlink_bddConnect.php');
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
		echo "ING:$ingredient[0]\n";

		for($i = 0; $i < 4; $i++) {
				$ingredient[$i] = trim(addslashes($ingredient[$i]));
		}

		$nom_singulier 		= $ingredient[0];
		$nom_pluriel 		= $ingredient[1];
		$alias_singulier 	= $ingredient[2];
		$alias_pluriel 		= $ingredient[3];
	
		$nom_pluriel 		= (!empty($ingredient[1])) ? $ingredient[1] : "NULL";
		$alias_singulier	= (!empty($ingredient[2])) ? $ingredient[2] : "NULL";
		$alias_pluriel 		= (!empty($ingredient[3])) ? $ingredient[3] : "NULL";

		//$ingredient nom de ingredient
		

		
		// insert de ingredient, avec id de famille 
		$sql = "INSERT INTO Ingredients (LibelleI,IdFamille,LibelleI_Pluriel,Alias_Singulier,Alias_Pluriel) VALUES('$nom_singulier',$idFamille,'$nom_pluriel','$alias_singulier','$alias_pluriel');";
		$r = mysqli_query($cnx, $sql);
		if(!$r) { echo "Erreur SQL insert ingredient: $nom_singulier\n"; };
	
	}
}

?>
