package BarreOutils
{
	public class BarreOutilFichier extends BarreOutil
	{
		[Bindable] [Embed("Images/barre_outil/new_fic.png")] private var nouveau:Class;
		[Bindable] [Embed("Images/barre_outil/enregistrer.png")] private var enregistrer:Class;
		
		public function BarreOutilFichier()
		{
			super();
			liste_bouton.push({id:"bouton_nouveau", icon:nouveau, toolTip:"Nouveau"});
			liste_bouton.push({id:"bouton_enregistrer", icon:enregistrer, toolTip:"Enregistrer"});
		}
		
	}
}