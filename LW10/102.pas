PROGRAM Correcting(INPUT, OUTPUT);
VAR
  W1, W2, W3, W4, W5: CHAR;    
  CheckCondition: CHAR;         
  F1: TEXT;                    
  F, Ch: CHAR;                  
BEGIN {Correcting}
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  W5 := ' ';
  CheckCondition := '0'; {оепелеммюъ дкъ опнбепйх мюкхвхъ WHILE/IF}
  REWRITE(F1);
  WHILE NOT EOLN
  DO
    BEGIN
      {ядбхцюел нймн мю 1 яхлбнк}
      W1 := W2;
      W2 := W3;
      W3 := W4;
      W4 := W5;
      READ(W5);
      {гюохяэ яхлбнкнб б F1, еякх мюидеряъ опхябнемхе (1-ши хдемрхтхйюрнп)}
      WRITE(F1, W5); 
      {опнбепйю мю BEGIN}         
      IF (W1 = 'B') AND (W2 = 'E') AND (W3 = 'G') AND (W4 = 'I') AND (W5 = 'N')
      THEN
        BEGIN
          REWRITE(F1); {нвхярйю F1, р.й. ашк мюидем ноепюрнп}
          IF CheckCondition = '0' {WHILE/IF мер}
          THEN
            WRITELN('BEGIN')
          ELSE
            IF CheckCondition = '2' {WHILE/IF еярэ}
            THEN
              BEGIN
                WRITELN('    BEGIN');
                CheckCondition := '4' {днаюбкъеряъ бкнфеммши BEGIN...END -> рюаскъжхъ +2 опнаекю}
              END
        END;  
      {опнбепйю мю READ/READLN}    
      IF (W2 = 'R') AND (W3 = 'E') AND (W4 = 'A') AND (W5 = 'D')
      THEN
        BEGIN
          REWRITE(F1); {нвхярйю F1, р.й. ашк мюидем ноепюрнп}
          IF CheckCondition = '0' {WHILE/IF мер}
          THEN
            WRITE('  READ');
          IF CheckCondition = '2' {WHILE/IF еярэ аег бкнфеммшу BEGIN...END}
          THEN
            WRITE('    READ');
          IF CheckCondition = '4' {WHILE/IF еярэ я бкнфеммшлх BEGIN...END}
          THEN
            WRITE('      READ');                 
          W1 := W2;
          W2 := W3;
          W3 := W4;
          W4 := W5;
          READ(W5);
          IF W5 = 'L' {яксвюи READLN}
          THEN
            BEGIN
              W1 := W2;
              W2 := W3;
              W3 := W4;
              W4 := W5;
              READ(W5);
              WRITE(W4, W5)
            END;
          Ch := 'F'; {оепелеммюъ дкъ бшундю хг жхйкю}
          WHILE Ch <> 'T'
          DO
            BEGIN
              IF W5 = '('
              THEN
                BEGIN
                  WHILE W5 <> ')'
                  DO
                    BEGIN
                      IF W5 <> ' '
                      THEN
                        IF W5 <> ','
                        THEN
                          WRITE(W5)
                        ELSE
                          WRITE(W5, ' ');
                      W1 := W2;
                      W2 := W3;
                      W3 := W4;
                      W4 := W5;
                      READ(W5)
                    END;
                  WRITE(W5)
                END;
              IF W5 = ';'
              THEN
                BEGIN
                  WRITELN(W5);
                  Ch := 'T'
                END;  
              IF W5 = 'E'
              THEN
                BEGIN
                  WRITELN;
                  Ch := 'T'
                END;  
              W1 := W2;
              W2 := W3;
              W3 := W4;
              W4 := W5;
              READ(W5)    
            END
        END;
      {опнбепйю мю WRITE/WRITELN}
      IF (W1 = 'W') AND (W2 = 'R') AND (W3 = 'I') AND (W4 = 'T') AND (W5 = 'E')
      THEN
        BEGIN
          REWRITE(F1); {нвхярйю F1, р.й. ашк мюидем ноепюрнп}
          IF CheckCondition = '0' {WHILE/IF мер}
          THEN
            WRITE('  WRITE');
          IF CheckCondition = '2' {WHILE/IF еярэ аег бкнфеммшу BEGIN...END}
          THEN
            WRITE('    WRITE'); 
          IF CheckCondition = '4' {WHILE/IF еярэ я бкнфеммшлх BEGIN...END}
          THEN
            WRITE('      WRITE');
          W1 := W2;
          W2 := W3;
          W3 := W4;
          W4 := W5;
          READ(W5);
          IF W5 = 'L' {яксвюи WRITELN}
          THEN
            BEGIN
              W1 := W2;
              W2 := W3;
              W3 := W4;
              W4 := W5;
              READ(W5);
              WRITE(W4, W5)
            END;
          Ch := 'F'; {оепелеммюъ дкъ бшундю хг жхйкю}
          WHILE Ch <> 'T'
          DO
            BEGIN
              IF W5 = '('
              THEN
                BEGIN
                  WHILE W5 <> ')'
                  DO
                    BEGIN
                      IF W5 <> ' '
                      THEN
                        IF W5 <> ','
                        THEN
                          WRITE(W5)
                        ELSE
                          WRITE(W5, ' ');
                      W1 := W2;
                      W2 := W3;
                      W3 := W4;
                      W4 := W5;
                      READ(W5)
                    END;
                  WRITE(W5)
                END;
              IF W5 = ';'
              THEN
                BEGIN
                  WRITELN(W5);
                  Ch := 'T'
                END;  
              IF W5 = 'E'
              THEN
                BEGIN
                  WRITELN;
                  Ch := 'T'
                END;  
              W1 := W2;
              W2 := W3;
              W3 := W4;
              W4 := W5;
              READ(W5)    
            END;
        END;
      {опнбепйю мю WHILE}  
      IF (W1 = 'W') AND (W2 = 'H') AND (W3 = 'I') AND (W4 = 'L') AND (W5 = 'E')
      THEN
        BEGIN
          REWRITE(F1); {нвхярйю F1, р.й. ашк мюидем ноепюрнп}
          WRITE('  WHILE');
          Ch := 'F'; {оепелеммюъ дкъ ябнебпелеммнцн бшбндю DO/THEN}
          CheckCondition := '2'; {днаюбкъел рюаскъжхч +2 опнаекю}
          {бшбнд сякнбхъ дкъ WHILE}
          WHILE Ch <> 'T'
          DO
            BEGIN
              W1 := W2;
              W2 := W3;
              W3 := W4;
              W4 := W5;
              READ(W5);
              {опнбепйю мю DO} 
              IF (W4 = ' ') AND (W5 = 'D') {опнбепйю мю мюкхвхе опнаекю оепед бнглнфмшл DO}
              THEN
                BEGIN
                  W1 := W3;
                  W2 := W4;
                  W3 := W5;
                  READ(W4, W5);
                  IF (W3 = 'D') AND (W4 = 'O') AND (W5 = ' ') {опнбепйю мю мюкхвхе нанянакеммнцн DO}
                  THEN
                    BEGIN
                      Ch := 'T';
                      WRITELN;
                      WRITELN('  DO')
                    END
                  ELSE
                    WRITE(W3, W4, W5) {бшбндхл яхлбнкш, йнрнпше явхрюкх, еякх ме мюькх DO}
                END
              ELSE
                WRITE(W5) {бшбндхл сякнбхе WHILE оняхлбнкэмн}                    
            END
        END;
      {опнбепйю мю IF}
      IF (W4 = 'I') AND (W5 = 'F')
      THEN
        BEGIN
          REWRITE(F1); {нвхярйю F1, р.й. ашк мюидем ноепюрнп}
          WRITE('  IF');
          Ch := 'F'; {оепелеммюъ дкъ ябнебпелеммнцн бшбндю DO/THEN}
          CheckCondition := '2'; {днаюбкъел рюаскъжхч +2 опнаекю}
          {бшбнд сякнбхъ дкъ IF}
          WHILE Ch <> 'T'
          DO
            BEGIN
              W1 := W2;
              W2 := W3;
              W3 := W4;
              W4 := W5;
              READ(W5);
              {опнбепйю мю DO} 
              IF (W4 = ' ') AND (W5 = 'T') {опнбепйю мю мюкхвхе опнаекю оепед бнглнфмшл THEN}
              THEN
                BEGIN
                  W1 := W5;
                  READ(W2, W3, W4, W5);
                  IF (W1 = 'T') AND (W2 = 'H') AND (W3 = 'E') AND (W4 = 'N') AND (W5 = ' ') {опнбепйю мю мюкхвхе нанянакеммнцн THEN}
                  THEN
                    BEGIN
                      Ch := 'T';
                      WRITELN;
                      WRITELN('  THEN')
                    END
                  ELSE
                    WRITE(W1, W2, W3, W4, W5) {бшбндхл яхлбнкш, йнрнпше явхрюкх, еякх ме мюькх DO}
                END
              ELSE
                WRITE(W5) {бшбндхл сякнбхе IF оняхлбнкэмн}                    
            END           
        END;
      {опнбепйю мю йнллемрюпхх}
      IF W5 = '{'
      THEN
        BEGIN
          REWRITE(F1); {нвхярйю F1, р.й. ашк мюидем ноепюрнп}
          IF CheckCondition = '0' {WHILE/IF мер}
          THEN
            WRITE('  {');
          IF CheckCondition = '2' {WHILE/IF еярэ аег бкнфеммшу BEGIN...END}
          THEN
            WRITE('    {'); 
          IF CheckCondition = '4' {WHILE/IF еярэ я бкнфеммшлх BEGIN...END}
          THEN
            WRITE('      {');
          WHILE W5 <> '}'
          DO
            BEGIN
              W1 := W2;
              W2 := W3;
              W3 := W4;
              W4 := W5;
              READ(W5);
              WRITE(W5)
            END;
          WRITELN  
        END;    
      {опнбепйю мю опхябнемхе}
      IF (W2 = ' ') AND (W3 = ':') AND (W4 = '=') AND (W5 = ' ')
      THEN
        BEGIN
          WRITELN(F1);
          RESET(F1);
          IF CheckCondition = '0' {WHILE/IF мер}
          THEN
            WRITE(' ');
          IF CheckCondition = '2' {WHILE/IF еярэ аег бкнфеммшу BEGIN...END}
          THEN
            WRITE('   ');
          IF CheckCondition = '4' {WHILE/IF еярэ я бкнфеммшлх BEGIN...END}
          THEN
            WRITE('     ');
          WHILE NOT EOLN(F1)
          DO
            BEGIN
              READ(F1, F);
              WRITE(F)
            END;
          Ch := 'F'; {оепелеммюъ дкъ йнппейрмнцн бшбндю 2-нцн хдемрхтхйюрнпю}
          WHILE Ch <> 'T'
          DO                           
            BEGIN
              W1 := W2;
              W2 := W3;
              W3 := W4;
              W4 := W5;
              READ(W5);
              IF (W5 = ';') OR (W5 = ' ')
              THEN
                BEGIN
                  Ch := 'T';
                  WRITELN(W5)
                END
              ELSE  
                WRITE(W5)    
            END  
        END;    
      {опнбепйю мю END}  
      IF (W3 = 'E') AND (W4 = 'N') AND (W5 = 'D')
      THEN
        BEGIN
          REWRITE(F1); {нвхярйю F1, р.й. ашк мюидем ноепюрнп}
          Ch := 'F';    
          WHILE Ch <> 'T'
          DO
            BEGIN
              W1 := W2;
              W2 := W3;
              W3 := W4;
              W4 := W5;
              READ(W5);
              IF W5 = '.' {опнбепйю мю END.}
              THEN
                BEGIN
                  WRITELN('END.');
                  Ch := 'T'
                END
              ELSE
                IF W5 = ';' {опнбепйю мю END;}
                THEN
                  BEGIN
                    WRITELN('END;');
                    CheckCondition := '0'; {WHILE/IF гюйнмвхкяъ}
                    Ch := 'T'
                  END
                ELSE
                  IF W5 <> ' ' {опнбепйю мю END}
                  THEN
                    BEGIN
                      WRITELN('END');
                      CheckCondition := '0'; {WHILE/IF гюйнмвхкяъ}
                      Ch := 'T'
                    END                    
            END        
        END    
    END  
END. {Correcting}
