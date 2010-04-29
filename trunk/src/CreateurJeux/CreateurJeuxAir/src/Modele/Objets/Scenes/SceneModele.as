package Modele.Objets.Scenes
{
	import Erreurs.Erreur;
	
	import Modele.Objets.IObjet;
	import Modele.Objets.Objet;
	
	public class SceneModele extends Objet implements IObjet
	{
		private var tab_objet:Array;
		private var erreur:Erreur;
		
		public function SceneModele(id:String,image:String, largeur:Number, hauteur:Number, posX:Number, posY:Number,erreur:Erreur)
		{
			super(id,"MGraphiqueScene", image, largeur, hauteur, posX, posY);
			this.erreur=erreur;
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
		
		public function getObjetParId(s:String):Objet
		{
			var o:Objet=null;
			for(var i:int=0;i<tab_objet.length;i++)
			{
				if(tab_objet[i].getId()==s)
				{
					o=tab_objet[i];
					erreur.sysout.text+=o+"\n";
				}
			}
			return o;
		}
		
	}
}