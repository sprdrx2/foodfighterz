<?php

// traitement saisi utilisateur

$saisiUtilisateur = $_POST[''];

//$saisiUtilisateur est une chaine de string , que l'on va parcourir
utiliser( la trouver d.abord ^^) la fonction php pour faire sauter les delimiteurs synthaxiques de notre chaine de string(pour l.instant on garde le trait d.union);
utiliser( la trouver d.abord ^^) la fonction php pour faire sauter les doubles espaces de notre chaine de string;

$listeMot = ['chaque mot situé entre 2 espaces'];

//$listeMot = ['mot', 'mot', 'mot','mot'];
$mot = '';
$motProscrit = ['recherche','recette','avec','en plus',....];

foreach($listeMot as $mot) {

    if($mot in $motProscrit) {

        $mot = !null;// cad qu'il existe dans notre liste de mots proscrits , definitivement ingorés
    }

    else (!$mot in $motProscrit) {

        $mot= null; // cad qu'il ne fait pas parti de la liste de mots proscrits, on le garde
    }
}

$ingredients = ['tomate','choux','escalope'.....];
$motClé = ['sans','pas de','-',...];

if($mot in $motClé) {

    'sans'=> indice i d.un tab, $mot[i+1] = $tabMotBannie=[''];//cad que le mot apres le $motClé est stocké ailleurs pour une utilisation ultérieure, cf alogoRecherche;

}

if($mot in $ingredients) {}





































































































































?>