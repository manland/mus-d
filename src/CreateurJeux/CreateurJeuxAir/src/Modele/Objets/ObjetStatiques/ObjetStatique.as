package Modele.Objets.ObjetStatiques
{
	import Modele.Objets.IObjet;
	import Modele.Objets.Objet;

	public class ObjetStatique extends Objet implements IObjet
	{
		public function ObjetStatique(id:String,image:String, largeur:Number, hauteur:Number, posX:Number, posY:Number)
		{
			super(id,"ObjetStatique", image, largeur, hauteur, posX, posY);
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