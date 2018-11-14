<!--Corps de la page-->
	<div class="container">
		<div class="row">
                    <form >
                    
                        <div class="col col-lg-8 col-md-8 col-sm-8 col-xs-7">
                        <div class="form-elem form-group text-center">                     
                            
                            
                                <div class="elem">
                                    <!--<label for="nomRecette" > Nom de la recette :</label>-->
                                    <input type="text" id="nomRecette" class="form-control wordDisp" placeholder="Nom de la recette"/>  
                                </div>

                                <div class="elem">
                                    <label for="famRecette" > Categorie de la recette :</label>
                                    <select class=form-control id="famRecette">
                                        <option value="">feculent</option>
                                        <option value="">legume</option>
                                        <option value="">fruit</option>
                                    </select>
                                </div>  
                            
                               
                                <div class="elem input-file" >
                                    
                                    <input class="btn btn-default btn-choose" type="file"/>                             
                                    
                                </div>
                            


                            <div class="elem">
                                <input type="button" class="btn btn-block btn-md btn-info form-control" id="btn" value="Valider"/>
                            </div>
                        </div>
                        </div>
                        <div class="col col-lg-4 col-md-4 col-sm-4 col-xs-3">
                        <div class="form-elem form-group input-group text-center">
                            
                            <table id="table">
                               
                                <tr>
                                    <td><input type="text" class="form-control elem" placeholder='nom ingredient' /></td>                            
                                        
                                        
                                    <td><input type="text" class="form-control elem" placeholder='poids' /></td>
                                    
                                    
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
