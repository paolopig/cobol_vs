       program-id. CalculValContrat as "Contrat_Epargne_TS.CalculValContrat".

       data division.
       working-storage section.

       77 LS-OperatComptes-EOF PIC 999.
       77  CNXDB STRING .

       copy "Copybook-param.cpy".
       copy "Copybook-SQL.cpy".
       copy "Copybook-csv.cpy".

       Linkage section.
       77 LS-CodeProduit PIC XX.
       77 LS-NoContrat   PIC 9(8).
       77 LS-ValContrat  PIC 9(12)v99.




       Procedure division using LS-CodeProduit, LS-NoContrat, LS-ValContrat.


           Call 'ConnectSQL' using CNXDB.

           If SQLCODE <> 0
               Display " Erreur de connection à la base des données Call Val"  at line 24 col 2
           else
               continue
           end-if.


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


           MOVE 0 to LS-OperatComptes-EOF

           perform until LS-OperatComptes-EOF=1
               EXEC SQL 
                   FETCH OperationsCompte-Curseur
                       INTO :CodeProduitOC, :NoContratOC, :NoOperationOC, :TypeOperationOC,
                        :MontantOperationOC, :DateOperationOC
               END-EXEC
               add MontantOperationOC to LS-ValContrat

               If SQLCODE = 100 OR SQLCODE = 101 then
                   MOVE 1 to LS-OperatComptes-EOF

               end-if

           END-perform.



           
       end program CalculValContrat.