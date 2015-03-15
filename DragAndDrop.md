# Drag & Drop #
Tous les éléments de flex supportent le drag & drop mais il y a plusieurs façon de faire du drag & drop :
## **Façon simple** ##
  * Il est facile d'utiliser le drag&drop sur les composants "simples" suivants : List, TileList, HorizontalList, Tree, Datagrid, PrintDataGrid. Pour cela, il suffit de modifier leurs propriétés dragEnabled et dropEnabled et de les mettre a true.
  * ex :
`Flex : <mx:TileList id="mesImages" dragEnabled="true" dropEnabled="true">`

```
ActionScript : 
var liste:TileList = new TileList();
liste.dragEnabled = true;
```

> En faisant cela, on peut facilement glisser et déposer des objets contenus dans ces composants.

## **Drag&Drop d'un conteneur à l'autre** ##
<font color='#FF0000'>Attention : un canvas doit avoir une couleur de fond pour être "droppable" sinon le fond est considéré comme transparant et donc les objets ne peuvent pas "s'accrocher"... </font>

> ### **D'un composant "simples" à un autre :** ###
> Il suffit de mettre dans le composant source un dragEnabled=true et dans l'autre un dropEnabled=true

> ### **D'un composant simple à un conteneur :** ###
> Il suffit que le composant simple ait comme propriété un dragEnabled=true et il faut alors redefinir les methodes de drag & drop de l'objet receveur.

> ### **D'un conteneur à un autre conteneur et pour le drag & drop dans un même conteneur :** ###
> Dans ce cas là, il faut redefinir toutes les fonctions de drag mais aussi de drop pour ces conteneurs.

## **Les fonctions de drag & drop :** ##
Il y a des fonctions qu'il faut écrire en fonction des évements du drag & drop, ces fonctions peuvent avoir n'importe quel nom. Il n'est pas toujours necessaire de réécrire toutes les fonctions, juste celles dont on a besoin. Voici les événements qui appartiennent à DragEvent:
  * <u>dragEnter :</u> se déclenche dès que la souris qui drag un objet entre dans la zone de dépot. Une fonction doit être créée si on veut pouvoir déposer des objets dans une zone.
  * <u>dragDrop :</u> se déclanche quand on lache l'objet qu'on déplace dans la zone de dépot. Une fonction doit également être écrite si on veut pouvoir ajouter des éléments à l'endroit où on les laches.
  * <u>dragMove :</u> se déclanche lorsque la souris bouge dans la zone de dépot. J'ai pas encore utilisé de fonction utilisant cet événement...
  * <u>dragExit :</u> se délanche quand la souris qui drag un objet sort de la zone de dépot. J'ai pas encore utilisé de fonction utilisant cet événement...
  * <u>dragComplete :</u> se déclanche à chaque fois qu'on lache un objet peut importe où on est. J'ai pas encore utilisé de fonction utilisant cet événement...

> Il y a aussi des événements de souris  qu'il faut prendre en compte (qui appartiennent à mouseEvent):
    * <u>mouseMove :</u> qui peut également être appelé de la même façon que le dragMove. Je n'utilise que cet événement auquel j'associe une fonction de "selection" de l'objet.
    * <u>mouseDown :</u> qui se déclanche quand on appui avec la souris sur l'objet qu'on veut deplacer, on utilise ca pour déclancher le drag.

## **Un exemple de code pour être plus compréhensive :** ##
Dans ce code on veut deplacer un objet du panel vers un canvas. on rend donc dragable l'objet dans le panel et on rend droppable le canvas. Pour faire ca, on ajoute des listener sur ces objets :
```
monImage.addEventListener(MouseEvent.MOUSE_MOVE,selectionner);
monCanvas.addEventListener(DragEvent.DRAG_ENTER,dragEnterFonction);				
monCanvas.addEventListener(DragEvent.DRAG_DROP,dragDropFonction);
```

Puis on écrit ces fonctions :
  * fonction de selection :
```
private function selectionner(event:MouseEvent):void
{
     var dragInitiator:Image=Image(event.currentTarget);
     var ds:DragSource = new DragSource();

     ds.addData(dragInitiator, "img");

     var imageProxy:Image = new Image();
     imageProxy.source = event.currentTarget.source;
     imageProxy.height=dragInitiator.contentHeight;
     imageProxy.width=dragInitiator.contentWidth;         
     DragManager.doDrag(dragInitiator, ds, event, imageProxy);
				
}

```
> Cette fonction est appelée quand on click sur l'image et qu'on la déplace.
> On crée une image appelée dragInitiator qui est en fait une copie de l'image qu'on drag (pour créer cette image, on fait appel a event.currentTarget).
> Puis on créee une variable de type DragSource qui sera en quelque sorte les données de l'images. Pour cela, on ajoute a ce dragSource (ds) l'image dragInitiator créée plus haut et on lui donne un nom de format (ici "img") il faut bien spécifié ce format car il sera utile plus tard.
> > Ensuite, pour que lorsqu'on déplace l'image, une image suive la souris, on créée une imageProxy de type Image et on lui associe la même source que l'image initiale ainsi que la meme taille (qui peuvent être différentes mais ca n'a pas beaucoup d'interet).
> > Enfin, on fait appel au DragManager, qui est une classe qui permet de donner des comportements à nos objets draggués. La méthode doDrag de la classe DragManager permet de lancer le drag elle attend comme attribut : l'image source, les données du DragSource, l'événement (ici MouseEvent.MOUSE\_MOVE), et éventuellement l'imageProxy (si on la met pas, un carré vide transparant suit la souris).

  * fonction dragEnterFonction :
```
private function dragEnterFonction(event:DragEvent):void
{
    if (event.dragSource.hasFormat("img"))
    {
        DragManager.acceptDragDrop(Canvas(event.currentTarget));
    }
}
```


> Cette fonction est appellée par l'événement DragEnter, donc quand la souris entre dans la zone de dépot (ici dans le canvas). C'est également ici qu'intervient le format dont je parlais plus haut.
> Ainsi, avec ce format, on peut décider du comportement qu'on donnera au canvas. En donnant un format aux objets du dragSource on peut ainsi gérer différement ces comportements.
> Ici on récupere le format du dragSource et on regarde si il est égal a "img", si c'est le cas, on utilise la fonction acceptDragDrop du DragManager sur l'endroit où on vient de rentrer, on cast cet endroit en canvas, car l'endroit où on veut déposer est un canvas.

  * fonction dragDropFonction :
```
private function dragDropFonction(event:DragEvent):void
{
	if(!monCanvas.contains(((Image)(event.dragInitiator))))
   	{
    		Image(event.dragInitiator).x = event.localX - xInit;
		Image(event.dragInitiator).y = event.localY - yInit;
		monCanvas.addChild(((Image)(event.dragInitiator)));
	}
	else
	{
		Image(event.dragInitiator).x = event.localX - xInit;
		Image(event.dragInitiator).y = event.localY - yInit;
	}
}
```
> Cette fonction est appelée par l'évenement dragDrop donc quand on lache l'objet sur la zone de dépot. Ici, je fait un test qui correpond a regarder si l'objet est déja dans la scene ou pas.
> Dans le cas où l'objet n'est pas dans la scène je place mon image où j'ai laché mon objet et je l'ajoute au canvas en fesant un addChild. Le else correspond au cas où l'objet serait déjà dans la scène et donc on n'ajoute pas l'objet à la scène car on ne veut pas de copie (ce cas correspond donc au drag & drop d'un objet dans le même conteneur).

  * Fonction pour les coordonnées :
> On remarquera que lorsque l'objet est "laché", il n'est pas laché exactement à l'endroit où on voulait, il faut pour cela rajouter une fonction qui "enregistrera" la position de la souris lors du lachement. On rajoute donc un listener aux objets :
`monCanvas.addEventListener(MouseEvent.MOUSE_DOWN,enregistrerPosition);`
```
private function enregistrerPosition(event:MouseEvent):void
{
     	xInit=event.localX;
     	yInit=event.localY;
}
```