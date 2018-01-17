PROGRAM Nim;
//But:Jouer au jeu de Nim avec 2 joueurs.
//Principe:Les deux joueurs se partagent 21 alumettes et retirent tour a tour 1,2 ou 3 allumette(s)
//Entree:nombre d'allumettes a enlever par joueur
//Sortie:nombre d'allumettes restantes

USES crt;

CONST
	TOTALALLUM = 21;
	FIN = 1;
	CHOIXMIN = 1;
	CHOIXMAX = 3;

VAR
	nbAllum, nbChoix : integer;

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
		IF ((nbChoix > (nbAllum - CHOIXMIN)) OR ((nbChoix < CHOIXMIN) OR (nbChoix > CHOIXMAX))) THEN
			writeln('Choisir un nombre possible d''allumettes a enlever')
		ELSE
		BEGIN
			nbAllum := nbAllum - nbChoix;
		END;
	END;
	UNTIL (nbAllum = FIN);
	writeln('Vous avez gagne !!');
	readln;
END.		