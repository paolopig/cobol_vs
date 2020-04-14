       program-id. StringToNumeric as "Contrat_Epargne_TS.StringToNumeric".

       data division.
       working-storage section.

       procedure division.
      *---------------------------------------------------------------------------------------------
      * Control montant souscription >= montant brut contrat
      *---------------------------------------------------------------------------------------------
      *
      *    initialize MT-GAUCHE MT-DROIT MT-AVANT MT-AVANT-CAR MT-APRES MT-APRES-CAR MT-TEMP MT-NUM MT-ED MT-CONV.
      *    Move SeuilEntreeBrut of ligneproduit(IndexContrat) TO MT-GAUCHE.
      *    PERFORM ConversionStrMt THRU ConversionStrMt-fin.    
      *
      *ConversionStrMt.
      *    Unstring MT-GAUCHE delimited by ','                           
      *    INTO MT-AVANT MT-APRES.                                       
      *    Inspect MT-AVANT tallying MT-AVANT-CAR FOR CHARACTERS BEFORE SPACE.                          
      *    Inspect MT-APRES tallying MT-APRES-CAR FOR CHARACTERS BEFORE SPACE.                          
      *    Move MT-AVANT(1:MT-AVANT-CAR) TO MT-TEMP-10.                  
      *    Move MT-APRES(1:MT-APRES-CAR) TO MT-TEMP-2.                   
      *    Inspect MT-TEMP replacing all ' ' BY '0'.                     
      *    Move MT-NUM  TO MT-ED.  
      *    DISPLAY MT-ED. *> Por controle, à eliminer
      *
      *ConversionStrMt-fin.
      *    If MontantSouscr of Saisie-Simulation >=  MT-ED then
      *        display ' Ok ' at  line 10 col 50
      *    end-if.
      *
      *    goback.
           
       end program StringToNumeric.