# Introduction #

Le fameux state pattern est aussi, voir plus bête que le composite pattern. En gros cela relègue la méthode à un attribut (un état); ainsi le comportement de la méthode peut être vraiment différent.


# Exemple #

Il suffit d'une interface et d'un attribut. Imaginons un personnage d'un jeux, nous allons réfléchir à comment lui permettre de vouloir marcher et courir.

Pour cela on commence à créer notre personnage :

```
class Personnage {
   nom:string;
   position:Coordonne;
   Personne(nom:string, pos:Coordonne) {
      self.nom = nom;
      position = pos;
   }
   deplacement(pos:Coordonne) {
      position = pos;
   }
}
```

Maintenant on va lui ajouter ces 2 etats au travers d'une interface :

```
class Personne {
   etat:IEtat;
   setEtat(e:IEtat);
   deplacement(pos:Coordonne) {
      etat.deplacement(pos);
   }
}
interface IEtat {
   deplacement(pos:Coordonne);
}
```

Enfin on créé nos etat :

```
class Marcher(monPersonnage:Personnage) {
   deplacement(pos:Coordonne) {
      p.position = pos;
   }
}
class Courir(monPersonnage:Personnage) {
   deplacement(pos:Coordonne) {
      p.position = vaViteAPos(pos);
   }
}
```

Enfin nous pouvons l'essayer :

```
class Main {
   p:Personnage = new Personnage("m@n", new Coordonnee(10, 10));
   p.setEtat(new Marcher(p));
   p.deplacement(11, 11);
   p.setEtat(new Courir(p));
   p.deplacement(100, 100);
}
```

# Transitions #

Le problème suivant est comment passer d'un état à l'autre ? En effet précédemment nous avons vu que nous devons coder en dur le fait que le personnage passe de l'état marcher à l'état courir.
Plusieurs solutions s'offrent à nous :
  * les états s'appellent eux même, comme une machine à état.
  * le programmeur décidera lui même où il faut le mettre.

# Singleton #

Si vous regardez bien l'exemple vous remarquerez que l'état d'un objet est souvent appliquable à toutes ces instances (tous les personnages cours et marche). Pour ce faire il suffit d'utiliser le Singleton pattern.

Bref rappel :
  * Constructeur privée
  * Attribut de type THIS (private static Marcher marcher)
  * méthode renvoyant this (if(this==null) {new Marcher();} return this;)

# Transitions spontanées #

Il arrive souvent que l'on est besoins de créer un gestionnaire qui s'occuperait d'appeler un changement d'état. Par exemple si on veut que notre personnage commence à se fatiguer s'il court plus de 10min.

Pour cela nous pouvons utiliser notre MTimer.

Exemple :

```
class PasserCourirMarcherEtat implements ITimer {
   public PasserCourirMarcherEtat(10) {
      timer = newMTimer(10);
      timer.addEcouteur(this);
   }
   public TimerFini() {
      personnage.setEtat(new Marcher(personnage));
   }
}
```

et avec le factory pattern :

```
class ChangementSpontaneeEtat implements ITimer {
   public ChangementSpontaneeEtat("marcher", 10) {
      timer = newMTimer(10);
      timer.addEcouteur(this);
   }
   public TimerFini() {
      if(type == "marcher") {
         personnage.setEtat(new Marcher(personnage));
      }
   }
}
```

# Projet #

Pour le projet je vous propose de faire un MIEtatObjet représentant un objet à état. Il faut alors faire un MIEtat avec les méthodes actionCollision(); actionCollisionBord(); mourir(); naitre(); ....

Biensur il faudra un MEtatElement et une MEtatScene avec un argument etat\_courant:MIEtat et implémentant MIEtatObjet. Ses méthodes seront les même sauf qu'elles appelleront la méthode de l'action : actionCollision() {etat\_courant.actionCollision();}

Ainsi le programmeur n'aura plus qu'à créer ces états qui implémenteront MIEtat. Enfin il pourra au choix changer l'état courant de son MIEtatObjet.