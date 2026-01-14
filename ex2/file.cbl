       IDENTIFICATION DIVISION.
       PROGRAM-ID. FileProcessing.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT PEOPLE-STORAGE ASSIGN TO 'people.dat'
           ORGANIZATION IS LINE SEQUENTIAL
           FILE STATUS IS WS-FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD PEOPLE-STORAGE.
       01 PEOPLE-RECORD.
           05 PERSON-NAME PIC A(30).
           05 PERSON-AGE  PIC 9(3).

       WORKING-STORAGE SECTION.
       01 WS-FILE-STATUS PIC XX.
       01 WS-END-OF-FILE PIC X VALUE 'N'.

       PROCEDURE DIVISION.
           OPEN EXTEND PEOPLE-STORAGE.
           PERFORM UNTIL PERSON-NAME = 'END'
               DISPLAY 'Enter name (or type "END" to finish): '

               ACCEPT PERSON-NAME
               IF PERSON-NAME = 'END'
                   EXIT PERFORM
               END-IF

               DISPLAY 'Enter age: '
               ACCEPT PERSON-AGE
               WRITE PEOPLE-RECORD
           END-PERFORM.

           CLOSE PEOPLE-STORAGE.
           OPEN INPUT PEOPLE-STORAGE.

           PERFORM UNTIL WS-END-OF-FILE = 'Y'
               READ PEOPLE-STORAGE
                   AT END
                       MOVE 'Y' TO WS-END-OF-FILE
                   NOT AT END
                       DISPLAY 'Name: ' PERSON-NAME ' Age: ' PERSON-AGE
               END-READ
           END-PERFORM.

           CLOSE PEOPLE-STORAGE.
           STOP RUN.
