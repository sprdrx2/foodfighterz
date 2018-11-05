#!/bin/bash

mysql_host='localhost';
mysql_user='foodfighterz';
mysql_pwd='foodfighterz';
mysql_db='foodfighterz';
mysql_cmd="mysql -h $mysql_host -u $mysql_user -p$mysql_pwd $mysql_db";

tmpd='tmp'; # repertoire où l'on va compiler les ingredients et recettes

cat > connexion.php << EOF
<?php

	define('MYSQL_HOST', '$mysql_host');
	define('MYSQL_USER', '$mysql_user');
	define('MYSQL_PASSWORD', '$mysql_pwd');
	define('MYSQL_DB', '$mysql_db');

	\$cnx = mysqli_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DB); 
?>
EOF

echo "Drop tables...";
$mysql_cmd < dropTables.sql;

echo "Create tables...";
$mysql_cmd < createTables.sql;

echo "Construction liste ingrédients...";

ingf="Ingredients.txt";
sqlf="$tmpd/Ingredients.arrays.php";

cp $ingf $sqlf;

sed -i "/^[a-zA-Z]/s/^/\"/" $sqlf;
sed -i "/^\"/s/$/\",/" $sqlf;
sed -i "/^+++/s/$/\" => [/" $sqlf;
sed -i "/^+++/s/^+++/\$famillesIngredients += [\"/" $sqlf;
sed -i "/^---/s/---/]];/" $sqlf;
sed -i '1i<?php $famillesIngredients = [];' $sqlf;
sed -i "\$a?>" $sqlf;

echo "Insertion liste ingrédients...";
./insertIngredients.php;

echo "Construction recettes...";

for recetteF in recettes/*.recette; do
	recetteF_basename=$(basename "$recetteF");
	recetteC="tmp/recettes/$recetteF_basename.php";
	cp "$recetteF" "$recetteC";
	
	sed -i 's/"/\\"/g' "$recetteC";
	sed -i '1s/^/$titre ="/' "$recetteC";
	sed -i '1s/$/";/' "$recetteC";
	sed -i '1i<?php' "$recetteC";
	sed -i '$a?>' "$recetteC";
	sed -i 's/===/$instructions = "/' "$recetteC";
	sed -i 's/+++/";/' "$recetteC";
	sed -i '3i$ingredients = [];' "$recetteC";
	sed -i '/^i /s/^i /array_push($ingredients,["/' "$recetteC";
	sed -i '/^array_push($ingredients,\["/s/ /", "/' "$recetteC";
	sed -i '/^array_push($ingredients,\["/s/$/"]);/' "$recetteC";	
done

echo "Insertion recettes...";
./insertRecettes.php

echo "Dump BDD...";
mysqldump -h $mysql_host -u $mysql_user -p$mysql_pwd $mysql_db > FOODFIGHTERZ.sql;

