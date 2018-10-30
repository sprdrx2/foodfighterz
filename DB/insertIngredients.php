#!/usr/bin/php

<?php

include('tmp/Ingredients.arrays');

foreach ($famillesIngredients as $famille => $ingredients) {
	echo "famille: $famille \n";
	foreach ($ingredients as $ingredient) {
		echo "$ingredient\n";
	}
}

?>
