package
{
	public class BarreOutilAnnuler extends BarreOutil
	{
		[Bindable] [Embed("Images/barre_outil/undo.png")] private var btn_annuler:Class;
		[Bindable] [Embed("Images/barre_outil/redo.png")] private var btn_refaire:Class;
		
		
		public function BarreOutilAnnuler()
		{
			super();
			liste_bouton.push({id:"bouton_annuler", icon:btn_annuler, toolTip:"Annuler"});
			liste_bouton.push({id:"bouton_refaire", icon:btn_refaire, toolTip:"Refaire"});
		}
		
	}
}