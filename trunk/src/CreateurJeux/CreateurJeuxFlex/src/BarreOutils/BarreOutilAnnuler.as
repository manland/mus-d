package BarreOutils
{
	public class BarreOutilAnnuler extends BarreOutil
	{
		[Bindable] [Embed("Images/barre_outil/undo.png")] private var annuler:Class;
		[Bindable] [Embed("Images/barre_outil/redo.png")] private var refaire:Class;
		
		
		public function BarreOutilAnnuler()
		{
			super();
			liste_bouton.push({id:"bouton_annuler", icon:annuler, toolTip:"Annuler"});
			liste_bouton.push({id:"bouton_refaire", icon:refaire, toolTip:"Refaire"});
		}
		
	}
}