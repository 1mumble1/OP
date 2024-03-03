UNIT Analyze;

INTERFACE
USES Words;
USES InsertSort;

CONST
  Space = ' ';
  Comma = ',';
  DoubleDot = ':';
PROCEDURE UpdateStatistics(VAR First: Pointer; VAR Count: INTEGER; VAR Word, Basis: STRING); {Обновление статистики}
PROCEDURE PrintStatistics(VAR FOut: TEXT; First: Pointer);    {Печать статистики}
PROCEDURE MergeFile(VAR F: TEXT; VAR First: Pointer);         {Слияние файла с содержимым указателей в отсортированном виде}
PROCEDURE DisposePointers(VAR First: Pointer);                {Очистка памяти, выделенной под указатели}

IMPLEMENTATION
PROCEDURE UpdateStatistics(VAR First: Pointer; VAR Count: INTEGER; VAR Word, Basis: STRING);  {Проходимся по списку, ищем совпадения}
VAR                                                            {Если нашли, то увеличение счетчика}
  Ptr: Pointer;                                                {Если нет, то создание нового элемента в конец списка}
  Found, Inserted: BOOLEAN;                                              {Также задаем указатель первый элемент списка, чтобы не потерять связь}
  I: 1 .. Max;
BEGIN {UpdateStatistics}
  Ptr := First;
  Found := FALSE;
  WHILE (Ptr <> NIL) AND (NOT Found)
  DO
    BEGIN
      IF Ptr^.Keys[BasisID] = Basis
      THEN
        BEGIN
          Ptr^.Counter := Ptr^.Counter + Count;
          I := 1;
          Inserted := FALSE;
          WHILE (I < Max) AND (NOT Inserted)
          DO
            BEGIN
              IF Ptr^.Keys[I] = EmptyValue
              THEN
                BEGIN
                  Ptr^.Keys[I] := Word;
                  Inserted := TRUE
                END;
              I := I + 1  
            END;    
          Found := TRUE
        END;
      Ptr := Ptr^.Next    
    END;
  IF NOT Found
  THEN
    InsertInList(First, Count, Word, Basis)
END; {UpdateStatistics}

PROCEDURE PrintStatistics(VAR FOut: TEXT; First: Pointer);            {Проходка по списку с помощью Next}
VAR                                                                   {Вывод ключа-слова и его количества через пробел}
  Ptr: Pointer;
  I: INTEGER; 
BEGIN {PrintStatistics}
  Ptr := First;
  WHILE Ptr <> NIL
  DO
    BEGIN
      I := BasisID + 1;
      WHILE (I < Max) AND (Ptr^.Keys[I] <> EmptyValue)
      DO
        BEGIN
          WRITE(FOut, Ptr^.Keys[I]);
          I := I + 1;
          IF Ptr^.Keys[I] <> EmptyValue
          THEN
            WRITE(FOut, Comma)
        END;
      WRITELN(FOut, DoubleDot, Space, Ptr^.Counter);  
      Ptr := Ptr^.Next
    END
END; {PrintStatistics}

PROCEDURE MergeFile(VAR F: TEXT; VAR First: Pointer);                      {Совмещение файла со списком}
VAR                                                                        {Используя сортировку слиянием}
  Word, Basis: STRING;                                                            {Результат помещается в файл}
  Ptr: Pointer;
  NewF: TEXT;
  Count: INTEGER;
  Ch: CHAR;
  EndOfLine: BOOLEAN;

PROCEDURE InsertInKeys(VAR Word: STRING; VAR Ptr: Pointer);
VAR
  FoundWord: BOOLEAN; 
  I: INTEGER; 
BEGIN {InsertInKeys}
  FoundWord := FALSE;
  I := BasisID + 1;
  WHILE (I < Max) AND (Ptr^.Keys[I] <> EmptyValue) AND (NOT FoundWord)
  DO
    BEGIN
      IF Ptr^.Keys[I] = Word
      THEN
        FoundWord := TRUE;
      I := I + 1;
      IF (NOT FoundWord) AND (Ptr^.Keys[I] = EmptyValue)
      THEN
        Ptr^.Keys[I] := Word  
    END    
END; {InsertInKeys}
  
PROCEDURE FindCoincidences(VAR F: TEXT; VAR First: Pointer);               {Поиск совпадений в файле и списке}
VAR                                                                        {Если нашлось совпадение, то}
  Word, Basis: STRING;                                                            {счетчик данного элемента списка увеличивается на счетчик этого слова в файле}
  Ptr: Pointer;                                                            
  Count: INTEGER;
  FoundBasis: BOOLEAN;
  Ch: CHAR;
  
BEGIN {FindCoincidences}
  RESET(F);
  WHILE NOT EOF(F)
  DO
    BEGIN
      ReadWord(F, Word);
      FindBasisOfWord(Word, Basis);
      Ptr := First;
      FoundBasis := FALSE;
      WHILE (Ptr <> NIL) AND (NOT FoundBasis)
      DO
        BEGIN
          IF Basis = Ptr^.Keys[BasisID]
          THEN
            FoundBasis := TRUE
          ELSE  
            Ptr := Ptr^.Next
        END;  
      IF FoundBasis
      THEN
        BEGIN
          InsertInKeys(Word, Ptr);
          WHILE NOT EndReadWordInStats(F, Word)
          DO
            InsertInKeys(Word, Ptr);
          READ(F, Count);
          Ptr^.Counter := Ptr^.Counter + Count
        END;
      READLN(F)     
    END  
END; {FindCoincidences}

PROCEDURE CopyFile(VAR F1: TEXT; VAR F2: TEXT);                             {Копирование файла F1 в F2}
VAR
  Ch: CHAR;
BEGIN {CopyFile}
  RESET(F1);
  REWRITE(F2);
  WHILE NOT EOF(F1)
  DO
    BEGIN
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, Ch);
          WRITE(F2, Ch)
        END;
      READLN(F1);
      WRITELN(F2)  
    END
END; {CopyFile}

PROCEDURE WritePtrInFile(VAR F: TEXT; Ptr: Pointer);
VAR
  I: INTEGER;
BEGIN {WritePtrInFile}
  I := BasisID + 1;
  WHILE (I < Max) AND (Ptr^.Keys[I] <> EmptyValue)
  DO
    BEGIN
      WRITE(F, Ptr^.Keys[I]);
      I := I + 1;
      IF Ptr^.Keys[I] <> EmptyValue
      THEN
        WRITE(F, Comma)
    END;
  WRITELN(F, DoubleDot, Space, Ptr^.Counter)
END; {WritePtrInFile}

BEGIN {MergeFile}
  FindCoincidences(F, First);
  REWRITE(NewF);
  Ptr := First;
  RESET(F);
  EndOfLine := EndReadWordInStats(F, Word);
  FindBasisOfWord(Word, Basis);
  WHILE (NOT EOF(F)) AND (Ptr <> NIL)
  DO
    BEGIN
      IF Basis < Ptr^.Keys[BasisID]
      THEN
        BEGIN
          WRITE(NewF, Word);
          IF EndOfLine
          THEN
            WRITE(NewF, DoubleDot)
          ELSE
            WRITE(NewF, Comma);   
          WHILE NOT EOLN(F)
          DO
            BEGIN
              READ(F, Ch);
              WRITE(NewF, Ch)
            END;
          READLN(F);
          WRITELN(NewF);
          IF NOT EOF(F)
          THEN
            BEGIN
              EndOfLine := EndReadWordInStats(F, Word);
              FindBasisOfWord(Word, Basis)
            END  
        END
      ELSE
        IF Basis = Ptr^.Keys[BasisID]
        THEN
          BEGIN
            WritePtrInFile(NewF, Ptr);    
            Ptr := Ptr^.Next;
            READLN(F);
            IF NOT EOF(F)
            THEN
              BEGIN
                EndOfLine := EndReadWordInStats(F, Word);
                FindBasisOfWord(Word, Basis)
              END
          END
        ELSE
          BEGIN
            WritePtrInFile(NewF, Ptr);    
            Ptr := Ptr^.Next;
          END    
    END;
  
  IF NOT EOF(F)
  THEN
    BEGIN  
      WRITE(NewF, Word);
      IF EndOfLine
      THEN
        WRITE(NewF, DoubleDot)
      ELSE
        WRITE(NewF, Comma); 
      WHILE NOT EOLN(F)
      DO
        BEGIN
          READ(F, Ch);
          WRITE(NewF, Ch)
        END;
      WRITELN(NewF);  
      READLN(F)
    END;    
  WHILE NOT EOF(F)
  DO
    BEGIN 
      WHILE NOT EOLN(F)
      DO
        BEGIN
          READ(F, Ch);
          WRITE(NewF, Ch)
        END;
      READLN(F);
      WRITELN(NewF)
    END;
    
  WHILE Ptr <> NIL
  DO
    BEGIN
      WritePtrInFile(NewF, Ptr);
      Ptr := Ptr^.Next
    END;    
    
  CopyFile(NewF, F)  
END; {MergeFile}

PROCEDURE DisposePointers(VAR First: Pointer);                              {Проходимся по списку и удаляем предыдущий элемент списка}
VAR                                                                         {Переход к следующему и тд...}
  Ptr, PrevPtr: Pointer;                                                    {Обнуление указателя на первый элемент в списке}
BEGIN {DisposePointers}
  PrevPtr := First;
  Ptr := PrevPtr^.Next;
  WHILE Ptr <> NIL
  DO
    BEGIN
      DISPOSE(PrevPtr);
      PrevPtr := Ptr;
      Ptr := Ptr^.Next
    END;
  DISPOSE(PrevPtr);
  First := NIL  
END; {DisposePointers}

VAR
  First: Pointer;
  Counter: INTEGER;
BEGIN
  Counter := 0;
  First := NIL
END.
