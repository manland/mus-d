# Introduction #

Après plusieurs jours de recherches j'ai enfin réussi à comprendre comment on peut faire un framework en action script et enssuite le lier en Flex !

Cela permet de soit recréer des classes en ActionScript (pour étendre) soit les utiliser directement en Flex genre <Coeur:MScence .../> ou encore de pouvoir le renommer en ter pour faire genre un <ter:MScene ... />.

Enfin bref de pouvoir faire tout ce qu'on veut en faire !!


# Création du framework #

Pour ce faire rien de plus simple, file -> new -> Flex Librairy Project, nous l'appellerons donc ter pour le moment de toute façons cela n'a pas d'importance.

# Création de la première classe #

Donc click droit sur le nouveau projet flex puis new -> ActionScript Class. A ce moment là pensez à remplir le package comme nous l'avons décidé : Graphique, Coeur et Utilitaire. Cela créera un dossier pour le package et donc votre classe dedans.

Vous pouvez donc commencer à programmer normalement, pour tester vos classes vous n'avez d'autre choix que de faire un projet Flex Project et d'y importer votre projet (voir plus loin).

Une fois vos classes prêtes vous devez les compiler en clickant sur le bouton "run" (triangle vert) normalement rien ne vous est demandé et rien ne s'affiche (c'est un peu embêtant mais on s'y fait). Vous verrez alors apparaitre dans le dossier bin de votre projet un fichier SWC contenant notre framework.

# Importation du framework #

Une fois votre projet Flex créer vous devez faire un click droit dessus puis properties -> Flex Build Path -> Librairy path -> Add SWC et aller chercher dans votre workspace le swc créer précédemment.

Maintenant vous pourrez utiliser vos classes de plusieurs manières :
  * Flex sans binding : vous pouvez ouvrir une balise < et tappez le nom du package contenant la classe que vous souhaitez utiliser (je n'ai essayer qu'avec des composants : panel et canvas)
  * Flex avec binding : dans la balise application rajouter (et non à la place de) un attribut xmlns:ter="Package.**etoile**"(j'arrive pas à fair étoile car c'est gras dans ce wiki) ainsi vous pourrez utiliser les composants de cette façon : 

&lt;ter:MScene width="150" height="150"/&gt;

 au lieu de 

&lt;Coeur:MScene width="150" height="150"/&gt;


  * ActionScript : créer une classe puis faites un extends MScene et cela devrait importer import Coeur.MScene; sinon faites le !! Par contre ter.MScene pour l'import ne marchera pas.