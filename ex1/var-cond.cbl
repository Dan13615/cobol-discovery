       IDENTIFICATION DIVISION.
       PROGRAM-ID. VariableAndConditions.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NB PIC 9(3).

       PROCEDURE DIVISION.
           DISPLAY "Write a number between 0 and 999 : ".
           ACCEPT WS-NB.
     
           IF WS-NB >= 100
                DISPLAY "Large"
           ELSE
                DISPLAY "Small"
           END-IF.

           STOP RUN.
