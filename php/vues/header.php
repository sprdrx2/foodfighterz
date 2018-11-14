<!DOCTYPE html>

<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="www/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="www/index.css" rel="stylesheet">
		
		<title>Food Fighterz</title>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
	
	</head>
	<body>

<!--Navbar-->


		<div class="navbar navbar-default" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-target">
					<span class="sr-only">Activer la navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.php">Home</a>
				
			</div>
			<div class="collapse navbar-collapse" id="navbar-collapse-target">
				<ul class="nav navbar-nav">
					
					<li><a href="?modele=Ingredients&methode=inserer">Ajouter un aliment</a></li>
					<li><a href="?modele=Recettes&methode=inserer">Ajouter une recette</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Connexion/Déconnexion</a></li>
				</ul>
			</div>
		</div>

<!--FinNavbar-->

<!--Encadré du titre-->
	<div class="jumbotron text-center">


		<h1>Food Fighterz</h1>
		<p>Trouvez la recette faite pour vous !</p> 

	<header class="masthead text-white text-center">
		<div class="overlay"></div>
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-lg-8 col-xl-7 mx-auto center">
						<form>
							<div class="form-row">
								<div class="col-10 col-md-9 mb-2 mb-md-0">
									<input type="ingredient" class="form-control form-control-lg" placeholder="Entrez ingrédient(s), recette(s)...">
								</div>
								<div class="col-10 col-md-3">
									<button type="Recherche" class="btn btn-block btn-md btn-info">Valider !</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</header>
		  
	</div>
	
<!--Fin Encadré du titre-->	





