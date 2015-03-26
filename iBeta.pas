program iBeta;

uses crt;

{--------------------------------------------------------------------------------------}	

const
	{boutons servant aux mouvements et actions du curseur}
	UP = 'z';
	DOWN = 's';
	LEFT = 'q';
	RIGHT = 'd';
	{Barre espace, pour cliquer}
	CLIC = chr(32);
	{Bouton ESCAPE, pour quitter}
	QUIT = chr(27);
	
	{taille de l'interface}
	XMAX = 50;
	YMAX = 20;
	
	

{--------------------------------------------------------------------------------------}	
	
type
	Limits = array[0..3] of integer;
	Str128 = string[128];
	tColors = integer;

	
	Button = record
		{x et y qui delimitent le bouton}
		delimitation : Limits;
		{etat du bouton. True = actif et False = inactif}
		status : boolean;
		{color la couleur du tableau colors que revet le bouton.}
		color: integer;
		{contient l'intitule du bouton}
		headline : Str128;
	end;
	
	tButtons = array[0..18] of Button;
{--------------------------------------------------------------------------------------}	
	
procedure fullBackground;
	var
		i,j: integer;
	Begin
		for i := 1 to XMAX do begin
			for j := 1 to YMAX do begin
				gotoXY(i,j);
				write(' ');
				TextBackground(White);
			end;
		end;
	End;
	
procedure cursor;
	var
		key: char;
		i,j: integer;
	Begin
		i:= 5;
		j:= 5;
		gotoXY(i,j);
		key:= ' ';
		while not (key = QUIT) do begin
			if keypressed then begin
			key:= readkey;
			case key of
				UP : if j > 1 then j:= j-1;
				DOWN : if j < YMAX then j:= j+1;
				LEFT : if i > 1 then i:= i-1;
				RIGHT : if i < XMAX then i:= i+1;
				CLIC : begin textColor(Black); write('a'); end;
			end;
			end;
			gotoXY(i,j);  
		end;
	end;


{--------------------------------------------------------------------------------------}		
	

	
BEGIN
	clrscr;
	fullBackground;
	testCrt;
	cursor;
	clrscr;
end.