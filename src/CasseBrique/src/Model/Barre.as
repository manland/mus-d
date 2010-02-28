package Model
{
	import mx.controls.Text;
	import Controleur.Clavier;
	import mx.core.UIComponent;
	import Controleur.IClavierListener;
	import Controleur.MSouris;
	import Controleur.MIEcouteurClavier;
	import Controleur.MIEcouteurSouris;
	
	public class Barre extends Objet implements IModelObjet, IClavierListener, MIEcouteurSouris
	{
		public function Barre(x:Number = 0, y:Number = 0, largeur:Number = 30, hauteur:Number = 30)
		{
			super(x, y, largeur, hauteur);
			nom = "Barre";
			
			//Objet controlé par clavier
			var clavier:Clavier = new Clavier();
			clavier.addIClavierListener(this);
			//objet controlé par souris
			var souris:MSouris = new MSouris(Jeux.getSysout());
			souris.ajouterEcouteur(this);
		}
		
		public function toucheBas():void {
			setY(y + 2);
		}
		
		public function toucheHaut():void {
			setY(y - 2);
		}
		
		public function toucheDroite():void {
			setX(x + 2);
		}
		
		public function toucheGauche():void {
			setX(x - 2);
		}
		
		public function clic():void {}
		public function doubleClic():void {}
		public function bougeDroite():void {
			setX(x + 2);
		}
		public function bougeGauche():void {
			setX(x - 2);
		}
	}
}