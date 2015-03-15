# Introduction #

Le patron de conception Fabrique est un bien grand mot pour mettre en place un truc tout bête. Il s'agit en fait d'une classe permettant de créer des instances d'autres classes à partir de certains attributs.

# Flex et le factory pattern #

Je pense qu'en interne Flex est un gigantesque Factory Pattern des classes de action script.

En effet on remarque que dans les balises de flex on a pas moyen de faire passer des paramètres au constructeur. Il y a donc deux choix possibles :
  * Flex construit un objet avec un constructeur vide, puis remplit l'instance avec des set.
  * Soit il récupère les attributs de la balise avant de construire l'instance pour pouvoir faire passer les attributs au constructeur.

Dans tous les cas il lui faut récupérer les informations écrit en string et les transformer en objet.

# Exemple #

Flex :
```
<mx:Label text="toto" color="red" />
```

ActionScript :
```
var l:Label = new Label();
l.setText("toto");
var c:Color = new Color(0xFF0000);
l.setColor(c);
```

Nous voyons bien sur cet exemple que flex doit non seulement setter le text mais aussi être capable de créer l'objet color à partir du string red !! Et c'est cette partie que l'on appel la Fabrique puisqu'elle fabrique un objet.

# Application au projet #

Pour le projet nous devons être capable d'utiliser Flex et donc de reconstituer des objets à partir des indications dans les balises. Pour se faire il suffit de réimplanter la méthode commitProperties() d'un UIComponent. Vous l'aurez donc compris c'est à la partie graphique de le faire. Cette fonction est appelée lorsque tous les paramètres des balises flex sont passés à la classe correspondante. Et d'appeler nos différentes fabriques qui nous renverrons de vrai objets.

Je vous propose donc 2 fabriques de bases :
  * les objets du Coeur se décomposant en creerObjet(), creerForme() (creerMouvement())
  * les objets du graphisme se décomposant en creerObjetGraphique(), creerTexture()

Le but étant de pouvoir faire dans les sous classes de UIComponent :
var objet:MIObjet = FabriqueCoeur.creer(.........); (qui appelera les sous fabriques)
var graphique:MIObjetGraphique = Fabrique.creer(........);

# Code #

```
public class MGraphiqueTriangle extends UIComponent {
   public var forme:String = "";
   public var texture:String = "";
   public function MGraphiqueTriangle() {
      super();
   }
        
   override protected function commitProperties():void {
      super.commitProperties();
      if(test != "" && texture != "") {
         objet = FabriqueObjet.creerForme(forme);
         graphique = FabriqueGraphique.creerTexture(texture);
      }
   }
}

public class FabriqueObjet {
   public function FabriqueObjet() {
      super();
   }
        
   static public function creerObjet(.......):MIObjet {
      if(....) {
         return new MControle().setForme(creerForme(......));
      } 
      else if(...) {
         return new MStatique().setForme(creerForme(...));
      }
      else return null;
   }

   static public function creerForme(.......):MIForme {
      .......
   }
}
```
Idem pour le graphique

Ce code n'est pas du tout compilable !!! C'est juste pour vous donner un ordre d'idée de ce qu'est un factory pattern. Il vous faut compléter tous les ..... Et pensez surtout que vous êtes libre de changer les noms de classes/méthodes/attributs. Vous pouvez aussi au choix décliner en hiérarchie de classe mais pensez aux interfaces car il faut pouvoir ajouter de nouvelles classes autant pour nous que pour l'utilisateur de notre framework.

# Possibilités #

```
<TER:MGraphique[FORME] x="" y="" largeur="" hauteur="" texture="[TEXTURE]" type="[TYPE]" />
FORME = MEllipse ou MRond ou MTriangle ou MRectangle ou MCarre
--> si MTriangle rajouter point1x="" point1y="" point2x="" point2y="" point3x="" point3y=""
TEXTURE = MCouleur ou MDegrade ou MImage
--> si MCouleur rajouter rgb="rrrgggbbb"
--> si MDegrade rajouter...
--> si MImage rajouter url="file://" ou url="http://"
TYPE = MScene ou MStatique ou MControle ou MDynamique
--> si MControle rajouter control="MClavier" ou control="MSouris"
--> si MDynamique rajouter effet="MMouvement" ou effet="MRedimensionnement" ou effet="MMouvementPerpetuel"
```

Cette partie est à compléter par chaque responsable de section !!

# Conclusion #

Je ne suis pas tout à fait convaincue par ce pattern mais on a pas le choix avec flex. Si quelqu'un réussi à trouver une hiérarchie qui permette d'ajouter des objets créable par notre/nos fabriques je suis preneur.

Je pensais également à un singleton pour Fabrique car il ne devrait y avoir qu'une seule fabrique mais alors le problème des fonctions statiques se poses : qu'en fesons-nous ? Enfin bref j'ai bien dépatouillé le sujet à vous de le finir !!