package Controleur
{
	import flash.events.MouseEvent;
	
	
	/**
	 * interface que doit implémenter un objet qui écoute la souris
	 * <p> il y a un prototype pour les actions de la souris les plus fréquemment utilisée dans les jeux </p>
	 * @see Controleur.MSouris
	 * @example Exemple d'implémentation de MIEcouteurSouris:
	 * <listing version="3.0" > 
	 *
	 *    public class MonEcouteur implements MIEcouteurSouris
	 *	  {
	 *	 		public function MonEcouteur()
	 *			{
	 *				var souris:MSouris = MSouris.getInstance();
	 *				souris.ajouterEcouteur(this);
	 *			}
	 *			
	 *			public function bougeGauche():void{
	 *				//code qui doit être executé lorsque la souris se déplace vers la gauche est appuyée
	 *			}
	 *			
	 *			public function bougeDroite():void{
	 *				//code qui doit être executé lorsque la souris se déplace vers la droite est appuyée
	 *			}
	 *			
	 *			public function bougeHaut():void{
	 *				//code qui doit être executé lorsque la souris se déplace vers la haut est appuyée
	 *			}
	 *			
	 *			public function bougeBas():void{
	 *				//code qui doit être executé lorsque la souris se déplace vers la bas est appuyée
	 *			}
	 *			
	 *			public function clic():void{
	 *				//code qui doit être executé lorsque la souris est cliqué
	 *			}
	 *			
	 *			public function doubleClic():void{
	 *				//code qui doit être executé lorsque la souris est double-cliqué
	 *			}
	 * 	}
	 *
	 * </listing>
 	 */
	public interface MIEcouteurSouris
	{
		/**
		 * fonction appelée lors d'un clic de la souris
	 	 */
		function clic(e:MouseEvent):void;
		/**
		 * fonction appelée lors d'un double clic de la souris
	 	 */
		function doubleClic(e:MouseEvent):void;
		/**
		 * fonction appelée lorsque la souris se déplace vers la droite
	 	 */
		function bougeDroite():void;
		/**
		 * fonction appelée lorsque la souris se déplace vers la gauche
	 	 */
		function bougeGauche():void;
		/**
		 * fonction appelée lorsque la souris se déplace vers le haut
	 	 */
		function bougeHaut():void;
		/**
		 * fonction appelée lorsque la souris se déplace vers le bas
	 	 */
		function bougeBas():void;
	}
}