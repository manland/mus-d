package Objets
{
	public class Objet extends Object
	{
		private var sous_classe:IObjet;
		private var image:String;
		private var hauteur:Number;
		private var largeur:Number;
		private var posX:Number;
		private var posY:Number;
		private var nom:String;
		
		public function Objet(nom:String,image:String,largeur:Number,hauteur:Number,posX:Number,posY:Number)	
		{
			sous_classe = IObjet(this);
			this.nom=nom;
			this.image=image;
			this.largeur=largeur;
			this.hauteur=hauteur;
			this.posX=posX;
			this.posY=posY;
			
         	if(sous_classe == null) 
         	{
            	throw("Les classes qui étendent Objet doivent implementer IObjet");
         	}	
		}
		
		public function enregistrer():String
		{
			var str:String="";
			str+="<TER:"+nom
				 +" image=\""+image+"\""
				 +" largeur=\""+largeur.toString()+"\""
				 +" hauteur=\""+hauteur.toString()+"\""
				 +" x=\""+posX.toString()+"\""
				 +" y=\""+posY.toString()+"\"";
			return str;
		}
		
		// accesseurs :
		public function getNom():String {return this.nom;}
		public function getImage():String {return this.image;}
		public function getLargeur():Number {return this.largeur;}
		public function getHauteur():Number {return this.hauteur;}
		public function getPosX():Number {return this.posX;}
		public function getPosY():Number {return this.posY;}
		
		public function setNom(n:String):void {nom=n;}
		public function setImage(i:String):void {image=i;}
		public function setLargeur(l:Number):void {largeur=l;}
		public function setHauteur(h:Number):void {hauteur=h;}
		public function setPosX(x:Number):void {posX=x;}
		public function setPosY(y:Number):void {posY=y;}
		
	}
}