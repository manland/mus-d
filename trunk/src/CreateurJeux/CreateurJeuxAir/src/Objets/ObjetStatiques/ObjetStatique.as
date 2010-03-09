package Objets.ObjetStatiques
{
	import Objets.IObjet;
	import Objets.Objet;

	public class ObjetStatique extends Objet implements IObjet
	{
		public function ObjetStatique(image:String, largeur:Number, hauteur:Number, posX:Number, posY:Number)
		{
			super("ObjetStatique", image, largeur, hauteur, posX, posY);
		}
		
		override public function enregistrer():String
		{
			var str:String=super.enregistrer();
			str+=" />";
			return str;
		}
		
		public function initArgs(image:String, largeur:Number, hauteur:Number, posX:Number, posY:Number):void
		{
			super.setImage(image);
			super.setHauteur(hauteur);
			super.setLargeur(largeur);
			super.setNom("ObjetControle");
			super.setPosX(posX);
			super.setPosY(posY);
		}
		
	}
}