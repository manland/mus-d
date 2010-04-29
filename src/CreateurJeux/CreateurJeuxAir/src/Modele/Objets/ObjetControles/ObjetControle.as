package Modele.Objets.ObjetControles
{
	import Modele.Objets.IObjet;
	import Modele.Objets.Objet;

	public class ObjetControle extends Objet implements IObjet
	{
		private var type_controle:String;
		
		public function ObjetControle(id:String,image:String, largeur:Number, hauteur:Number, posX:Number, posY:Number,type_controle:String)
		{
			super(id,"ObjetControle",image, largeur, hauteur, posX, posY);
			this.type_controle=type_controle;
		}
		
		override public function enregistrer():String
		{
			var str:String="";
			str+=super.enregistrer();
			str+=" type_controle=\""+type_controle+"\"/>"
			return str;
		}
		
		public function initArgs(image:String, largeur:Number, hauteur:Number, posX:Number, posY:Number,type_controle:String):void
		{
			super.setImage(image);
			super.setHauteur(hauteur);
			super.setLargeur(largeur);
			super.setNom("ObjetControle");
			super.setPosX(posX);
			super.setPosY(posY);
			this.type_controle=type_controle;
		}
	}
}