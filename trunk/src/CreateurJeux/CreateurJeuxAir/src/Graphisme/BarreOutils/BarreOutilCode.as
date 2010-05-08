package Graphisme.BarreOutils
{	
	import Erreurs.Erreur;
	
	import Graphisme.FenetreCodes.CanvasCode;
	import Graphisme.FenetreCodes.FenetreCode;
	import Graphisme.FenetreCodes.TabOngletCode;
	import Graphisme.Onglets.TabOnglet;
	import Graphisme.PanelOptions.PanelOption;
	
	import flash.net.*;
	
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
		private var deja_ouvert_ecouteur:Boolean = false;
		private var deja_ouvert_ecouteur_clavier:Boolean = false;
		private var deja_ouvert_ecouteur_souris:Boolean = false;
		
		public function BarreOutilCode(tab_onglet:TabOnglet,panel_opt:PanelOption, erreur:Erreur)
		{
			super(tab_onglet);
			this.panel_opt=panel_opt;
			this.percentHeight=100;
			this.erreur=erreur;
			this.tab_onglet=tab_onglet;
			fenetre_code=new FenetreCode();
			tab_onglet_code = new TabOngletCode(fenetre_code,erreur);
			fenetre_code.setTabOnglet(tab_onglet_code);
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
				if(tab_onglet.getOnglet().getCodeMouvementGenerer() && !deja_ouvert_ecouteur)
				{
					deja_ouvert_ecouteur = true;
					var onglet_classe:CanvasCode = new CanvasCode();
					onglet_classe.name = "onglet_mvt";
					onglet_classe.setNomOnglet("MonEcouteur.as");
					fenetre_code.getTabOngletCode().addChild(onglet_classe);
					if(onglet_classe==null)
					{
						erreur.sysout.text+="ici";
					}
					(fenetre_code.getTabOngletCode().getChildByName("onglet_classe") as CanvasCode).getCode().text = tab_onglet.getOnglet().genererClasseEcouteur().toString();
					
				}
				if(tab_onglet.getOnglet().getCodeClavier() && !deja_ouvert_ecouteur_clavier)
				{
					deja_ouvert_ecouteur_clavier = true;
					var onglet_classe:CanvasCode = new CanvasCode();
					onglet_classe.setNomOnglet("MonEcouteurClavier.as");
					onglet_classe.name = "onglet_clavier";
					fenetre_code.getTabOngletCode().addChild(onglet_classe);
					(fenetre_code.getTabOngletCode().getChildByName("onglet_clavier") as CanvasCode).getCode().text = tab_onglet.getOnglet().genererClasseEcouteurClavier().toString();
				}
				if(tab_onglet.getOnglet().getCodeSouris() && !deja_ouvert_ecouteur_souris)
				{
					deja_ouvert_ecouteur_souris= true;
					var onglet_classe:CanvasCode = new CanvasCode();
					onglet_classe.setNomOnglet("MonEcouteurSouris.as");
					onglet_classe.name = "onglet_souris";
					fenetre_code.getTabOngletCode().addChild(onglet_classe);
					(fenetre_code.getTabOngletCode().getChildByName("onglet_souris") as CanvasCode).getCode().text = tab_onglet.getOnglet().genererCodeEcouteurSouris().toString();
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