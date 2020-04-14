       program-id. ConnectSQL as "Contrat_Epargne_TS.ConnectSQL".

       data division.
       working-storage section.

       Linkage section.
       77 LS-CnxDb STRING.

       procedure division using LS-CnxDb.

      ********** Connexion à la base de données ***********************
           MOVE "TRUSTED_CONNECTION=YES;DATABASE=AbeillesVide;server=PORTABLEP-PC\SQLEXPRESS;FACTORY=SYSTEM.DATA.SQLCLIENT;" to LS-CnxDb.
           exec sql
               Connect using :LS-CnxDb
           end-exec.

      ********** Choix de l'option Autocommit  *************************
           EXEC SQL
               SET AUTOCOMMIT ON
           End-EXEC.

      ********** Fin Choix de l'option Autocommit  *********************
           
       end program ConnectSQL.