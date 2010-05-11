package 
{ 
	import Controleur.MClavier; 
	import Controleur.MIEcouteurClavier; 
	import Graphique.MIObjetGraphique; 

 
	 public class MonEcouteurClavier implements MIEcouteurClavier 
	 { 
	 	 private var objet:MIObjetGraphique; 
	 	 public function MonEcouteurClavier(objet:MIObjetGraphique)
	 	 {
	 	 	 this.objet=objet; 
	 	 	// objet.getGraphique().setFocus(); 
	 	 }

 
 	 	 public function flecheBas():void 
	 	 { 
	 	  	 // code qui doit être executé lorsque la flèche bas est appuyée 
	 	 } 

	 	 public function flecheHaut():void 
	 	 { 
	 	 	 // code qui doit être executé lorsque la flèche haut est appuyée 
	 	 } 

	 	 public function flecheGauche():void 
	 	 { 
	 	 	 // code qui doit être executé lorsque la flèche gauche est appuyée 
	 	 	 objet.getObjet().setX(objet.getObjet().getX()-5);
	 	 } 

	 	 public function flecheDroite():void 
	 	 { 
	 	  	 // code qui doit être executé lorsque la flèche droite est appuyée
	 	  	  objet.getObjet().setX(objet.getObjet().getX()+5); 
	 	 } 

	 	 public function entree():void 
	 	 { 
	 	  	 // code qui doit être executé lorsque la touche Entrée est appuyée 
	 	 } 

	 	 public function espace():void 
	 	 { 
	 	  	 // code qui doit être executé lorsque la touche espace est appuyée 
	 	 } 

	 	 public function touche(touche:uint):void 
	 	 { 
	 	  	 // fonction appelée lorsque l'utilisateur appuie une touche autre que celles repérées param touche: code de la touche appuyée 
	 	 } 

	 } 
}