/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  20/07/2023 10:15:09                      */
/*==============================================================*/


drop table if exists client;

drop table if exists couture;

drop table if exists depense;

drop table if exists mesure;

drop table if exists modele;

drop table if exists paiement;

drop table if exists personnel;

drop table if exists utilisateur;

/*==============================================================*/
/* Table : client                                               */
/*==============================================================*/
create table client
(
   idclient             int not null,
   idmesure             int,
   idmodele             int not null,
   idpaiement           int not null,
   idcouture            int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   quartier             varchar(254),
   telephone            int,
   primary key (idclient),
   key AK_Identifiant_1 (idclient)
);

/*==============================================================*/
/* Table : couture                                              */
/*==============================================================*/
create table couture
(
   idcouture            int not null,
   idmesure             int not null,
   date_depot           int,
   date_retrait         int,
   primary key (idcouture)
);

/*==============================================================*/
/* Table : depense                                              */
/*==============================================================*/
create table depense
(
   iddepense            int not null,
   date                 datetime,
   primary key (iddepense),
   key AK_Identifiant_1 (iddepense)
);

/*==============================================================*/
/* Table : mesure                                               */
/*==============================================================*/
create table mesure
(
   idmesure             int not null,
   taille               int,
   poitrine             int,
   epaule               int,
   longueur_bras        int,
   cuisse               int,
   jambe                int,
   primary key (idmesure),
   key AK_Identifiant_1 (idmesure)
);

/*==============================================================*/
/* Table : modele                                               */
/*==============================================================*/
create table modele
(
   idmodele             int not null,
   nom                  varchar(254),
   primary key (idmodele)
);

/*==============================================================*/
/* Table : paiement                                             */
/*==============================================================*/
create table paiement
(
   idpaiement           int not null,
   date                 datetime,
   primary key (idpaiement),
   key AK_Identifiant_1 (idpaiement)
);

/*==============================================================*/
/* Table : personnel                                            */
/*==============================================================*/
create table personnel
(
   idpersonnel          int not null,
   iddepense            int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   age                  int,
   poste                varchar(254),
   telephone            int,
   primary key (idpersonnel),
   key AK_Identifiant_1 (idpersonnel)
);

/*==============================================================*/
/* Table : utilisateur                                          */
/*==============================================================*/
create table utilisateur
(
   idutilisateur        int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   fonction             varchar(254),
   primary key (idutilisateur),
   key AK_Identifiant_1 (idutilisateur)
);

alter table client add constraint FK_Association_1 foreign key (idmodele)
      references modele (idmodele) on delete restrict on update restrict;

alter table client add constraint FK_Association_2 foreign key (idpaiement)
      references paiement (idpaiement) on delete restrict on update restrict;

alter table client add constraint FK_Association_3 foreign key (idcouture)
      references couture (idcouture) on delete restrict on update restrict;

alter table client add constraint FK_Association_4 foreign key (idmesure)
      references mesure (idmesure) on delete restrict on update restrict;

alter table couture add constraint FK_Association_6 foreign key (idmesure)
      references mesure (idmesure) on delete restrict on update restrict;

alter table personnel add constraint FK_Association_5 foreign key (iddepense)
      references depense (iddepense) on delete restrict on update restrict;

