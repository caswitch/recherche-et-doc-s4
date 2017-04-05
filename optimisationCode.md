*mercredi 22 mars 2017*

## Sources

<https://www-soc.lip6.fr/~heydeman/APC2016/Cours2APC.pdf>
Diapo de cours - Karine Heydemann <https://www-soc.lip6.fr/~heydeman/>
Maître de conférences 

<http://www.dicofr.com/cgi-bin/n.pl/dicofr/definition/>
Dictionnaire de l'informatique et de l'internet
Eric Goguey ® 1999-2014 - DicoFR.com

<http://www.azillionmonkeys.com/qed/optimize.html>
Paul Hsieh, Programming Optimization, 1996-2016

<https://books.google.fr/books?id=8ogrKMfpoywC&pg=PA20&dq=%22Assembleur%22+langage+1949&hl=fr&sa=X&ved=0ahUKEwia5JfCnIbLAhWBRBoKHaVFBnsQ6AEIHDAA#v=onepage&q=%22Assembleur%22%20langage%201949&f=false>
Laurent Bloch, Initiation à la programmation avec Scheme, Éditions TECHNIP, 2011


## Optimisation

**Optimisation** : Utilisation de moins de ressources (temps, mémoire morte, énergie, mémoire vive, etc) par « application de transformations de code ».

L'optimisation se fait après vérification de sa validité
Transformations :
  - application après vérification de leur validité et pertinence (selon la ressource dont l'utilisation est à diminuer) et leur lieu d'application et savoir comment l'appliquer.
  - application possible à différents niveaux
    - dans le code source
	- dans le langage intermédiare (IR)
	- dans le pseudo-assembleur (pseudo-ASM)
	- dans l'assembleur (ASM)
 Optimisation à portée variable : instruction, blocs de base, régions d’un CFG,
fonction/procédure (intra- ou inter-procédural)
 Où les utiliser dans le flot de compilation ? Sur quelle représentation ?
• Fixe pour certaines transformations :
 allocation de registres et ordonnancement à bas niveau,
 transformation des accès aux tableaux à haut niveau
• Si applicables à différents niveaux : choix/compromis à faire 

#TODO : A continuer


