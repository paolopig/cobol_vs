       program-id. Contrat_Epargne_Main as "Contrat_Epargne_TS.Contrat_Epargne_Main".

       environment division.
       Configuration section.

       input-output section.
       file-control.
           select FichierEpargne assign to "C:\fichiers-cobol\ProduitsEpargne.csv"
                organization is line sequential access sequential.

          Select FichierPrint assign to "C:\fichiers-cobol\ProduitsEpargne.txt"
          organization is line sequential access sequential.

       data division.

       file section.
       FD FichierEpargne record varying from 0 to 255.
       01 EnrFichierEpargne pic x(255).

       FD FichierPrint record varying from 0 to 255.
       01 EnrFichierPrint pic x(255).

       working-storage section.

       01 DateSysteme.
           10 Annee Pic 99.
           10 Mois Pic 99.
           10 Jour Pic 99.

       01 DateNaissanceTiers.
           10 Annee Pic 9999.
           10 Mois  Pic 99.
           10 Jour  Pic 99.

       01 DateNaissanceTiersB.
           10 Annee Pic 9999.
           10 Mois  Pic 99.
           10 Jour  Pic 99.


       01 DateEffetContratEpargne.
           10 Annee Pic 9999.
           10 Mois  Pic 99.
           10 Jour  Pic 99.

       01 DateOperationContrat.
           10 Annee Pic 9999.
           10 Mois  Pic 99.
           10 Jour  Pic 99.
       
       01 ValsContratDisplay.
           10 ValeurContratDisplayG PIC X(25).
           10 ValeurInteretsDisplayG PIC X(35).
           10 IndicateurMoisG PIC X(25) justified right.

       copy "Copybook-param.cpy".
       copy "Copybook-SQL.cpy".
       copy "Copybook-csv.cpy".

       77  option                  pic 9.
      *77  Msg-Erreur              pic x(79).
       77  EofImport               pic 9.
       77  IndexContrat            pic 9.
       77 CouleurFondEcran         pic 99 value 1.
       77 CouleurCaractere         pic 99 value 14.
      *77 CouleurFondEcran         pic 99 value 15.
      *77 CouleurCaractere         pic 99 value 0.
      *77 CouleurFondEcran         pic 99 value 15.
      *77 CouleurCaractere         pic 99 value 1.
       77 CouleurSaisie            pic 99 .
      *77 CreationForeGround       pic 99.
      *77 ModificationForeGround   pic 99.
      *77 SuppressionForeGround    pic 99.
      *77 ValidationForeGround     pic 99.
       77 ChoixEcrSimulation       pic X global.
      *77 PrevDureeContrat         pic 99.
       77 LaInfoAide               pic X(80).
       77 LaInfoComm               pic X(80).
       77 DonneesValides           pic 9.
      *77 ChoixUtilisater          pic X.
      *77 SaisieCorrecte           Pic X.
      *77 DateNaissYear           PIC 9(8).
      *77 DateNaissMois           PIC 9(8).
      *77 DateNaissjour           PIC 9(8).
      *77 DateEffetYear           PIC 9(8).
      *77 DateEffetMois           PIC 9(8).
      *77 DateEffetjour           PIC 9(8).
      *77 DateAnneeTiersInt       PIC 9(8).
       77 DateOperationContratDisplay pic X(10).
       77 AgeTiers                PIC S999.
      *77 DateEffetCInt            PIC 9(8).
       77 TauxRemPeriode               PIC 99v99999999.
      *77 TauxRemuneration2       PIC 99v99.
       77 MontantSouscrTab        PIC 9(8)v9999.
       77 MontantVersementP       PIC 9(8)v9999.
       77 MontantVersementP-tmp      PIC 9(8)v99.
       77 MontantRachatP       PIC 9(8)v9999.
       77 MontantRachatP-tmp      PIC 9(8)v99.

      *77 MontantVersementP-net   PIC 9(8)v99.
       77 ValeurContrat           PIC 9(8)v99.
       77 ValeurInterets          PIC 9(8)v9999.
       77 ValeurInteretsAnnee     PIC 9(8)v9999.
       77 ValeurInteretsNets      PIC 9(8)v9999.
       77 ValeurContratDisplay     PIC Z(8)9.99.
       77 ValeurInteretsDisplay    PIC Z(8)9.99. 
       77 ValeurFraisContratDisplay PIC Z(8)9.99. 
       77 ValeurFraisPrelSocDisplay PIC Z(8)9.99. 
      *77 ValeurContratTmp        PIC 9(8)v99. 
       77 FraisContratTmp         PIC 9(8)v99. 
       77 ValeurFraisContrat      PIC 9(8)v99. 
       77 ValeurFraisPrelSoc     PIC 9(8)v99. 
      *77 IntTemp            PIC 9(8)v9999. 
       77 MontEntreeBrut     PIC 9(8)v99. 
       77 IndicateurMois             PIC 99.
       77 IndicateurAnnee PIC 99.
       77 IndicateurLigne   PIC 999.
       77 IndicateurMoisDuree        PIC 999.
       77 IndicateurMoisDureeTot        PIC 999.
       77 IndicateurMoisDureePart  PIC 999.
       77 ChoixValideSimulation    PIC X.
      *77 Testmajeur               PIC 9(8).
       01 VarTempString PIC X(50).
           77 Courriel-avant           PIC X(17).
           77 Courriel-apres           PIC X(15).
           77 Courriel-avantB           PIC X(17).
           77 Courriel-apresB           PIC X(15).
           77 IsSouscr        PIC X.  
           77 IsBenef         PIC X.  
           77 ChoixInsertion PIC X.  
           77 ChoixInsertionBenef PIC X.  
      *77 NoContratNum PIC 9(8).
      *77 maxID PIC 9(8).
      *77 MontantSouscription PIC 9(8)v99. 
       77 NoContratPCDisplay       PIC Z(3)9.
       77 NoContratOCDisplay       PIC Z(3)9.
       77 OperatComptes-EOF        PIC 9.
       77 FinInsertion PIC X.
       77 LigneDetailsOper PIC 99.
       77  CNXDB STRING .
       77 NoOperationOCDisplay      PIC Z(8)9.
       77 TypeOperationOCDisplay    PIC X(15).
       77 MontantOperationOCDisplay PIC Z(12)9.99.  *>ZBZZZBZZZBZZ9,99.
       77 ChoixLectSyntContrat PIC X.
      *77 LigneSimulation   PIC X(80).  
       77 PaginationOk PIC X.
       77 TitreNomPrenomSouscr PIC X(60). 
       77 AdresseSouscr    PIC X(60). 
       77 TitreNomPrenomBenef PIC X(60). 
       77 AdresseBenef    PIC X(60). 
       77 VisuDettOper PIC X.
       77 OkLaInfoAide pic X.
       77 OkLaInfoComm pic X.
       77 OkNonTrouve pic X.
       77 DateEffetContratEpargneDisplay PIC X(10).
       77 MontantRPrgPCDisplay   PIC ZZBZZZBZZ9.99.
       77 MontantVPrgPCDisplay   PIC ZZBZZZBZZ9.99.
       77 MontantSouscrPCDisplay PIC ZZBZZZBZZ9.99.
       77 DateDuJour PIC X(10). 

       Screen section.
       copy "Copybook-Ecrans.cpy".
       procedure division.
      *---------------------------------------------------------------------------------------------
      * Initialisation menu principal
      *---------------------------------------------------------------------------------------------
       Debut.
           perform Menu-Init.
           perform Menu-Trt until Option = 0.
           perform Menu-Fin.
       
       Menu-Init. 
           move 9 to option.
           accept DateSysteme from Date.

           perform ImportationFichier.   *> Pour importation fichiers de parametres csv
      *    move spaces to OperationsCompte
      *    move spaces to ProduitClient
      *    move 0 to OperationsCompte
      *    move 0 to ProduitClient.
           
       Menu-trt.

           move 0 to option.
           display menu-01.
           accept option at line 4 col 79.

               evaluate option

                   when 1
                       perform SimulationContrat
           
                   when 2
                       perform LectureSyntheseContrat

                   when 3
                       perform LectureOperationsContrat

                   when 0
                       continue

                   when other 
                       move " Vous avez fait une erreur de saisie " to LaInfoAide
                       display InfoAide
                       accept option line 4 col 79
                       Display REsetInfoAide

               end-evaluate.
           
       Menu-Fin.
           stop run.
           goback.

      **************************************************************************************************************
      * Importation du fichier des types de contrats d'epargne
      **************************************************************************************************************

       ImportationFichier.
           perform ImportationFichier-Init.
           perform ImportationFichier-Trt Until EofImport = 1.
           perform ImportationFichier-Fin.

      *---------------------------------------------------------------------------------------------
      * Initialisation de l'importation
      *---------------------------------------------------------------------------------------------
       
       ImportationFichier-Init.
           Move 0 to EofImport.
           Move 1 to IndexContrat.
           open input FichierEpargne.
           read FichierEpargne.

      *---------------------------------------------------------------------------------------------
      * Traitement d'une boucle de l'importation : lecture des lignes du fichier jusqu'à la fin
      *---------------------------------------------------------------------------------------------
           
       ImportationFichier-Trt.
           read FichierEpargne 
               at end move 1 to EofImport
               not at end perform TrtLigne
           end-read.
           
       ImportationFichier-Fin.
           close FichierEpargne.

      *---------------------------------------------------------------------------------------------
      * Recuperation valeurs et alimentation tableau index1,2,3
      *---------------------------------------------------------------------------------------------

       TrtLigne.

           Unstring EnrFichierEpargne delimited by ";" into

               CodeProduit  of ligneProduit(IndexContrat)  
               FraisEntree  of ligneProduit(IndexContrat)        
               FraisVersement   of ligneProduit(IndexContrat)   
               FiscRachat   of ligneProduit(IndexContrat)       
               TauxRemuneration  of ligneProduit(IndexContrat)   
               SeuilEntree   of ligneProduit(IndexContrat)     
               SeuilEntreeBrut   of ligneProduit(IndexContrat)   

           end-Unstring.
           Add 1 to IndexContrat.

      **************************************************************************************************************
      * Simulation de contrats d'epargne
      **************************************************************************************************************

       SimulationContrat.
           perform SimulationContrat-init
           perform SimulationContrat-trt until ChoixEcrSimulation = 'A'
           perform SimulationContrat-fin.

       SimulationContrat-init.
           Move 0 to DonneesValides
           Move space to CodeProduitE
           Move space to ChoixEcrSimulation
           Move spaces to Saisie-Simulation
           Move spaces to TiersSouscrBenef
           Move spaces to TiersBenef
           Move spaces to ProduitClient
           Move 0 to DateNaissanceTiers
           Move 0 to DateNaissanceTiersB.

      *---------------------------------------------------------------------------------------------
      * On affiche la masque de saisie et on recupere les infos des contrats
      *---------------------------------------------------------------------------------------------
       SimulationContrat-trt.
           Display menu-02-simulation
      *    display M-DonneeSimulation
           move 0 to DonneesValides
           Perform until DonneesValides = 1
             accept  CodeProduitE of ProduitEpargne at line 7 col  17 foreground-color is 3 Highlight

               Move Function Upper-case(CodeProduitE) to CodeProduitE
               display CodeProduitE at line 7 col  17 foreground-color is 3 Highlight 

               evaluate CodeProduitE
 
                   When = "A1"
                        Move 1 to IndexContrat
                        move 1 to DonneesValides
                        Display M-infoContrat
                        set A1 of param to true *> test params
                        Move Param to Tab

                   When = "B1"
                        Move 2 to IndexContrat
                        move 1 to DonneesValides
                        Display M-infoContrat
                        set B1 of param to true *> test params
                        Move Param to Tab

                   When = "PR"
                        Move 3 to IndexContrat
                        move 1 to DonneesValides
                        Display M-infoContrat
                        set PR of param to true *> test params
                        Move Param to Tab

                   when other
                           move " Produit inexistant... " to LaInfoAide
                           display InfoAide
                           accept  CodeProduitE of ProduitEpargne at line 7 col  17 foreground-color is 3 Highlight
                           Display REsetInfoAide
               end-evaluate
           End-perform.

      *---------------------------------------------------------------------------------------------
      * On permet la saisie des autres parametres duree et montant VP
      *---------------------------------------------------------------------------------------------
           move 0 to DonneesValides
           Perform until DonneesValides = 1
               accept PrevDureeCtr of Saisie-Simulation at line 9 col  16 foreground-color is 3 Highlight
               Move PrevDureeCtr to IndicateurMoisDuree
                   evaluate IndicateurMoisDuree
                       When >= 4  *> 4 ans  1 pour test
                           move 1 to DonneesValides
                       when other
                           move " Saisie non valide : >= 4 ans " to LaInfoAide
                           display InfoAide
                           accept PrevDureeCtr of Saisie-Simulation at line 9 col  16 foreground-color is 3 Highlight
                           Display REsetInfoAide
                   end-evaluate
           End-perform.
      *---------------------------------------------------------------------------------------------
      * On permet la saisie des autres parametres
      *---------------------------------------------------------------------------------------------
           move 0 to DonneesValides

           Perform until DonneesValides = 1
               accept MontantSouscr of Saisie-Simulation at line 11 col  32 foreground-color is 3 Highlight
               Move MontantSouscr of Saisie-Simulation to MontantSouscrTab
               Move MontantSouscr of Saisie-Simulation to  MontantSouscrPC
               Move SeuilEntreeBrut of Tab to MontEntreeBrut
                   evaluate MontantSouscrTab
                       When >= MontEntreeBrut  *> superieur à 0
      *                    display SeuilEntreeBrut of Tab at  line 10 col 50  *> pour controle
                           move 1 to DonneesValides
                       when other
                           move " Saisie non valide : Montant inferieur au minimum " to LaInfoAide
                           display InfoAide
                           accept MontantSouscr of Saisie-Simulation at line 11 col  32 foreground-color is 3 Highlight
                           Display REsetInfoAide
                   end-evaluate
           End-perform.

      *---------------------------------------------------------------------------------------------
      * On saisi ou pas de versement programmés 
      *---------------------------------------------------------------------------------------------
           move 0 to DonneesValides.
           accept VersPrg  of Saisie-Simulation at line 13 col  18 foreground-color is 3 Highlight.
           Perform until DonneesValides = 1
                   evaluate VersPrg  of Saisie-Simulation

                       When = 'o' OR = 'O'
                           Move 'O' to VersPrg  of Saisie-Simulation
                           display 'Oui' at line 13 col  18 foreground-color is 3 Highlight
                           set VrstProgrammes to true
                           move 1 to donneesValides

                       When = 'n' OR = 'N'
                           Move 'N' to VersPrg  of Saisie-Simulation
                           display 'Non' at line 13 col  18 foreground-color is 3 Highlight
                           set NoVrstProgrammes to true
                           move 1 to donneesValides
                       When other
                           move " Saisie non valide : [O]ui ou [N]on" to LaInfoAide
                           display InfoAide
                          accept VersPrg  of Saisie-Simulation at line 13 col  18 foreground-color is 3 Highlight
                          Display REsetInfoAide
                          
               end-evaluate
           End-perform.
      *---------------------------------------------------------------------------------------------
      * On affiche les infos vrst progr et periodicité, à saisir
      *---------------------------------------------------------------------------------------------
           move 0 to donneesValides
               If VrstProgrammes = true then
                   display M-DonneeSimulationVP

                       Perform until DonneesValides = 1
                        accept MontantVPrg  of Saisie-Simulation at line  13 col  32 foreground-color is 3 Highlight
                                 Move MontantVPrg of Saisie-Simulation to MontantVersementP
                                 Move MontantVPrg to MontantVPrgPC
                                 evaluate MontantVersementP
                                       when greater or equal 50  *> 10 pour test , autrement 50
                                           Move 1 to DonneesValides
                                       When other
                                           move " Saisie non valide : >= 50.00 Eur " to LaInfoAide
                                           display InfoAide
                                           accept MontantVPrg  of Saisie-Simulation at line  13 col  32 foreground-color is 3 Highlight
                                           Display REsetInfoAide
                                  end-evaluate
                       end-perform

                        Move 0 to DonneesValides

                       Perform until DonneesValides = 1

                        accept PeriodeVPrg  of Saisie-Simulation at line  13 col 65 foreground-color is 3 Highlight
                                evaluate PeriodeVPrg  of Saisie-Simulation
                                    when = 'M' or = 'm'
                                      Move 1 to VersPrgPC
                                      Move 1 to DonneesValides
                                      move 'M' to PeriodeVPrgPC
                                      set W-VP-Mens to true
                                      set W-VP-Oui to true
                                      display 'Mensuel' at line  13 col  65 foreground-color is 3 Highlight
                                    when = 'T' or = 't' 
                                      Move 1 to DonneesValides
                                      move 'T' to PeriodeVPrgPC
                                      Move 1 to VersPrgPC
                                      set W-VP-Trim to true
                                      set W-VP-Oui to true
                                      display 'Trimestriel' at line  13 col  65 foreground-color is 3 Highlight
                                    when = 'S' or = 's'
                                      set W-VP-Sem to true
                                      Move 1 to DonneesValides
                                      move 'S' to PeriodeVPrgPC
                                      Move 1 to VersPrgPC
                                      display 'Semestriel' at line  13 col  65 foreground-color is 3 Highlight
                                    when = 'A' or = 'a' 
                                      Move 1 to DonneesValides
                                      set W-VP-Ann to true
                                      set W-VP-Oui to true
                                      move 'A' to PeriodeVPrgPC
                                      Move 1 to VersPrgPC
                                      display 'Annuel' at line  13 col  65 foreground-color is 3 Highlight
                                    When other 
                                       move " Saisie non valide : [M] - [T] - [S]  ou [A]" to LaInfoAide
                                       display InfoAide
                                       accept PeriodeVPrg  of Saisie-Simulation at line  13 col  65 foreground-color is 3 Highlight
                                       Display REsetInfoAide
                                end-evaluate

                          end-perform

                   Else
                      continue
                   end-if
      *---------------------------------------------------------------------------------------------
      * On affiche les infos Rachat programmés
      *---------------------------------------------------------------------------------------------
           accept RachatPrg  of Saisie-Simulation at line  15 col  18  foreground-color is 3 Highlight
           move 0 to DonneesValides

           Perform until DonneesValides =1
                   evaluate RachatPrg  of Saisie-Simulation
                       When = 'o' OR = 'O'
                           Move 'O' to RachatPrg  of Saisie-Simulation
                           display 'Oui' at line 15 col  18  foreground-color is 3 Highlight
                           set W-RP-Oui to true
                           Move 1 to DonneesValides
                       When = 'n' OR = 'N'
                           Move 'N' to RachatPrg  of Saisie-Simulation
                           display 'Non' at line 15 col  18 foreground-color is 3 Highlight
                           Move 1 to DonneesValides
                           set W-RP-Non to true
                       When other
                           move " Saisie non valide : [O]ui ou [N]on" to LaInfoAide
                           display InfoAide
                           accept RachatPrg  of Saisie-Simulation at line 15 col  18 foreground-color is 3 Highlight
                           Display REsetInfoAide
                   end-evaluate
           end-perform.

      *---------------------------------------------------------------------------------------------
      * On affiche les infos Rachats progr et periodicité, à saisir
      *---------------------------------------------------------------------------------------------
           move 0 to DonneesValides
               If W-RP-Oui = true then
                   display M-DonneeSimulationRP
                       Perform until DonneesValides = 1
                        accept MontantRPrg  of Saisie-Simulation at line  15 col  32 foreground-color is 3 Highlight
                                 Move MontantRPrg of Saisie-Simulation to MontantRachatP 
                                 Move MontantRPrg to MontantRPrgPC
                                 evaluate MontantRachatP 
                                       when greater or equal 50  
                                           Move 1 to DonneesValides
                                       When other
                                           move " Saisie non valide : >= 50.00 Eur " to LaInfoAide
                                           display InfoAide
                                           accept MontantRPrg  of Saisie-Simulation at line  15 col  32 foreground-color is 3 Highlight
                                           Display REsetInfoAide
                                  end-evaluate
                       end-perform

                        Move 0 to DonneesValides

                       Perform until DonneesValides = 1

                        accept PeriodeRPrg  of Saisie-Simulation at line 15 col  65 foreground-color is 3 Highlight
                                evaluate PeriodeRPrg  of Saisie-Simulation
                                    when = 'M' or = 'm'
                                      Move 1 to DonneesValides
                                      move 'M' to PeriodeRPrgPC
                                      set W-RP-Mens to true
                                      set W-RP-Oui to true
                                      Move 1 to RachatPrgPC
                                      display 'Mensuel' at line  15 col 65 foreground-color is 3 Highlight
                                    when = 'T' or = 't' 
                                      Move 1 to DonneesValides
                                      move 'T' to PeriodeRPrgPC
                                      Move 1 to RachatPrgPC
                                      set W-RP-Trim to true
                                      set W-RP-Oui to true
                                      display 'Trimestriel' at line 15 col 65 foreground-color is 3 Highlight
                                    when = 'S' or = 's'
                                      set W-RP-Sem to true
                                      Move 1 to RachatPrgPC
                                      move 'S' to PeriodeRPrgPC
                                      Move 1 to DonneesValides
                                      display 'Semestriel' at line 15 col 65 foreground-color is 3 Highlight
                                    when = 'A' or = 'a' 
                                      Move 1 to RachatPrgPC
                                      move 'A' to PeriodeRPrgPC
                                      Move 1 to DonneesValides
                                      set W-RP-Ann to true
                                      set W-RP-Oui to true
                                      display 'Annuel' at line 15 col 65 foreground-color is 3 Highlight
                                    When other 
                                       move " Saisie non valide : [M] - [T] - [S]  ou [A]" to LaInfoAide
                                       display InfoAide
                                       accept PeriodeRPrg  of Saisie-Simulation at line 15 col 65 foreground-color is 3 Highlight
                                       Display REsetInfoAide
                                end-evaluate

                          end-perform

                   Else
                      continue
                   end-if


      *---------------------------------------------------------------------------------------------
      * On Valide et on lance la simulation ou on annule.
      *---------------------------------------------------------------------------------------------

           Accept ChoixEcrSimulation at line 19 col 75 foreground-color is 3 Highlight.

                   If ChoixEcrSimulation = 'a' move 'A' to ChoixEcrSimulation.
                   If ChoixEcrSimulation = 'v' move 'V' to ChoixEcrSimulation.

                   Evaluate ChoixEcrSimulation

                       when 'A' *> Retour au menu precedent
                           Move spaces to CodeProduitE of ProduitEpargne
                           Move spaces to Saisie-Simulation
                       
                       When 'V' *> on valide la simulation verifiant les valeurs saisies
                           perform testValSimulation
                           perform SimulationCalculEpargne

                       When other *> on reste sur l'option tant que une bonne choix est faite
                            move " Saisie non valide : A ou V" to LaInfoAide
                            display InfoAide
                            Accept ChoixEcrSimulation at line 19 col 75 foreground-color is 3 Highlight
                            Display REsetInfoAide
                   end-evaluate.


       SimulationContrat-fin.
           continue.

      *---------------------------------------------------------------------------------------------
      * On verifie les valeurs saisies et on le compare aux contraintes du contrat,
      * montant minumim de souscription. A faire si on a le temps.
      *---------------------------------------------------------------------------------------------
       testValSimulation.
           continue.


       
      ***************************************************************************************
      * A partir des données reçus, on obtient la simulation finale
      ***************************************************************************************

       SimulationCalculEpargne.
           Perform SimulationCalculEpargne-init.
           Perform SimulationCalculEpargne-trt.
           Perform SimulationCalculEpargne-fin.
       
       SimulationCalculEpargne-init.
           move 0 to ValeurContrat
           move 0 to  ValeurInterets
           move 0 to  ValeurInteretsAnnee
           move 0 to  ValeurFraisContrat
           move 0 to  IndicateurMoisDureePart
           Move Annee of datesysteme to IndicateurAnnee
           move 7 to IndicateurLigne.
      *-----------------------------------------------------------------------------------------------
      *    Preparation variables
      *-----------------------------------------------------------------------------------------------
           divide 12 into TauxRemuneration of Tab giving TauxRemPeriode *> Taux remuneration /mensuel

      ************montant net : Mont Brut - frais entree
           Move MontantSouscr of Saisie-Simulation to ValeurContrat *> Capital initial
           Multiply ValeurContrat by FraisEntree of Tab giving FraisContratTmp
           Subtract FraisContratTmp from ValeurContrat *> Capital initial au net des frais d'entree
 
           add FraisContratTmp to ValeurFraisContrat *> por calcul frais totales

           move mois of DateSysteme to IndicateurMois

      ************Versements **********
           Move MontantVPrg of Saisie-Simulation to MontantVersementP *> Versement brut initial 

           Multiply MontantVersementP by FraisVersement of Tab giving MontantVersementP-tmp *> Versement Net  
           Subtract MontantVersementP-tmp from MontantVersementP


      *************rachats**********
           Move MontantRPrg of Saisie-Simulation to MontantRachatP *> Rachat brut initial 

           Multiply MontantRachatP by FiscRachat of Tab giving MontantRachatP-tmp *> Rachat Net  
           Subtract MontantRachatP-tmp from MontantRachatP


      *************annualisation****
           Move PrevDureeCtr to IndicateurMoisDuree
           Multiply 12 by IndicateurMoisDuree giving IndicateurMoisDureeTot. *> On transforme les années en mois
      *-----------------------------------------------------------------------------------------------
      *    Fin preparation variables
      *-----------------------------------------------------------------------------------------------

       SimulationCalculEpargne-trt.
           display M-ResetEcran
           display M-ResultatSimulation
           OPEN OUTPUT FichierPrint. *> Print...

           perform CalculInteretAnnuel.

      *-----------------------------------------------------------------------------------------------
      *    Debut CalculInteretAnnuel Valeur du contrat + vers programmés 03/04/2018
      *-----------------------------------------------------------------------------------------------
       CalculInteretAnnuel.
           Perform until IndicateurMoisDureePart equal IndicateurMoisDureeTot 
               Perform Ajoute-VP
               Perform Enleve-RP
               Perform CalculInteretsMensuels
               If IndicateurMois > 12 Perform CalculValeursFinAnnee

           End-perform.

      *-----------------------------------------------------------------------------------------------
      *   Aprés les calculs, on affiche les Totaux et on propose la souscription
      *-----------------------------------------------------------------------------------------------
           move ValeurContrat to ValeurContratDisplay
           move ValeurInterets to ValeurInteretsDisplay
           move ValeurFraisContrat to ValeurFraisContratDisplay

           Move ValeurContratDisplay to EnrFichierPrint
           write EnrFichierPrint
           move ValeurInteretsDisplay to EnrFichierPrint
           write EnrFichierPrint
           move ValeurFraisContratDisplay to EnrFichierPrint
           write EnrFichierPrint
           Close FichierPrint.

           display M-infoContratSimulation

           Move  9 to DonneesValides.
           perform until DonneesValides = 0 or = 1
            accept ChoixValideSimulation at line 25 col 60  foreground-color is 3 Highlight
               Evaluate ChoixValideSimulation 
                   When = 'o' OR = 'O'
                       Move  1 to DonneesValides
                   When = 'n' OR = 'N'
                       Move  'A' to ChoixEcrSimulation *> On annule la saisie
                       Move  0 to DonneesValides
                   When other
      *                accept ChoixValideSimulation at line 25 col 60  foreground-color is 3 Highlight
               end-evaluate

           End-perform.

      *-----------------------------------------------------------------------------------------------
      *    Selon periodicité M/T/S/A on rajoute les versements programmés
      *-----------------------------------------------------------------------------------------------
       Ajoute-VP.
               Evaluate PeriodeVPrg of Saisie-Simulation
                   When = 'M' or ='m' *> un verse à chaque periode
                       add MontantVersementP  to ValeurContrat
                       add MontantVersementP-tmp to ValeurFraisContrat
       
                   When = 'T' or = 't'*> un verse à chaque periode 03-06-09-12
                       if IndicateurMois = 3 or = 6 or = 9 or = 12 then
                           add MontantVersementP  to ValeurContrat
                           add MontantVersementP-tmp to ValeurFraisContrat

                       end-if
                   
                   When = 'S' or = 's'*> un verse à chaque periode 06-12
                       if IndicateurMois = 6 or IndicateurMois = 12  then
                           add MontantVersementP  to ValeurContrat
                           add MontantVersementP-tmp to ValeurFraisContrat
                       end-if
       
                   When = 'A' or ='a'*> un verse à chaque periode 12
                       if IndicateurMois = 12  then
                           add MontantVersementP  to ValeurContrat
                           add MontantVersementP-tmp to ValeurFraisContrat
                       end-if
                   When other
                       continue
               end-evaluate.

      *-----------------------------------------------------------------------------------------------
      *    Selon periodicité M/T/S/A on enleve les rachats programmés * en cours
      *-----------------------------------------------------------------------------------------------
       Enleve-RP.
               Evaluate PeriodeRPrg of Saisie-Simulation
                   When = 'M' or ='m' *> un rachat à chaque periode
                       Subtract MontantRachatP From ValeurContrat
                       add MontantRachatP-tmp to ValeurFraisContrat
       
                   When = 'T' or = 't'*> un rachat à chaque periode 03-06-09-12
                       if IndicateurMois = 3 or = 6 or = 9 or = 12 then
                           Subtract MontantRachatP  From ValeurContrat
                           add MontantRachatP-tmp to ValeurFraisContrat

                       end-if
                   
                   When = 'S' or = 's'*> un rachat à chaque periode 06-12
                       if IndicateurMois = 6 or IndicateurMois = 12  then
                           Subtract MontantRachatP  From ValeurContrat
                           add MontantRachatP-tmp to ValeurFraisContrat

                       end-if
       
                   When = 'A' or ='a'*> un rachat à chaque periode 12
                       if IndicateurMois = 12  then
                           Subtract MontantRachatP  From ValeurContrat
                           add MontantRachatP-tmp to ValeurFraisContrat
                       end-if
                   When other
                       continue
               end-evaluate.

      *-----------------------------------------------------------------------------------------------
      *    Calcul Interets mensuels
      *-----------------------------------------------------------------------------------------------
       CalculInteretsMensuels.
           Multiply ValeurContrat by TauxRemPeriode giving CumulInterets of tableauCalcul(IndicateurMois)
           add CumulInterets of tableauCalcul(IndicateurMois) to ValeurInterets.
           add CumulInterets of tableauCalcul(IndicateurMois) to ValeurInteretsAnnee.
           Move ValeurContrat to ValeurContratDisplay
           Move CumulInterets of tableauCalcul(IndicateurMois) to ValeurInteretsDisplay

      *-----------------------------------------------------------------------------------------------
      *   On gére l'affichage...
      *-----------------------------------------------------------------------------------------------
           Move ValeurContratDisplay to ValeurContratDisplayG
           Move ValeurInteretsDisplay to ValeurInteretsDisplayG
           String  IndicateurMois
             '/'
             IndicateurAnnee
             INTO IndicateurMoisG
      *    Move IndicateurMois to IndicateurMoisG 
           move ValsContratDisplay to EnrFichierPrint *> Print...
           Display ValsContratDisplay at line IndicateurLigne col 4 foreground-color is 3 Highlight
           Write EnrFichierPrint *> Print...
           Add 1 to IndicateurLigne
           add 1 to IndicateurMois
           add 1 to IndicateurMoisDureePart
           
           If IndicateurLigne > 20
               move 7 to IndicateurLigne
               move " Pressez Enter pour continuer >> " to LaInfoAide
               Display LaInfoAide at line 25 col 1 foreground-color is 3 Highlight 
               Accept PaginationOk at line 25 col 74 foreground-color is 3 Highlight
               Display REsetInfoAide
      * on reaffiche l'ecran pour eliminer les lignes parasites de l'ecran précedent
               display M-ResetEcran
               display M-ResultatSimulation
               
           Else
               Continue
           end-if.


      *-----------------------------------------------------------------------------------------------
      *   On gére à la fin d'année la fiscalité eventuelle, et on rajoute les intérets au capital.
      *-----------------------------------------------------------------------------------------------
       CalculValeursFinAnnee.
                   move 1 to IndicateurMois *> on recommence l'année
                   add 1 to IndicateurAnnee
                   Multiply ValeurInteretsAnnee by TauxPrelSociaux giving ValeurFraisPrelSoc *> - prel sociaux
                   Subtract ValeurFraisPrelSoc From ValeurInteretsAnnee giving ValeurInteretsNets
                   add ValeurInteretsNets to ValeurContrat *> Capital + interets
                   Add ValeurFraisPrelSoc to ValeurFraisContrat *> pour le total des frais
                
                   move ValeurContrat to ValeurContratDisplay *> print
                   move ValeurInteretsNets to ValeurInteretsDisplay
                   move ValeurFraisContrat to ValeurFraisContratDisplay
                   move 0 to ValeurInteretsAnnee
                   Move ValeurContratDisplay to EnrFichierPrint
                   write EnrFichierPrint
                   move ValeurInteretsDisplay to EnrFichierPrint
                   write EnrFichierPrint
                   move ValeurFraisContratDisplay to EnrFichierPrint
                   write EnrFichierPrint. *> print
                   Move ValeurFraisPrelSoc to ValeurFraisPrelSocDisplay
                   move ValeurFraisPrelSocDisplay to EnrFichierPrint
                   write EnrFichierPrint. *> print


       
      *-----------------------------------------------------------------------------------------------
      *    Fin CalculInteretAnnuel   03/04/2018
      *-----------------------------------------------------------------------------------------------

       SimulationCalculEpargne-fin.

           If DonneesValides = 1  *> le client a validé la simulation
               set W-PassageSimulation to true
               perform GestionTiers
           Else 
               continue
           end-if.


      ***************************************************************************************
      * Gestion des Tiers souscripteurs beneficiaires
      ***************************************************************************************
      *-----------------------------------------------------------------------------------------------

      *-----------------------------------------------------------------------------------------------
       GestionTiers.
           perform GestionTiers-init.
           perform GestionTiers-trt until ChoixInsertion = 'A' or 'a'.
           perform GestionTiers-fin.
       
      *--------------------------------------------------------------------------------------
      * Initialisation de la gestion des clients
      *-----------------------------------------------------------------------------------------------

       GestionTiers-init. *> on recupere les variables depuis la simulation
      *                      code produit, date ?, prev; durée, mont brut,vrspr, rchtprg, flag 0/1 + MTSA 
           Move space to ChoixInsertion
           move spaces to TiersSouscrBenef
           Move spaces to VarTempString.



       GestionTiers-trt.
           move spaces to TiersSouscrBenef
           display EcranGestionTiers.
           Display '@' at line 15 col 65 foreground-color is 3 Highlight.
           Display '/  /' at line 17 col 27 foreground-color is 3 Highlight.
      *    display EcranGestionTiersAlternatif.
      *    display M-DonneeTiers.
      **************************
           accept Intitule at line  7 col 10 required foreground-color is 3 Highlight .
           accept nom  at line  7 col 23 required foreground-color is 3 Highlight .
           accept prenom  at line 7 col 55 required foreground-color is 3 Highlight.   
      *    10 line  7 col 58 using TypeClient of TiersSouscrBenef pic x(20).   

           accept NoRue at line 9 col 8 required foreground-color is 3 Highlight.
           accept Rue at line  9 col 22 required foreground-color is 3 Highlight.

           accept CodePostal at line  11 col 8 required foreground-color is 3 Highlight.
           accept Ville at line  11 col 25 required foreground-color is 3 Highlight.
           accept Pays  at line  11 col 59 required foreground-color is 3 Highlight.


           accept CodeBanqueT of TiersSouscrBenef at line  13 col 12 auto required background-color is 5 Foreground-color is 3 Highlight.
           accept Codeguichet of TiersSouscrBenef at line  13 col 18 auto required background-color is 5 foreground-color is 3 Highlight.
           accept RacineCompte of TiersSouscrBenef at line  13 col 24 auto required background-color is 5 foreground-color is 3 Highlight.
           accept TypeCompte of TiersSouscrBenef at line  13 col 34 auto required background-color is 5 foreground-color is 3 Highlight .
           accept CleRib of TiersSouscrBenef at line  13 col 37 auto required background-color is 5 foreground-color is 3 Highlight .

           accept Telephone at line  15 col 19 foreground-color is 3 Highlight.

      *--------------------------------------------------------------------------------------
      * Verif saisie - à faire
      *--------------------------------------------------------------------------------------
           

           accept Courriel-avant at line 15 col 48 foreground-color is 3 Highlight.
           accept Courriel-apres at line 15 col 66 foreground-color is 3 Highlight.

      * REMOVE SPACES -  A FAIRE    
           if Courriel-avant  <> '' or  Courriel-apres <> ''
               String Courriel-avant
                 '@' delimited by space
                 Courriel-apres delimited by space
                 Into Courriel
           Else
               Move space to Courriel
           End-if


           Display Courriel of TiersSouscrBenef at line 25 col 5 foreground-color is 3 Highlight.

      *---------------------------------------------------------------------------------------------
      * Verification âge : majeur...ou pas
      *---------------------------------------------------------------------------------------------
           Accept jour of DateNaissanceTiers  at line 17 col 25  required foreground-color is 3 Highlight
           Accept Mois of DateNaissanceTiers  at line 17 col 28  required foreground-color is 3 Highlight
           Accept annee of DateNaissanceTiers  at line 17 col 31  required foreground-color is 3 Highlight

           ACCEPT DateEffetContratEpargne from date YYYYMMDD

            String annee of DateEffetContratEpargne '-'
             Mois of DateEffetContratEpargne  '-'
             jour of DateEffetContratEpargne into DateEffetPC.    


            String annee of DateNaissanceTiers '-'
             Mois of DateNaissanceTiers  '-'
             jour of DateNaissanceTiers  into DateNaissance of TiersSouscrBenef.             

           Call 'CalculAge' USING DateNaissanceTiers, DateEffetContratEpargne, AgeTiers.

           If AgeTiers >= 18 *> test > 18 ans? si non le programme ne continue pas
      *---------------------------------------------------------------------------------------------
      *     si Souscripteur... + 18 ans
      *---------------------------------------------------------------------------------------------
               Move 'O' to IsSouscr
               display 'Oui' at line 17 col 48 foreground-color is 3 Highlight

      *---------------------------------------------------------------------------------------------
      *     si beneficiaire...
      *---------------------------------------------------------------------------------------------
               move 0 to DonneesValides
               Accept Isbenef at line 17 col 62 foreground-color is 3 Highlight
               Perform until DonneesValides = 1
                       evaluate Isbenef
                           When = 'o' OR = 'O'
                               Move 'O' to Isbenef
                               display 'Oui' at line 17 col 62 foreground-color is 3 Highlight
                               move 1 to donneesValides
       
                           When = 'n' OR = 'N'
                               Move 'N' to Isbenef
                               display 'Non' at line 17 col 62  foreground-color is 3 Highlight
                               perform GestionTiersBenef
                               move 1 to donneesValides
                           When other
                               move " Saisie non valide : [O]ui ou [N]on" to LaInfoAide
                               display InfoAide
                              Accept Isbenef at line 17 col 62 foreground-color is 3 Highlight
                              Display REsetInfoAide
                        end-evaluate
               End-perform

           Else
               Move 'N' to IsSouscr
               display 'Non' at line 17 col 48  Foreground-color is 3 Highlight
               move " Attention : Le souscr doit etre majeur ! Souscription annulee" to LaInfoAide
               display InfoAide
               Move 'A' to ChoixInsertion 
               Accept ChoixInsertion at line 20 col 75 foreground-color is 3 Highlight
               Display REsetInfoAide
           End-if

      * A priori toutes les données sont correctes
      *    move 1 to DonneeCorrect.
           
      * On fait le contrôle des données
      *    if nom = "" move 0 to DonneeCorrect.
 

           If W-BenefSaisi = false and LaInfoAide  <> " Attention : Le souscr doit etre majeur ! Souscription annulee"
               Move space to ChoixInsertion
               Accept ChoixInsertion at line 20 col 75 foreground-color is 3 Highlight
      *    end-if


           if ChoixInsertion = 'a' move 'A' to ChoixInsertion.
           if ChoixInsertion = 'v' move 'V' to ChoixInsertion.

             Evaluate ChoixInsertion
                       
                    when = 'A' *> Retour au menu precedent
                           Move 'A' to ChoixEcrSimulation
      *                    Move 'A' to ChoixInsertion 
      *                    continue
                       
                 When = 'V'*> on valide la simulation verifiant les valeurs saisies
                            if IsBenef = 'Non' And W-BenefSaisi = false
                               perform GestionTiersBenef
                            End-if
                            Perform InsertionDonnéesTiers

                       When other *> on reste sur l'option tant que une bonne choix est faite
                            move " Saisie non valide : A ou V" to LaInfoAide
                            display InfoAide
                            Accept ChoixInsertion at line 20 col 75 foreground-color is 3 Highlight
                            Display REsetInfoAide
                   end-evaluate.


       GestionTiers-fin.
           continue.
  

      ***************************************************************************************
      ***************************************************************************************
      * Test des couleurs de l'écran
      ***************************************************************************************
      ***************************************************************************************
       TestCouleur.
           move 0 to CouleurFondEcran.
           perform TestCouleurAffichage until CouleurFondEcran = 64  .
           
       TestCouleurAffichage.
           add 1 to CouleurFondEcran.
           display M-TestCouleur.
           display " Couleur de fond = " line 1 col 1 with no advancing.
           display CouleurFondEcran with no advancing.
           accept CouleurSaisie.
           
      *-----------------------------------------------------------------------------------------------
      *    test age - a placer en call externe su
      *-----------------------------------------------------------------------------------------------
       test-age.
           display M-ResetEcran.

           Accept jour of DateNaissanceTiers  at line 17 col 25
           Accept Mois of DateNaissanceTiers  at line 17 col 28
           Accept annee of DateNaissanceTiers  at line 17 col 31

           ACCEPT DateEffetContratEpargne from date YYYYMMDD

           Call 'CalculAge' USING DateNaissanceTiers, DateEffetContratEpargne, AgeTiers.
      *  
           Display AgeTiers 'ans'.
           accept option.

       InsertionDonnéesTiers.
           perform InsertionDonnéesTiers-init.
           perform InsertionDonnéesTiers-trt.
           perform InsertionDonnéesTiers-fin.

       InsertionDonnéesTiers-init.
           Move 0 to DonneesValides
           Call 'ConnectSQL' using cnxDb.

           If SQLCODE <> 0
               Display " Erreur de connection à la base des données Abeilles"  at line 24 col 2
           else
               continue
           end-if.

       InsertionDonnéesTiers-trt.

      ***** On recupére l'index de la table tiers et on l'incrément de 1 ********************* 
           If W-BenefSaisi = True
               EXEC SQL
                   Select MAX(IdTiers) into :IdTiersB from TiersSB
               End-EXEC
       
               Add 1 to IdTiersB
      *    -----------------------------------------------------------------------------------------------
      *     Insertion Tiers Beneficiaire # et insertion dans la table 
      *    -----------------------------------------------------------------------------------------------
               exec sql
                   INSERT INTO TiersSB
                        (IdTiers
                        ,CodeBanque
                        ,CodeGuichet
                        ,RacineCompte
                        ,TypeCompte
                        ,CleRib
                        ,Intitule
                        ,Prenom
                        ,Nom
                        ,NoRue
                        ,Rue
                        ,CodePostal
                        ,Ville
                        ,Pays 
                        ,Telephone
                        ,Courriel
                        ,DateNaissance)
                    VALUES
                        (:IdTiersB
                        ,:CodeBanqueTB
                        ,:CodeGuichetB
                        ,:RacineCompteB
                        ,:TypeCompteB
                        ,:CleRibB
                        ,:IntituleB
                        ,:PrenomB
                        ,:NomB
                        ,:NoRueB
                        ,:RueB
                        ,:CodePostalB
                        ,:VilleB
                        ,:Pays 
                        ,:TelephoneB
                        ,:CourrielB
                        ,:DateNaissanceB)

               end-exec
               If SQLCODE <>0  
                   Display " Erreur TiersSB: " SQLCODE at line 24 Col 2 foreground-color is 2 highlight 
               else
                   Move 1 to DonneesValides
                   move IdTiersB to TiersBeneficPC
               end-if

           End-if.


      ********** On recupére l'index de la table tiers et on l'incrément de 1 ********************* 
           EXEC SQL
               Select MAX(IdTiers) into :IdTiers from TiersSB
           End-EXEC.
       
           Add 1 to IdTiers of TiersSouscrBenef
           move IdTiers of TiersSouscrBenef to TiersSouscrPC.
           If W-BenefSaisi = FALSE move IdTiers of TiersSouscrBenef to TiersBeneficPC.

      *    Display IdTiers.
            
      *-----------------------------------------------------------------------------------------------
      * Insertion Tiers
      *-----------------------------------------------------------------------------------------------
           exec sql
               INSERT INTO TiersSB
                        (IdTiers
                        ,CodeBanque
                        ,CodeGuichet
                        ,RacineCompte
                        ,TypeCompte
                        ,CleRib
                        ,Intitule
                        ,Prenom
                        ,Nom
                        ,NoRue
                        ,Rue
                        ,CodePostal
                        ,Ville
                        ,Pays 
                        ,Telephone
                        ,Courriel
                        ,DateNaissance)
                VALUES
                    (:IdTiers
                    ,:CodeBanqueT
                    ,:CodeGuichet
                    ,:RacineCompte
                    ,:TypeCompte
                    ,:CleRib
                    ,:Intitule
                    ,:Prenom
                    ,:Nom
                    ,:NoRue
                    ,:Rue
                    ,:CodePostal
                    ,:Ville
                    ,:Pays 
                    ,:Telephone
                    ,:Courriel
                    ,:DateNaissance)

           end-exec.
           If SQLCODE <>0  
               Display " Erreur : TiersSB " SQLCODE at line 24 Col 2 foreground-color is 2 highlight 
           else
               Move 1 to DonneesValides
           end-if.
      *-----------------------------------------------------------------------------------------------
      * Contrat lié au Tiers - Incrementation de l'index
      *-----------------------------------------------------------------------------------------------    

                   EXEC SQL
                       Select MAX(NoContrat) into :NoContratPC from ProduitsClient
                       Where CodeProduit = :CodeProduitParam;
                   End-EXEC.
       
                   Add 1 to NoContratPC
                   Move 1 to EtatProduitPC

      *            Display NoContratPC


                   If SQLCODE <> 0
                       Display " Erreur de connection à la base des données Max(Nocontrat)" at line 24 Col 2 foreground-color is 2 highlight 

                   else
                       Move 1 to DonneesValides
                   end-if
      *-----------------------------------------------------------------------------------------------
      *         Insertion données contrat liés au Tiers
      *-----------------------------------------------------------------------------------------------

                   exec sql
                       INSERT INTO ProduitsClient
                            (CodeProduit
                            ,NoContrat
                            ,TiersSouscr
                            ,TiersBenefic
                            ,MontantSouscr
                            ,DateEffet
                            ,VersPrg
                            ,PeriodeVPrg
                            ,MontantVPrg
                            ,RachatPrg
                            ,PeriodeRPrg
                            ,MontantRPrg
                            ,EtatProduit)
                       VALUES
                            (:CodeProduitParam
                            ,:NoContratPC
                            ,:TiersSouscrPC
                            ,:TiersBeneficPC
                            ,:MontantSouscrPC
                            ,:DateEffetPC
                            ,:VersPrgPC 
                            ,:PeriodeVPrgPC
                            ,:MontantVPrgPC
                            ,:RachatPrgPC
                            ,:PeriodeRPrgPC
                            ,:MontantRPrgPC
                            ,:EtatProduitPC)
                   end-exec

                   If SQLCODE <>0  
                       Display " Erreur : ProduitsClient "  at line 24 Col 2 foreground-color is 2 highlight 
                       Display  SQLCODE  at line 55 Col 2 foreground-color is 2 highlight 

                   else
                       continue
                   end-if.

      *-----------------------------------------------------------------------------------------------
      *     Insertion Operation de souscription dans la table Operations compte
      *-----------------------------------------------------------------------------------------------
                  Move CodeProduitParam to CodeProduitOC
                  Move NoContratPC to NoContratOC
                  Move 'S' to TypeOperationOC
                  Move 1 to NoOperationOC
                  Move MontantSouscrPC to MontantOperationOC
                  Move DateEffetPC to DateOperationOC

                   exec sql
                       INSERT INTO OperationsCompte
					            (CodeProduit
					            ,NoContrat
					            ,NoOperation
					            ,TypeOperation
					            ,MontantOperation
					            ,DateOperation)
					   VALUES
					            (:CodeProduitOC
					            ,:NoContratOC
					            ,:NoOperationOC
					            ,:TypeOperationOC
					            ,:MontantOperationOC
					            ,:DateOperationOC )
                      end-exec

                   If SQLCODE <> 0
                       Display " Erreur : OperationsCompte " at line 24 Col 2 foreground-color is 2 highlight 
                       Display  SQLCODE  at line 55 Col 2 foreground-color is 2 highlight 

                   else
                       Move 1 to DonneesValides
                   end-if.


       InsertionDonnéesTiers-fin.
           If  DonneesValides = 1
               Move space to ChoixInsertion
               Move 'A' to ChoixInsertion *> move A to ...^pour sortir + messaggio okl
               move " Les infos ont etes correctement sauvegardes dans la base :" & CodeProduitOC & ' ' & NoContratOC to LaInfoComm
               display InfoComm
               Accept FinInsertion at line 25 col 75
               Move 'A' to ChoixEcrSimulation
               Display REsetInfoComm
           Else
               continue
           end-if.

           exec sql
               CONNECT RESET 
           end-exec.
       
      *-----------------------------------------------------------------------------------------------
      *  MENU 5 - Lecture Synthése contrat 
      *-----------------------------------------------------------------------------------------------

       LectureSyntheseContrat.
           perform LectureSyntheseContrat-init.
           perform LectureSyntheseContrat-trt until ChoixLectSyntContrat = '0'.
           perform LectureSyntheseContrat-fin.

       LectureSyntheseContrat-init.
           Move spaces to CodeProduitPC
           Move 0 to NoContratPC
           Move spaces to CodeProduitOC
           Move 0 to NoContratOC
           Move spaces to ChoixLectSyntContrat
           Move 0 to NoContratPCDisplay

           Call 'ConnectSQL' using cnxDb

           If SQLCODE <> 0
               Display " Erreur de connection à la base des données" at line 24 Col 2 foreground-color is 2 highlight 
           else
               continue
           end-if.

       LectureSyntheseContrat-trt.
          display M-SyntheseContrat 
      *   Accept M-SyntheseContrat 
          Accept CodeProduitPC at line 4 col 26 required foreground-color is 3 highlight.
          Move Function Upper-case(CodeProduitPC) to CodeProduitPC
          display CodeProduitPC at line 4 col 26 foreground-color is 3 highlight.
          Accept  NoContratPCDisplay at line 4 col 28 required foreground-color is 3 highlight.
          move NoContratPCDisplay to NoContratPC
          Display NoContratPC at line 4 col 28  foreground-color is 3 highlight.
      *   Accept NoContratPC at line 4 col 28 required foreground-color is 3 highlight.
          move CodeProduitPC to CodeProduitOC
          move NoContratPC to NoContratOC

      *-----------------------------------------------------------------------------------------------
      *  Selection contrat
      *-----------------------------------------------------------------------------------------------
 		   EXEC SQL
			   SELECT
                   CodeProduit
                   , NoContrat, TiersSouscr, TiersBenefic, MontantSouscr,DateEffet, VersPrg, PeriodeVPrg,
                   MontantVPrg, RachatPrg, PeriodeRPrg, MontantRPrg, EtatProduit                                            
               INTO :CodeProduitPC, :NoContratPC, :TiersSouscrPC, :TiersBeneficPC,
                   :MontantSouscrPC,:DateEffetPC, :VersPrgPC, :PeriodeVPrgPC,
                   :MontantVPrgPC, :RachatPrgPC, :PeriodeRPrgPC, :MontantRPrgPC, :EtatProduitPC                                 
				   FROM   ProduitsClient                                   
               WHERE (CodeProduit = :CodeProduitPC
               AND NoContrat = :NoContratPC);
           END-EXEC.
           If SQLCODE = 100
                   Display " Erreur : contrat non trouve - tapez entree >>"  at line 23 col 2 foreground-color is 3 highlight
                   accept OkNonTrouve at line 23 col 75
                   Move spaces to CodeProduitPC
                   Move 0 to NoContratPC
                   Move spaces to CodeProduitOC
                   Move 0 to NoContratOC
                   Move 0 to NoContratPCDisplay

                    perform LectureSyntheseContrat-trt
           else
               continue           
           end-if.
      *    Display ProduitClient aT line 9 col 2.

           unstring DateEffetPC delimited by '-' into
               Annee of DateEffetContratEpargne
               mois of DateEffetContratEpargne
               jour of DateEffetContratEpargne
           end-unstring

           String jour of DateEffetContratEpargne '/'
               mois of DateEffetContratEpargne '/'
               Annee of DateEffetContratEpargne 
               Into DateEffetContratEpargneDisplay
           end-string

           move MontantSouscrPC to MontantSouscrPCDisplay
           Display " Date souscription :" at line 6 col 1 foreground-color is 2 Highlight.
           Display DateEffetContratEpargneDisplay at line 6 col 22 foreground-color is 3 highlight.
           Display "Montant :" at line 6 col 34 foreground-color is 2 highlight.
           Display MontantSouscrPCDisplay at line 6 col 45 foreground-color is 3 highlight.
           if EtatProduitPC= 1 display 'Etat : Actif' at line 6 col 65 foreground-color is 2 Highlight.

      *    Call 'CalculValContrat' using CodeProduitPC, NoContratPC, ValeurContrat.
           perform CalculValContrat


           iF VersPrgPC = '1'
               move MontantVPrgPC to MontantVPrgPCDisplay
               Display " Versem. Prg :" at line 8 col 1 foreground-color is 2 Highlight
               Display "Oui" at line 8 col 16 foreground-color is 3 Highlight
               Display "Montant :" at line 8 col 21 foreground-color is 2 Highlight
               display MontantVPrgPCDisplay at line 8 col 31 foreground-color is 3 highlight
               Display "Periode :" at line 8 col 47 foreground-color is 2 Highlight
                   evaluate PeriodeVPrgPC 
                       when = 'M' or = 'm'
                       display 'Mensuel' at line 8 col 57 foreground-color is 3 highlight
                       when = 'T' or = 't' 
                       display 'Trimestriel' at line 8 col 57 foreground-color is 3 highlight
                       when = 'S' or = 's'
                       display 'Semestriel' at line 8 col 57 foreground-color is 3 highlight
                       when = 'A' or = 'a' 
                       display 'Annuel' at line 8 col 57 foreground-color is 3 highlight
                       When other 
                   end-evaluate

      *        display PeriodeVPrgPC at line 8 col 57 foreground-color is 3 highlight
           else
               display ' Aucun versement programme ' at line 8 col 1 foreground-color is 3 highlight
           end-if
           iF RachatPrgPC = '1'
               move MontantRPrgPC to MontantRPrgPCDisplay
               Display " Rachats Prg :" at line 10 col 1 foreground-color is 2 Highlight
               Display "Oui" at line 10 col 16 foreground-color is 3 Highlight
               Display "Montant :" at line 10 col 21 foreground-color is 2 Highlight
               display MontantRPrgPCDisplay AT line 10 col 31 foreground-color is 3 highlight
               Display "Periode :" at line 10 col 47 foreground-color is 2 Highlight
      *        display PeriodeRPrgPC at line 10 col 57 foreground-color is 3 highlight
                   evaluate PeriodeRPrgPC 
                       when = 'M' or = 'm'
                       display 'Mensuel' at line 10 col 57 foreground-color is 3 highlight
                       when = 'T' or = 't' 
                       display 'Trimestriel' at line 10 col 57 foreground-color is 3 highlight
                       when = 'S' or = 's'
                       display 'Semestriel' at line 10 col 57 foreground-color is 3 highlight
                       when = 'A' or = 'a' 
                       display 'Annuel' at line 10 col 57 foreground-color is 3 highlight
                       When other 

           else
               display ' Aucun rachat programme ' at line 10 col 1 foreground-color is 3 highlight
           end-if

      *-----------------------------------------------------------------------------------------------
      *  On recupére les ID Souscr et beneficiaire pour les afficher
      *-----------------------------------------------------------------------------------------------

           EXEC SQL
               SELECT TitreNomPrenom, Adresse
               INTO :TitreNomPrenomSouscr,:AdresseSouscr                              
               FROM TiersSB                                   
               WHERE IdTiers = :TiersSouscrPC
           END-EXEC.
           If SQLCODE <> 0
               Display " Erreur de connection à la base des données TiersSB" at line 24 Col 2 foreground-color is 2 highlight 
           else
               continue
           end-if.

           If TiersSouscrPC = TiersBeneficPC 
               display M-ecranSintheseSetB
           Else
               EXEC SQL
                   SELECT TitreNomPrenom, Adresse
                   INTO :TitreNomPrenomBenef,:AdresseBenef                          
                   FROM TiersSB                                   
                   WHERE IdTiers = :TiersBeneficPC
               END-EXEC

               display M-ecranSinthese

           end-if.

           Display ' Pressez entree pour details Operations >> ' at line 23 col 2 foreground-color is 3 Highlight 
           Accept VisuDettOper at line 23 col 60 .
           perform LectureOperationsContrat-trt.

       LectureSyntheseContrat-fin.
           EXEC SQL 
             Connect reset
           END-EXEC.

      *-----------------------------------------------------------------------------------------------
      *  Valorisation d'un contrat au jour j
      *-----------------------------------------------------------------------------------------------

       CalculValContrat.
           perform CalculValContrat-init.
           perform CalculValContrat-trt.
           perform CalculValContrat-fin.

       CalculValContrat-init.

           move 0 to ValeurContrat
           move 0 to ValeurContratDisplay

               evaluate CodeProduitOC
                   When = "A1"
                           set A1 of param to true 
                           Move Param to Tab
                   When = "B1"
                           set B1 of param to true 
                           Move Param to Tab

                   When = "PR"
                           set PR of param to true 
                           Move Param to Tab
                   when other
                          Continue
              end-evaluate



           EXEC SQL
               DECLARE OperationsCompteVal-Curseur CURSOR FOR 
                Select CodeProduit, NoContrat, NoOperation, TypeOperation, MontantOperation, DateOperation
                From [dbo].[OperationsCompte]
                Where (CodeProduit = :CodeProduitOC
                And NoContrat = :NoContratOc);
           END-EXEC.

           EXEC SQL
 	            OPEN OperationsCompteVal-Curseur
           END-EXEC.

       CalculValContrat-trt.
           MOVE 0 to OperatComptes-EOF

           perform until OperatComptes-EOF=1
               EXEC SQL 
                   FETCH OperationsCompteVal-Curseur
                       INTO :CodeProduitOC, :NoContratOC, :NoOperationOC, :TypeOperationOC,
                        :MontantOperationOC, :DateOperationOC
               END-EXEC

               If SQLCODE = 100 OR SQLCODE = 101 then
                   MOVE 1 to OperatComptes-EOF
               ELSE
                    Evaluate TypeOperationOC
                        When 'S'
                           multiply MontantOperationOC by FraisEntree of Tab giving FraisContratTmp
                           Subtract FraisContratTmp from MontantOperationOC
                           add MontantOperationOC to ValeurContrat

                        When 'V'
                           multiply MontantOperationOC by FraisVersement of Tab giving FraisContratTmp
                           Subtract FraisContratTmp from MontantOperationOC
                           add MontantOperationOC to ValeurContrat

                        When 'R'
                           multiply MontantOperationOC by FiscRachat of Tab giving FraisContratTmp
                           Subtract FraisContratTmp from MontantOperationOC
                           Subtract MontantOperationOC from ValeurContrat

                        When 'I'
                           add MontantOperationOC to ValeurContrat *> Int nets de PSociaux
                       when other
                           continue

                    end-evaluate
               end-if

           END-perform.

           string Jour of DateSysteme
             '/'  Mois of DateSysteme '/' Annee of DateSysteme
             into DateDuJour
           end-string.

           Move ValeurContrat to ValeurContratDisplay
      *    Display ' Valeur au ' & Jour of DateSysteme & '/' & Mois of DateSysteme & '/' & Annee of DateSysteme  at line 4 col 55 foreground-color is 3 highlight.              
           Display ' Valeur au ' at line 4 col 40 foreground-color is 2 highlight.
           Display DateDuJour at line 4 col 52 foreground-color is 2 highlight.
           Display ValeurContratDisplay at line 4 col 60 foreground-color is 3 highlight.

       CalculValContrat-fin.
           EXEC SQL
 	            CLOSE OperationsCompteVal-Curseur
           END-EXEC.

      *-----------------------------------------------------------------------------------------------
      *  MENU 6 - Lecture operations d'un contrat
      *-----------------------------------------------------------------------------------------------
       LectureOperationsContrat.
           perform LectureOperationsContrat-init.
           perform LectureOperationsContrat-trt until ChoixLectSyntContrat = 0.
           perform LectureOperationsContrat-fin.

       LectureOperationsContrat-init.

      *    Call 'ConnectSQL' using cnxDb.
      *
      *    If SQLCODE <> 0
      *        Display " Erreur de connection à la base des données cnxDb 6" at line 24 Col 2 foreground-color is 2 highlight 
      *    else
      *        continue
      *    end-if.

      *---------------------------------------------------------------------------------------------          
      * Declarations curseur pour OperationsCompte
      *---------------------------------------------------------------------------------------------

           Move spaces to CodeProduitOC.
           Move 0 to NoContratOC.
           Move spaces to ChoixLectSyntContrat.

       LectureOperationsContrat-trt.

          display M-OperationsCompte.
           If CodeProduitOC = space
               Accept CodeProduitOC at line 5 col 26 required foreground-color is 3 highlight
               Accept NoContratOC at line 5 col 28 required foreground-color is 3 highlight
           Else 
               display CodeProduitOC at line 5 col 26 foreground-color is 3 highlight
               Display NoContratOC at line 5 col 28 foreground-color is 3 highlight
           End-if.

           EXEC SQL
               DECLARE OperationsCompte-Curseur CURSOR FOR 
                Select CodeProduit, NoContrat, NoOperation, TypeOperation, MontantOperation, DateOperation
                From [dbo].[OperationsCompte]
                Where (CodeProduit = :CodeProduitOC
                And NoContrat = :NoContratOc);
           END-EXEC.

           EXEC SQL
 	            OPEN OperationsCompte-Curseur
           END-EXEC.

           MOVE 0 to OperatComptes-EOF
           move 9 TO LigneDetailsOper.

           perform until OperatComptes-EOF=1
               EXEC SQL 
                   FETCH OperationsCompte-Curseur
                       INTO :CodeProduitOC, :NoContratOC, :NoOperationOC, :TypeOperationOC,
                        :MontantOperationOC, :DateOperationOC
               END-EXEC

               If SQLCODE = 100 OR SQLCODE = 101 then
                   MOVE 1 to OperatComptes-EOF
      *            add 1 to LigneDetailsOper
                   Display " Fin de la liste des Operations :" at line 23 Col 2 foreground-color is 2 highlight   
                   Display " Tapez [0] pour sortir, [2] pour une nouvelle recherche" at line 24 Col 2 foreground-color is 2 highlight  
                   accept ChoixLectSyntContrat at line 24 Col 75 foreground-color is 2 highlight 
                   Evaluate ChoixLectSyntContrat
                       When '2'
                           Move spaces to CodeProduitPC
                           Move 0 to NoContratPC
                           Move spaces to CodeProduitOC
                           Move 0 to NoContratOC
                           Move 0 to NoContratPCDisplay

                           Perform LectureSyntheseContrat
                       When '0'
                           continue

                       When Other
                           accept ChoixLectSyntContrat at line 24 Col 75 foreground-color is 2 highlight 
                   end-evaluate
               else
                  Move NoOperationOC to NoOperationOCDisplay
                  Move MontantOperationOC to MontantOperationOCDisplay

                  Evaluate TypeOperationOC
                      When 'V'
                           Move 'Versement' to TypeOperationOCDisplay
                      When 'R' 
                           Move 'Rachat' to TypeOperationOCDisplay
                      When 'S' 
                           Move 'Souscription' to TypeOperationOCDisplay
                      When 'I' 
                           Move 'Interets' to TypeOperationOCDisplay

                      When Other
                           Move TypeOperationOC to TypeOperationOCDisplay
                  end-evaluate


                  unstring DateOperationOC delimited by '-' into
                    Annee of DateOperationContrat
                    mois of DateOperationContrat
                    jour of DateOperationContrat
                  end-unstring

                   String jour of DateOperationContrat '/'
                     mois of DateOperationContrat '/'
                     Annee of DateOperationContrat 
                     Into DateOperationContratDisplay
                   end-string

                  Display DateOperationContratDisplay at line LigneDetailsOper Col 5 with no advancing foreground-color is 3 highlight 
                  Display TypeOperationOCDisplay at line LigneDetailsOper Col 33 with no advancing foreground-color is 3 highlight 
                  Display MontantOperationOCDisplay at line LigneDetailsOper Col 51 with no advancing foreground-color is 3 highlight

                  Add 1 TO LigneDetailsOper
                   If LigneDetailsOper > 20
                       move 9 TO LigneDetailsOper
                       move "Pressez entree pour afficher la suite >>" to LaInfoAide
                       Display LaInfoAide at line 23 col 1 foreground-color is 3 Highlight 
                       Accept PaginationOk at line 23 col 74 foreground-color is 3 Highlight
                       Display REsetInfoAide
      *******on reaffiche l'ecran pour eliminer les lignes parasites de l'ecran précedent
                       display M-ResetEcran
                       display M-OperationsCompte
                       display CodeProduitOC at line 5 col 26 foreground-color is 3 highlight
                       Display NoContratOC at line 5 col 28 foreground-color is 3 highlight

                   end-if
               end-if

           END-perform.
      * = VALORISATION
  
       LectureOperationsContrat-fin.
           EXEC SQL
 	            CLOSE OperationsCompte-Curseur
           END-EXEC.

       testsql.
               continue.


      *-----------------------------------------------------------------------------------------------
      *
      *-----------------------------------------------------------------------------------------------
       GestionTiersBenef.
           perform GestionTiersBenef-init
           perform GestionTiersBenef-Trt until ChoixInsertionBenef = 'A' or = 'a' or = 'V' or = 'v'
           perform GestionTiersBenef-fin.

       GestionTiersBenef-init.
           Move space to ChoixInsertionBenef
           move 0 to DateNaissanceB.

       GestionTiersBenef-Trt.
           Display EcranGestionTiersBenef.
           Display '@' at line 15 col 65 foreground-color is 3 Highlight.
           Display '/  /' at line 17 col 27 foreground-color is 3 Highlight.

      **************************
           accept IntituleB at line  7 col 10 required foreground-color is 3 Highlight .
           accept nomB  at line  7 col 23 required foreground-color is 3 Highlight .
           accept prenomB  at line 7 col 55 required foreground-color is 3 Highlight.   


           accept NoRueB at line 9 col 8 required foreground-color is 3 Highlight.
           accept RueB at line  9 col 22 required foreground-color is 3 Highlight.

           accept CodePostalB at line  11 col 8 required foreground-color is 3 Highlight.
           accept VilleB at line  11 col 25 required foreground-color is 3 Highlight.
           accept PaysB  at line  11 col 59 required foreground-color is 3 Highlight.


           accept CodeBanqueTB at line  13 col 12 auto required background-color is 5 Foreground-color is 3 Highlight.
           accept CodeguichetB at line  13 col 18 auto required background-color is 5 foreground-color is 3 Highlight.
           accept RacineCompteB  at line  13 col 24 auto required background-color is 5 foreground-color is 3 Highlight.
           accept TypeCompteB  at line  13 col 34 auto required background-color is 5 foreground-color is 3 Highlight .
           accept CleRibB  at line  13 col 37 auto required background-color is 5 foreground-color is 3 Highlight .

           accept TelephoneB at line  15 col 19 foreground-color is 3 Highlight.

           accept Courriel-avantB at line 15 col 48 foreground-color is 3 Highlight.
           accept Courriel-apresB at line 15 col 66 foreground-color is 3 Highlight.

      * REMOVE SPACES -  A FAIRE    
           if Courriel-avantB  <> '' or  Courriel-apresB <> ''
               String Courriel-avantB
                 '@' delimited by space
                 Courriel-apresB delimited by space
                 Into CourrielB
           Else
               Move space to CourrielB
           End-if

           Display CourrielB at line 25 col 5 foreground-color is 3 Highlight.


           move 0 to DonneesValides
               Accept jour of DateNaissanceTiersB  at line 17 col 25  required foreground-color is 3 Highlight
               Accept Mois of DateNaissanceTiersB  at line 17 col 28  required foreground-color is 3 Highlight

           Perform until DonneesValides = 1
               Accept annee of DateNaissanceTiersB  at line 17 col 31  required foreground-color is 3 Highlight
               if annee of DateNaissanceTiersB greater or equal Annee of DateEffetContratEpargne
                   move " Date non valide" to LaInfoAide
                   display InfoAide
                   Accept annee of DateNaissanceTiersB  at line 17 col 31  required foreground-color is 3 Highlight
                   Display REsetInfoAide
               else
                   move 1 to DonneesValides
               End-if
           End-perform.

            String annee of DateNaissanceTiersB '-'
             Mois of DateNaissanceTiersB  '-'
             jour of DateNaissanceTiersB  into DateNaissanceB.    

      *    Accept ChoixInsertionBenef at line 20 col 75 foreground-color is 3 Highlight
           
           move 0 to DonneesValides
           Move space to ChoixInsertionBenef
            Perform until DonneesValides= 1
                   Accept ChoixInsertionBenef at line 20 col 75 foreground-color is 3 Highlight

                       Evaluate ChoixInsertionBenef

                        when = 'A' or = 'a' *> Retour au menu precedent
                               Move 'A' to ChoixInsertionBenef 
                               Move 'A' to  ChoixInsertion 
                               Move 'A' to ChoixEcrSimulation

                               move 1 to DonneesValides
      *                        continue
                       
                        When = 'V' or = 'v'*> on valide la simulation verifiant les valeurs saisies
                                Set W-BenefSaisi to true
      *                         Perform InsertionDonnéesTiersBenef
                                Move 'V' to  ChoixInsertion 
                                move 1 to DonneesValides
                        When other *> on reste sur l'option tant que une bonne choix est faite
                                move " Saisie non valide : A ou V " to LaInfoAide
                                display InfoAide
                                Accept ChoixInsertionBenef at line 20 col 75 foreground-color is 3 Highlight
                                Display REsetInfoAide
                       end-evaluate
               end-perform.

      *    iF DonneesValides = 1 Perform InsertionDonnéesTiersBenef.

       GestionTiersBenef-fin.
      *    iF DonneesValides = 1 Perform InsertionDonnéesTiersBenef.
           continue.

       end program Contrat_Epargne_Main.
