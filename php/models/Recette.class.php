<?php


class Recettes {

		public $libelle;
		public $ingredients;
		public $instructions;
		public $id;

		static private $validations = [
			'inserer' => [ 
				'nom' => ['chaine', "/.*/"],
				'instructions' => ['chaine',"/.*/"],
				//'ingredientsNumber' => ['int'],	
			],
			'modifier' => [
				'nom' => ['chaine', "/^.{10,}$/"],
				'instructions' => ['chaine',"/^.{10,}$/"],
			],
		];

		function __construct($id) {
			$bdd = $GLOBALS['bdd'];
			$req = $bdd->query("select * from Recettes where idRecette=$id;");
			if(!self::existeParId($id)) { error("Recettes: id inconnu $id."); }
			$rec = $req->fetch_array();
			
			$this->libelle 			= $rec['LibelleR'];		
			$this->instructions		= $rec['instructions'];
			$this->id		 	 	= $rec['idRecette'];
			$this->ingredients 		= $this->getIngredients();	
		}
		
		// static prives
		static private function existeParLibelle($libelle) {
			$bdd = $GLOBALS['bdd'];
			$reqDoublon = $bdd->query("select idRecette from Recettes where libelleR=upper('$libelle');");
			if ($reqDoublon->num_rows == 0){
				return false; // Si la requete ne renvoie rien
			} 
			return true; // Si la requete renvoie qqch
		}
	
		static private function existeParId($id) {
			$bdd = $GLOBALS["bdd"];
			$req = 	$bdd->query("select idRecette from Recettes where idRecette=$id;");
			if ($req->num_rows == 0){   // Si la requête ne renvoie rien 
				return false;
			}
			return true; // Si la requete renvoie qqch
		}

		// static publics
		static function validationsPour($methode) {
			// si la methode exist dans le tableau
			if(!empty(self::$validations[$methode])) {
				return self::$validations[$methode];
			} else {
				return NULL;
			}
		}

		static function inserer($data) {
			$libelle		= $data["nom"];
			$instructions	= $data["instructions"];

			$bdd = $GLOBALS['bdd'];

			if (self::existeParLibelle($libelle)){
				error("cette recette existe déjà");
			}
			$reqInsert = $bdd->query("insert into Recettes (libelleR,instructions) values(upper('$libelle'),'$instructions');");
			sleep(1);
			$id = $bdd->query("select idRecette from Recettes where libelleR = upper('$libelle');")->fetch_row()[0];
			$nr = new Recettes($id);
			$ingredients = [];
			for($i = 1; $i <= $data["ingredientsNumber"]; $i++) {
				$ingredients[$i]["qte"] = addslashes(trim($_POST["qte_ingredient_$i"]));
				$ingredients[$i]["id"] = addslashes(trim($_POST["ingredient_$i"]));
			}
			$nr->setIngredients($ingredients);
			return $reqInsert;
		}

		static function getAll() {
			$recettes = [];			
			$query = "select idRecette from Recettes;";
			$bdd = $GLOBALS['bdd'];
			$idListe = $bdd->query($query);
			foreach ($idListe as $id) {
				array_push($recettes, new Recettes($id["idRecette"]));
			}
			return $recettes;
		}

		// méthode d'instances
		function getThis() {
			return $this;
		}
			
		function supprimer() {
			$id = $this->id;
			$bdd = $GLOBALS['bdd'];
	
			if(!self::existeParId($id)){
				error("delete: recette inexistante");
			}
			$reqDelete = $bdd->query("delete from Recettes where idRecettes =$id;");
			return $reqDelete;

		}

		function modifier($data) {
			$libelle		= $data["libelle"];
			$instructions	= $data["instructions"];
			$ingredients	= $data["ingredients"];

			$bdd 	= $GLOBALS['bdd'];
			$id = $this->id;

			if(!self::existeParId($id)){		
				error("modifier: idRecette inconnu"); 
			}
			$reqUpdate = $bdd->query("update Recettes set libelle=upper('$libelle'),instructions='$instructions' where idRecette=$id;");
			$this->setIngredients($ingredients);
			return $reqUpdate;
		}
		
		// gestion des ingredients
		private function getIngredients() {
				$id 		= $this->id;
				$bdd 		= $GLOBALS['bdd'];
				$ingredients = $bdd->query("select quantite, libelleI from composer natural join Ingredients where idRecette = $id;");
				return $ingredients;
		}

		private function delIngredients() {
				$id = $this->id;
				$bdd 	= $GLOBALS['bdd'];
				$reqDel = $bdd->query("delete from composer where idRecette = $id;");
		}
			
		private function setIngredients($ingredients) {
				$this->delIngredients();
				$bdd 	= $GLOBALS['bdd'];
				$idR = $this->id;
				foreach($ingredients as $ingredient) {
					$ingId  = $ingredient["id"];
					$ingQte = $ingredient["qte"];
					$bdd->query("insert into composer (idIngr, idRecette, quantite) values ($ingId, $idR, '$ingQte')");
				}
		}

		// les mastodontes
		static public function recherche($requete) {
			$requette = parseRequete($requete);
		}

		static private function parseRequete($requete) {

		}
}

























	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

?>
