PROGRAM NimIA;
//But:Jouer au jeu de Nim avec l'orinateur.
//Principe:Les deux joueurs se partagent 21 alumettes et retirent tour a tour 1,2 ou 3 allumette(s)
//Entree:nombre d'allumettes a enlever par le joueur
//Sortie:nombre d'allumettes restantes

USES crt;

CONST
	TOTALALLUM = 21;
	FIN = 1;
	CHOIXMIN = 1;
	CHOIXMAX = 3;

VAR
	nbAllum, nbChoix : integer;

FUNCTION TourOrdi(nbAllum : integer) : integer;
VAR
	i, res : integer;
BEGIN
	i := 0;
	REPEAT
		i := i + 1;
	UNTIL ((((nbAllum - i) MOD 4) = 0) OR (i = 4) OR ((nbAllum - i + 1) = 1));
	IF (((nbAllum - i) MOD 4) = 0) THEN
		BEGIN
		writeln('L''ordinateur enleve ', i - 1, ' allumette(s)');
		res := i - 1;
		END
	ELSE
		BEGIN
		writeln('L''ordinateur enleve 1 allumette');
		res := 1;
		END;
	IF ((nbAllum - res) = 1) THEN
		writeln('L''ordinateur a gagne :/');
	TourOrdi := res;
END;

BEGIN
	clrscr;
	nbAllum := TOTALALLUM;
	nbChoix := 0;
	REPEAT
	BEGIN
		writeln('Il y a un tas de ',
			nbAllum,
			' allumettes. Choisir le nombre d''allumettes a enlever entre 1 et 3, le jeu s''arrete quand il ne reste plus qu''une allumette');
		readln(nbChoix);
		IF ((nbChoix >= nbAllum) OR ((nbChoix < CHOIXMIN) OR (nbChoix > CHOIXMAX))) THEN
			writeln('Choisir un nombre possible d''allumettes a enlever')
		ELSE
			BEGIN
			nbAllum := nbAllum - nbChoix;
			IF (nbAllum <> 1) THEN
				nbAllum := nbAllum - TourOrdi(nbAllum)
			ELSE
				writeln('Vous avez gagne !!!');
			END;
	END;
	UNTIL (nbAllum = FIN);
	readln;
END.