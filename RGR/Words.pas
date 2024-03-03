UNIT Words;

INTERFACE

CONST
  Alphabet = ['A' .. 'Z', 'a' .. 'z', '�' .. '�', '�' .. '�', '-', '�', '�'];  {�������, �� ������� ����� �������� �����}
  EmptyValue = '';
  Hyphen = '-';

PROCEDURE PrepareFiles(VAR FIn, FOut: TEXT);                  {���������� ������ � ������}
PROCEDURE ReadWord(VAR FIn: TEXT; VAR Word: STRING);          {���������� ����� �� �����}
FUNCTION EndReadWordInStats(VAR FIn: TEXT; VAR Word: STRING): BOOLEAN; {���������� ����� �� ����� ����������}
FUNCTION CheckCorrectWord(Word: STRING): BOOLEAN;         {�������� �� ������������ ������������ �����} 
PROCEDURE FindBasisOfWord(VAR Word, Basis: STRING);           {����� ������ �����}

IMPLEMENTATION

PROCEDURE PrepareFiles(VAR FIn, FOut: TEXT);          {����� ������ � �����������}
BEGIN {PrepareFiles}                                                                             {���������� input-����� � ������}
  ASSIGN(FIn, 'in.txt');                                                                           {���������� output-����� � ������}
  ASSIGN(FOut, 'out.txt');
  RESET(FIn);
  REWRITE(FOut)
END; {PrepareFiles} 

PROCEDURE ReadWord(VAR FIn: TEXT; VAR Word: STRING);   {����������� ������ �� ��� ���, ���� �� �������� ������ ��� ��������}
CONST
  DefaultCh = 'A';
VAR                                                  {��������� ������ �� ��������}
  Ch: CHAR;
  
FUNCTION TransformRegister(Ch: CHAR): CHAR;          {���������� � ������� �������� �������}
BEGIN {TransformRegister}
  CASE Ch OF
    'A': TransformRegister := 'a';
    'B': TransformRegister := 'b';
    'C': TransformRegister := 'c';
    'G': TransformRegister := 'g';                    
    'D': TransformRegister := 'd';
    'E': TransformRegister := 'e';
    'F': TransformRegister := 'f';
    'H': TransformRegister := 'h';
    'I': TransformRegister := 'i';
    'J': TransformRegister := 'j';
    'K': TransformRegister := 'k';
    'L': TransformRegister := 'l';
    'M': TransformRegister := 'm';
    'N': TransformRegister := 'n';
    'O': TransformRegister := 'o';
    'P': TransformRegister := 'p';
    'Q': TransformRegister := 'q';
    'R': TransformRegister := 'r';
    'S': TransformRegister := 's';
    'T': TransformRegister := 't';
    'U': TransformRegister := 'u';
    'V': TransformRegister := 'v';
    'W': TransformRegister := 'w';
    'X': TransformRegister := 'x';
    'Y': TransformRegister := 'y';
    'Z': TransformRegister := 'z';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�', '�', '�': TransformRegister := '�';
    //'�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�'
  ELSE
    TransformRegister := Ch
  END    
END; {TransformRegister}  
  
BEGIN {ReadWord}
  Word := EmptyValue;
  Ch := DefaultCh;
  WHILE (Ch IN Alphabet) AND (NOT EOLN(FIn))
  DO
    BEGIN
      READ(FIn, Ch);
      IF Ch IN Alphabet
      THEN
        IF (Ch = Hyphen) AND (EOLN(FIn))
        THEN
          BEGIN
            IF NOT EOF(FIn)
            THEN
              READLN(FIn)
          END   
        ELSE   
          Word := Word + TransformRegister(Ch)
    END  
END; {ReadWord}

FUNCTION EndReadWordInStats(VAR FIn: TEXT; VAR Word: STRING): BOOLEAN;
CONST
  DefaultCh = 'A';
  EndOfWords = ':';
VAR                                                  {��������� ������ �� ��������}
  Ch: CHAR;
BEGIN {EndReadWordInStats}
  Word := EmptyValue;
  Ch := DefaultCh;
  WHILE (Ch IN Alphabet) AND (NOT EOLN(FIn))
  DO
    BEGIN
      READ(FIn, Ch);
      IF Ch IN Alphabet
      THEN
        IF (Ch = Hyphen) AND (EOLN(FIn))
        THEN
          BEGIN
            IF NOT EOF(FIn)
            THEN
              READLN(FIn)
          END   
        ELSE   
          Word := Word + Ch
    END;
  EndReadWordInStats := (Ch = EndOfWords)    
END; {EndReadWordInStats}

FUNCTION CheckCorrectWord(Word: STRING): BOOLEAN;   {���� ����� <> "-" � �� ������, ����� �������� TRUE, ����� FALSE}
CONST
  FirstLetter = 1;
BEGIN {CheckCorrectWord}
  CheckCorrectWord := ((Word[FirstLetter] <> Hyphen) AND (Word <> EmptyValue))
END; {CheckCorrectWord}

PROCEDURE FindBasisOfWord(VAR Word, Basis: STRING);                                 {����� ������ �����}
CONST                                                                               {������������� ���� ���������}
  Max = 100;                                                                        {������������� ��������� ��������� � ����� �����}
                                                                                    {���� ������ ��������� ������� � ������, ����� ��������� ������ �����}
TYPE                                                                                {����� ��������� � ������� ���������� ��������� � ����� ����� � ��}
  StringMas = ARRAY [1 .. Max] OF STRING;                                           {���� �� �������, ������ ������ ����� � ���� ���� �����}
    
VAR
  Endings: StringMas;
  I: INTEGER;
  Ending1, Ending2, Ending3: STRING;

PROCEDURE InitStrMas(VAR Mas: StringMas);
VAR 
  EndFile: TEXT;
  I: INTEGER;
BEGIN {InitStrMas}
  ASSIGN(EndFile, 'endings.txt');
  RESET(EndFile);
  I := 1;
  WHILE (I < Max) AND NOT EOF(EndFile)
  DO
    BEGIN
      IF NOT EOF(EndFile)
      THEN
        ReadWord(EndFile, Mas[I])
      ELSE
        Mas[I] := EmptyValue;
      READLN(EndFile);    
      I := I + 1
    END
END; {InitStrMas}

PROCEDURE InitEndingOfWord(VAR Ending1, Ending2, Ending3: STRING; VAR Word: STRING);
BEGIN {InitEndingOfWord}
  Ending1 := Word[Length(Word)];
  
  IF Length(Word) > Length(Ending1)
  THEN
    Ending2 := Word[Length(Word) - 1] + Ending1
  ELSE
    Ending2 := EmptyValue;
      
  IF (Ending2 <> EmptyValue) AND (Length(Word) > Length(Ending2))
  THEN
    Ending3 := Word[Length(Word) - 2] + Ending2
  ELSE
    Ending3 := EmptyValue;       
END; {InitEndingOfWord}

PROCEDURE InitBasisOfWord(VAR Ending: STRING; VAR Word: STRING; VAR Basis: STRING);  
VAR
  I: INTEGER;
BEGIN {InitBasisOfWord}
  Basis := EmptyValue;
  IF Word <> Ending
  THEN
    BEGIN
      {FOR I := 1 TO (Length(Word) - Length(Ending))
      DO
        Basis := Basis + Word[I];}
      Basis := Copy(Word, 1, Length(Word) - Length(Ending))  
    END
  ELSE
    Basis := Word                 
END; {InitBasisOfWord}

FUNCTION FindEnding(VAR Endings: StringMas; VAR Ending, Word: STRING): BOOLEAN;
VAR
  Found: BOOLEAN;
  I: INTEGER; 
BEGIN {FindEnding}
  Found := FALSE;
  I := 1;
  IF (Ending <> EmptyValue) AND (Length(Word) > Length(Ending))
  THEN
    WHILE (I < Max) AND (Endings[I] <> EmptyValue) AND (NOT Found)
    DO
      BEGIN
        Found := (Endings[I] = Ending);
        I := I + 1  
      END;    
  FindEnding := Found    
END; {FindEnding}

BEGIN {FindBasisOfWord}               
  InitStrMas(Endings);
  InitEndingOfWord(Ending1, Ending2, Ending3, Word);
  IF FindEnding(Endings, Ending3, Word)
  THEN
    InitBasisOfWord(Ending3, Word, Basis)
  ELSE
    IF FindEnding(Endings, Ending2, Word)
    THEN 
      InitBasisOfWord(Ending2, Word, Basis)
    ELSE
      IF FindEnding(Endings, Ending1, Word)
      THEN 
        InitBasisOfWord(Ending1, Word, Basis)
      ELSE
        Basis := Word         
END; {FindBasisOfWord}

BEGIN
END.
