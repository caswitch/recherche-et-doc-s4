##Compilation/compilateur

##Techniques d'optimisation

###Constant propagation
Substitution de variable par leur constante assignée. <http://www.compileroptimizations.com/category/constant_propagation.htm>

###Constant folding
Substitution d’expression constante par sa valeur calculée pendant la compilation et non pendant l’exécution. <http://www.compileroptimizations.com/category/constant_folding.htm>
Expressions with constant operands can be evaluated at compile time, thus improving run-time performance and reducing code size by avoiding evaluation at compile-time. <http://www.compileroptimizations.com/category/constant_folding.htm>
Exemples <https://en.wikipedia.org/wiki/Constant_folding#The_optimizations_in_action>

##Dead code elimination
Élimination du code qui n’affecte pas la finalité du programme. 
- code qui n'est pas utilisé
- code qui n'est pas atteint (ex. : après un return)
<http://www.compileroptimizations.com/category/dead_code_elimination.htm>

##Constant propagation -> Constant folding -> Dead code eliminiation

Pour de la simplification et réduction, on répète les opérations sur les constantes jusqu'il n'y ait plus modificatin du code. <https://en.wikipedia.org/wiki/Constant_folding#The_optimizations_in_action>

##Vectorization (simd)

Exécution de plusieurs opérations en une seule étape : dans une boucle, le compilateur exécute n opérations selon la taille n du vecteur, puis stocke plusieurs instrucions scalaires dans un seul vecteur d'instruction.
Les performances peuvent être améliorées d'un facteur n (taille du vecteur).
+ Exemples
<!-- PAS COMPRIS : By executing multiple operations in a single step, performance can potentially improve by a factor of up to the vector length (4 in this example), over scalar mode where one pair of operands are being operated on sequentially. -->

Compilers can auto-vectorize loops for you that are considered safe for vectorization. In case of the Intel compiler, this happens when you compile at default optimization level (-O2) or higher. On the other hand, if you want to disable vectorization for any loop in a source file for any reason, you can do that by specifying the '-no-vec' compile flag.
<http://www.nersc.gov/users/computational-systems/edison/programming/vectorization/>
<http://moss.csc.ncsu.edu/~mueller/cluster/ps3/SDK3.0/docs/accessibility/sdkpt/cbet_1simdvector.html>

-ftree-loop-vectorize : Vectorisation d'arbres.
-ftree-slp-vectorize : Vectorisation basique d’arbres en bloques

Ces options sont par défaut dans -03 ou utilisées si -ftree-vectorize.
<https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html>

## Simplification et réduction

Simplification d'expressions par leur substitution avec une expression plus efficace.
<http://www.compileroptimizations.com/category/expression_simplification.htm>

## Induction Variable Elimination
## Élimination d'itérateur

Combinaison d’itérateurs dans une boucle.
<http://www.compileroptimizations.com/category/ive.htm>


##Defer-pop
Quand on crée une fonction en assembleur, on a généralement un prologue et un épilogue. Quand une fonction fait son return, on procède donc à l'exécution de l'épilogue. On dit qu'on "pop". Une optimisation consiste à retarder le pop. D'où "defer-pop". 

Pour des raisons de cache, c'est plus intéressant de tout pop en même temps.

<https://gcc.gnu.org/onlinedocs/gcc-4.4.0/gcc/Optimize-Options.html>

##Thread-jumps
C'est une optimisation qui se fait au niveau de l'assembleur même
Ex: ```
	20: Si a > 20, jump to 50
	...
	50: Si a > 10, jump to 100
	...
```
Ici, si le jump de la ligne 20 est pris, alors celui de la ligne 50 le sera aussi. Du coup on peut juste faire jump la ligne 20 vers la ligne 100 directement.
Source: Wikipedia

##Prédiction de branchement:
Dans un processeur possédant un pipeline, un branchement peut devenir une petite perte de temps. Quelles instructions sommes-nous supposés mettre dans le pipeline ? Celles adjacentes au branchement ? Ou celles pointées par le branchement ? Le temps que le branch soit traité et arrive en fin de pipeline (de longueur variable N, généralement 5), alors N-1 instructions auraient pu commencer à être traitées, si seulement nous savions lesquelles.

Alors, on tente de deviner. Il existe des approches graduellement sophistiquées, mais il ne faut pas oublier que le prédicteur de branchement est une partie du processeur et qu'il faut donc coder tout ça matériellement. 

* Prédiction statique
Les boucles font constamment appel à des branchements pour traiter la sortie ou non de la boucle. Cela se traduit par un retour en arrière conditionnel dans le code. 
Comme il est plus fréquent de boucler que de sortir d'une boucle, un prédicteur de branchement pourra considérer un branchement vers l'arrière comme inconditionnellement pris.

<https://fr.wikipedia.org/wiki/Pr%C3%A9diction_de_branchement>

