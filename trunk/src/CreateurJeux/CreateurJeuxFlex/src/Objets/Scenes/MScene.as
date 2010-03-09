package Objets.Scenes
{
	import Objets.IObjet;
	import Objets.Objet;
	
	public class MScene extends Objet implements IObjet
	{
		private var tab_objet:Array;
		
		public function MScene(image:String, largeur:Number, hauteur:Number, posX:Number, posY:Number)
		{
			super("Scene", image, largeur, hauteur, posX, posY);
			tab_objet= [];
		}
		
		override public function enregistrer():String
		{
			var str:String="";
			str+=super.enregistrer()+"> \n";
			for(var i:int; i<tab_objet.length; i++)
			{
				str+="\t"+tab_objet[i].enregistrer()+"\n";
			}
			str+="</TER:"+super.getNom()+">";
			return str;
		}
		
		public function ajouterObjet(o:Objet):void
		{
			tab_objet.push(o);
		}
		
		public function retirerObjet(o:Objet):void
		{
			var position_objet:int;
			position_objet=tab_objet.indexOf(o);
			tab_objet.splice(position_objet,1);
		}
		
		public function tailleListe():Number
		{
			return tab_objet.length;
		}
		
		
	}
}