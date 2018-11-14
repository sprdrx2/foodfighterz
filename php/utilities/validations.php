<?php

// Verifie que le tableau de paramètre $req correspont aux règles 
// déclarés dans le tableau $validations

// $validations est de la forme:
// $validations = 	
//		[ 	'nom' 	 => ['chaine','/regex/'],
//			'prenom' => ['chaine','/regex/']
//			'ddn'  	 => 'date',
//			'ageducap' => 'int',
//		], 

// return true ou false
// TODO: renvoyer un detail sur les regles qui n'étaient pas remplies

function validateClientParameters($requeteClient, $validationsRules) {

// pour chaque parametre nommé dans $validations
// on verifie qu'un parametre nommé pareil existe
// qu'il est du bon type
// si le type est une chaine verifier qu'il match la regex

	foreach($validationsRules as $ruleName => $ruleRules) {
		if (empty($requeteClient[$ruleName])) {
			return false;
		}

		$r = true;
		switch ($ruleRules[0]) {
			case "chaine":
				$pattern = $ruleRules[1];
				if(!preg_match($pattern, $requeteClient[$ruleName])) { 
					$r = false;
				}; 
				break;
			case "int":
				if(!is_int($requeteClient[$ruleName])) {
					$r = false;
				};
				break;
			case "date":
				if(!strtotime($requeteClient[$ruleName])) { 
					$r = false;
				};
				break;
			default:
				error("validation: type inconnu");
		}		
	}
	return $r;
}












?>
