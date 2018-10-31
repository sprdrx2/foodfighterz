CREATE TABLE Ingredients(
	idIngr    INT NOT NULL ,
	LibelleI  VARCHAR (50) NOT NULL  ,
	Pluriel   VARCHAR (50),
	Alias	  VARCHAR (50),
	CONSTRAINT Ingredients_PK PRIMARY KEY (idIngr)
);


CREATE TABLE Recettes(
	idRecette  INT NOT NULL ,
	LibelleR   VARCHAR (50) NOT NULL  ,
	CONSTRAINT Recettes_PK PRIMARY KEY (idRecette)
);


CREATE TABLE FamillesIngredients(
	idFamille  INT NOT NULL ,
	LibelleF   VARCHAR (50) NOT NULL  ,
	CONSTRAINT FamillesIngredients_PK PRIMARY KEY (idFamille)
);


CREATE TABLE CategoriesRecettes(
	idCategorie  INT NOT NULL ,
	LibelleC     VARCHAR (50) NOT NULL  ,
	CONSTRAINT CategorieRecette_PK PRIMARY KEY (idCategorie)
);


CREATE TABLE Saisons(
	IdSaison   INT NOT NULL ,
	LibelleS   VARCHAR (50) NOT NULL  ,
	DateDebut  DATE  NOT NULL  ,
	DateFin    DATE  NOT NULL  ,
	CONSTRAINT Saison_PK PRIMARY KEY (IdSaison)
);


CREATE TABLE composer(
	idRecette       INT(10)  NOT NULL  ,
	idIngr          INT(10)  NOT NULL  ,
	estRemplacable  INT (1) NOT NULL  ,
	CONSTRAINT composer_PK PRIMARY KEY (idRecette,idIngr),
	CONSTRAINT CHK_BOOLEAN_estRemplacable CHECK (estRemplacable IN (0,1))

	,CONSTRAINT composer_Recette_FK FOREIGN KEY (idRecette) REFERENCES Recettes(idRecette)
	,CONSTRAINT composer_Ingredient0_FK FOREIGN KEY (idIngr) REFERENCES Ingredients(idIngr)
);


CREATE TABLE consommer(
	IdSaison  INT(10)  NOT NULL  ,
	idIngr    INT(10)  NOT NULL  ,
	CONSTRAINT consommer_PK PRIMARY KEY (IdSaison,idIngr)

	,CONSTRAINT consommer_Saison_FK FOREIGN KEY (IdSaison) REFERENCES Saisons(IdSaison)
	,CONSTRAINT consommer_Ingredient0_FK FOREIGN KEY (idIngr) REFERENCES Ingredients(idIngr)
);


CREATE TABLE appartenir(
	idIngr     INT(10)  NOT NULL  ,
	idFamille  INT(10)  NOT NULL  ,
	CONSTRAINT appartenir_PK PRIMARY KEY (idIngr,idFamille)

	,CONSTRAINT appartenir_Ingredient_FK FOREIGN KEY (idIngr) REFERENCES Ingredients(idIngr)
	,CONSTRAINT appartenir_FamilleIngredient0_FK FOREIGN KEY (idFamille) REFERENCES FamillesIngredients(idFamille)
);


CREATE TABLE regrouper(
	idCategorie  INT(10)  NOT NULL  ,
	idRecette    INT(10)  NOT NULL  ,
	CONSTRAINT regrouper_PK PRIMARY KEY (idCategorie,idRecette)

	,CONSTRAINT regrouper_CategorieRecette_FK FOREIGN KEY (idCategorie) REFERENCES CategoriesRecettes(idCategorie)
	,CONSTRAINT regrouper_Recette0_FK FOREIGN KEY (idRecette) REFERENCES Recettes(idRecette)
);


CREATE TABLE suggerer(
	idRecette  INT(10)  NOT NULL  ,
	IdSaison   INT(10)  NOT NULL  ,
	CONSTRAINT suggerer_PK PRIMARY KEY (idRecette,IdSaison)

	,CONSTRAINT suggerer_Recette_FK FOREIGN KEY (idRecette) REFERENCES Recettes(idRecette)
	,CONSTRAINT suggerer_Saison0_FK FOREIGN KEY (IdSaison) REFERENCES Saisonss(IdSaison)
);
