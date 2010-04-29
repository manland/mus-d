package Modele.Objets.ObjetDynamiques
{
	import Modele.Objets.IObjet;
	import Modele.Objets.Objet;

	public class ObjetDynamique extends Objet implements IObjet
	{
		private var mouvement:String;
		
		public function ObjetDynamique(id:String,image:String, largeur:Number, hauteur:Number, posX:Number, posY:Number,mouvement:String)
		{
			super(id,"ObjetDynamique",image, largeur, hauteur, posX, posY);
			this.mouvement=mouvement;
		}
		
		override public function enregistrer():String
		{
			var str:String="";
			str+=super.enregistrer();
			str+=" mouvement=\""+mouvement+"\"/>"
			return str;
		}
		
		public function initArgs(image:String, largeur:Number, hauteur:Number, posX:Number, posY:Number,mouvement:String):void
		{
			super.setImage(image);
			super.setHauteur(hauteur);
			super.setLargeur(largeur);
			super.setNom("ObjetControle");
			super.setPosX(posX);
			super.setPosY(posY);
			this.mouvement=mouvement;
		}
		
	}
}