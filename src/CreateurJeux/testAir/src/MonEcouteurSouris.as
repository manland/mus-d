package 
{ 
	import Controleur.MIEcouteurSouris;
	
	import Graphique.MIObjetGraphique;
	import Graphique.Textures.MCouleur;

 
	 public class MonEcouteurSouris implements MIEcouteurSouris 
	 { 
	 	 private var objet:MIObjetGraphique; 
	 	 public function MonEcouteurSouris(objet:MIObjetGraphique)
	 	 {
	 	 	 this.objet = objet; 
	 	 }

	 	 public function bougeGauche():void 
	 	 { 
	 	  	 // code qui doit être executé lorsque la souris se déplace vers la gauche est appuyée 
	 	 } 

	 	 public function bougeDroite():void 
	 	 { 
	 	  	 // code qui doit être executé lorsque la souris se déplace vers la droite est appuyée 
	 	 } 

	 	 public function bougeHaut():void 
	 	 { 
	 	  	 // code qui doit être executé lorsque la souris se déplace vers la haut est appuyée 
	 	 } 

	 	 public function bougeBas():void 
	 	 { 
	 	  	 // code qui doit être executé lorsque la souris se déplace vers la bas est appuyée 
	 	 } 

	 	 public function clic():void 
	 	 { 
	 	  	 // code qui doit être executé lorsque la souris est cliqué 
	 	  	 objet.setTexture(new MCouleur());
	 	 } 

	 	 public function doubleClic():void 
	 	 { 
	 	  	 // code qui doit être executé lorsque la souris est double-cliqué 
	 	 } 
	 } 
}