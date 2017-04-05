# Cache

## Sources

Book, Texts in Computer Science, 2003
Fundamentals of Computer Organization and Design - Professeur Sivarama P. Dandamudi

Diapo, Cours
Cache Memory, Chapter 17 - S. Dandamudi
<http://service.scs.carleton.ca/sivarama/org_book/org_book_web/slides/chap_1_versions/ch17_1.pdf>

Diapo, Cours
Les mémoires - Chercheur Philippe Clauss

Pdf, November 21, 2007
What Every Programmer Should Know About Memory - Ulrich Drepper

# Cache

Composant matériel ou logiciel de stockage de données.
Permet une diffusion plus rapide des données.

D'où viennent les données ?
  - résultat d'un calcul antérieur
  - copie de données stockées ailleurs

La lecture des données du cache est plus rapide que :
  - le recalcul d'un résultat
  - la lecture d'un stock de données plus lent

Les caches doivent être relativement petits pour être rentable et permettre une utilisation efficace des données.

Ils sont particulièrement performants si le modèle d'accès dans les applications présente :
  - la localité de référence
  - la localité temporelle
  - localité spatiale (données stockées physiquement à proximité de données déjà demandées)

# Mémoire Cache

Mémoire cache est une petite quantité de mémoire rapide.
Gérée côté matériel (et non logiciel)

**Localité spatiale** : après un mot cherché, le mot cherché suivant est 
proche en mémoire (ex : tableaux, instructions)
**Localité temporelle** : ré-utilisation des mots cherchés (ex : boucles)

Mémoire cache est une petite quantité de mémoire rapide
Elle sert de tampon entre la mémoire vive et le processeur

Le processeur y stocke les informations dont il a le plus fréquemment besoin.
Il y ausi un cache pour les navigateur dont firefox et netscape dont le répertoire s'appelle cache pour un accès plus rapide aux page web et pour Internet Explorer c'est Temporary Internet file 
