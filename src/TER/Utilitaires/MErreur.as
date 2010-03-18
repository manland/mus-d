package Utilitaires
{
	import mx.controls.Text;
	
	public class MErreur extends Error
	{
		private var classe:String;
		private var fonction:String;
		private var sys:Text;
		
		public function MErreur(classe:String, fonction:String, message:String="", sys:Text=null, id:int=0)
		{
			this.classe = classe;
			this.sys = sys;
			this.fonction = fonction;
			super(message, id);
		}
		
		public function sysout():void{
			sys.text += "Erreur à la classe: "+this.classe+" à la fonction: "+this.fonction+" === "+message;
		}
		
		public function toString():String {
			return "Erreur à la classe: "+this.classe+" à la fonction: "+this.fonction+" === "+message;
		}
		
	}
}