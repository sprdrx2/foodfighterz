<?php

class Recherche {
	
	static $onVeut 		= [];
	static $onVeutPas 	= [];
	static $elementsRetiresDeLaRequetes = [];
	//static $bdd = $GLOBALS["bdd"];

	function __construct() { /* do nothing */ }

	// return toutes les combinaisons de taille $array - n
	private static function arrayCombinaisonsMoinsN($array, $n) {
		
	}

	//
	private function chercheParNomEtIngredients($onVeutArray) {
		$recettesTrouvees = [];
		foreach($onVeutArray as $onVeutItem) {
			$i = addslashes($onVeutItem);
			// a-t-on quelque chose en cherchant par ingredient ?
			// sinon on cherche par nom de recette
			$where 	= "LibelleI = '$i' or LibelleI_Pluriel = '$i' or Alias_Singulier = '$i' or Alias_Pluriel = '$i'";
			$query 	= "select idRecette from Recettes natural join composer natural join Ingredients where $where";		
			$queryResult = self::$bdd->query($query);
			if($queryResult->row_count == 0) {
					$where 	= "LibelleR like '*$i*'";
					$query 	= "select idRecette from Recettes natural join composer natural join Ingredients where $where";		
					$queryResult = self::$bdd->query($query);
			}
			array_push($recettesTrouvees, ["$onVeutItem" => $queryResult]);
		}
		return $recettesTrouvees;		
	}

	private function combineCandidates() {

	}

	//
	private function filtre($recettesCandidates) {
		$recettesFiltrees = [];
	}
	
	//// FONCTION PRINCIPALE

	public static function recherche() {
		//$requeteParse = Requete::parse($_GET['q']);
		$testSaisieU = "recherche nutella avec pizza, pomme de terre, /, _, olive jambon-beurre jambon - fromage sans carotte plus mozarrella pas de champignon, fraise des bois moins citron pomme de terre pomme";
		$requeteParse = Requete::parse($testSaisieU);
		self::$onVeut 	 = 	$requeteParse[0];
		self::$onVeutPas = 	$requeteParse[1];

		// est ce que des recettes existent pour chacun de ces ingredients ?
		// si non => c'est mort
		// si oui est ce que des recettes existent avec tous ces ingredients ? 
		// si rien, diminuer le nombre d'ingredients jusqu'à qu'on ait quelque chose
		$recettesCandidates = self::chercheParNomEtIngredients(self::$onVeut);
		if(!$recettesCandidates) { /* c'est mort */ }
		$rc = self::combineCandidates($onVeut, $recettesCandidates);
		$nbPasses = 0;
		while (!$recettesCandidates) {
			$nbPasses++;
			$recettesCandidates = self::combinesCandidates(arrayCombinaisonsMoinsN($onVeut, $nbPasses),$srecettesCandidates);
		}

		// application des filtres
		// si rien diminuer le nombre de filtres jusqu'à qu'on ait quelque chose
		$recettesFiltrees = self::filtre($recettesCandidates);
		$nbPasses = 0;
		while(!$recettesFiltrees) {
			$nbPasses++;
		}
						
		return($recettesFiltrees);
	}
}

?>


