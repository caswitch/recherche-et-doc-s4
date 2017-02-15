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

<http://moss.csc.ncsu.edu/~mueller/cluster/ps3/SDK3.0/docs/accessibility/sdkpt/cbet_1simdvector.html>


## Simplification et réduction

