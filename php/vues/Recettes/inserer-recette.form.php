<datalist id="famillesRecettes">
	<?php $ingredients = Ingredients::getAll(); ?>
	<?php foreach($ingredients as $ingredient) { ?>		
			<option value="<?php echo $ingredient->id; ?>"><?php echo $ingredient->nom_singulier; ?></option>
	<?php } ?>
</datalist>

<datalist id="ingredientsList">
	<?php $ingredients = Ingredients::getAll(); ?>
	<?php foreach($ingredients as $ingredient) { ?>		
			<option value="<?php echo $ingredient->id; ?>"><?php echo $ingredient->nom_singulier; ?></option>
	<?php } ?>
</datalist>


<!--Corps de la page-->
	<div class="container">
		<div class="row">
                    <form action="?modele=Recettes&methode=inserer" method="post">
                    
                        <div class="col col-lg-8 col-md-8 col-sm-8 col-xs-7">
                        <div class="form-elem form-group text-center">                     
                            
                            
                                <div class="elem">
                                    <!--<label for="nomRecette" > Nom de la recette :</label>-->
                                    <input type="text" id="nomRecette" class="form-control wordDisp" placeholder="Nom de la recette" name="nom"/>  
                                </div>

                                <div class="elem">
                                    <label for="famRecette" > Categorie de la recette :</label>
                                    <input type="select" class="form-control select" id="familleRecette" list="famillesRecettes">
                                </div>  
                            
								<div class="elem">
									<textarea class="form-control" rows="20" name="instructions"></textarea>
								</div>

                        </div>
                        </div>
                        <div class="col col-lg-4 col-md-4 col-sm-4 col-xs-3">
                        <div class="form-elem form-group input-group text-center">
							 <div class="elem">
                                <input type="submit" class="btn btn-block btn-md btn-info form-control" id="btn" value="Valider"/>
                            </div>	

                             <div class="elem input-file" > 
                                    <input class="btn btn-default btn-choose" type="file"/>                            
                             </div>
                            <table id="table">
                               		<input type="hidden" name="ingredientsNumber" value="5" />
                                <tr>
                                    <td><input type="select" name="ingredient_1" class="form-control elem" placeholder='nom ingredient' list="ingredientsList" /></td>                                 
                                    <td><input type="text" name="qte_ingredient_1" class="form-control elem" placeholder='quantité' /></td> 
                                    <td><input type="button" class="elem btn btn-block btn-md btn-info form-control btnAdd" id="addRow" value="+" /></td>
                                    <td><input type="button" class="elem btn btn-block btn-md btn-info form-control btnAdd" id="deleRow" value="-" /></td>
                                </tr>
                                <tr>
                                    <td><input type="select" name="ingredient_2" class="form-control elem" placeholder='nom ingredient' list="ingredientsList" /></td>                                 
                                    <td><input type="text" name="qte_ingredient_2" class="form-control elem" placeholder='quantité' /></td> 
                                    <td><input type="button" class="elem btn btn-block btn-md btn-info form-control btnAdd" id="addRow" value="+" /></td>
                                    <td><input type="button" class="elem btn btn-block btn-md btn-info form-control btnAdd" id="deleRow" value="-" /></td>
                                </tr>
                                <tr>
                                    <td><input type="select" name="ingredient_3" class="form-control elem" placeholder='nom ingredient' list="ingredientsList" /></td>                                 
                                    <td><input type="text" name="qte_ingredient_3" class="form-control elem" placeholder='quantité' /></td> 
                                    <td><input type="button" class="elem btn btn-block btn-md btn-info form-control btnAdd" id="addRow" value="+" /></td>
                                    <td><input type="button" class="elem btn btn-block btn-md btn-info form-control btnAdd" id="deleRow" value="-" /></td>
                                </tr>
                           		<tr>
                                    <td><input type="select" name="ingredient_4" class="form-control elem" placeholder='nom ingredient' list="ingredientsList" /></td>                                 
                                    <td><input type="text" name="qte_ingredient_4" class="form-control elem" placeholder='quantité' /></td> 
                                    <td><input type="button" class="elem btn btn-block btn-md btn-info form-control btnAdd" id="addRow" value="+" /></td>
                                    <td><input type="button" class="elem btn btn-block btn-md btn-info form-control btnAdd" id="deleRow" value="-" /></td>
                                </tr>
								<tr>
                                    <td><input type="select" name="ingredient_5" class="form-control elem" placeholder='nom ingredient' list="ingredientsList" /></td>                                 
                                    <td><input type="text" name="qte_ingredient_5" class="form-control elem" placeholder='quantité' /></td> 
                                    <td><input type="button" class="elem btn btn-block btn-md btn-info form-control btnAdd" id="addRow" value="+" /></td>
                                    <td><input type="button" class="elem btn btn-block btn-md btn-info form-control btnAdd" id="deleRow" value="-" /></td>
                                </tr>

                            </table>
                        </div>
                        </div>
                    </form>
                </div>
        </div>
<!--Fin Corps de la page-->
