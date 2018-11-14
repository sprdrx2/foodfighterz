<?php

$ROUTES = [
		"Recettes" => [
			"inserer" => [
				"static" => [ 
					"parametersRequired" => true,
					"view" => [ 
						"parametersMissing" => "inserer-recette.form.php",
						"parametersGiven" 	=> "inserer-recette.result.php",
					],
					"method" => [
						"parametersGiven" 	=> "inserer",
						"parametersMissing" => NULL,
				 	],
				],
			],
			"modifier" => [
				"static" => [ 
					"parametersRequired" => false, 
					"view" 		=> "modifier-recette.form-choix.php",
					"method" 	=> "getAll",
				],
				"instance" => [
					"parametersRequired" => true, 
					"view" => [
						"parametersGiven" 	=> "modifier-recette.result.php",
						"parametersMissing" => "modifier-recette.form-form.php",
					],
					"method" => [
						"parametersGiven" 	=> "modifier",
						"parametersMissing" => "getThis",
					],
				],
			],
			"supprimer" => [
				"static" => [ 
					"parametersRequired" => false,
					"view" 				 => "supprimer-recette.form.php",
					"method" 			 => "getAll",
				 ],
				"instance" => [
					"parametersRequired" => false, 
					"view" 				 => "supprimer-recette.result.php",
					"method" 			 => "supprimer",	
				],
			],
			"liste" => [
				"static" => [ 
					"parametersRequired" => false,
					"view"				 => "liste-recettes.php",
					"method" 			 => "getAll",
				],
			],
			"afficher" => [
				"instance" => [ 
					"parametersRequired" => false,
					"view" 				 => "afficher-recette.php",
					"method"	 		 => "getThis",
				],
			],
			"rechercher" => [
				"static" => [
					"parametersRequired" => true,
					"view" => [
						"parametersGiven" 	=> "afficher-recherche-recettes-resultat.php",
						"parametersMissing" => "afficher-recherche-recettes-form.php",	
					],
					"method" => [
						"parametersGiven"   => "rechercher",
						"parametersMissing" => NULL
					],
				],	
			],
		],
		"Ingredients" => [
			"inserer" => [
				"static" => [ 
					"parametersRequired" => true,
					"view" => [ 
						"parametersMissing" => "inserer-ingredient.form.php",
						"parametersGiven" 	=> "inserer-ingredient.result.php",
					],
					"method" => [
						"parametersGiven" 	=> "inserer",
						"parametersMissing" => NULL,
				 	],
				],
			],
			"modifier" => [
				"static" => [ 
					"parametersRequired" => false, 
					"view" 		=> "modifier-ingredient.form-choix.php",
					"method" 	=> "getAll",
				],
				"instance" => [
					"parametersRequired" => true, 
					"view" => [
						"parametersGiven" 	=> "modifier-ingredient.result.php",
						"parametersMissing" => "modifier-ingredient.form-form.php",
					],
					"method" => [
						"parametersGiven" 	=> "modifier",
						"parametersMissing" => "getThis",
					],
				],
			],
			"supprimer" => [
				"static" => [ 
					"parametersRequired" => false,
					"view" 				 => "supprimer-ingredient.form.php",
					"method" 			 => "getAll",
				 ],
				"instance" => [
					"parametersRequired" => false, 
					"view" 				 => "supprimer-ingredient.result.php",
					"method" 			 => "supprimer",	
				],
			],
			"liste" => [
				"static" => [ 
					"parametersRequired" => false,
					"view"				 => "liste-ingredients.php",
					"method" 			 => "getAll",
				],
			],
			"afficher" => [
				"instance" => [ 
					"parametersRequired" => false,
					"view" 				 => "afficher-ingredient.php",
					"method"	 		 => "getThis",
				],
			],
		],
		"Recherche" => [
			"recherche" => [
				"static" => [
					"parametersRequired"	=> false,
					"view"					=> "recherche-resultat.php",
					"method"				=> "recherche",
				],
			],
		],
		"default" => [ "model" => "Recettes", "method" => "liste" ]
];

?>
