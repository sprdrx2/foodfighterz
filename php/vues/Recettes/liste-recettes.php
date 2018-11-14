<!--Corps de la page-->
 <div class="container">	
	<h1 class="my-4">Les recettes proposées ! 
        <small>Résultat de votre recherche : </small>
     </h1>
	</br></br>

	<div class=row>
		<div class="card-deck">
		<?php foreach($DATA as $recette) { ?>
		<div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
          <div class="card" style="width: 18rem;">
            <a href="#"><img class="card-img-top" src="http://placehold.it/250" alt="Card image cap"></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="?modele=Recettes&methode=afficher&id=<?php echo $recette->id; ?>"><?php echo $recette->libelle; ?></a>
              </h4>
              <p class="card-text"><?php echo substr($recette->instructions, 0, 50); ?> ...</p>
            </div>
          </div>
        </div>
		<?php } ?>
		</div>
	</div>
</div>



<!--Fin Corps de la page-->
