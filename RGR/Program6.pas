program Program6;
uses Words;
var s, s1: string;
f: text; 
begin
  assign(f, 'in.txt');
  reset(f);
  ReadWord(f, s);
  write(s);
  FindBasisOfWord(s, s1);
  write(s1) 
end.
