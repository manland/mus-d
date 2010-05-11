package Coeur.Elements.ElementsAActions
{
	import Controleur.action.MAccroupissement;
	import Coeur.Elements.MElementAEtat;
	
	public class MElementAccroupi extends MElementAActionAbstrait implements MIElementAAction {
		private var pourcentage_accroupissement:Number;
		private var temps_accroupis_ms:Number;
		private var temps_montee_descente_ms:Number;
		
		public function MElementAccroupi(element_accroupis:MElementAEtat, nom:String, pourcentage_accroupissement:Number, temps_accroupis_ms:Number, temps_montee_descente_ms:Number) {
			super(element_accroupis, nom);
			this.pourcentage_accroupissement = pourcentage_accroupissement;
			this.temps_accroupis_ms = temps_accroupis_ms;
			this.temps_montee_descente_ms = temps_montee_descente_ms;
		}
		
		public function action(nom:String):void {
			if(this.nom == nom && active) {
				var accroupis:MAccroupissement = new MAccroupissement(element, pourcentage_accroupissement, temps_accroupis_ms, temps_montee_descente_ms);
				accroupis.lancer();
			}
			if(sous_element_decorateur != null) {
				sous_element_decorateur.action(nom);
			}
		}
	}
}