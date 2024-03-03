UNIT TreeSort;

INTERFACE

TYPE
  Keys = ARRAY [1 .. Max] OF STRING;
  Node = ^Tree;
  Tree = RECORD
            Words: Keys;
            Left: Node;
            Right: Node
          END;

PROCEDURE Insert(Data: STRING; VAR Ptr: Node);
PROCEDURE PrintTree(Root: Node);

IMPLEMENTATION

PROCEDURE Insert(Data: STRING; VAR Ptr: Node);
BEGIN {Insert}
  IF Ptr = NIL
  THEN
    BEGIN
      NEW(Ptr);
      Ptr^.Words[1] := //////////////;
      Ptr^.Words[2] := Data;
      Ptr^.Left := NIL;
      Ptr^.Right := NIL
    END
  ELSE
    IF ////// < Ptr^.Key
    THEN
      Insert(Data, Ptr^.Left)
    ELSE
      Insert(Data, Ptr^.Right)     
END; {Insert}

PROCEDURE PrintTree(Root: Tree);
BEGIN {PrintTree}
  IF Root <> NIL
  THEN
    BEGIN
      PrintTree(Root^.Left);
      WRITE(Root^.Key);
      PrintTree(Root^.Right)
    END
END; {PrintTree} 

BEGIN  
END.           
