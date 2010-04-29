package Graphisme.Onglets
{
	import Erreurs.Erreur;
	
	import Graphique.MGraphiqueAbstrait;
	import Graphique.MIObjetGraphique;
	
	import Graphisme.PanelOptions.PanelOption;
	
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	import mx.containers.Canvas;

	public class OperationSurObjet
	{
		private var panel_opt:PanelOption;
		private var erreur:Erreur;
		private var onglet:Onglet;		
		private var cadre:Canvas;		
		private var objet:MIObjetGraphique;
		private var clone:MIObjetGraphique;
		private var pos_x:Number;
		private var pos_y:Number;
		
		public function OperationSurObjet(panel_opt:PanelOption,onglet:Onglet,erreur:Erreur)
		{
			super();
			this.erreur=erreur;
			this.panel_opt=panel_opt;
			this.onglet=onglet;
			objet = null;
			clone = null;
		}
		
		 public function donnerFocus(event:MouseEvent):void
        {
       		objet.getGraphique().setFocus();
        }
        
        protected function focusInHandler(event:FocusEvent):void
        {
        	var obj:MGraphiqueAbstrait = event.currentTarget as MGraphiqueAbstrait;
        	objet.getGraphique().addEventListener(KeyboardEvent.KEY_UP,controleClavier);
        	if(obj!=null)
        	{
        		
        		//panel_opt.mettreAJour(this,onglet.getScene().getObjetParId(id));
        		afficherCadre();
//	        	if(type=="Scene" )
//	        	{
//	        		panel_opt.libererPanelOption();
//	        		panel_opt.afficherPanelOption(panel_opt.getOptionScene());
//	        		panel_opt.getOptionScene().setValeurX(onglet.getScene().getPosX().toString());
//	        		panel_opt.getOptionScene().setValeurY(onglet.getScene().getPosY().toString());
//	        		panel_opt.getOptionScene().setValeurLargeur(onglet.getScene().getLargeur().toString());
//	        		panel_opt.getOptionScene().setValeurHauteur(onglet.getScene().getHauteur().toString());
//	        		panel_opt.getOptionScene().setAdresseImage(onglet.getScene().getImage());
	        	//}
	//        	else if(!panel_deja_enleve)
	//        	{
	//        		panel_opt.libererPanelOption();
	//        	}
        	}

			
        }
        
        public function afficherCadre():void
        {
        	onglet.enleverCadres();
        	onglet.invalidateDisplayList();
        	cadre =new Canvas();
        	cadre.width=objet.getObjet().getLargeur()+1;
        	cadre.height=objet.getObjet().getHauteur()+1;
        	cadre.x=objet.getObjet().getX()*2;
        	cadre.y=objet.getObjet().getY()*2;
        	cadre.styleName="cadre";
        	onglet.addChild(cadre);	
        }
		
		public function perteFocus(event:FocusEvent):void
        {
        	var obj:MGraphiqueAbstrait = event.relatedObject as MGraphiqueAbstrait;
        	if(obj!=null)
        	{	
        		if(cadre)
        		{
//	        		onglet.removeChild(cadre);
	        		onglet.enleverCadres();
	        	}
//	        	panel_opt.libererPanelOption();
//	        	panel_opt.afficherPanelOption(panel_opt.getOptionJeu());
	        }
        }
        
        public function apresDeplacement():void
        {
        	if(cadre==null)
        	{
        		cadre = new Canvas();
        	}
        	else
        	{
        		cadre.move(objet.getObjet().getX()*2,objet.getObjet().getY()*2);
        	}
        }
      
      
		public function controleClavier(event:KeyboardEvent):void
		{
			if(event.keyCode==Keyboard.DELETE)
			{
				supprimerObjet();
			}
//			else if(event.controlKey && event.keyCode==Keyboard.C)
//			{
//				copier();
//			}
//			else if(event.controlKey && event.keyCode==Keyboard.V)
//			{
//				coller();
//			}
			else if(event.keyCode==Keyboard.UP)
			{
				objet.getObjet().setY(objet.getObjet().getY()-1);
				apresDeplacement();
			}
			else if(event.keyCode==Keyboard.DOWN)
			{
				objet.getObjet().setY(objet.getObjet().getY()+1);
				apresDeplacement();
			}
			else if(event.keyCode==Keyboard.LEFT)
			{
				objet.getObjet().setX(objet.getObjet().getX()-1);
				apresDeplacement();
			}
			else if(event.keyCode==Keyboard.RIGHT)
			{
				objet.getObjet().setX(objet.getObjet().getX()+1);
				apresDeplacement();
			}
		}
		
		public function copier():void
		{
//			var img:MonImage = new MonImage(panel_opt,onglet,erreur);
//		//	img.source=source;
//			img.width=width;
//			img.height=height;
//			img.type=type;
//			erreur.sysout.text+="idddd   "+onglet.getNbId()+"\n";
//			img.id=onglet.getNbId().toString();
//			img.x=x+20;
//			img.y=y+20;
			pos_x = objet.getObjet().getX();
			pos_y = objet.getObjet().getY();
			clone = objet.clone() as MIObjetGraphique; 	
		}
		
		public function coller():void
		{
			var id_objet:String = onglet.getIdObjet();
			var id_onglet:Number = onglet.getNbId();
			clone.getGraphique().id= id_objet+onglet.getNbId();
			onglet.setNbId(id_onglet+1); 
			clone.getObjet().setX(pos_x+10);
			clone.getObjet().setY(pos_y+10);
			this.setObjet(clone);
			clone.getGraphique().setFocus();
			onglet.addChild(clone.getGraphique());
		}
		
		public function supprimerObjet():void
		{
			if(objet!=null)
			{
				onglet.removeChild(objet.getGraphique());
				onglet.enleverCadres();
				objet=null;
			}
		}
		
        // accesseur : 
        public function setObjet(objet:MIObjetGraphique):void 
        {
        	 this.objet=objet;
        	 objet.getGraphique().addEventListener(MouseEvent.CLICK,donnerFocus);
			 objet.getGraphique().addEventListener(FocusEvent.FOCUS_IN,focusInHandler);
			 objet.getGraphique().addEventListener(FocusEvent.FOCUS_OUT,perteFocus);
			 objet.getGraphique().addEventListener(MouseEvent.MOUSE_MOVE,onglet.selectionner); 
        }
        public function getObjet():MIObjetGraphique { return objet; }
	}
}