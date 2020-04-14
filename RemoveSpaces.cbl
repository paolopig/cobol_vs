       program-id. RemoveSpaces as "Contrat_Epargne_TS.RemoveSpaces".

       data division.
       working-storage section.
       01  source-field    pic  x(999).
       01  source-index    pic 9(004).
       01  source-size     pic 9(004) value 999.
       01  target-field    pic x(999).
       01  target-index    pic 9(004).

       procedure division.


       
           move spaces to target-field.
           move zeroes to target-index
           perform varying source-index from 1 by 1 
                   until source-index > source-size
               if source-field(source-index:1) > space
                  add 1 to target-index
                  move source-field(source-index:1) to
                       target-field(target-index:1)
               end-if
           end-perform.
           goback.
           
       end program RemoveSpaces.