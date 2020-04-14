
      **************************************************************************************************
      * Ecran de gestion
      **************************************************************************************************

       01 menu-01 background-color is 01 foreground-color is 14 . *>background-color is CouleurFondEcran foreground-color is CouleurCaractere.
           10 blank screen .
      *    10 Line 1 col 25 value "                              " background-color is 14 foreground-color is 1.
           10 Line 2 col 25 value "  GESTION CONTRATS D'EPARGNE  " background-color is 14 foreground-color is 1 Highlight.
      *    10 Line 3 col 25 value "                              " background-color is 14 foreground-color is 1.
      *    10 Line 1 col 25 value ".----------------------------." .
      *    10 Line 2 col 25 value "| GESTION CONTRATS D'EPARGNE |" background-color is 14 foreground-color is 1.
      *    10 Line 3 col 25 value "'----------------------------'" .
           10 line  4 col  2 value " Date systeme : " foreground-color is 2 Highlight.
           10 line  4 col 18 from Jour of DateSysteme foreground-color is 2 Highlight.
           10 line  4 col 20 value "/" foreground-color is 2 Highlight.
           10 line  4 col 21 from Mois of DateSysteme foreground-color is 2 Highlight.
           10 line  4 col 23 value "/" foreground-color is 2 Highlight.
           10 line  4 col 24 from Annee of DateSysteme foreground-color is 2 Highlight.
           10 line  4 col 69 value " Option :" foreground-color is 2 Highlight.
           10 line  4 col 79 pic 9 from Option foreground-color is 2 Highlight.
           10 line  5 col  1 pic x(80) value all "_".
           10 line  10 col 11 value "- 1 - Simulation Contrat Epargne ....................... :".
      *    10 line 10 col 11 value "- 2 - Saisie Tiers / Beneficiaire ...................... :" .
      *    10 line 12 col 11 value "- 3 - Saisie Versements Libres ......................... :".
      *    10 line 14 col 11 value "- 4 - Saisie Rachats Libres ............................ :".
           10 line 13 col 11 value "- 2 - Synthese Contrat ................................. :".
           10 line 16 col 11 value "- 3 - Listing Operations ............................... :".
      *    10 line 19 col 5 value "- 7 - Lecture fichier Parametres......................... :"  .
      *    10 line  21 col 5 value "- 8 - Liste des banques ................................ :"  .
      *    10 line 22 col 5 value "- 9 - Controle des cles RIB ............................. :"  .
      *    10 line 21 col  1 pic x(80) value all "_".
           10 line 22 col 11 value "- 0 - Retour au menu appelant .......................... :".

       01 menu-02-simulation background-color is 1 foreground-color is 14.
           10 Blank Screen.
           10 Line 2 col 25 value " SIMULATION CONTRAT D'EPARGNE " background-color is 14 foreground-color is 1 Highlight.
           10 line 4 col  1 value " Veuillez selectionner le Produit ".
           10 line 5 col  1 pic x(80) value all "_".
           10 line 7 col  2 value "Code Produit :" .
           10 line 9 col  2 value "Duree/annees :".
           10 line 11 col  2 value "Montant souscription ....... :".
           10 line 13 col  2 value "Vers. prg.... :".
           10 line 15 col  2 value "Rcht. prg.... :".
           10 Line 17 col 56  value ".------------------------".
           10 line 18 col 56 value "|-A- Annulation :".
           10 line 19 col 56 value "|-V- Validation :".
           10 line 20 col 56 value "|".
           10 line 21 col  1 pic x(80) value all "_".

      *  good 04/04/18
      *    10 Blank Screen.
      *    10 Line 2 col 25 value "| SIMULATION CONTRAT D'EPARGNE |" background-color is 14 foreground-color is 1.
      *    10 Line 1 col 25 value ".------------------------------.".
      *    10 Line 2 col 25 value "| SIMULATION CONTRAT D'EPARGNE |".
      *    10 Line 3 col 25 value "'------------------------------'".
      *    10 line 5 col  1 value " Veuillez selectionner le Produit " PIC X(80) background-color is 14 foreground-color is 1. *>background-color is CouleurCaractere foreground-color is CouleurFondEcran.
      *    10 line 7 col  2 value "Code .... :" .
      *    10 line 9 col  2 value "Duree ... :".
      *    10 line 11 col  2 value "Montant souscription ......... :".
      *    10 line 13 col  2 value "Versements prg - Oui/Non ..... :".
      *    10 line 19 col  2 value "Rachats Prt.prg - Oui/Non .... :".
      *    10 Line 17 col 56  value ".------------------------".
      *    10 line 18 col 56 value "|-A- Annulation :".
      *    10 line 19 col 56 value "|-V- Validation :".
      *    10 line 20 col 56 value "|".
      *    10 line 21 col  1 pic x(80) value all "_".

       01 M-DonneeSimulationVP background-color is 1 foreground-color is 14. *>background-color is CouleurFondEcran foreground-color is CouleurCaractere.
      *    10 line 15 col  2 value "Montant Versement programme ....:".
      *    10 line 17 col  2 value "Periodicite - M/T/S/A ........ :".
           10 line 13 col  23 value "Montant :".
           10 line 13 col  51 value "P - M/T/S/A :".


       01 M-DonneeSimulationRP background-color is 1 foreground-color is 14. *>background-color is CouleurFondEcran foreground-color is CouleurCaractere.
           10 line 15 col  23 value "Montant :".
           10 line 15 col  51 value "P - M/T/S/A :".


      ***********************************************************************************
      * Ecran affichage tiers - 
      *********************************************************************************** 

       01 EcranGestionTiers background-color is 1 foreground-color is 14. *>background-color is CouleurFondEcran foreground-color is CouleurCaractere.
           10 Blank Screen.
           10 Line 2 col 25 value "   ADHESION CONTRAT D'EPARGNE   " background-color is 14 foreground-color is 1 Highlight.
           10 line 4 col  1 value " Veuillez saisir le Tiers Souscripteur et/ou Beneficiaire" .
           10 line 5 col  1 pic x(80) value all "_".
           10 line 7 col  2 value "Titre :" .
           10 line 7 col 16 value "Nom :" .
           10 line 7 col 45 value "Prenom :" .   
 
           10 line 9 col  2 value "No :" .
           10 line 9 col 15 value "Rue  :" .

           10 line 11 col  2 value "CP :" .
           10 line 11 col 15 value "Ville  :" .
           10 line 11 col 51 value "Pays  :" .

           10 line 13 col 2 value "RIB :                                                  "  .

           10 line 15 col 2 value "Telephone* :" .        
           10 line 15 col 37 value "Courriel* :" .
      *    10 line 15 col 50 value "Type S/B.. :" .   *> accept à part   
           10 line 17 col 40 value "Souscr:" .   *> accept à part  
           10 line 17 col 55 value "Benef:" .   *> accept à part  

           10 line 17 col 2 value "Date de naissance .. :" .   *> accept à part
      *    10 Display '/  /' at line 8 col 52.
           10 Line 18 col 56  value ".------------------------".
           10 line 19 col 56 value "|-A- Annulation :".
           10 line 20 col 56 value "|-V- Validation :".
           10 line 21 col 56 value "|".
           10 line 21 col  1 pic x(80) value all "_".
           10 line 23 col 1 value " Les champs avec * ne sont pas obligatoires     " PIC X(80) background-color is 14 foreground-color is 1.


       01 EcranGestionTiersBenef background-color is 2 foreground-color is 7 highlight. *>background-color is CouleurFondEcran foreground-color is CouleurCaractere.
           10 Blank Screen.
           10 Line 2 col 25 value "   ADHESION CONTRAT D'EPARGNE   " background-color is 14 foreground-color is 1 Highlight.
           10 line 4 col  1 value " Veuillez saisir le Tiers Beneficiaire" foreground-color is 2 highlight. 
           10 line 5 col  1 pic x(80) value all "_" foreground-color is 7 highlight.
           10 line 7 col  2 value "Titre :" foreground-color is 7 highlight.
           10 line 7 col 16 value "Nom :" .
           10 line 7 col 45 value "Prenom :" foreground-color is 7 highlight.   
 
           10 line 9 col  2 value "No :"  foreground-color is 7 highlight.  
           10 line 9 col 15 value "Rue  :"  foreground-color is 7 highlight.  

           10 line 11 col  2 value "CP :"  foreground-color is 7 highlight.  
           10 line 11 col 15 value "Ville  :"  foreground-color is 7 highlight.  
           10 line 11 col 51 value "Pays  :"  foreground-color is 7 highlight.  

           10 line 13 col 2 value "RIB :                                                  "  foreground-color is 7 highlight.

           10 line 15 col 2 value "Telephone* :" foreground-color is 7 Highlight.
           10 line 15 col 37 value "Courriel* :" foreground-color is 7 Highlight.

           10 line 17 col 2 value "Date de naissance .. :" .   *> accept à part
      *    10 Display '/  /' at line 8 col 52.
           10 Line 18 col 56  value ".------------------------".
           10 line 19 col 56 value "|-A- Annulation :".
           10 line 20 col 56 value "|-V- Validation :".
           10 line 21 col 56 value "|".
           10 line 21 col  1 pic x(80) value all "_".
           10 line 22 col 1 value " Les champs avec * ne sont pas obligatoires   " PIC X(80) background-color is 14 foreground-color is 1.


       01 M-DonneeTiers background-color is 1 foreground-color is 14 full. *>background-color is CouleurFondEcran foreground-color is CouleurCaractere.
           10 line  7 col 10 using Intitule of TiersSouscrBenef pic x(3) foreground-color is 3 Highlight .
           10 line  7 col 23 using nom of TiersSouscrBenef  pic x(20) foreground-color is 3 Highlight .
           10 line  7 col 55 using prenom of TiersSouscrBenef pic x(25)  foreground-color is 3 Highlight.   
      *    10 line  7 col 58 using TypeClient of TiersSouscrBenef pic x(20).   

           10 line  9 col 8 using NoRue of TiersSouscrBenef PIC x(5) foreground-color is 3 Highlight.
           10 line  9 col 20 using Rue of  TiersSouscrBenef PIC x(35) foreground-color is 3 Highlight.

           10 line  11 col 8 using CodePostal of TiersSouscrBenef foreground-color is 3 Highlight.
           10 line  11 col 25 using Ville of  TiersSouscrBenef PIC x(20) foreground-color is 3 Highlight.
           10 line  11 col 57 using Pays of  TiersSouscrBenef PIC x(20) foreground-color is 3 Highlight.

           10 line  13 col 12  using CodeBanqueT of TiersSouscrBenef auto background-color is 5 Foreground-color is 3 Highlight.
           10 line  13 col 18 using Codeguichet of TiersSouscrBenef auto background-color is 5 foreground-color is 3 Highlight.
           10 line  13 col 24 using RacineCompte of TiersSouscrBenef auto background-color is 5 foreground-color is 3 Highlight.
           10 line  13 col 34 using TypeCompte of TiersSouscrBenef auto background-color is 5 foreground-color is 3 Highlight .
           10 line  13 col 37 using CleRib of TiersSouscrBenef auto background-color is 5 foreground-color is 3 Highlight .


           10 line  15 col 19 using Telephone of  TiersSouscrBenef PIC x(15).

       01 M-ecranSinthese  background-color is 1 foreground-color is 14.
           10 line 12 col 1 value " Souscripteur " background-color is 14 foreground-color is 1.
           10 line 12 col 15 pic x(65) value all "_".
           10 line 14 col 2 from TitreNomPrenomSouscr foreground-color is 3 Highlight.
           10 line 15 col 2 from AdresseSouscr foreground-color is 3 Highlight.
           10 line 17 col 1 value " Beneficiaire " background-color is 14 foreground-color is 1.
           10 line 17 col 15 pic x(65) value all "_".
           10 line 19 col 2 from TitreNomPrenomBenef foreground-color is 3 Highlight.
           10 line 20 col 2 from AdresseBenef foreground-color is 3 Highlight.
           10 line 21 col 1 pic x(80) value all "_".

       01 M-ecranSintheseSetB  background-color is 1 foreground-color is 14.
           10 line 12 col 1 value " Souscripteur et Beneficiaire" background-color is 14 foreground-color is 1.
           10 line 12 col 30 pic x(50) value all "_".
           10 line 14 col 2 from TitreNomPrenomSouscr foreground-color is 3 Highlight.
           10 line 15 col 2 from AdresseSouscr foreground-color is 3 Highlight.
           10 line 21 col 1 pic x(80) value all "_".


       01 M-ResetEcran blank screen background-color is CouleurFondEcran foreground-color is CouleurCaractere.

       01 M-ResultatSimulation background-color is 1 foreground-color is 14. *>background-color is CouleurFondEcran foreground-color is CouleurCaractere.
           10 Line 2 col 25 value "     Resultats Simulation    "  background-color is 14 foreground-color is 1 Highlight.
           10 line 4 col  1 pic x(80) value all "-".
           10 line 5 col  1 value "  Montant Epargne      |  Montant interets     |             Nb Mois" . 
           10 line 6 col  1 pic x(80) value all "-".
      ***********************************************************************************
      * Affichage details contrat en bas d'ecran
      *********************************************************************************** 

       01 M-infoContrat background-color is 1 foreground-color is 14. *> background-color is CouleurFondEcran foreground-color is CouleurCaractere.
           10 line 20 col  1 pic x(80) value all "-".
           10 line 21 col  1 ' Details ' PIC X(80). *> background-color is CouleurCaractere foreground-color is CouleurFondEcran.
           10 line 21 col  20 ' Fr.Ent % -' . *> background-color is CouleurCaractere foreground-color is CouleurFondEcran.
           10 line 21 col  30 ' Fr.VLP % -' . *>  background-color is CouleurCaractere foreground-color is CouleurFondEcran.
           10 line 21 col  40 ' Fsc.Rp % -' . *>  background-color is CouleurCaractere foreground-color is CouleurFondEcran.
           10 line 21 col  50 ' Remun. % -' . *>  background-color is CouleurCaractere foreground-color is CouleurFondEcran.
           10 line 21 col  60 ' Montant Souscr. brut' . *>  background-color is CouleurCaractere foreground-color is CouleurFondEcran.

           10 line 22 col  1 pic x(80) value all "-".
           10 line 23 col  2 from CodeProduit of ligneproduit(IndexContrat). 
           10 line 23 col  22 from FraisEntree of ligneproduit(IndexContrat). 
           10 line 23 col  32 from FraisVersement of ligneproduit(IndexContrat). 
           10 line 23 col  42 from FiscRachat of ligneproduit(IndexContrat). 
           10 line 23 col  52 from TauxRemuneration of ligneproduit(IndexContrat). 
           10 line 23 col  67 from SeuilEntreeBrut of ligneproduit(IndexContrat).

       01 M-infoContratSimulation background-color is 1 foreground-color is 14. 
      *    10 LINE 23 PIC X(80) background-color is 14 foreground-color is 1.
           10 line 22 col  1 pic x(80) value all "-".
           10 LINE 23 COL 2 'Epargne Total:'.
           10 LINE 23 COL 16 from ValeurContratDisplay .
           10 LINE 23 COL 29 ' Tot. Int:' .
           10 LINE 23 COL 39 from ValeurInteretsDisplay .
           10 LINE 23 COL 54 ' Tot. Frais:'.
           10 LINE 23 COL 66 from ValeurFraisContratDisplay.
           10 line 24 col  1 pic x(80) value all "-".
           10 LINE 25 COL 1 '  Voules vous souscrire le contrat ?        [O]oui/[N]on:'.
           10 Line 25 Col 60 from ChoixValideSimulation.

       01 M-OperationsCompte background-color is 1 foreground-color is 14.
           10 Blank Screen.
           10 Line 2 col 25 value "     Details Operations     " background-color is 14 foreground-color is 1.
           10 Line 5 col 1 ' No de Contrat Epargne :'.
           10 line 6 col  1 pic x(80) value all "-".
           10 line 7 col  2 value "  Date Operation" PIC X(80) .
           10 line 7 col  30 value " Type Operation" PIC X(80) .
           10 line 7 col  60 value " Montant  " PIC X(80) .
           10 line 8 col  1 pic x(80) value all "-".
           10 line 21 col  1 pic x(80) value all "_".

      *           Display CodeProduitOC ' ' NoContratOC ' ' NoOperationOC ' ' MontantOperationOC ' ' DateOperationOC at line LigneContrat Col 2 
       01 M-OperationsCompteListe  background-color is CouleurFondEcran foreground-color is CouleurCaractere.
           10  Line LigneDetailsOper Col 2 from CodeProduitOC foreground-color is 3 Highlight.
           10  Line LigneDetailsOper Col 4 from NoContratOC foreground-color is 3 Highlight.
           10  Line LigneDetailsOper Col 27 from NoOperationOC foreground-color is 3 Highlight.


       01 M-SyntheseContrat required background-color is 1 foreground-color is 14.
           10 Blank Screen.
           10 Line 2 col 25 value "     Synthese contrat     " background-color is 14 foreground-color is 1.
           10 Line 4 col 1 ' No de Contrat Epargne :'.
           10 line 5 col  1 pic x(80) value all "-".

      ***********************************************************************************
      * Affichage informations aide saisie
      *********************************************************************************** 

       01 InfoAide background-color is 12 foreground-color is 7 Highlight.

           10 line 25 col 1 from LaInfoAide PIC X(80) background-color is 12 foreground-color is 7 Highlight.

       01 REsetInfoAide background-color is CouleurFondEcran foreground-color is CouleurCaractere.
           10 line 25 col 1 PIC X(80) background-color is 1 foreground-color is 14. 

      ***********************************************************************************
      * Affichage informations aide saisie
      *********************************************************************************** 

       01 InfoComm background-color is 2 foreground-color is 7 Highlight.

           10 line 25 col 1 from LaInfoComm PIC X(80) background-color is 2 foreground-color is 7 Highlight.

       01 REsetInfoComm background-color is CouleurFondEcran foreground-color is CouleurCaractere.
           10 line 25 col 1 PIC X(80) background-color is 1 foreground-color is 14. 


      ***********************************************************************************
      * Ecran de test des couleurs
      *********************************************************************************** 
       01 M-TestCouleur background-color couleurFondEcran foreground-color is CouleurCaractere.
           10 line 1 col 1 Blank Screen.
           10 line 1 col 1 value " Couleur ".
           10 line 1 col 10 from CouleurFondEcran pic Z9.