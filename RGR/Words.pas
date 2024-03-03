UNIT Words;

INTERFACE

CONST
  Alphabet = ['A' .. 'Z', 'a' .. 'z', 'А' .. 'Я', 'а' .. 'я', '-', 'Ё', 'ё'];  {Символы, из которых могут состоять слова}
  EmptyValue = '';
  Hyphen = '-';

PROCEDURE PrepareFiles(VAR FIn, FOut: TEXT);                  {Подготовка файлов к работе}
PROCEDURE ReadWord(VAR FIn: TEXT; VAR Word: STRING);          {Считывание слова из файла}
FUNCTION EndReadWordInStats(VAR FIn: TEXT; VAR Word: STRING): BOOLEAN; {Считывание слова из файла СТАТИСТИКИ}
FUNCTION CheckCorrectWord(Word: STRING): BOOLEAN;         {Проверка на корректность прочитанного слова} 
PROCEDURE FindBasisOfWord(VAR Word, Basis: STRING);           {Найти основу слова}

IMPLEMENTATION

PROCEDURE PrepareFiles(VAR FIn, FOut: TEXT);          {Связь файлов с переменными}
BEGIN {PrepareFiles}                                                                             {подготовка input-файла к чтению}
  ASSIGN(FIn, 'in.txt');                                                                           {подготовка output-файла к записи}
  ASSIGN(FOut, 'out.txt');
  RESET(FIn);
  REWRITE(FOut)
END; {PrepareFiles} 

PROCEDURE ReadWord(VAR FIn: TEXT; VAR Word: STRING);   {Посимвольно читаем до тех пор, пока не встретим символ вне алфавита}
CONST
  DefaultCh = 'A';
VAR                                                  {Формируем строку из символов}
  Ch: CHAR;
  
FUNCTION TransformRegister(Ch: CHAR): CHAR;          {Приведение к нижнему регистру символа}
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
    'А': TransformRegister := 'а';
    'Б': TransformRegister := 'б';
    'В': TransformRegister := 'в';
    'Г': TransformRegister := 'г';
    'Д': TransformRegister := 'д';
    'Е', 'ё', 'Ё': TransformRegister := 'е';
    //'Ё': TransformRegister := 'ё';
    'Ж': TransformRegister := 'ж';
    'З': TransformRegister := 'з';
    'И': TransformRegister := 'и';
    'Й': TransformRegister := 'й';
    'К': TransformRegister := 'к';
    'Л': TransformRegister := 'л';
    'М': TransformRegister := 'м';
    'Н': TransformRegister := 'н';
    'О': TransformRegister := 'о';
    'П': TransformRegister := 'п';
    'Р': TransformRegister := 'р';
    'С': TransformRegister := 'с';
    'Т': TransformRegister := 'т';
    'У': TransformRegister := 'у';
    'Ф': TransformRegister := 'ф';
    'Х': TransformRegister := 'х';
    'Ц': TransformRegister := 'ц';
    'Ч': TransformRegister := 'ч';
    'Ш': TransformRegister := 'ш';
    'Щ': TransformRegister := 'щ';
    'Ъ': TransformRegister := 'ъ';
    'Ы': TransformRegister := 'ы';
    'Ь': TransformRegister := 'ь';
    'Э': TransformRegister := 'э';
    'Ю': TransformRegister := 'ю';
    'Я': TransformRegister := 'я'
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
VAR                                                  {Формируем строку из символов}
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

FUNCTION CheckCorrectWord(Word: STRING): BOOLEAN;   {Если слово <> "-" И не пустое, тогда вернется TRUE, иначе FALSE}
CONST
  FirstLetter = 1;
BEGIN {CheckCorrectWord}
  CheckCorrectWord := ((Word[FirstLetter] <> Hyphen) AND (Word <> EmptyValue))
END; {CheckCorrectWord}

PROCEDURE FindBasisOfWord(VAR Word, Basis: STRING);                                 {Поиск основы слова}
CONST                                                                               {Инициализация всех окончаний}
  Max = 100;                                                                        {Инициализация возможных окончаний в нашем слове}
                                                                                    {Если данное окончание нашлось в списке, тогда формируем основу слова}
TYPE                                                                                {Иначе переходим к другому возможному окончанию в нашем слове и тд}
  StringMas = ARRAY [1 .. Max] OF STRING;                                           {Если не нашлось, значит основа слова и есть само слово}
    
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
