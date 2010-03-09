package BarreOutils
{
	import Onglets.TabOnglet;
	
	public class BarreOutilAnnuler extends BarreOutil
	{
		[Bindable] [Embed("Images/barre_outil/undo.png")] private var annuler:Class;
		[Bindable] [Embed("Images/barre_outil/redo.png")] private var refaire:Class;
		
		private var tab_onglet:TabOnglet;
		
		public function BarreOutilAnnuler(tab_onglet:TabOnglet)
		{
			super(tab_onglet);
			this.tab_onglet=tab_onglet;
			liste_bouton.push({id:"bouton_annuler", icon:annuler, toolTip:"Annuler"});
			liste_bouton.push({id:"bouton_refaire", icon:refaire, toolTip:"Refaire"});
		}
		
	}
}