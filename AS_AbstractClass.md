# Introduction #

Comme vous avez dû le remarquer ActionScript ne permet pas de faire des classes abstraites nativement. Heureusement il y a moyen de simuler ce concept.

# Principe #

Il suffit de faire une interface représentant votre classe abstraite. Puis de vérifier lorsque l'on instancie la classe (qui devrait être abstraite) que la sous classe est bien du type de l'interface. Si ce n'est pas le cas on le signal par le biais d'un Throw.

# Exemple #

## Interface ##

```
package Graphique
{
   import Coeur.MObjet;
	
   public interface MIGraphique {
      function dessiner(objet:MObjet):void;
   }
}
```

## Classe abstraite ##

```
package Graphique {
	
   public class MGraphique {
		
      private var sous_classe:MIGraphique;
		
      public function MGraphique() {
         sous_classe = MIGraphique(this);
         if(sous_classe == null) {
            throw("Les classes qui étendent MGraphique doivent implementer MIGraphique");
         }
      }
   }
}
```

## Classe héritant de la classe abstraite ##

```
package Graphique {
   import Coeur.MObjet;
	
   public class MTexture extends MGraphique implements MIGraphique {
		
      public function MTexture() {}
		
      public function dessiner(objet:MObjet):void {}
		
   }
}
```

## Classe héritant de la classe abstraite et étant elle même abstraite ##

Il suffit de ne pas implémenter l'interface et ce sera donc à ses sous-classes de le faire.


# Conclusion #

Comme vous pouvez le voir c'est très simple. Dommage que ce concept ne soit pas nativement présent dans ActionScript mais c'est comme ça !!

Le problème qui vient alors est que faire de ces interfaces au niveau de l'UML ??? On les mets dans un coin ?? On ne les met pas car c'est purement de l'implémentation ??
Merci de bien vouloir répondre en commentant cette page !!!