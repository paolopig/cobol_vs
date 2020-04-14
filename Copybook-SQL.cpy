      **************************************************************************************************************
      * Declarations de tables SQL
      **************************************************************************************************************

        01 ProduitEpargne.
            10 CodeProduitE       SQL CHAR(2).
            10 FraisEntree        PIC 99V99.
            10 FraisVersement     PIC 99V99.
            10 FiscRachat         PIC 99V99.
            10 TauxRemuneration   PIC 99V99.
            10 SeuilEntree        PIC 9(12)V99.
            10 SeuilEntreeBrut    PIC 9(12)V99.

        01 TiersSouscrBenef. 
		    10 IdTiers	          PIC 9(8). 
		    10 CodeBanqueT	      PIC 9(5). *>SQL Char(5).
			10 CodeGuichet	      PIC 9(5). *> SQL Char(5).
			10 RacineCompte	      PIC 9(9). *> SQL Char(9).
			10 TypeCompte	      PIC 9(2). *> SQL Char(2).
			10 CleRib	          PIC 9(2). *> SQL Char(2).
			10 Intitule	          SQL Char(3).
			10 Prenom	          SQL Char-Varying(25).
			10 Nom	              SQL Char-Varying(20).
			10 NoRue	          SQL Char-Varying (6).
			10 Rue	              SQL Char-Varying(30).
			10 CodePostal	      SQL Char(5).
			10 Ville	          SQL Char-Varying(25).
			10 Pays 	          SQL Char-Varying(25).
			10 Telephone	      SQL Char-Varying (15).
			10 Courriel	          SQL Char-Varying(30).
			10 DateNaissance	  PIC x(10).

        01 TiersBenef. 
		    10 IdTiersB	              PIC 9(8). 
		    10 CodeBanqueTB		      PIC 9(5). *>SQL Char(5).
			10 CodeGuichetB		      PIC 9(5). *>SQL Char(5).
			10 RacineCompteB		  PIC 9(9). *>SQL Char(9).
			10 TypeCompteB		      PIC 9(2). *>SQL Char(2).
			10 CleRibB		          PIC 9(2). *>SQL Char(2).
			10 IntituleB		      SQL Char(3).
			10 PrenomB		          SQL Char-Varying(25).
			10 NomB		              SQL Char-Varying(20).
			10 NoRueB		          SQL Char-Varying (6).
			10 RueB		              SQL Char-Varying(30).
			10 CodePostalB		      SQL Char(5).
			10 VilleB		          SQL Char-Varying(25).
			10 PaysB	 	          SQL Char-Varying(25).
			10 TelephoneB		      SQL Char-Varying (15).
			10 CourrielB		      SQL Char-Varying(30).
			10 DateNaissanceB		  PIC x(10).


      * 01 Banque.      
      *     10 CodeBanque         SQL Char(5).
      *     10 NomBanque          SQL Char-Varying(150).
		
		01 ProduitClient.
			10 CodeProduitPC     	  SQL Char(2).
			10 NoContratPC	          PIC 9(8). 
			10 TiersSouscrPC	      PIC S9(9) COMP-5. 
			10 TiersBeneficPC	      PIC S9(9) COMP-5. 
			10 MontantSouscrPC	      PIC 9(12)V99.
			10 DateEffetPC	          PIC X(10). 
			10 VersPrgPC	          PIC 9.
			10 PeriodeVPrgPC	      SQL Char(1).
			10 MontantVPrgPC	      PIC 9(12)V99.
			10 RachatPrgPC	          PIC 9.
			10 PeriodeRPrgPC	      SQL Char(1).
			10 MontantRPrgPC	      PIC 9(12)V99.
			10 EtatProduitPC	      PIC X.
			
		01 OperationsCompte.
			10 CodeProduitOC     	  SQL Char(2).
       	    10 NoContratOC	          PIC 9(8). 
			10 NoOperationOC	 	  PIC 9(8). 
			10 TypeOperationOC	      PIC X.
			10 MontantOperationOC	  PIC 9(12)v99.
			10 DateOperationOC	      PIC X(10).

      *---------------------------------------------------------------------------------------------
      * Initialisation SQLDA SQLCA
      *---------------------------------------------------------------------------------------------

           EXEC SQL
               INCLUDE SQLCA
           END-EXEC.
           EXEC SQL 
               INCLUDE SQLDA
           END-EXEC.


      *---------------------------------------------------------------------------------------------
      * Declarations curseur pour TiersSouscrBenef
      *---------------------------------------------------------------------------------------------
           EXEC SQL
               DECLARE TiersSouscrBenef-Curseur CURSOR FOR 
                Select * From TiersSouscrBenef
                ORDER BY TiersSouscrBenef.Idclient
           END-EXEC.

      *---------------------------------------------------------------------------------------------
      * Declarations curseur pour ProduitClient
      *---------------------------------------------------------------------------------------------
           EXEC SQL
               DECLARE ProduitClient-Curseur CURSOR FOR 
                Select * From Compte ORDER BY Compte.CodeBanque
           END-EXEC.

      *---------------------------------------------------------------------------------------------
      * Declarations curseur pour OperationsCompte
      *---------------------------------------------------------------------------------------------
      *    EXEC SQL
      *        DECLARE OperationsCompte-Curseur CURSOR FOR 
      *         Select CodeProduit, NoContrat, NoOperation, TypeOperation, MontantOperation, DateOperation
      *         From OperationsCompte 
      *         Where (CodeProduit = :CodeProduitOC And NoContrat = :NoContratOc);
      *    END-EXEC.
