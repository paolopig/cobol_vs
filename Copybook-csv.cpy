      *01  Compte.
      *    10 CodeBanque           sql Char(5).
      *    10 CodeGuichet          sql Char(5).
      *    10 RacineCompte         sql Char(9).
      *    10 TypeCompte           sql Char(2).
      *    10 CleRib               sql Char(2).
      *    10 Solde                sql Char(10).
      *    10 CodeClient           sql Char(36).

       01 tableauCalcul.
           05 CalculContrat occurs 12.
              10 CumulValeur PIC 9(8)v99.
              10 CumulInterets PIC 9(8)v9999.


       01 ProduitEpargne.
           05 ligneProduit OCCURS 3.
             10 CodeProduit       PIC XX.
             10 FraisEntree       PIC X(5).
             10 FraisVersement    PIC X(5).
             10 FiscRachat        PIC X(5).
             10 TauxRemuneration  PIC X(5).
             10 SeuilEntree       PIC X(12).
             10 SeuilEntreeBrut   PIC X(12). 

      *
      * 01 TiersSB.     *>Fichier tiers beneficiaires et/ou souscripteurs
      *      10 IdClient          PIC S9(9) COMP-5.
      *      10 CodeBanque        SQL Char(5).
      *      10 CodeGuichet       SQL Char(5).
      *      10 RacineCompte      SQL Char(9).
      *      10 TypeCompte        SQL Char(2).
      *      10 CleRib            SQL Char(2).
      *      10 Intitule          SQL Char(5).
      *      10 Prenom            SQL Char-varying(50).
      *      10 Nom               SQL Char-varying(50).
      *      10 NoRue             SQL Char-varying(10).
      *      10 Rue               SQL Char-varying(50).
      *      10 CodePostal        SQL Char(5).
      *      10 Ville             SQL Char-varying(50).
      *      10 Pays              SQL Char-varying(50).
      *      10 Telephone         SQL Char-varying(20).
      *      10 Courriel          SQL Char-varying(50).
       
      *01 ProduitEpargne. *>Fichier  
      *      10 CodeProduit       PIC XX.
      *      10 FraisEntree       PIC 99v99.
      *      10 FraisVersement    PIC 99v99.
      *      10 FiscRachat        PIC 99v99.
      *      10 TauxRemuneration  PIC 99v99.
      *      10 SeuilEntree       PIC 9(12)v99.
      *      10 SeuilEntreeBrut   PIC Z(12)9v99.

      *01 ProduitsClient. *>Fichier  
      *      10 CodeProduitC          SQL Char(2).
      *      10 NoContrat         SQL Char(10).
      *      10 TiersSouscr       PIC S9(9) COMP-5.
      *      10 TiersBenefic      PIC S9(9) COMP-5.
      *      10 MontantSouscr     PIC 9(12)v99.
      *      10 DateEffet         PIC X(10).
      *      10 VersPrg           PIC 9.
      *      10 PeriodeVPrg       PIC X.
      *      10 MontantVPrg       PIC 9(12)v99.
      *      10 RachatPrg         PIC 9.
      *      10 PeriodeRPrg       PIC X.
      *      10 MontantRPrg       PIC 9(12)v99.
      *      10 EtatProduit       PIC 9.

      *01 OperationsCompte.
      *      10 NoContrat         SQL Char(10).
      *      10 NoOperation       PIC S9(9) COMP-5.
      *      10 TypeOperation     SQL Char(1).
      *      10 MontantOperation  PIC 9(12)v99.
      *      10 DateOperation     PIC X(10).

      *---------------------------------------------------------------------------------------------
      * Affichage echan pour simulation avec variables display
      *---------------------------------------------------------------------------------------------
       01 Saisie-Simulation.
             10 PrevDureeCtr  PIC Z(2)9.
      *      10 MontantSouscr PIC Z(12)9.99.
             10 MontantSouscr  PIC ZBZZZBZZZBZZ9.99.
             10 VersPrg  PIC X.
             10 RachatPrg  PIC X.
             10 MontantVPrg  PIC ZBZZZBZZZBZZ9.99.
             10 MontantRPrg  PIC ZBZZZBZZZBZZ9.99.
      *      10 MontantVPrg  PIC Z(8)9.99.
      *      10 MontantVPrg PIC ZBZZZBZZZBZZ9,99.  *>PIC Z(6)9.99.
             10 PeriodeVPrg  PIC X.      
             10 PeriodeRPrg  PIC X.     
      *---------------------------------------------------------------------------------------------
      * Variables pour conversion string into numerique
      *---------------------------------------------------------------------------------------------
        01  MT-GAUCHE PIC X(12).                          
		01  MT-DROIT  PIC X(12).                                          
		01  MT-AVANT  PIC X(10).                                          
		01  MT-AVANT-CAR PIC 9(5).                                        
		01  MT-APRES  PIC X(2).                                           
		01  MT-APRES-CAR PIC 9(5).                                        
		01  MT-TEMP.                                                      
		   05 MT-TEMP-10 PIC X(10) JUSTIFIED RIGHT.                      
		   05 MT-TEMP-2  PIC X(2).                                       
		01  MT-NUM REDEFINES MT-TEMP PIC 9(12).                          
        01  MT-ED PIC ZBZZZBZZZBZZ9,99.  
		01  MT-CONV PIC Z(12)9,99.

       01 WS-A                   PIC X(1)      VALUE 'N'.
         88 VrstProgrammes   VALUE 'Y'.
         88 NoVrstProgrammes VALUE 'N'.
         88 W-VP-Ann  value 'A'.
         88 W-VP-Trim value 'T'.
         88 W-VP-Sem  value 'S'.
         88 W-VP-Mens value 'M'.
         88 W-VP-Non  VALUE 'N'. 
         88 W-VP-Oui  VALUES 'A' 'S' 'T' 'A'.
         88 W-RP-Oui  VALUES 'A' 'S' 'T' 'A'.
         88 W-RP-Non  VALUE 'N'.
         88 W-RP-Ann  value 'A'.
         88 W-RP-Trim value 'T'.
         88 W-RP-Sem  value 'S'.
         88 W-RP-Mens value 'M'.
         88 W-Souscr  value 'O'.
         88 W-Benef   value 'O'.
         88 W-BenefSaisi   value 'O'.
         88 W-PassageSimulation VALUE 'Y'.




