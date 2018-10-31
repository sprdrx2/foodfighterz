#!/bin/bash

mysql_host='localhost';
mysql_user='foodfigtherz';
mysql_pwd='foodfigtherz';
mysql_db='foodfigtherz';
mysql_cmd="mysql -h $mysql_host -u $mysql_user -p$mysql_pwd -D $mysql_db";

tmpd='tmp'; # repertoire où l'on va compiler les ingredients et recettes


echo "Drop tables...";
#$mysql_cmd < dropTables.sql;

echo "Create tables...";
#$mysql_cmd < createTables.sql;

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
