package Graphisme.Onglets
{
	import Erreurs.Erreur;
	
	import Graphique.MGraphiqueAbstrait;
	import Graphique.MGraphiqueScene;
	import Graphique.MIObjetGraphique;
	import Graphique.Textures.MCouleur;
	import Graphique.Textures.MImage;
	
	import Graphisme.PanelOptions.PanelOption;
	
	import Modele.Objets.MApplication;
	import Modele.Objets.ObjetControles.ObjetControle;
	import Modele.Objets.ObjetDynamiques.ObjetDynamique;
	import Modele.Objets.ObjetStatiques.ObjetStatique;
	
	import flash.events.MouseEvent;
	import flash.utils.*;
	
	import mx.containers.Canvas;
	import mx.controls.Image;
	import mx.core.DragSource;
	import mx.events.DragEvent;
	import mx.managers.DragManager;

	public class Onglet extends MGraphiqueScene
	{		
		private var panel_opt:PanelOption;
		private var id_img:int=0; 			// permet de donner un id a chaque objet glissé sur le canevas
		private var xInit:Number;		// position de la souris qd on clique sur le canvas
		private var yInit:Number;
		private var monObjetS:Modele.Objets.ObjetStatiques.ObjetStatique;
		private var monObjetD:Modele.Objets.ObjetDynamiques.ObjetDynamique;
		private var monObjetC:Modele.Objets.ObjetControles.ObjetControle;
		private var liste_attributs:Array;
		private var scene_ajoutee:Boolean;
		private var type_obj:String;
		private var img_fond:Image; 
		private var application:MApplication;
		private var panel_deja_enleve:Boolean;
		private var panel_scene_affiche:Boolean;
		private var cadre:Canvas;
		
		// objet global : 
		 private var objet_global:MGraphiqueAbstrait;
	//	 private var cadre:Canvas;
		
		// gestion des erreurs : 
		private var erreur:Erreur;
		
		private var operation:OperationSurObjet;
		
		
		// variable pour generation de code :
		private var var_script:String;
		
		// pour le jeu : 
		private var nom_jeu:String;
		private var nom_auteur:String;
		private var type_jeux:String;
		
		// id de l'objet en string : 
		var id_objet:String;
		
		public function Onglet(panel_opt:PanelOption,erreur:Erreur)
		{
			super();
			this.label="jeu";
			this.erreur = erreur;
			this.panel_opt=panel_opt;
			liste_attributs=[];
			
			scene_ajoutee = false;
			application = new MApplication;
			type_obj="";
			panel_deja_enleve=false;
			panel_scene_affiche=false;
			
			// -----------------------------
			
			this.texture=new MCouleur(0xE2CDFF);
			this.width=400;
			this.height=400;
			this.x=0;
			this.y=0;
			operation = new OperationSurObjet(panel_opt,this,erreur);

			// ----------------------------------
			
			cadre =new Canvas();
			var_script = "	<mx:Script> \n"+
						"\t <![CDATA[ \n "+
						"\t ]]> \n"+
						"</mx:Script>";
						
			// --------------------------------
			
			nom_jeu = this.label;
			nom_auteur = "";
			type_jeux = "Flex";
			panel_opt.setNomJeu(nom_jeu);
			panel_opt.setNomAuteur(nom_auteur);
			panel_opt.setTypeFlex(true);
			
			// --------------------------------

			cadre =new Canvas();
			// ajout des actions : 
			this.addEventListener(DragEvent.DRAG_ENTER,dragEnterHandler);				
			this.addEventListener(MouseEvent.MOUSE_DOWN,enregistrerPosition);
			this.addEventListener(DragEvent.DRAG_DROP,dragDropHandler);
		}
			
		private function dragEnterHandler(event:DragEvent):void
        {
		    DragManager.acceptDragDrop(Onglet(event.currentTarget));
        }
		
		private function dragDropHandler(event:DragEvent):void
        {
        	// affichage des objets dans la scene :
//        	for (var i:int=0; i<((MScene)(this.getObjet())).getEnfants().length; i++)
//        	{
//        		erreur.sysout.text+=((MScene)(this.getObjet())).getEnfants()[i].toString()+"\n";
//        	}
        	
        	
       		if(!this.contains((MIObjetGraphique)(event.dragInitiator)))
       		{
       			 var clone:MIObjetGraphique = ((MIObjetGraphique)(event.dragInitiator)).clone();
       			
       			 this.addChild(clone.getGraphique());
				 clone.getObjet().setX((event.localX)/2);
				 clone.getObjet().setY((event.localY)/2);
				
				 id_objet = ((MIObjetGraphique)(event.dragInitiator)).id; 
				 clone.getGraphique().id =id_objet+id_img.toString();
				
				 operation.setObjet(clone);
				 panel_opt.setObjet(clone);
				 clone.getGraphique().setFocus();
				 panel_opt.setOperation(operation);
				 id_img=id_img + 1;
       		}
        	else
        	{
        		 ((MIObjetGraphique)(event.dragInitiator)).x=(event.localX)/2 - (xInit/2);
				 ((MIObjetGraphique)(event.dragInitiator)).y=(event.localY)/2 - (yInit/2);

				 operation.setObjet(((MIObjetGraphique)(event.dragInitiator)));
				 ((MIObjetGraphique)(event.dragInitiator)).setFocus();	 			 
				 
				 operation.afficherCadre();
				 operation.apresDeplacement();
        	}
        	
//           if(event.dragSource.hasFormat("items"))
//		   {
//			   var items:Array = event.dragSource.dataForFormat("items") as Array;
//			   var type_obj2:String=items[0].type;
//			   var img:MImage = new MImage(panel_opt,this,erreur);
//			   img.setType(type_obj2);
//			   img.height=items[0].hauteur;
//			   img.width=items[0].largeur;
//			   img.source=items[0].source;
//			   img.id=id_img.toString();
//			   setImageGlobale(img);
//			   
//			 	
//			  
//			   erreur.sysout.text+="ima "+image_globale.height+"    "+cadre.height+"\n";
//			  
//		//	   image_globale.setFocus();
//			   while(!scene_ajoutee)
//			   {
//					if(type_obj2=="Scene")
//					{
//						scene_ajoutee=true;
//						ma_scene= new MScene(img.id,img.source.toString(),img.width,img.height,img.x,img.y,erreur);
//						img.x=0;
//			   			img.y=0;
//						this.height=items[0].hauteur;
//						this.width = items[0].largeur;
//						application.ajoutScene(ma_scene);
//						this.addChild(img);
//					}
//					else
//					{
//						Alert.show("Vous devez d'abbord ajouter une scene !","Attention");
//						return;
//					}
//			   }
//				if(type_obj2!="Scene")
//				{
//					   img.x=event.localX - 20;
//			   		   img.y=event.localY - 20;
//			   		   
//			   		   ajouterObjet();   
//			   		  
//					   this.addChild(img);
//				}		   
//			   //img.addEventListener(MouseEvent.MOUSE_MOVE,selectionner);
//		   	   id_img=id_img + 1;
//		   }
//		   else
//		   {
//			   	event.dragInitiator.x=event.localX - xInit;
//			    event.dragInitiator.y=event.localY - yInit;
//			    image_globale.setFocus();
//			    panel_opt.mettreAJour(image_globale,ma_scene.getObjetParId(image_globale.id));
//			    image_globale.afficherCadre();			   	
//		   }  
		   	          
        }
        

        
        public function selectionner(event:MouseEvent):void
		{
			var dragInitiator:MIObjetGraphique=MIObjetGraphique(event.currentTarget);
            var ds:DragSource = new DragSource();
			operation.setObjet(dragInitiator);
            ds.addData(dragInitiator, "carre");

			var imageProxy:Image = new Image();
			var image_rect:MImage = event.currentTarget.getTexture() as MImage;
			if(image_rect!=null)
			{
				 imageProxy.source =  image_rect.getUrlImage();	
			}
		    imageProxy.height=dragInitiator.getObjet().getHauteur();
		    imageProxy.width=dragInitiator.getObjet().getLargeur();  
            DragManager.doDrag(dragInitiator.getGraphique(), ds, event, imageProxy);

			
//			var dragInitiator:MImage;
//			dragInitiator = event.currentTarget as MImage;
//			image_globale=dragInitiator;
//            var ds:DragSource = new DragSource();
//
//			dragInitiator.styleName="imageGlobale";
//            ds.addData(dragInitiator, "img");
//
//			var imageProxy:Image = new Image();
//		    imageProxy.source = event.currentTarget.source;
//		    imageProxy.height=dragInitiator.height;
//		    imageProxy.width=dragInitiator.width;           
//		   
//	//	    xPos.addEventListener(Event.CHANGE,deplacerImageX);
//	//	    yPos.addEventListener(Event.CHANGE,deplacerImageY);
//	//	    tailleImg.addEventListener(Event.CHANGE,changerTaille);
//	//	    image_globale.addEventListener(MouseEvent.MOUSE_DOWN,afficherSource);
//		//	image_globale.addEventListener(MouseEvent.CLICK,afficherPanelObjet);
//		
//			if(image_globale.getType()!="Scene")
//			{
//            	DragManager.doDrag(dragInitiator, ds, event, imageProxy);
//  			}	
        }
        
//        public function ajouterObjet():void
//        {
//        	erreur.sysout.text+="id dan onglet : "+id_img.toString()+"id im"+image_globale.id+"\n";
//        	 // on crée un nouvel objet en fonction de son type :
//			 liste_attributs=[image_globale.id,image_globale.source,image_globale.width,image_globale.height,image_globale.x,image_globale.y];
//			 if(image_globale.getType()=="ObjetControle")
//			 {	liste_attributs.push("type_controle");	}
//			 else if (image_globale.getType()=="ObjetDynamique") 			  
//			 {	liste_attributs.push("mvmt");	}
//			   					   
//			 var obj =creerInstance("Modele.Objets."+image_globale.getType()+"s."+image_globale.getType(),liste_attributs);
//				   			   
//			 ma_scene.ajouterObjet(obj);
//        }
        
        private function enregistrerPosition(event:MouseEvent):void
        {        	
        	var graph_temp:MIObjetGraphique = event.target as MIObjetGraphique;
        	if(graph_temp!=null)
        	{
        	 	xInit=event.localX - graph_temp.getObjet().getX();
        		yInit=event.localY - graph_temp.getObjet().getY();
        		panel_opt.setObjet(graph_temp);
        	}
        }
        
        public function creerInstance(nom_classe:String, args:Array):MGraphiqueAbstrait
        {
        	var ma_classe:Class = getDefinitionByName(nom_classe) as Class;
        	var instance:MGraphiqueAbstrait=null;
        	if(args.length==7)
        	{
        		instance = new ma_classe(args[0],args[1],args[2],args[3],args[4],args[5],args[6]);
        	}
        	else
        	{
        		instance = new ma_classe(args[0],args[1],args[2],args[3],args[4],args[5]);
        	}
        	return instance;

        }  
      
      	public function enleverCadres():void
      	{
      		for(var i:int=0;i<getChildren().length;i++)
      		{
				var canvas:Canvas = getChildAt(i) as Canvas;
      			if(canvas!=null)
      			{
      				this.removeChildAt(i); 
      				invalidateDisplayList();
      			}
      		}
      	}
   
   
   		// accesseurs :
        public function getApplication():MApplication {  return application; }
        public function setTitreOnglet(s:String):void {	this.label=s; }        
        public function getNbId():Number { return id_img; }
        public function setNbId(n:Number):void { id_img = n; }
        public function setSceneDeFondInstallee(b:Boolean):void {   scene_ajoutee=b;   }
        public function getOperation():OperationSurObjet { return operation; }
        public function getPanelOption():PanelOption { return panel_opt; }
        public function getNomJeu():String { return nom_jeu;}
        public function setNomJeu(nom_jeu:String):void {this.nom_jeu = nom_jeu;}
        public function getNomAuteur():String {return nom_auteur;}
        public function setNomAuteur(nom_auteur:String):void {this.nom_auteur = nom_auteur;}
        public function getTypeJeu():String { return type_jeux;}
        public function setTypeJeu(type_jeu:String):void {this.type_jeux = type_jeu;}
        public function getIdObjet():String {return id_objet;}


		// fonction de génération de code : 
		public function genererCodeApplicationFlex(titre:String):String
		{
			// penser a remettre le titre du jeu et a faire le choix entre air ou flex
			var res:String="<?xml version=\"1.0\" encoding=\"utf-8\"?> "+
				" \n <mx:Application xmlns:mx=\"http://www.adobe.com/2006/mxml\" "+
				"layout=\"absolute\" xmlns:TER=\"Graphique.*\" pageTitle=\""+titre+"\"> \n";
				
			res+=this.genererCodeScene();
			res+="\n </mx:Application>";
			
			return res;
		}
		
		public function genererCodeApplicationAir(titre:String):String
		{
			// penser a remettre le titre du jeu et a faire le choix entre air ou flex
			var res:String="<?xml version=\"1.0\" encoding=\"utf-8\"?> "+
				" \n <mx:WindowedApplication title=\""+titre+"\" xmlns:mx=\"http://www.adobe.com/2006/mxml\" "+
				"layout=\"absolute\" xmlns:TER=\"Graphique.*\"> \n";
				
			res+=this.genererCodeScene();
			res+="\n </mx:WindowedApplication>";
			return res;
		}
		
		public function genererCodeScene():String
		{
			var str:String = "\t <TER:MGraphiqueScene" +
							// +" id=\""+this.id+"\""
							 " largeur=\""+this.width+"\""
							 +" hauteur=\""+this.height.toString()+"\""
							 +" x=\""+this.x.toString()+"\""
							 +" y=\""+this.y.toString()+"\""
							 +">";
			var tab_enfant:Array = this.getChildren();
			for(var i:int=0; i<tab_enfant.length;i++)
			{
				var enfant:MIObjetGraphique = tab_enfant[i] as MIObjetGraphique;
				if(enfant)
				{
					str+=genererCodeObjet(enfant);
				}
			}
			str+="\n </TER:MGraphiqueScene>";
			return str;
		}
		
		public function genererCodeObjet(obj:MIObjetGraphique):String
		{
			var str:String = "\n \t \t <TER:"+obj.getNomClasse()
							 +" id=\""+obj.getGraphique().id+"\""
							 +" largeur=\""+obj.getObjet().getLargeur().toString()+"\""
							 +" hauteur=\""+obj.getObjet().getHauteur().toString()+"\""
							 +" x=\""+obj.getObjet().getX().toString()+"\""
							 +" y=\""+obj.getObjet().getY().toString()+"\""
							 +" "+genererCodeTexture(obj)+" ";
			if(obj.getBordure()!=null)
			{
				str+=genererCodeBordure(obj);
			}
			str+=" />";
			return str;
		}
		
		public function genererCodeTexture(obj:MIObjetGraphique):String
		{
			var nom_classe:String = obj.getTexture().getNomClasse();
			var str:String = "texture=\"{new "+nom_classe+"(";
			if(nom_classe == "MCouleur")
			{
				str+="0x"+uint2hex(((MCouleur)(obj.getTexture())).getCouleur().valueOf())+")}\"";
			}
			else if(nom_classe == "MImage")
			{
				str+="\'"+((MImage)(obj.getTexture())).getUrlImage()+"\'"+")}\"";
			}
			// cas du degradé
			return str;
		}
		
		// fonction permettant d'afficher le code pour une bordure : 
		public function genererCodeBordure(obj:MIObjetGraphique):String
		{
			var nom_classe:String = obj.getBordure().getNomClasse();
			var str:String = "bordure=\"{new "+nom_classe+"(";
			str+=obj.getBordure().getEpaisseur()+",0x"+uint2hex(obj.getBordure().getCouleur())+")}\"";
			return str;
		}
		
		// fonction permettant de transformer un uint en hexadecimal :
		private function uint2hex(dec:uint):String 
		{
			var digits:String = "0123456789ABCDEF";
			var hex:String = '';
			while (dec > 0) {
			var next:uint = dec & 0xF;
			dec >>= 4;
			hex = digits.charAt(next) + hex;
			}
			if (hex.length == 0) hex = '0'
			return hex;
		}
      
 }
 
}