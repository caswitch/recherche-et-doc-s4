## Compilation/compilateur

## Techniques d'optimisation

### Constant propagation

Substitution de variable par leur constante assignée.

```c
void constant_propagation (void) {
	x = 2;
	y = x + 8;
}
```
devient
```c
void constant_propagation (void) {
	x = 2;
	y = 10;
}
```

<http://www.compileroptimizations.com/category/constant_propagation.htm>

### Constant folding

Substitution d’expression constante par sa valeur calculée pendant la compilation et non pendant l’exécution.

<http://www.compileroptimizations.com/category/constant_folding.htm>

```c
int constant_folding (void) {
	return 2 + 6;
}
```
devient
```c
int constant_folding (void) {
	return 8;
}
```

## Dead code elimination

Élimination du code qui n’affecte pas la finalité du programme. 
- code qui n'est pas utilisé
- code qui n'est pas atteint (ex. : après un return)

<http://www.compileroptimizations.com/category/dead_code_elimination.htm>

```c
int x;
int dead_code_elimination (void) {
	int y;
	y = 24;
	x = 2;
	x = 8;
	return x;
	x = 4;
}
```
devient
```c
int x;
int dead_code_elimination (void) {
	x = 8;
	return x;
}
```

## Constant propagation -> Constant folding -> Dead code eliminiation

Pour de la simplification et réduction, on répète les opérations sur les constantes jusqu'il n'y ait plus modificatin du code.

<https://en.wikipedia.org/wiki/Constant_folding#The_optimizations_in_action>

```c
int techniques_combination (void) {
	int a = 30;
	int b = 9 - (a / 5);
	int c;
	c = b * 4;
	if (c > 140)
		c = c - 10;
	return c * (60 / a);
}
```
devient après l'application de constant propagation puis de constant folding :
```c
int techniques_combination (void) {
  int a = 30;
  int b = 3;
  int c;

  c = b * 4;
  if (c > 10) {
     c = c - 10;
  }
  return c * 2;
}
```
devient après une deuxième application de constant propagation puis de constant folding :
```c
int techniques_combination (void) {
  int a = 30;
  int b = 3;
  int c;

  c = 12;
  if (true) {
     c = 2;
  }
  return c * 2;
}
```
Les variables a et b ont été simplifiée en constantes et leurs valeurs ont été substituées à chacune de leur occurrence.
Le code devient après application du dead code elimination :
```c
int techniques_combination (void) {
  int c;

  if (true) {
     c = 2;
  }
  return c * 2;
}
```
Le booléen True peut être substitué par l'entier 1.
Utilisation de **sparse conditional constant propagation** <https://en.wikipedia.org/wiki/Sparse_conditional_constant_propagation>.
Le code devient :
```c
int techniques_combination (void) {
  return 4;
}
```
Exemple tiré de <https://en.wikipedia.org/wiki/Constant_folding#The_optimizations_in_action>

## Vectorization (SIMD)

Exécution de plusieurs opérations d'une boucle en une seule étape
-> exécution de n opérations selon la taille n du vecteur dans une boucle
-> stockage de plusieurs instrucions scalaires dans un seul vecteur d'instruction
*Instruction/implémentation/programme scalaire : Traitement de données séquentielles*

Amélioration des performances jusqu'à un facteur n (taille du vecteur) au-dessus du mode scalaire où une paire d'opérandes est exploitée séquentiellement.

<http://www.nersc.gov/users/computational-systems/edison/programming/vectorization/>
<http://moss.csc.ncsu.edu/~mueller/cluster/ps3/SDK3.0/docs/accessibility/sdkpt/cbet_1simdvector.html>

-ftree-loop-vectorize : Vectorisation d'arbres
-ftree-slp-vectorize : Vectorisation basique d’arbres en bloques

Ces options sont par défaut dans -03 ou utilisées si -ftree-vectorize.
<https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html>

**Processeur vectoriel :** Processeur dont les fonctionnalités architecturales améliorent l'exécution de programme utilisant le parallélisme des tableaux et des matrices.
<https://fr.wikipedia.org/wiki/Processeur_vectoriel>

```
do i = 1, 100
   a(i) = b(i) + c(i)
end do
```
devient
```
do i = 1, 100, 4
   a(i)   = b(i)   + c(i)
   a(i+1) = b(i+1) + c(i+1)
   a(i+2) = b(i+2) + c(i+2)
   a(i+3) = b(i+3) + c(i+3)
end do
```
devient
```
do i = 1, 100, 4
   <load b(i), b(i+1), b(i+2), b(i+3) into a vector register, vB>
   <load c(i), c(i+1), c(i+2), c(i+3) into a vector register, vC>
   vA = vB + vC
   <store a(i), a(i+1), a(i+2), a(i+3) from the vector register, vA>
end do
```
Ici, 4 instruction (additions) sont exécutées en une seule étape.
Exemple tiré de <http://www.nersc.gov/users/computational-systems/edison/programming/vectorization/>

## Expression Simplification

Simplification d'expressions par leur substitution avec une expression plus efficace.
<http://www.compileroptimizations.com/category/expression_simplification.htm>

```c
void expression_simplification (int i) {
  a[0] = i + 0;
  a[1] = i * 0;
  a[2] = i - i;
  a[3] = 1 + i + 1;
}
```
devient
```c
void expression_simplification (int i) {
  a[0] = i;
  a[1] = 0;
  a[2] = 0;
  a[3] = 2 + i;
}
```

## Induction Variable Elimination (ou Élimination d'itérateur)

Combinaison d’itérateurs dans une boucle.

```
int a[SIZE];
int b[SIZE];

void induction_variable_elimination (void) {
  int i1, i2, i3;

  for (i1 = 0, i2 = 0, i3 = 0; i1 < SIZE; i1++)
    a[i2++] = b[i3++];

  return;
}
  
```
devient
```c
int a[SIZE];
int b[SIZE];

void induction_variable_elimination (void) {
  int i1;

  for (i1 = 0; i1 < SIZE; i1++)
    a[i1] = b[i1];

  return;
}
```

Cette technique peut réduire le nombre d'instructions dans une boucle.
Ainsi, le temps d"exécution et la taille du code peuvent être amélioré.

Certaines architectures ont des instructions d'auto-in/décrémentation qui peuvent être utilisé au lieu d'itérateur.
<http://www.compileroptimizations.com/category/ive.htm>

## Loop Optimization

Méthode d'amélioration de la vitesse d'exécution et de diminution des ressources associées aux boucles.
-> rôle important dans l'amélioration des performances du cache
-> amélioration de l'utilisation efficace des capacités de traitement paralèlle

<https://en.wikipedia.org/wiki/Loop_optimization>

Les boucles sont beaucoup utilisées par des programmes sicientifiques. 

## Loop Optimization : les transformations spécifiques de boucles

### Loop Fusion (ou Loop Jaming)

Optimisation de compilation ET loop transformation

Fusion de certaines boucles adjacentes en une seule boucle.
-> réduction de la surcharge de la boucle et améliorer les performances d'exécution.
<http://compileroptimizations.com/category/loop_fusion.htm>

Loop Fusion n'améliore pas le temps d'exécution de certaines architectures.

PAS BON
```c
void loop_fusion (void) {
  int i, a[100], b[100];
  for (i = 0; i < 100; i++)
	a[i] = 1;                     
  for (i = 0; i < 100; i++)
    b[i] = 2;
}
```
devient

```c
void loop_fusion (void) {
  int i, a[100], b[100];
  for (i = 0; i < 100; i++) {
    a[i] = 1; 
    b[i] = 2;
  }
}
```

### Loop Fission (ou Loop Distribution)

Décomposition du corps d'une boucle en plusieurs plus petites boucles.

Optimisation plus efficace dans les processeurs multi-cœurs qui peuvent diviser une tâche en plusieurs tâches pour chaque processeur.
Techniques contraire à la fusion de boucles.

```c
void loop_fission (void) {
	int i, a[100], b[100];
	for (i = 0; i < 100; i++) {
		a[i] = 1; 
		b[i] = 2;
	}
}
```
devient

```c
void loop_fission (void) {
 int i, a[100], b[100];
 for (i = 0; i < 100; i++) {
   a[i] = 1;                     
 }
 for (i = 0; i < 100; i++) {
   b[i] = 2;
 }
```

La lisibilité prime sur l'optimisation manuelle de code.
Il faut laisser le compilateur optimiser pour nous.

Optimisation de haut niveau (dans le middle-end)

Voir les caches

Qualité du code avant tout

Simulation
Jeux vidéo (optimisation énorme, cf. PS4)
Réalité virtuelle
Imagerie médicale en temps réel (qualité du code prime sur l'optimisation)

GIMPLE, GENERIC, RTL
