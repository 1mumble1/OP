PROGRAM GroupWords(INPUT, OUTPUT);
USES Words;
USES InsertSort;
USES Analyze;     
    
CONST
  MaxSize = 1000;
   
VAR
  FIn, FOut: TEXT;
  Word, Basis: STRING;
  First: Pointer;
  Counter, Count: INTEGER;

BEGIN
  PrepareFiles(FIn, FOut);
  WHILE NOT EOF(FIn)
  DO
    BEGIN
      WHILE NOT EOLN(FIn)
      DO
        BEGIN
          ReadWord(FIn, Word);
          FindBasisOfWord(Word, Basis);
          READ(FIn, Count);
          IF CheckCorrectWord(Word)
          THEN
            UpdateStatistics(First, Count, Word, Basis);
          Counter := Counter + 1;
          IF Counter = MaxSize
          THEN
            BEGIN
              Counter := 0;
              MergeFile(FOut, First);
              DisposePointers(First)
            END 
        END;
      READLN(FIn)  
    END;
  MergeFile(FOut, First);
  DisposePointers(First)
  //PrintStatistics(FOut, First)
END.                  
