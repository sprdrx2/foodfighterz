<?php


class Ingredients {

		public $nom_singulier;
		public $nom_pluriel;
		public $alias_singulier;
		public $alias_pluriel;	
		public $famille;

		static private $validations = [
			'inserer' => [ 
				'nom_singulier' 	=> ['chaine', "/^[a-zA-Zéèàü\-\s']{2,}$/"],
				'nom_pluriel' 		=> ['chaine', "/.*/"],
				'alias_singulier' 	=> ['chaine', "/.*/"],
				'alias_pluriel' 	=> ['chaine', "/.*/"],
			],

			'modifier' => [
				'nom_singulier' 	=> ['chaine', "/^[a-zA-Zéèàü\-\s']{2,}$/"],
				'nom_pluriel' 		=> ['chaine', "/*/"],
				'alias_singulier' 	=> ['chaine', "/*/"],
				'alias_pluriel' 	=> ['chaine', "/*/"],
			],
		];

		function __construct($id) {
			$bdd = $GLOBALS['bdd'];
			$req = $bdd->query("select * from Ingredients where idIngr=$id;");
			if(!self::existeParId($id)) { error("ingredient: id inconnu $id."); }
			$ing = $req->fetch_array();
	
			$this->nom_singulier  	= $ing['LibelleI'];		
			$this->nom_pluriel	 	= $ing['LibelleI_Pluriel'];
			$this->alias_singulier	= $ing['Alias_Singulier'];
			$this->alias_pluriel 	= $ing['Alias_Pluriel'];		
			$this->id				= $ing['idIngr'];
			$this->idFamille		= $ing['idFamille'];
		}
		
		// static prives	
		static private function existeParId($id) {
			$bdd = $GLOBALS["bdd"];
			$req = 	$bdd->query("select idIngr from Ingredients where idIngr=$id;");
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
			$nom_singulier		= $data["nom_singulier"];
			$nom_pluriel		= $data["nom_pluriel"];
			$alias_singulier	= $data["alias_singulier"];
			$alias_pluriel		= $data["alias_pluriel"];
			$idFamille			= $data["idFamille"];

			$bdd = $GLOBALS['bdd'];

			/*if (self::existeParNomPrenom($nom,$prenom)){
				error("cet utilisateur existe déjà");
			}*/
			$reqInsert = $bdd->query("insert into Ingredients(LibelleI,LibelleI_Pluriel,Alias_Singulier,Alias_Pluriel,idFamille) values(upper('$nom_singulier'),upper('$nom_pluriel'),upper('$alias_singulier'),upper('$alias_pluriel'), $idFamille);");			
			return $reqInsert;
		}

		static function getAll() {
			$ingredients = [];			
			$query = "select idIngr from Ingredients;";
			$bdd = $GLOBALS['bdd'];
			$idListe = $bdd->query($query);
			foreach ($idListe as $id) {
				array_push($ingredients, new Ingredients($id["idIngr"]));
			}
			return $ingredients;
		}

		// méthode d'instances
		function getThis() {
			return $this;
		}
			
		function supprimer() {
			$id = $this->id;
			$bdd = $GLOBALS['bdd'];
	
			if(!self::existeParId($id)){
				error("delete: ingredient inexistant");
			}
			$reqDelete = $bdd->query("delete from Ingredients where idIngredient =$id;");
			return $reqDelete;

		}

		function modifier($data) {
			$nom_singulier		= $data["nom_singulier"];
			$nom_pluriel		= $data["nom_pluriel"];
			$alias_singulier	= $data["alias_singulier"];
			$alias_pluriel		= $data["alias_pluriel"];
			$idFamille			= $data["idFamille"];

			$bdd 	= $GLOBALS['bdd'];
			$id = $this->id;

			if(!self::existeParId($id)){		
				error("modifier: idClient inconnu"); 
			}
			$reqUpdate = $bdd->query("update Ingredients set LibelleI=upper('$nom_singulier'),LibelleI_Pluriel=upper('$nom_pluriel'),Alias_Singulier=upper('$alias_singulier'),Alias_Pluriel=upper('$alias_pluriel') where idIngr=$id;");
			return $reqUpdate;
		}

}
























	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

?>
