##Compilation/compilateur

##Techniques d'optimisation

###Constant propagation
[Constants assigned to a variable can be propagated through the flow graph and substituted at the use of the variable.](http://www.compileroptimizations.com/category/constant_propagation.htm)

###Constant folding

[Remplace une expression constante par sa valeur (calculée stastiquement par le
compilateur).](https://fr.wikipedia.org/wiki/Constant_folding)
[](https://en.wikipedia.org/wiki/Constant_folding)
[Expressions with constant operands can be evaluated at compile time, thus improving run-time performance and reducing code size by avoiding evaluation at compile-time.](http://www.compileroptimizations.com/category/constant_folding.htm)
[](https://en.wikipedia.org/wiki/Constant_folding)
Pendant la compilation plutôt que pendant l'exécution.

Constant folding is the process of recognizing and evaluating constant
expressions at compile time rather than computing them at runtime. Terms in
constant expressions are typically simple literals, such as the integer literal
2, but they may also be variables whose values are known at compile time.

Consider the statement:
<https://en.wikipedia.org/wiki/Constant_folding#The_optimizations_in_action>
 
**Literal** is a notation for representing a fixed value in source code.
<https://en.wikipedia.org/wiki/Literal_(computer_programming)>


##Dead code elimination

##Constant propagation -> Constant folding -> Dead code eliminiation

[Pour de la simplification et réduction, on répète les opérations sur les
constantes jusqu'il n'y ait plus modificatin du
code.](https://en.wikipedia.org/wiki/Constant_folding#The_optimizations_in_action)

##Vectorization (simd)

## Simplification et réduction

