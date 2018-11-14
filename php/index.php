<?php

define('APPLICATION_ROOT', '/IPI/TP5/');

// chargement des classes, configurations, et fonctions utiles
$phpDirs = ["models","utilities", "conf"];
foreach ($phpDirs as $phpDir) {
	foreach (glob("$phpDir/*.php") as $phpFile) {
			include($phpFile);
	}
}

// verification que le routage est configuré
(is_array($ROUTES)) or error('routage.conf.php manquant ou erroné');
//print_r($ROUTES);
//var_dump($ROUTES["Client"][""]);

// affectation avec valeur par défaut
$REQ_CLIENT = [
	"modele"	=> (!empty($_GET["modele"])) 	? $_GET["modele"] 	: $ROUTES["default"]["model"],
	"methode" 	=> (!empty($_GET["methode"])) 	? $_GET["methode"] 	: $ROUTES["default"]["method"],
	"id"		=> (!empty($_GET["id"])) 		? $_GET["id"] 		: "",
	"post"		=> [],
];

// est ce que le modèle demandé est un des miens
if(!class_exists($REQ_CLIENT['modele'])) {
	error("modele inconnu: ".$REQ_CLIENT['modele']);
}
$model  = $REQ_CLIENT['modele'];
$method = $REQ_CLIENT['methode'];

// est ce qu'un id est fourni ?
$instanceMode = (is_numeric($REQ_CLIENT["id"]));

// est ce que j'ai une route pour le modèle demandé dans le mode demandé ?
$i = $instanceMode ? "instance" : "static";
if (!is_array($ROUTES[$model][$method][$i])) { error("pas de route pour cette requête"); }

// si oui, peut on instancier le model ? // gestion d'erreur laissé au model cause php zarbi
if ($instanceMode) { $obj = new $model($REQ_CLIENT["id"]); }

// 
$parametersRequired 	= $ROUTES[$model][$method][$i]["parametersRequired"];
$parametersGiven 		= (!empty($_POST));

// validations eventuelles des paramètres
if($parametersRequired && $parametersGiven) {
	$validations = $model::validationsPour($method);
	if (!validateClientParameters($_POST, $validations)) {
		error("parametres incorrects");
	}
}

// sanitize rapide
if(!empty($_POST)) {
	foreach($_POST as $key => $value) {
		$REQ_CLIENT["post"][$key] = addslashes($value);
	}
}

// quel est la methode à appeller ?
if($instanceMode && $parametersRequired && $parametersGiven)	{ $m = $ROUTES[$model][$method]['instance']['method']['parametersGiven']; };
if($instanceMode && $parametersRequired && !$parametersGiven)	{ $m = $ROUTES[$model][$method]['instance']['method']['parametersMissing']; };
if($instanceMode && !$parametersRequired) 						{ $m = $ROUTES[$model][$method]['instance']['method']; };
if(!$instanceMode && $parametersRequired && $parametersGiven)	{ $m = $ROUTES[$model][$method]['static']['method']['parametersGiven']; };
if(!$instanceMode && $parametersRequired && !$parametersGiven)	{ $m = $ROUTES[$model][$method]['static']['method']['parametersMissing']; };
if(!$instanceMode && !$parametersRequired)						{ $m = $ROUTES[$model][$method]['static']['method']; };

if($m != NULL) {
	// appel de la methode
	if($instanceMode && $parametersRequired && $parametersGiven)	{ $DATA = $obj->$m($REQ_CLIENT["post"]); };
	if($instanceMode && $parametersRequired && !$parametersGiven)	{ $DATA = $obj->$m(); };
	if($instanceMode && !$parametersRequired) 						{ $DATA = $obj->$m(); };
	if(!$instanceMode && $parametersRequired && $parametersGiven)	{ $DATA = $model::$m($REQ_CLIENT["post"]); };
	if(!$instanceMode && $parametersRequired && !$parametersGiven)	{ $DATA = $model::$m(); };
	if(!$instanceMode && !$parametersRequired)						{ $DATA = $model::$m(); };

	// check
	if(!$DATA) {
		error("l'operation n'a pas pu être effectuée");
	}
}	


// quelles est à la vue à afficher ?
if($instanceMode && $parametersRequired && $parametersGiven)	{ $view = $ROUTES[$model][$method]['instance']['view']['parametersGiven']; };
if($instanceMode && $parametersRequired && !$parametersGiven)	{ $view = $ROUTES[$model][$method]['instance']['view']['parametersMissing']; };
if($instanceMode && !$parametersRequired) 						{ $view = $ROUTES[$model][$method]['instance']['view']; };
if(!$instanceMode && $parametersRequired && $parametersGiven)	{ $view = $ROUTES[$model][$method]['static']['view']['parametersGiven']; };
if(!$instanceMode && $parametersRequired && !$parametersGiven)	{ $view = $ROUTES[$model][$method]['static']['view']['parametersMissing']; };
if(!$instanceMode && !$parametersRequired)						{ $view = $ROUTES[$model][$method]['static']['view']; };

// affichage
require("vues/header.php");
require("vues/$model/$view");
require("vues/footer.php");








?>
