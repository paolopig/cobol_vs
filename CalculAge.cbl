       program-id. CalculAge as "Contrat_Epargne_TS.CalculAge".

       data division.  
    
       working-storage section.
       01 LS-DiffAge.
           10 DiffAnnee   PIC s9(4).
           10 DiffMois    PIC s9(2).
           10 DiffJours   PIC s9(2).

       77 LS-DateAnneeTiersInt     PIC 9(8).
       77 LS-DateEffetCInt         PIC 9(8).
       77 Testmajeur               PIC 9(8).

       Linkage section.
       01 LS-DateNaissanceTiers.
           10 Annee Pic 9999.
           10 Mois  Pic 99.
           10 Jour  Pic 99.

       01 LS-DateEffetContratEpargne.
           10 Annee Pic 9999.
           10 Mois  Pic 99.
           10 Jour  Pic 99.

       77 LS-AgeTiers PIC S999.


       Procedure division using LS-DateNaissanceTiers, LS-DateEffetContratEpargne, LS-AgeTiers.
      *---------------------------------------------------------------------------------------------
      * Methode 1, sans compute : on confronte en succession années, mois et jours au besoin si Année = 18
      * si <> 18 le probléme est resolu du depart...On gére aussi le cas de date negative
      *---------------------------------------------------------------------------------------------

           subtract Annee of LS-DateNaissanceTiers from annee of LS-DateEffetContratEpargne giving  DiffAnnee

           iF DiffAnnee greater or equal 0 
                   If DiffAnnee <> 18
                       move DiffAnnee to LS-AgeTiers
                   Else
                      subtract mois of LS-DateNaissanceTiers from mois of LS-DateEffetContratEpargne giving  DiffMois
                       evaluate DiffMois
                           when = 0
                               subtract jour of LS-DateNaissanceTiers from jour of LS-DateEffetContratEpargne giving  Diffjours
                               if Diffjours less or equal 0 
                                   move DiffAnnee to LS-AgeTiers
                               else
                                   move 17 to LS-AgeTiers
                               end-if
                           when > 0
                               move DiffAnnee to LS-AgeTiers
                           When < 0
                               move 17 to LS-AgeTiers
                       end-evaluate
   
                   end-if
           Else
               move 0 to LS-AgeTiers
           End-if.
      *---------------------------------------------------------------------------------------------
      * Methode 2, avec COMPUTE et la function integer-of-date, plus gourmande en ressources...
      *---------------------------------------------------------------------------------------------

      *        Move LS-DateEffetContratEpargne to LS-DateEffetCInt.       
      *        Move LS-DateNaissanceTiers to  LS-DateAnneeTiersInt.
      *
      *        compute Testmajeur = function integer-of-date(LS-DateEffetCInt)
      *                       - function integer-of-date(LS-DateAnneeTiersInt)
      *    
      *        Divide 365 into Testmajeur giving LS-AgeTiers
      *---------------------------------------------------------------------------------------------
      *   Fin methode 2
      *---------------------------------------------------------------------------------------------

       end program CalculAge.