PROGRAM Snow(INPUT, OUTPUT);

USES
  CRT;

CONST
  WINDOW_WIDTH = 100;
  WINDOW_HEIGHT = 50;
  FLAKES_COUNT = 5;
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
  RANDOMIZE;
  Flake.X := RANDOM(WINDOW_WIDTH) + 1;
  Flake.Y := 1;
  Flake.Color := RANDOM(15) + 1;
  Flake.SpeedX := 0;
  Flake.SpeedY := 1
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
  GOTOXY(Flake.X, Flake.Y);
  TEXTCOLOR(Flake.Color);
  WRITE(Ch)
END; 

BEGIN
  CURSOROFF;
  InitFlake(Flake);
  WHILE TRUE
  DO
    BEGIN
      PrintSimbol('*', Flake);
      DELAY(1000);
      //PrintSimbol(' ');
      DELAY(1000);
      //ChangeFlakeXY()
    END
END.