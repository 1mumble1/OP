UNIT InsertSort;

INTERFACE
USES Words;

CONST
  Max = 500;
  BasisID = 1;

TYPE
  StringMas = ARRAY [1 .. Max] OF STRING;                      {}
  Pointer = ^Statistics;                                       {Указатель на запись}
  Statistics = RECORD                                          {Запись с ключом-словом, его количеством и следующим словом}
                 Keys: StringMas;
                 Counter: INTEGER;
                 Next: Pointer
               END;     
               
PROCEDURE InsertInList(VAR First: Pointer; VAR Count: INTEGER; VAR Word, Basis: STRING);       {Вставка нового элемента в список}

IMPLEMENTATION

PROCEDURE InsertInList(VAR First: Pointer; VAR Count: INTEGER; VAR Word, Basis: STRING);      {Ищем предыдущий следующий элемент списка, вставляем между ними}
VAR
  NewPtr, Prev, Curr: Pointer;
    
PROCEDURE FindPrevCurr(VAR Prev, Curr: Pointer; NewPtr, First: Pointer);               {Поиск предыдущего и следующего элемента}
VAR
  Found: BOOLEAN;
BEGIN {FindPrevCurr}
  Prev := NIL;
  Curr := First;
  Found := FALSE;
  WHILE (Curr <> NIL) AND NOT Found
  DO
    IF NewPtr^.Keys[BasisID] > Curr^.Keys[BasisID]
    THEN
      BEGIN
        Prev := Curr;
        Curr := Curr^.Next
      END
    ELSE
      Found := TRUE
END; {FindPrevCurr}

PROCEDURE InitKeys(VAR Ptr: Pointer; VAR Word, Basis: STRING);
CONST
  FirstWordID = BasisID + 1;
VAR 
  I: 1 .. Max;
BEGIN {InitKeys}
  Ptr^.Keys[BasisID] := Basis;
  Ptr^.Keys[FirstWordID] := Word;
  FOR I := FirstWordID + 1 TO Max
  DO
    Ptr^.Keys[I] := EmptyValue
END; {InitKeys}

BEGIN {InsertInList}
  NEW(NewPtr);
  InitKeys(NewPtr, Word, Basis);
  NewPtr^.Counter := Count;
  FindPrevCurr(Prev, Curr, NewPtr, First);
  NewPtr^.Next := Curr;
  IF Prev = NIL 
  THEN
    First := NewPtr
  ELSE
    Prev^.Next := NewPtr
END; {InsertInList}

BEGIN
END.
