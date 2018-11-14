<?php

class Requete {

	// PARTIE 1: parsage de la requête

	static $delimiteursSyntaxique = array(",",":", ".", ";", "_", "(", ")", "{", "}", "[", "]","!","?","/","&","  ");
	static $motsProscrits = ['recherche','recette','avec','plus','cherche','trouver'];
	//ce sera une fonction qui n'existe pas encore, qui retourne les mots composés
	static $motsComposes = [
		['motcomplet' => 'pomme de terre', 'premiermot' => 'pomme', 'longueur' => '3'],
		['motcomplet' => 'fraise des bois', 'premiermot' => 'fraise', 'longueur' => '3'],
		['motcomplet' => 'pas de', 'premiermot' => 'pas', 'longueur' => '2'],
	];
	static $motsClefMoins = ['sans','pas de','moins','-'];

	static $tmpOnVeut 		= [];
	static $tmpOnVeutPas 	= [];

	//fonction qui fait passerla requete d'une chaine de string en array de string sans délimiteurs
	static private function nettoieEtExplode($v) {

		//on met tout en minuscle
		$str = strtolower($v);

		$delimiteursSyntaxique = self::$delimiteursSyntaxique;

		//enlever les caractères spéciaux definit dans le tableau $delimiteurSyntaxique
		$traitementRequete = trim(str_replace($delimiteursSyntaxique, " ",$str));
		$traitementRequete = preg_replace('/\s{2,}/',' ',$traitementRequete);

		//on retourne un tableau de chaines, de chaque mots de la requêtes
		$mots = explode(" ", $traitementRequete); 
		
		return $mots;
	}

	// renvoie un tableau _clean_ sans les indices compris entre keyBegin et keyEnd
	// clean = indices qui se suivent
	static private function tableauCleanSansIndice($array, $keyBegin, $keyEnd) {
		$newArray = [];
		foreach ($array as $k => $a) {
			if(!(($k >= $keyBegin) && ($k <= $keyEnd))) {
				array_push($newArray,$a);
			}
		}
		return $newArray;
	}


	//fonction qui va gere les mots composé
	static private function unifieMotsComposes($array) {

		$motsComposes = self::$motsComposes;   
		foreach ($motsComposes as $t) {
				    
			$keys = array_keys($array,$t['premiermot']);
					
			for ($j = 0; $j < count($keys); $j++) {
					$key = array_search($t['premiermot'],$array);
					$debutMot = $key;
					$finMot = $key + ($t['longueur'] - 1);
					// on verifie que apres le mot il y a assez de place pour faire le mot composé, dans ce cas on test
					if($finMot < count($array)) {

						$motDepile = "";
						for ($i = $debutMot; $i <= $finMot; $i++) {
							$motDepile += $array[$i];
						}
						if($motDepile == $t['motcomplet']) {
							$array[$key] = $t['motcomplet'];
							$array = self::tableauCleanSansIndice($array, ($debutMot + 1), $finMot);
						}
					}
			}
		}
		return $array;
	}

	//parcours l'array en parametre et cherche dedans s'il contient des mots de l'array $motProscrit. si oui, ma fonction ecrase ces mots et me renvoie un nouveau array $listeMot sans les mots proscrit
	static private function supMotsInutiles($array) {
		$motsProscrits = self::$motsProscrits;
		foreach($motsProscrits as $motProscrit) {

		    //on cherche si les mots proscrit sont dans notre liste de mots et on les efface
		    $key = array_search($motProscrit, $array);
			$array = self::tableauCleanSansIndice($array, $key, $key);
		}
		return $array;
	} 

	// parcours array, si un element fais partie de motsClefMoins,
	// cet element est enlevé, et l'élément suivant est précédé du signe -
	static private function traitementDesMoins($array) {
			$motsClefMoins = self::$motsClefMoins;
			$keys = [];
			# on note les indices
			foreach ($array as $key => $value) {
				if (in_array($value, $motsClefMoins)) {
					$keyPlusOne = $key + 1;
					$array[$keyPlusOne] = "-$array[$keyPlusOne]";
					unset($array[$key]);
				}
			}
			return $array; 
	}

	// les éléments d'array précédés d'un - sont envoyé dans le tableau tmpOnVeutPas,
	// les autres dans tmpOnVeut
	static private function dispatchVeutVeutPas($array) {
		$tmpOnVeut 		= &self::$tmpOnVeut;
		$tmpOnVeutPas 	= &self::$tmpOnVeutPas;
		foreach($array as $a) {
			if ($a[0] == "-") {
				array_push($tmpOnVeutPas,str_replace('-','',$a));
			} else {
				array_push($tmpOnVeut, $a);
			}
		}	
	}

	/// BOUCLE PRINCIPALE, appelle les autres fonctions
	static public function parse($saisieUtilisateur) {
		// 1er traitement de la requete, array contenant la requete utilisateur sans les espaces,marqueurs synthaxiques etc..
		$saisieClean = self::nettoieEtExplode($saisieUtilisateur);
		//var_dump($saisieClean);

		// 2eme traitement de la requete, rassemble les valeurs de l'array formant un mot composé en une seule valeur de l'array
		$saisieClean = self::unifieMotsComposes($saisieClean); 
		//var_dump($saisieClean);

		// 3eme traitement array contenant la requete utilisateur sans les mots proscrit
		$saisieClean = self::supMotsInutiles($saisieClean); 
		//var_dump($saisieClean);

		// 4e passe traitement des "moins" / "pas de" / "-"
		$saisieClean = self::traitementDesMoins($saisieClean);
		//var_dump($saisieClean);

		// dispatch ce que l'on veut et ce que l'on veut pas vers des tableaux différents
		self::dispatchVeutVeutPas($saisieClean);
	
		return [self::$tmpOnVeut, self::$tmpOnVeutPas];
	}
}

