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
  CheckCondition := '0'; {���������� ��� �������� ������� WHILE/IF}
  REWRITE(F1);
  WHILE NOT EOLN
  DO
    BEGIN
      {�������� ���� �� 1 ������}
      W1 := W2;
      W2 := W3;
      W3 := W4;
      W4 := W5;
      READ(W5);
      {������ �������� � F1, ���� �������� ���������� (1-�� �������������)}
      WRITE(F1, W5); 
      {�������� �� BEGIN}         
      IF (W1 = 'B') AND (W2 = 'E') AND (W3 = 'G') AND (W4 = 'I') AND (W5 = 'N')
      THEN
        BEGIN
          REWRITE(F1); {������� F1, �.�. ��� ������ ��������}
          IF CheckCondition = '0' {WHILE/IF ���}
          THEN
            WRITELN('BEGIN')
          ELSE
            IF CheckCondition = '2' {WHILE/IF ����}
            THEN
              BEGIN
                WRITELN('    BEGIN');
                CheckCondition := '4' {����������� ��������� BEGIN...END -> ��������� +2 �������}
              END
        END;  
      {�������� �� READ/READLN}    
      IF (W2 = 'R') AND (W3 = 'E') AND (W4 = 'A') AND (W5 = 'D')
      THEN
        BEGIN
          REWRITE(F1); {������� F1, �.�. ��� ������ ��������}
          IF CheckCondition = '0' {WHILE/IF ���}
          THEN
            WRITE('  READ');
          IF CheckCondition = '2' {WHILE/IF ���� ��� ��������� BEGIN...END}
          THEN
            WRITE('    READ');
          IF CheckCondition = '4' {WHILE/IF ���� � ���������� BEGIN...END}
          THEN
            WRITE('      READ');                 
          W1 := W2;
          W2 := W3;
          W3 := W4;
          W4 := W5;
          READ(W5);
          IF W5 = 'L' {������ READLN}
          THEN
            BEGIN
              W1 := W2;
              W2 := W3;
              W3 := W4;
              W4 := W5;
              READ(W5);
              WRITE(W4, W5)
            END;
          Ch := 'F'; {���������� ��� ������ �� �����}
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
      {�������� �� WRITE/WRITELN}
      IF (W1 = 'W') AND (W2 = 'R') AND (W3 = 'I') AND (W4 = 'T') AND (W5 = 'E')
      THEN
        BEGIN
          REWRITE(F1); {������� F1, �.�. ��� ������ ��������}
          IF CheckCondition = '0' {WHILE/IF ���}
          THEN
            WRITE('  WRITE');
          IF CheckCondition = '2' {WHILE/IF ���� ��� ��������� BEGIN...END}
          THEN
            WRITE('    WRITE'); 
          IF CheckCondition = '4' {WHILE/IF ���� � ���������� BEGIN...END}
          THEN
            WRITE('      WRITE');
          W1 := W2;
          W2 := W3;
          W3 := W4;
          W4 := W5;
          READ(W5);
          IF W5 = 'L' {������ WRITELN}
          THEN
            BEGIN
              W1 := W2;
              W2 := W3;
              W3 := W4;
              W4 := W5;
              READ(W5);
              WRITE(W4, W5)
            END;
          Ch := 'F'; {���������� ��� ������ �� �����}
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
      {�������� �� WHILE}  
      IF (W1 = 'W') AND (W2 = 'H') AND (W3 = 'I') AND (W4 = 'L') AND (W5 = 'E')
      THEN
        BEGIN
          REWRITE(F1); {������� F1, �.�. ��� ������ ��������}
          WRITE('  WHILE');
          Ch := 'F'; {���������� ��� �������������� ������ DO/THEN}
          CheckCondition := '2'; {��������� ��������� +2 �������}
          {����� ������� ��� WHILE}
          WHILE Ch <> 'T'
          DO
            BEGIN
              W1 := W2;
              W2 := W3;
              W3 := W4;
              W4 := W5;
              READ(W5);
              {�������� �� DO} 
              IF (W4 = ' ') AND (W5 = 'D') {�������� �� ������� ������� ����� ��������� DO}
              THEN
                BEGIN
                  W1 := W3;
                  W2 := W4;
                  W3 := W5;
                  READ(W4, W5);
                  IF (W3 = 'D') AND (W4 = 'O') AND (W5 = ' ') {�������� �� ������� ������������� DO}
                  THEN
                    BEGIN
                      Ch := 'T';
                      WRITELN;
                      WRITELN('  DO')
                    END
                  ELSE
                    WRITE(W3, W4, W5) {������� �������, ������� �������, ���� �� ����� DO}
                END
              ELSE
                WRITE(W5) {������� ������� WHILE �����������}                    
            END
        END;
      {�������� �� IF}
      IF (W4 = 'I') AND (W5 = 'F')
      THEN
        BEGIN
          REWRITE(F1); {������� F1, �.�. ��� ������ ��������}
          WRITE('  IF');
          Ch := 'F'; {���������� ��� �������������� ������ DO/THEN}
          CheckCondition := '2'; {��������� ��������� +2 �������}
          {����� ������� ��� IF}
          WHILE Ch <> 'T'
          DO
            BEGIN
              W1 := W2;
              W2 := W3;
              W3 := W4;
              W4 := W5;
              READ(W5);
              {�������� �� DO} 
              IF (W4 = ' ') AND (W5 = 'T') {�������� �� ������� ������� ����� ��������� THEN}
              THEN
                BEGIN
                  W1 := W5;
                  READ(W2, W3, W4, W5);
                  IF (W1 = 'T') AND (W2 = 'H') AND (W3 = 'E') AND (W4 = 'N') AND (W5 = ' ') {�������� �� ������� ������������� THEN}
                  THEN
                    BEGIN
                      Ch := 'T';
                      WRITELN;
                      WRITELN('  THEN')
                    END
                  ELSE
                    WRITE(W1, W2, W3, W4, W5) {������� �������, ������� �������, ���� �� ����� DO}
                END
              ELSE
                WRITE(W5) {������� ������� IF �����������}                    
            END           
        END;
      {�������� �� �����������}
      IF W5 = '{'
      THEN
        BEGIN
          REWRITE(F1); {������� F1, �.�. ��� ������ ��������}
          IF CheckCondition = '0' {WHILE/IF ���}
          THEN
            WRITE('  {');
          IF CheckCondition = '2' {WHILE/IF ���� ��� ��������� BEGIN...END}
          THEN
            WRITE('    {'); 
          IF CheckCondition = '4' {WHILE/IF ���� � ���������� BEGIN...END}
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
      {�������� �� ����������}
      IF (W2 = ' ') AND (W3 = ':') AND (W4 = '=') AND (W5 = ' ')
      THEN
        BEGIN
          WRITELN(F1);
          RESET(F1);
          IF CheckCondition = '0' {WHILE/IF ���}
          THEN
            WRITE(' ');
          IF CheckCondition = '2' {WHILE/IF ���� ��� ��������� BEGIN...END}
          THEN
            WRITE('   ');
          IF CheckCondition = '4' {WHILE/IF ���� � ���������� BEGIN...END}
          THEN
            WRITE('     ');
          WHILE NOT EOLN(F1)
          DO
            BEGIN
              READ(F1, F);
              WRITE(F)
            END;
          Ch := 'F'; {���������� ��� ����������� ������ 2-��� ��������������}
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
      {�������� �� END}  
      IF (W3 = 'E') AND (W4 = 'N') AND (W5 = 'D')
      THEN
        BEGIN
          REWRITE(F1); {������� F1, �.�. ��� ������ ��������}
          Ch := 'F';    
          WHILE Ch <> 'T'
          DO
            BEGIN
              W1 := W2;
              W2 := W3;
              W3 := W4;
              W4 := W5;
              READ(W5);
              IF W5 = '.' {�������� �� END.}
              THEN
                BEGIN
                  WRITELN('END.');
                  Ch := 'T'
                END
              ELSE
                IF W5 = ';' {�������� �� END;}
                THEN
                  BEGIN
                    WRITELN('END;');
                    CheckCondition := '0'; {WHILE/IF ����������}
                    Ch := 'T'
                  END
                ELSE
                  IF W5 <> ' ' {�������� �� END}
                  THEN
                    BEGIN
                      WRITELN('END');
                      CheckCondition := '0'; {WHILE/IF ����������}
                      Ch := 'T'
                    END                    
            END        
        END    
    END  
END. {Correcting}
