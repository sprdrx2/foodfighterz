<?php 

//recuperation saisi utilisateur

$saisieUtilisateur = $_POST['']; // ingredients que l'on veut  et que l'on veut pas. recettes que l'on veut et que l'on veut pas.

if (recettes ok dans base) {

    renvoie listes (temporaire?) recette;
}

else (recettes !ok dans base) {

    renvoie recettes contenant tout les ingredients demandés;
    cad on parcours un tableau d.ingredients associé a une recette  et on match les recettes dont le tableau d.ingredients contient tout les ingredients saisie par l.utilisateur;
}

//fonction filtre
if(le else d.en haut = null) {

    //filtre = tableau d.ingredient saisie par l.utilisateur - 1 ingredient;
    $ingredientUtilisateur = [liste d.ingredients];
    $filtre = $ingredientUtilisateur.length-1;
    $tableauFiltre = parcours $ingredientUtilisateur et lui enleve a chaque parcours un ingredient different;
    renvoie des $filtres compatibles avec le $ingredientUtilisateur;
    on utilise le 1er else sur ces $filtres;
}

if(fonction filtre = null) {

    message d.erreur? suggestion?
}

if(fonction filtre = ok) {

    on renvoie une liste temporaire, c.est a dire que l.on retourne au 1er if;
}


// une fois la liste temporaire d'ingredients obtenus, on lui applique un traitement de suppression d'ingredients/recettes non desires

//ce if recupere les ingredients/recette non voulu dans une variable
if (mot-clé 'sans' = true ) {

    while(('sans'.$ingredient) || ('sans'.$recette)) {
    
        $ingredienstBannie = $_POST[''];
        $recetteBannie = $_POST[''];
    }

}

$listeTemporaire = [d.ingredients];

for(i=0 ; i<$listeTemporaire.lengt; i++) { // for ou foreach

    if(($ingredienstBannie in $listeTemporaire) || ($recetteBannie in $listeTemporaire)) {

        $listeTraité = $listeTemporaire[i] - $listeTemporaire[$recetteBannie] - $listeTemporaire[$ingredienstBannie];
    }

}

if ($listeTraité = null) {

    on reutilise la fonction filtre d.en haut mais au lieu d.enlever un ingredient non présent dans la recette , on enleve $ingredienstBannie ou $recetteBannie;
    on repasse aussi dans les if si on obtient filtre null(dans ce cas erreur ou non trouvé?) ou !null (dans ce cas on va au else ci dessous);
}

else($listeTraité= !null) {

    //traitement de $listeTraité[] par nombre d'ingredient en plus  ou il y en a le moins possible de ces ingredients en plus ^^
    for(i=0 ; i<$listeTraité.length; i++) { // for ou foreach

        for(j=0; j<$listeIngredient.length; j++) {

            if($listeIngredient.[i] = $ingredientEnPlus) { 

                count $ingredientEnPlus; // un entier
                retourne $listeIngredient order by $ingredientEnPlus;
            }
            on obtient donc une $listeTraitéTrié qu.on renvoie en affichage;
        }

    }

   
}


?>