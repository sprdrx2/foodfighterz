<?php $ingredient = $DATA; ?>

<!--Corps de la page-->
    <div class="myrow">
		<div class="col-md-2">
		<h3>Ingrédients</h3>
          <ul>
			<?php foreach($recette->ingredients as $ingredient) {?>
            <li><?php if($ingredient["quantite"] != "NULL") { echo $ingredient["quantite"]; }?> <?php echo $ingredient["libelleI"]; ?></li>
			<?php } ?>
          </ul>
        </div>
        <div class="col-md-5">
          <img class="img-fluid" src="http://placehold.it/450x300" alt="">
</br>
</br>
</br>
<hr>
		</div>

        <div class="col-md-4">
          <h3><?php echo $recette->libelle; ?></h3>
          <p><?php echo $recette->instructions; ?></p>
          
        </div>

      </div>
<!--Fin Corps de la page-->

