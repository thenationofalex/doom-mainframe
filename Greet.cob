       IDENTIFICATION DIVISION.
       PROGRAM-ID. Greet.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 IterNum PIC 9 VALUE 1.

       PROCEDURE DIVISION.
       Begin.
           PERFORM DisplayG IterNum TIMES.
           STOP RUN.

       DisplayG.
           DISPLAY "DOOM MAINFRAME COBOL.".
