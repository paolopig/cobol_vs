
      *---------------------------------------------------------------------------------------------
      * Clause Copy contenant les parametres des contrats 
      *---------------------------------------------------------------------------------------------
       01 Param.
           05 FILLER PIC X(100).
               88 A1 Value 'A1 000500 000350 000750 000400 001720 00005000 000000005250'.       
               88 B1 Value 'B1 000400 000260 000750 000300 001720 00005000 000000005250'. 
               88 PR Value 'PR 000250 000220 000750 000450 001720 10000000 000010250000'.


       01 Tab redefines param.
           05 CodeProduitParam  PIC XX.
           05 filler            PIC X.   
           05 FraisEntree       PIC 99v9999.
           05 filler            PIC X.  
           05 FraisVersement    PIC 99v9999.
           05 filler            PIC X.  
           05 FiscRachat        PIC 99v9999.
           05 filler            PIC X.  
           05 TauxRemuneration  PIC 99v9999.
           05 filler            PIC X.  
           05 TauxPrelSociaux   PIC 99v9999.
           05 filler            PIC X.  
           05 SeuilEntree       PIC 9(8)v99.
           05 filler            PIC X.  
           05 SeuilEntreeBrut   PIC 9(8)v99.

