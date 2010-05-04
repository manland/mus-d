package Controleur
{
	import mx.core.Application;
	
	
	/*
	 * interface que doit implémenter un objet qui écoute le clavier pour être prévenu par MClavier
	 * <p> il y a un prototype pour les touches les plus fréquemment utilisée dans les jeux </p>
	 * @see Controleur.MClavier
	 * @example Exemple d'implémentation de MIEcouteurClavier:
	 * <listing version="3.0" > 
	 *
	 *    public class MonEcouteur implements MIEcouteurClavier
	 *	  {
	 *	 		public function MonEcouteur()
	 *			{
	 *				var clavier:MClavier = MClavier.getInstance();
	 *				clavier.ajouterEcouteur(this);
	 *			}
	 *			
	 *			public function flecheGauche():void{
	 *				//code qui doit être executé lorsque la flèche gauche est appuyée
	 *			}
	 *			
	 *			public function flecheDroite():void{
	 *				//code qui doit être executé lorsque la flèche droite est appuyée
	 *			}
	 *			
	 *			public function flecheHaut():void{
	 *				//code qui doit être executé lorsque la flèche haut est appuyée
	 *			}
	 *			
	 *			public function flecheBas():void{
	 *				//code qui doit être executé lorsque la flèche bas est appuyée
	 *			}
	 *			
	 *			public function entree():void{
	 *				//code qui doit être executé lorsque la touche Entrée est appuyée
	 *			}
	 *			
	 *			public function espace():void{
	 *				//code qui doit être executé lorsque la touche espace est appuyée
	 *			}
	 * 	}
	 *
	 * </listing>
 	 */
 	
 	
	public interface MIEcouteurClavier
	{
		/*
		 * fonction appelée lorsque l'utilisateur appuie sur la flèche du bas
	 	 */
		function flecheBas():void;
		/*
		 * fonction appelée lorsque l'utilisateur appuie sur la flèche du haut
	 	 */
		function flecheHaut():void;
		/*
		 * fonction appelée lorsque l'utilisateur appuie sur la flèche de gauche
	 	 */
		function flecheGauche():void;
		/*
		 * fonction appelée lorsque l'utilisateur appuie sur la flèche de droite
	 	 */
		function flecheDroite():void;
		/*
		 * fonction appelée lorsque l'utilisateur appuie sur Entrée
	 	 */
		function entree():void;
		/*
		 * fonction appelée lorsque l'utilisateur appuie Espace
	 	 */
		function espace():void;

	}
}