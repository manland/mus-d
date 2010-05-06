package Graphisme.BarreOutils
{	
	import Erreurs.Erreur;
	
	import Graphisme.FenetreCodes.FenetreCode;
	import Graphisme.FenetreCodes.TabOngletCode;
	import Graphisme.Onglets.TabOnglet;
	import Graphisme.PanelOptions.PanelOption;
	
	import flash.net.*;
	
	import mx.controls.Button;
	import mx.events.ItemClickEvent;
	import mx.managers.PopUpManager;
	
	public class BarreOutilCode extends BarreOutil
	{
		private var tab_onglet:TabOnglet;
		private var fenetre_code:FenetreCode;
		private var erreur:Erreur;
		private var panel_opt:PanelOption;
		private var tab_onglet_code:TabOngletCode;
		private var nom_onglet:String;
		
		
		public function BarreOutilCode(tab_onglet:TabOnglet,panel_opt:PanelOption)
		{
			super(tab_onglet);
			this.panel_opt=panel_opt;
			this.percentHeight=100;
			this.erreur=erreur;
			this.tab_onglet=tab_onglet;
			tab_onglet_code = new TabOngletCode();
			fenetre_code=new FenetreCode(tab_onglet_code);
			liste_bouton.push({id:"genererCode", label:"Générer Code"});
			liste_bouton.push({id:"afficherOptionJeu", label:"Options du jeu"});

			this.addEventListener(ItemClickEvent.ITEM_CLICK,clicItem);
		}
		
		public function clicItem(event:ItemClickEvent):void
		{	
			if(event.index == 0)
			{
				var nom_jeu:String = tab_onglet.getOnglet().getNomJeu();
				var type_jeu:String = tab_onglet.getOnglet().getTypeJeu();
				nom_onglet = nom_jeu+"_"+type_jeu+".mxml";
				fenetre_code.getTabOngletCode().getOnglet().setNomOnglet(nom_onglet);
				fenetre_code.getHboxBtn().setTitreBouton(nom_onglet);
				if(type_jeu=="Flex")
				{
					fenetre_code.getTabOngletCode().getOnglet().getCode().text=tab_onglet.getOnglet().genererCodeApplicationFlex(nom_jeu).toString();
				}
				else if(type_jeu=="Air")
				{
					fenetre_code.getTabOngletCode().getOnglet().getCode().text=tab_onglet.getOnglet().genererCodeApplicationAir(nom_jeu).toString();
				}
				PopUpManager.removePopUp(fenetre_code);
	            PopUpManager.addPopUp(fenetre_code, tab_onglet.parent, false);
	            PopUpManager.centerPopUp(fenetre_code);
	  		}
	  		else if(event.index == 1)
	  		{
	  			tab_onglet.getOptionJeu().visible=true;
	  		}
	  
		}
	
		// accesseurs : 
		public function getNomOnglet():String {return nom_onglet;}
		public function setNomOnglet(s:String):void { nom_onglet = s;}	
	}
}