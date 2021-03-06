CREATE TABLE FamillesIngredients(
	idFamille  INT NOT NULL auto_increment,
	LibelleF   VARCHAR (50) NOT NULL  ,
	CONSTRAINT FamillesIngredients_PK PRIMARY KEY (idFamille)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE CategoriesRecettes(
	idCategorie  INT NOT NULL auto_increment,
	LibelleC     VARCHAR (50) NOT NULL  ,
	CONSTRAINT CategorieRecette_PK PRIMARY KEY (idCategorie)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Ingredients(
	idIngr    INT NOT NULL auto_increment,
	LibelleI  VARCHAR (50) NOT NULL  ,
	idFamille INT NOT NULL,
	LibelleI_Pluriel   VARCHAR (50),
	Alias_Singulier	  VARCHAR (50),
	Alias_Pluriel	  VARCHAR(50),
	CONSTRAINT Ingredients_PK PRIMARY KEY (idIngr),
	CONSTRAINT Ingredients_FK_FamillesIngredients FOREIGN KEY (idFamille) REFERENCES FamillesIngredients (idFamille)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Recettes(
	idRecette  INT NOT NULL auto_increment,
	LibelleR   VARCHAR (50) NOT NULL  ,
	instructions varchar(1000) not null,
	CONSTRAINT Recettes_PK PRIMARY KEY (idRecette)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE Saisons(
	IdSaison   INT NOT NULL auto_increment,
	LibelleS   VARCHAR (50) NOT NULL  ,
	DateDebut  DATE  NOT NULL  ,
	DateFin    DATE  NOT NULL  ,
	CONSTRAINT Saison_PK PRIMARY KEY (IdSaison)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE composer(
	idRecette       INT(10)  NOT NULL ,
	idIngr          INT(10)  NOT NULL  ,
	estRemplacable  INT (1) NOT NULL  ,
	quantite		varchar (50),
	CONSTRAINT composer_PK PRIMARY KEY (idRecette,idIngr),
	CONSTRAINT CHK_BOOLEAN_estRemplacable CHECK (estRemplacable IN (0,1))

	,CONSTRAINT composer_Recette_FK FOREIGN KEY (idRecette) REFERENCES Recettes(idRecette)
	,CONSTRAINT composer_Ingredient0_FK FOREIGN KEY (idIngr) REFERENCES Ingredients(idIngr)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE consommer(
	IdSaison  INT(10)  NOT NULL  ,
	idIngr    INT(10)  NOT NULL  ,
	CONSTRAINT consommer_PK PRIMARY KEY (IdSaison,idIngr)

	,CONSTRAINT consommer_Saison_FK FOREIGN KEY (IdSaison) REFERENCES Saisons(IdSaison)
	,CONSTRAINT consommer_Ingredient0_FK FOREIGN KEY (idIngr) REFERENCES Ingredients(idIngr)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE appartenir(
	idIngr     INT(10)  NOT NULL  ,
	idFamille  INT(10)  NOT NULL  ,
	CONSTRAINT appartenir_PK PRIMARY KEY (idIngr,idFamille)

	,CONSTRAINT appartenir_Ingredient_FK FOREIGN KEY (idIngr) REFERENCES Ingredients(idIngr)
	,CONSTRAINT appartenir_FamilleIngredient0_FK FOREIGN KEY (idFamille) REFERENCES FamillesIngredients(idFamille)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE regrouper(
	idCategorie  INT(10)  NOT NULL  ,
	idRecette    INT(10)  NOT NULL  ,
	CONSTRAINT regrouper_PK PRIMARY KEY (idCategorie,idRecette)

	,CONSTRAINT regrouper_CategorieRecette_FK FOREIGN KEY (idCategorie) REFERENCES CategoriesRecettes(idCategorie)
	,CONSTRAINT regrouper_Recette0_FK FOREIGN KEY (idRecette) REFERENCES Recettes(idRecette)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE suggerer(
	idRecette  INT(10)  NOT NULL  ,
	IdSaison   INT(10)  NOT NULL  ,
	CONSTRAINT suggerer_PK PRIMARY KEY (idRecette,IdSaison)

	,CONSTRAINT suggerer_Recette_FK FOREIGN KEY (idRecette) REFERENCES Recettes(idRecette)
	,CONSTRAINT suggerer_Saison0_FK FOREIGN KEY (IdSaison) REFERENCES Saisons(IdSaison)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
