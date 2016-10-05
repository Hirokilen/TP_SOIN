-- ************************************************************
--   Nom de la base   :  Base_SOIN                          
--   Nom de SGBD      :  ORACLE Version 9.2.0                    
--   Date de mdification:  05/10/2016 14:32                       
--   Auteur :  Dylan RAIMON   
-- ************************************************************

drop table DOSSIER cascade constraints
/

drop table PRESTATION cascade constraints
/

drop table INTERVENANT cascade constraints
/

drop table INTERVENANTEXTERNE cascade constraints
/


-- ************************************************************
--   Table : DOSSIER                                            
-- ************************************************************
create table Dossier
(
	numPatient     			INTEGER               not null,
    nomPatient     			varchar(35)           not null,
    prenomPatient			varchar(35)           not null,
    dateNaissancePatient      TIMESTAMP             not null,
    constraint PK_DOSSIER primary key (numPatient)
)
/


-- ************************************************************
--   Table : INTERVENANTEXTERNE                                           
-- ************************************************************
create table IntervenantExterne
(
	numIntervenantExterne INTEGER                     not null,
    Specialite			varchar(35)					not null,
	Adresse				varchar(35)					not null,
	Tel					varchar(35)					not null,
    constraint PK_INTERVENANTEXTERNE primary key (numIntervenantExterne)

)
/
-- ************************************************************
--   Table : INTERVENANT                                         
-- ************************************************************
create table Intervenant
(
    numIntervenant        INTEGER                     not null,
    nom     				varchar(35)                 not null,
    prenom  				varchar(35)                 not null,
	
    constraint PK_INTERVENANT primary key (numIntervenant),
	constraint FK_INTERVENANT_INTEXT foreign key  (numIntervenant)
       references INTERVENANTEXTERNE (numIntervenantExterne) on delete cascade
)
/

-- ************************************************************
--   Table : PRESTATION                                            
-- ************************************************************
create table Prestation
(
	numPrestation    		 INTEGER                not null,
    libelle    	  		 varchar(35)            not null,
    datePrestation         TIMESTAMP              not null,
	idDossier 			 INTEGER				not null,
	idIntervenant		 INTEGER				not null,
	
    constraint PK_PRESTATION primary key (numPrestation),
	constraint FK_PRESTATION_DOSSIER foreign key  (idDossier)
       references DOSSIER (numPatient) on delete cascade,
	constraint FK_PRESTATION_INTERVENANT foreign key  (idIntervenant)
       references INTERVENANT (numIntervenant) on delete cascade
)
/



