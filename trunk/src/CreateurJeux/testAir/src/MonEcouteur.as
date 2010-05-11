package 
{ 
	 import Controleur.MIEffet;
	 import Controleur.MMouvementPerpetuel;
	 
	 import Graphique.MIObjetGraphique;
	 import Graphique.MIObjetGraphiqueEcouteur;
	 
	 import Utilitaires.MAxe; 

 
	 public class MonEcouteur implements MIObjetGraphiqueEcouteur 
	 { 
 	 	 private var tab_mvt:Array; 
 
	 	 public function MonEcouteur() 
	 	 { 
	 	 	 tab_mvt = new Array(); 
	 	 } 
 
	 	 // Fonctions de l'interface MIObjetGraphiqueEcouteur à réimplémenter : 
	 	 public function graphiqueSeDessine(graphique:MIObjetGraphique):void 
	 	 { 
	 	 } 
 
	 	 public function graphiqueMeurt(graphique:MIObjetGraphique):void 
	 	 { 
	 	 } 
 
	 	 public function graphiqueCollision(graphique:MIObjetGraphique, axe:MAxe):void 
	 	 { 
	 	 	for(var i:int=0;i<tab_mvt.length;i++)
	 	 	{
	 	 		var mouv:MMouvementPerpetuel = tab_mvt[i] as MMouvementPerpetuel;
	 	 		if(mouv != null)
	 	 		{
	 	 			mouv.rebondir(axe);
	 	 		}
	 	 	}
	 	 	if(graphique.getGraphique().id != "Rectangle_vide0" && graphique.getGraphique().id != "scene" && graphique.getGraphique().id != "balle")
	 	 	{
	 	 		graphique.mourir();
	 	 	}
	 	 } 
 
	 	 public function graphiqueSeDeplace(graphique:MIObjetGraphique):void 
	 	 { 
	 	 } 
 
	 	 public function graphiqueChangeTaille(objet:MIObjetGraphique):void 
	 	 { 
	 	 } 
 
	 	 public function debutDuJeuGraphique(graphique:MIObjetGraphique):void 
	 	 { 
	 	 	for(var i:int=0;i<tab_mvt.length;i++)
	 	 	{
	 	 		var m:MIEffet = tab_mvt[i] as MIEffet;
	 	 		if(m!=null)
	 	 		{
	 	 			(tab_mvt[i] as MIEffet).lancer();
	 	 		}
	 	 	}
	 	 } 
 
	 	 public function finDuJeuGraphique(graphique:MIObjetGraphique):void 
	 	 { 
	 	 } 
 
	 	 public function ajouterMouvement(m:MIEffet):void 
	 	 { 
	 	 	 tab_mvt.push(m); 
	 	 } 
 
	 } 
}