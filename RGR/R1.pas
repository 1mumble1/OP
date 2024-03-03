PROGRAM CountWords(INPUT, OUTPUT);
USES Analyze;
USES InsertSort;
USES Words;     
    
CONST
  MaxSize = 1000;
   
VAR
  FIn, FOut: TEXT;
  Word: STRING;
  First: Pointer;
  Counter: INTEGER;

BEGIN
  PrepareFiles(FIn, FOut);
  First := NIL;
  Counter := 0;
  WHILE (NOT EOF(FIn)) AND (Counter < MaxSize)
  DO
    BEGIN
      WHILE (NOT EOLN(FIn)) AND (Counter < MaxSize)
      DO
        BEGIN
          ReadWord(FIn, Word);
          Counter := Counter + 1;
          IF Word <> EmptyValue
          THEN
            UpdateStatistics(First, Word)
        END;
      READLN(FIn)  
    END;
  WRITELN(Counter);   
  PrintStatistics(FOut, First)
END.                  
