<?php



$_db = new PDO('mysql:host='.HOST.';dbname='.DBNAME, USER,PASS);

verifierRecetteExisteDansBase($nomRecette) {     
    
        $req = $_db -> prepare('SELECT libelleR FROM recette WHERE libelleR = :libelleR');
        $req -> execute(array('libelleR' => $nomRecette));
        $row = $req -> fetchAll();

        if($row['libelleR'] == $nomRecette)
        {
            return true;
        }  
        else
        {
            return false;
        } 
}



recupererRecettesParIngredientsDansBase($arrayIngredient) {

    $req = $_db -> prepare('SELECT LibelleR FROM recette JOIN composer ON  composer.idRecette = recette.idRecette
    JOIN ingredient ON ingredient.idIngr = composer.idIngr WHERE ingredient.libelleI = :libelleI'); 

    $arrayRetourne = []; //le tableau retourné
    $i = 0;
    $bool = false;

    foreach($arrayIngredient as $ingredient) // parcours les ingredients pour lesquels on cherche une recette
    {

        $req -> execute(array('libelleI' => $ingredient));
        $rows = $req -> fetchAll(); // recupère les recettes de l'ingrédient voulu

        if(isset($rows))
        {
            if($bool = false)
            {
                $arrayRetourne = $rows; // premiere instanciation du tableau retourné
                $bool = true;
            }
            array_intersect($arrayRetourne, $rows); // comparaison avec la listes précédente de recettes
        }
    }
    return $arrayRetourne;
}



trouverIngredientDuneRecette($nomRecette) {

    $select = $_db -> prepare('SELECT LibelleI FROM ingredient JOIN composer ON ingredient.idIngr = composer.idIngr 
    JOIN recette ON composer.idRecette = recette.idRecette WHERE recette.libelleR = :libelleR');

    $select -> execute(array('libelleR' => $nomRecette));
    $rows = $req -> fetchAll();

    return $rows;
}

?>
