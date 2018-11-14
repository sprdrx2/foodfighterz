<?php $bdd = $GLOBALS["bdd"]; $famillesIngredients = $bdd->query("select * from FamillesIngredients;"); ?>
<datalist id="famillesIngredients">
<?php foreach($famillesIngredients as $famille) {?>
		<option value="<?php echo $famille["idFamille"]; ?>"><?php echo $famille["LibelleF"]; ?></option> 
<?php }?>
</datalist>

<!--Corps de la page-->
	<div class="container">
		<div class="row">
                    <form action="?modele=Ingredients&methode=inserer" method="post">
                    
                        <div class="col col-lg-8 col-md-8 col-sm-8 col-xs-8">
                        <div class="form-group text-center">
                            
                                <div class="elem">
                                    <label for="nomIngr" > Nom de l'ingredient :</label>
                                    <input type="text" id="nomIngr" name="nom_singulier" class="form-control wordDisp"/> 
                                </div>

                                <div class="elem">
                                    <label for="nomPlurierIngr" > Nom de l'ingredient (pluriel) (facultatif):</label>
                                    <input type="text" id="nomPlurierIngr" name="nom_pluriel" class="form-control wordDisp" value="null"/> 
                                </div>

                                <div class="elem">
                                    <label for="aliasIngr" > Autre nom connu de l'ingredient (facultatif):</label>
                                    <input type="text" id="aliasIngr" name="alias_singulier" class="form-control wordDisp" value="null"/> 
                                </div>

                                <div class="elem">
                                    <label for="aliasPlurielIngr" > Autre nom connu de l'ingredient (pluriel) (facultatif):</label>
                                    <input type="text" id="aliasPlurielIngr" name="alias_pluriel" class="form-control wordDisp" value="null"/> 
                                </div>

                                <div class="elem">
                                    <label for="famIngr" > Famille d'ingredient :</label>
                                    <input type="select" class="form-control" id="famIngr" list="famillesIngredients" name="idFamille"/>
                                </div>                
                            


                            <div class="elem">
                                <input type="submit" class="btn btn-block btn-md btn-info form-control" id="btn" value="Valider"/>
                            </div>
                        </div>
                        </div>
                    </form>
                </div>
        </div>
<!--Fin Corps de la page-->

