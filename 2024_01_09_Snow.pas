PROGRAM Snow(INPUT, OUTPUT);

USES
  CRT;

CONST
  WINDOW_WIDTH = 80;
  WINDOW_HEIGHT = 25;
  FLAKES_COUNT = 20;
  FLAKE_CHAR = '*';
  REMOVING_CHAR = ' ';

TYPE
  TFlake = RECORD
             X, Y: BYTE;
             Color: BYTE;
             SpeedX, SpeedY: BYTE   
           END;
  TFlakeArray = ARRAY[0 .. FLAKES_COUNT - 1] OF TFlake;
VAR
  //Flake: TFlake;
  Flakes: TFlakeArray;

PROCEDURE InitFlake(VAR Flake: TFlake);
BEGIN
  
  Flake.X := RANDOM(WINDOW_WIDTH) + 1;
  Flake.Y := RANDOM(1) + 1;
  Flake.Color := RANDOM(15) + 1;
  Flake.SpeedX := 0;
  Flake.SpeedY := RANDOM(2) + 1;          
END;

PROCEDURE PrintFlake(FlakeChar: CHAR; VAR Flake: TFlake);
BEGIN
  GOTOXY(Flake.X, Flake.Y);
  TEXTCOLOR(Flake.Color);
  WRITE(FlakeChar)
END;

PROCEDURE RemoveFlake(VAR Flake: TFlake);
BEGIN
  GOTOXY(Flake.X, Flake.Y);
  WRITE(REMOVING_CHAR)
END;

FUNCTION IsBorderReached(VAR Flake: TFlake): BOOLEAN;
BEGIN
  IsBorderReached := Flake.Y >= WINDOW_HEIGHT
END;

PROCEDURE ChangeFlakeCoordinates(VAR Flake: TFlake);
BEGIN
  Flake.X := Flake.X + Flake.SpeedX;
  Flake.Y := Flake.Y + Flake.SpeedY;
  IF IsBorderReached(Flake)
  THEN
    InitFlake(Flake)
END; 

PROCEDURE InitFlakes(VAR Flakes: TFlakeArray);
VAR
  I: BYTE;
BEGIN
  FOR I := 0 TO FLAKES_COUNT - 1
  DO                        
    InitFlake(Flakes[I])
END;

PROCEDURE PrintFlakes(VAR Flakes: TFlakeArray);
VAR
  I: BYTE;
BEGIN
  FOR I := 0 TO FLAKES_COUNT - 1
  DO                        
    PrintFlake(FLAKE_CHAR, Flakes[I])
END;

PROCEDURE RemoveFlakes(VAR Flakes: TFlakeArray);
VAR
  I: BYTE;
BEGIN
  FOR I := 0 TO FLAKES_COUNT - 1
  DO                        
    RemoveFlake(Flakes[I])
END;

PROCEDURE ChangeFlakesCoordinates(VAR Flakes: TFlakeArray);
VAR
  I: BYTE;
BEGIN
  FOR I := 0 TO FLAKES_COUNT - 1
  DO                        
    ChangeFlakeCoordinates(Flakes[I])
END;


BEGIN
  RANDOMIZE;
  CURSOROFF;
  InitFlakes(Flakes);
  WHILE TRUE
  DO
    BEGIN
      PrintFlakes(Flakes);
      DELAY(50);
      RemoveFlakes(Flakes);
      ChangeFlakesCoordinates(Flakes)
    END;
  READLN
END.