<?php



$ingrVoulu = ['pomme', 'cerise', 'patate', 'orange'];
$ingrNonVoulu = ['concombre'];
$recetteVoulu = ['tarte'];
$recetteNonVoulu = ['pizza'];

$recettesTrouvees = [];



function recupererRecettesParNomsRecettes($array)
{  
    $arrayRetourne = [];
    foreach($array as $recette)
    {
        $tampon = verifierRecetteExisteDansBase($recette);

        if ($tampon = true) {

            array_push($arrayRetourne,$recette;
        }

    } 
    return $arrayRetourne; 
}


function recupererRecettesParIngredients($array)
{
    $i = 1;
    $tampon = $array;
    foreach($array as $ingredient)
    {
        $arrayRetourne = recupererRecettesParIngredientsDansBase($tampon);
        
        if(empty($arrayRetourne))
        {        
            array_splice($tampon, count($tampon) - $i);
            $i++;
        }
        else
        {
            return $arrayRetourne;
        }
    }    
}


/*function recupererRecettesParIngredient($ingredient)
{
    $arrayRetourne = recupererRecettesParIngredientDb($array);
    return $arrayRetourne; 
}*/


function filtrerRecettes($ingrNonVoulu,$recetteNonVoulu) // peut etre a divisé en 2....
{  
    $newArray = [];

    if(isset($recetteNonVoulu))
    {
        foreach($recetteNonVoulu as $recette)
        {
            $key = array_search($recette, $recettesTrouvees);
            if(isset($key))
            {
                unset($recettesTrouvees[$key]);
            }
        }
                
    }

    if(isset($ingrNonVoulu))
    {
        $i = 0;
        foreach($recettesTrouvees as $recette)
        {
            foreach($ingrNonVoulu as $nonVoulu) {
                $listeIngredientsRecette = trouverIngredientDuneRecette($recette);  // retourne les ingrédients de la recette en parametre
                $key = array_search($nonVoulu, $listeIngredientsRecette);

                if(isset($key)) 
                {
                    unset($recette);
                }
                
            }
        }       
    }
    array_push($newArray,$recettesTrouvees);
    return $newArray;
}




if(!empty($recetteVoulues)) {
    $tampon = recupererRecettesParNomsRecettes($recetteVoulu);
    array_push($recettesTrouvees, $tampon);
} 

$tampon = recupererRecettesParIngredients($ingrVoulu);
array_push($recettesTrouvees, $tampon);


$tampon = filtrerRecettes($ingrNonVoulu,$recetteNonVoulu);
array_push($recettesTrouvees, $tampon);


return $recetteTrouvees;

?>
