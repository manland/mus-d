package Graphisme.Onglets
{
	import Coeur.Forme.MFormeTriangle;
	
	import Erreurs.Erreur;
	
	import Graphique.MGraphiqueEtoile;
	import Graphique.MGraphiqueEtoilePleine;
	import Graphique.MGraphiqueScene;
	import Graphique.MGraphiqueTriangle;
	import Graphique.MIObjetGraphique;
	import Graphique.Textures.Degrades.MDegrade;
	import Graphique.Textures.MCouleur;
	import Graphique.Textures.MImage;
	
	import Graphisme.PanelOptions.OptionJeu;
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
		
		// dictionnaire contenant pour chaque clé l'import a réalisé, utilisé dans la génération de code:
		private var dico:Dictionary; 
		
		// booleen qui dit qu'il y a eu au moins un mouvement et donc on peut déclancher la génération 
		// de code pour la classe de l'écouteur :
		private var code_mouvement_generer:Boolean = false; 
		private var souris:Boolean = false;
		private var clavier:Boolean = false;
		
		private var option_jeu:OptionJeu;
		
		public function Onglet(panel_opt:PanelOption,option_jeu:OptionJeu,erreur:Erreur)
		{
			super();
			this.verticalScrollPolicy = "auto";
			this.horizontalScrollPolicy = "auto";
			
			this.option_jeu = option_jeu;
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
			
			operation = new OperationSurObjet(panel_opt,this,erreur);
			cadre =new Canvas();
			this.texture=new MCouleur(0xE2CDFF);
			
			this.id = "scene";
			this.getObjet().setHauteur(600);
			this.getObjet().setLargeur(600);
			this.x=0;
			this.y=0;
			panel_opt.setObjet(this);			

			// ----------------------------------
			
			nom_jeu = this.label;
			nom_auteur = "";
			type_jeux = "Flex";
			option_jeu.setNomJeu(nom_jeu);
			option_jeu.setNomAuteur(nom_auteur);
			option_jeu.setTypeFlex(true);
			
			// --------------------------------
			// 			Dictionnaire contenant les différents imports par rapport au type
				
			dico = new Dictionary();
			
			// --------------------------------


			
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
       		if(!this.contains((MIObjetGraphique)(event.dragInitiator)))
       		{
       			 var clone:MIObjetGraphique = ((MIObjetGraphique)(event.dragInitiator)).clone();
       			
       			 this.addChild(clone.getGraphique());

				 clone.getObjet().setX((event.localX));
				 clone.getObjet().setY((event.localY));
				
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
        		 ((MIObjetGraphique)(event.dragInitiator)).x=event.localX - xInit;
				 ((MIObjetGraphique)(event.dragInitiator)).y=event.localY - yInit;

				 operation.setObjet(((MIObjetGraphique)(event.dragInitiator)));
				 ((MIObjetGraphique)(event.dragInitiator)).setFocus();	 			 
				 
				 operation.afficherCadre();
				 operation.apresDeplacement();
        	}
        	
//        	// affichage des objets dans la scene :
//        	erreur.sysout.text+="\n";
//        	for (var i:int=0; i<((MScene)(this.getObjet())).getEnfants().length; i++)
//        	{
//        		erreur.sysout.text+=((MScene)(this.getObjet())).getEnfants()[i].toString()+"\n";
//        	}
        			   	          
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
		    if(dragInitiator!=this)
		    {
            	DragManager.doDrag(dragInitiator.getGraphique(), ds, event, imageProxy);
            	option_jeu.visible = false;	
      		}
      		
        }
        
        
        private function enregistrerPosition(event:MouseEvent):void
        {        	
        	var graph_temp:MIObjetGraphique = event.target as MIObjetGraphique;
        	if(graph_temp!=null)
        	{
        	 	xInit=event.localX;
        		yInit=event.localY;
        		panel_opt.setObjet(graph_temp);
        		if(graph_temp.getNomClasse() == "MGraphiqueScene")
      			{
      				option_jeu.setVisible(true);
      			}
      			else
      			{
	      			option_jeu.setVisible(false);
      			}
        	}
        }
        

      
      	public function enleverCadres():void
      	{
      		for(var i:int=0;i<getChildren().length;i++)
      		{
				var canvas:Canvas = getChildAt(i) as Canvas;
				
      			if(canvas!=null)
      			{
      				var sc:MGraphiqueScene = canvas as MGraphiqueScene; 
      				if(sc==null)
      				{
      					this.removeChildAt(i); 
      					invalidateDisplayList();
      				}
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
		public function getCodeMouvementGenerer():Boolean { return code_mouvement_generer;}
		public function getCodeClavier():Boolean {return clavier;}
		public function getCodeSouris():Boolean {return souris;}

		// fonction de génération de code : 
		public function genererCodeApplicationFlex(titre:String):String
		{
			var code_scene:String = this.genererCodeScene();
			var code_script:String =genererCodeScript();
			var res:String="<?xml version=\"1.0\" encoding=\"utf-8\"?> "+
				" \n <mx:Application xmlns:mx=\"http://www.adobe.com/2006/mxml\" "+
				"layout=\"absolute\" xmlns:TER=\"Graphique.*\" pageTitle=\""+titre+"\" creationComplete=\"init()\"> \n";
			res+=code_script;
			res+=code_scene;
			res+="\n </mx:Application>";
			
			return res;
		}
		
		public function genererCodeApplicationAir(titre:String):String
		{
			var code_scene:String = this.genererCodeScene();
			var code_script:String =genererCodeScript();
			var res:String="<?xml version=\"1.0\" encoding=\"utf-8\"?> "+
				" \n <mx:WindowedApplication title=\""+titre+"\" xmlns:mx=\"http://www.adobe.com/2006/mxml\" "+
				"layout=\"absolute\" xmlns:TER=\"Graphique.*\" creationComplete=\"init()\"> \n";
			res+=code_script;
			res+=code_scene;
			
			res+="\n </mx:WindowedApplication>";
			return res;
		}
		
		// permet de generer la balise de script :
		public function genererCodeScript():String
		{
			var str:String;
			str= "";
			str+="	<mx:Script> \n"+
						"\t <![CDATA[ \n ";
			// generation des imports : 
			for (var key:Object in dico) 
			{
				str+="\t \t"+dico[key].toString()+"\n";	
			}
		
			str+="\t ]]> \n"+
					"</mx:Script> \n";
						
			return str;
		}
		
		// fonction permettant de generer le code pour la scene
		public function genererCodeScene():String
		{
			var str:String = "\t <TER:MGraphiqueScene"
							 +" id=\""+this.getGraphique().id+"\""
							 +" largeur=\""+this.getObjet().getLargeur()+"\""
							 +" hauteur=\""+this.getObjet().getHauteur()+"\""
							 +" x=\""+this.getObjet().getX().toString()+"\""
							 +" y=\""+this.getObjet().getY().toString()+"\" "
							 +genererCodeTexture(this);
			if(this.getBordure()!=null)
			{
				str+=" "+genererCodeBordure(this);
			}
			str+=" >";
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
			genererCodeMouvement(obj);
			var str:String = "\n \t \t <TER:"+obj.getNomClasse()
							 +" id=\""+obj.getGraphique().id+"\"";
			if(obj.getNomClasse()=="MGraphiqueTriangle")
			{
				str+=" point1=\"{new MCoordonnee("+Number((((MGraphiqueTriangle)(obj)).getObjet().getForme() as MFormeTriangle).getPoint1().getX())+","+Number((((MGraphiqueTriangle)(obj)).getObjet().getForme() as MFormeTriangle).getPoint1().getY())+")}\""+
					 " point2=\"{new MCoordonnee("+Number((((MGraphiqueTriangle)(obj)).getObjet().getForme() as MFormeTriangle).getPoint2().getX())+","+Number((((MGraphiqueTriangle)(obj)).getObjet().getForme() as MFormeTriangle).getPoint2().getY())+")}\""+
					 " point3=\"{new MCoordonnee("+Number((((MGraphiqueTriangle)(obj)).getObjet().getForme() as MFormeTriangle).getPoint3().getX())+","+Number((((MGraphiqueTriangle)(obj)).getObjet().getForme() as MFormeTriangle).getPoint3().getY())+")}\"";
			}
			else
			{
				str+=" largeur=\""+obj.getObjet().getLargeur().toString()+"\""
					 +" hauteur=\""+obj.getObjet().getHauteur().toString()+"\""
					 +" x=\""+obj.getObjet().getX().toString()+"\""
					 +" y=\""+obj.getObjet().getY().toString()+"\"";
			}
			if(obj.getNomClasse()=="MGraphiqueEtoile")
			{
				str+=" tourne=\""+((MGraphiqueEtoile)(obj)).tourne+"\" ";
			}
			if(obj.getNomClasse()=="MGraphiqueEtoilePleine")
			{
				str+=" tourne=\""+((MGraphiqueEtoilePleine)(obj)).tourne+"\" ";
			}
			
			str+=" "+genererCodeTexture(obj)+" ";
			if(obj.getBordure()!=null)
			{
				str+=genererCodeBordure(obj);
			}
			str+=" />";
			
			return str;
		}
		
		// permet de generer le code pour la texture
		public function genererCodeTexture(obj:MIObjetGraphique):String
		{
			var nom_classe:String = obj.getTexture().getNomClasse();
			var str:String = "texture=\"{new "+nom_classe+"(";
			if(nom_classe == "MCouleur")
			{
				dico["MCouleur"]="import Graphique.Textures.MCouleur;";
				str+="0x"+uint2hex(((MCouleur)(obj.getTexture())).getCouleur().valueOf())+")}\"";
			}
			else if(nom_classe == "MImage")
			{
				dico["MImage"]="import Graphique.Textures.MImage;";
				str+="\'"+((MImage)(obj.getTexture())).getUrlImage()+"\'"+")}\"";
			}
			else if(nom_classe == "MDegrade") // peut etre faire exp reg
			{
				dico["MDegrade"]="import Graphique.Textures.Degrades.MDegrade;";
				str+=genererCodeDegrade(obj);
			}
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
		
		// feonction generant le code du degradé : 
		public function genererCodeDegrade(obj:MIObjetGraphique):String
		{
			var str:String;
			str = "";
			var degrade:MDegrade;
			degrade = obj.getTexture() as MDegrade;
			str+="["+"0x"+uint2hex(degrade.getCouleurs()[0]);
			for(var i:int=1;i<degrade.getCouleurs().length;i++)
			{
				str+=",0x"+uint2hex(degrade.getCouleurs()[i]);
			}
			str+="],["+degrade.getAlphas()[0];
			for(var i:int=1;i<degrade.getAlphas().length;i++)
			{
				str+=","+degrade.getAlphas()[i];
			}
			str+="],["+degrade.getRatios()[0];
			for(var i:int=1;i<degrade.getRatios().length;i++)
			{
				str+=","+degrade.getRatios()[i];
			}
			str+="],";
			str+="SpreadMethod."+degrade.getSpreadMethod().toUpperCase()+",";
			if(degrade.getInterpolation()=="linearRGB")
			{
				str+="InterpolationMethod.LINEAR_RGB,";
			}
			else
			{
				str+="InterpolationMethod."+degrade.getInterpolation().toUpperCase()+",";
			}
			str+=degrade.getFocalPtRatio()+",";
			str+="GradientType."+degrade.getType().toUpperCase()+",";
			str+=degrade.getBoxRotation()+")}\"";	
			return str;
		}
		
		
		// generation de code pour le mouvement : 
		public function genererCodeMouvement(obj:MIObjetGraphique):void
		{
		//	code_mouvement_generer =true;
			var n:Number = 0;
			var m:Number = 0;
			var str:String = "";
			str+="\n  \t \tprivate function init():void \n";
			str+="\t \t{\n";
			for (var key:Object in panel_opt.getDicoMvt()) 
			{
				
				//str+="\t \t \tvar mon_ecouteur"+m+":MonEcouteur = new MonEcouteur(); \n";
				for(var i:int=0;i<(panel_opt.getDicoMvt()[key] as Array).length;i++)
				{
					var s:String= (panel_opt.getDicoMvt()[key] as Array)[i].mvt;
					if(s!="clavier" && s!="souris")
					{
						str+="\t \t \tvar mon_ecouteur"+m+":MonEcouteur = new MonEcouteur(); \n";	
					}
					if((panel_opt.getDicoMvt()[key] as Array)[i].mvt == "perpetuel")
					{
						code_mouvement_generer =true;
						str+="\n\t \t \tvar mouv"+n+":MMouvementPerpetuel = new MMouvementPerpetuel(); \n";
						str+="\t \t \tmouv"+n+".instancieAvecAngleEtVitesse("+(key as MIObjetGraphique).getGraphique().id+".getObjet(),"+
							 (panel_opt.getDicoMvt()[key] as Array)[i].angle +","+
							 (panel_opt.getDicoMvt()[key] as Array)[i].vitesse +"); \n";
						
						str+="\t \t \tmon_ecouteur"+m+".ajouterMouvement(mouv"+n+"); \n"; 
						dico["MMouvementPerpetuel"]="import Controleur.MMouvementPerpetuel;";
					}
					else if((panel_opt.getDicoMvt()[key] as Array)[i].mvt == "fini")
					{
						code_mouvement_generer =true;
						str+="\n\t \t \tvar mouv"+n+":MMouvementFini = new MMouvementFini("+(key as MIObjetGraphique).getGraphique().id+".getObjet(),"+
							 (panel_opt.getDicoMvt()[key] as Array)[i].x_arrivee+","+
							 (panel_opt.getDicoMvt()[key] as Array)[i].y_arrivee+","+
							 (panel_opt.getDicoMvt()[key] as Array)[i].temps+
							 "); \n";
						str+="\t \t \tmon_ecouteur"+m+".ajouterMouvement(mouv"+n+"); \n";
						dico["MMouvementFini"]="import Controleur.MMouvementFini;";
					}
					else if((panel_opt.getDicoMvt()[key] as Array)[i].mvt == "redimensionnement")
					{
						code_mouvement_generer =true;
						str+="\n\t \t \tvar mouv"+n+":MRedimensionnement = new MRedimensionnement("+(key as MIObjetGraphique).getGraphique().id+".getObjet(),"+
							 (panel_opt.getDicoMvt()[key] as Array)[i].largeur_finale+","+
							 (panel_opt.getDicoMvt()[key] as Array)[i].hauteur_finale+","+
							 (panel_opt.getDicoMvt()[key] as Array)[i].temps+
							 "); \n";
						str+="\t \t \tmon_ecouteur"+m+".ajouterMouvement(mouv"+n+"); \n"; 
						dico["MRedimensionnement"]="import Controleur.MRedimensionnement;";
					}
					else if((panel_opt.getDicoMvt()[key] as Array)[i].mvt == "circulaire_fini")
					{
						code_mouvement_generer =true;
						str+="\n\t \t \tvar mouv"+n+":MMouvementCirculaireFini = new MMouvementCirculaireFini("+(key as MIObjetGraphique).getGraphique().id+".getObjet(),"+
							 "new MCoordonnee("+(panel_opt.getDicoMvt()[key] as Array)[i].centre_x+","+
							 (panel_opt.getDicoMvt()[key] as Array)[i].centre_y+"),"+
							 (panel_opt.getDicoMvt()[key] as Array)[i].angle+","+
							 (panel_opt.getDicoMvt()[key] as Array)[i].temps+
							 "); \n";
						str+="\t \t \tmon_ecouteur"+m+".ajouterMouvement(mouv"+n+"); \n"; 
						dico["MMouvementCirculaireFini"]="import Controleur.MMouvementCirculaireFini;";
						dico["MCoordonnee"] = "import Utilitaires.MCoordonnee;";
					}
					else if((panel_opt.getDicoMvt()[key] as Array)[i].mvt == "circulaire_perpet")
					{
						code_mouvement_generer =true;
						str+="\n\t \t \tvar mouv"+n+":MMouvementCirculairePerpetuel = new MMouvementCirculairePerpetuel("+(key as MIObjetGraphique).getGraphique().id+".getObjet(),"+
							 "new MCoordonnee("+(panel_opt.getDicoMvt()[key] as Array)[i].centre_x+","+
							 (panel_opt.getDicoMvt()[key] as Array)[i].centre_y+"),"+
							 (panel_opt.getDicoMvt()[key] as Array)[i].tour_par_sec+
							 "); \n";
						str+="\t \t \tmon_ecouteur"+m+".ajouterMouvement(mouv"+n+"); \n"; 
						dico["MMouvementCirculairePerpetuel"]="import Controleur.MMouvementCirculairePerpetuel;";
						dico["MCoordonnee"] = "import Utilitaires.MCoordonnee;";
					}
					else if((panel_opt.getDicoMvt()[key] as Array)[i].mvt == "rotation_perpet")
					{
						code_mouvement_generer =true;
						str+="\n\t \t \tvar mouv"+n+":MRotationPerpetuelle = new MRotationPerpetuelle("+(key as MIObjetGraphique).getGraphique().id+".getObjet(),"+
							 "new MCoordonnee("+(panel_opt.getDicoMvt()[key] as Array)[i].centre_x+","+
							 (panel_opt.getDicoMvt()[key] as Array)[i].centre_y+"),"+
							 (panel_opt.getDicoMvt()[key] as Array)[i].tour_par_sec+
							 "); \n";
						str+="\t \t \tmon_ecouteur"+m+".ajouterMouvement(mouv"+n+"); \n"; 
						dico["MRotationPerpetuelle"]="import Controleur.MRotationPerpetuelle;";
						dico["MCoordonnee"] = "import Utilitaires.MCoordonnee;";
					}
					else if((panel_opt.getDicoMvt()[key] as Array)[i].mvt == "clavier")
					{
						clavier = true;
						dico["Clavier"]="import Controleur.MClavier;";
						str +="// Mise en place de l'écouteur clavier \n"+
						      "\t \t \tvar ecouteur_clavier:MonEcouteurClavier=new MonEcouteurClavier("+(key as MIObjetGraphique).getGraphique().id+"); \n"+
							  "\t \t \tMClavier.getInstance().ajouterEcouteur(ecouteur_clavier); \n";
							  // faire tableau d'objet et setter l'objet courant
					}
					else if((panel_opt.getDicoMvt()[key] as Array)[i].mvt == "souris")
					{
						souris = true;
						dico["Souris"]="import Controleur.MSouris;";
						str +="\n // Mise en place de l'écouteur souris \n"+
						      "\t \t \tvar ecouteur_souris:MonEcouteurSouris=new MonEcouteurSouris("+(key as MIObjetGraphique).getGraphique().id+"); \n"+
							  "\t \t \tMSouris.getInstance().ajouterEcouteur(ecouteur_souris); \n";
							  // faire tableau d'objet et setter l'objet courant
					}
					n++;
				}	
				if(s!="souris" && s!="clavier")
				{
					str+="\t \t \t"+(key as MIObjetGraphique).getGraphique().id+".ajouterEcouteur(mon_ecouteur"+m+"); \n";
				}
				
				m++;
			}
			str+="\t \t} \n";
			dico["init"] = str;
		}
		
		
		// fonction generant la classe d'ecouteur : 
		public function genererClasseEcouteur():String
		{
			var str:String = "";
			str+="package \n"+
				 "{ \n"+
				 "\t import Graphique.MIObjetGraphiqueEcouteur; \n" +
				 "\t import Utilitaires.MAxe; \n"+
				 "\t import Graphique.MIObjetGraphique; \n"+
				 "\t import Controleur.MIEffet; \n"+
				 "\n \n" +
				 "\t public class MonEcouteur implements MIObjetGraphiqueEcouteur \n"+
				 "\t { \n "+
				 "\t \t private var tab_mvt:Array; \n \n"+
				 "\t \t public function MonEcouteur() \n"+
				 "\t \t { \n" + 
				 "\t \t \t tab_mvt = new Array(); \n"+
				 "\t \t } \n \n"+
				 "\t \t // Fonctions de l'interface MIObjetGraphiqueEcouteur à réimplémenter : \n"+
				 "\t \t public function graphiqueSeDessine(graphique:MIObjetGraphique):void \n"+
				 "\t \t { \n"+
				 "\t \t } \n \n"+
				 "\t \t public function graphiqueMeurt(graphique:MIObjetGraphique):void \n"+
				 "\t \t { \n"+
				 "\t \t } \n \n"+
				 "\t \t public function graphiqueCollision(graphique:MIObjetGraphique, axe:MAxe):void \n"+
				 "\t \t { \n"+
				 "\t \t } \n \n"+
				 "\t \t public function graphiqueSeDeplace(graphique:MIObjetGraphique):void \n"+
				 "\t \t { \n"+
				 "\t \t } \n \n"+
				 "\t \t public function graphiqueChangeTaille(objet:MIObjetGraphique):void \n"+
				 "\t \t { \n"+
				 "\t \t } \n \n"+
				 "\t \t public function debutDuJeuGraphique(graphique:MIObjetGraphique):void \n"+
				 "\t \t { \n"+
				 "\t \t } \n \n"+
				 "\t \t public function finDuJeuGraphique(graphique:MIObjetGraphique):void \n"+
				 "\t \t { \n"+
				 "\t \t } \n \n"+
				 "\t \t public function ajouterMouvement(m:MIEffet):void \n"+
				 "\t \t { \n"+
				 "\t \t \t tab_mvt.push(m); \n"+
				 "\t \t } \n \n"+
				 "\t } \n"+ 	 
				 "}";
			return str;
		}
		
		
		// generation de la classe qui implemente MIEcouteurClavier :
		public function genererClasseEcouteurClavier():String
		{
			var str:String = "";
			str+="package \n"+
				 "{ \n"+
				 "\timport Controleur.MClavier; \n"+
				 "\timport Controleur.MIEcouteurClavier; \n"+
				 "\timport Graphique.MIObjetGraphique; \n"+
				 "\n \n" +
				 "\t public class MonEcouteurClavier implements MIEcouteurClavier \n"+
				 "\t { \n" + 
				 "\t \t private var objet:MIObjetGraphique; \n"+
				 "\t \t public function MonEcouteurClavier(objet:MIObjetGraphique)\n" + 
				 "\t \t {\n" + 
				 "\t \t \t this.objet=objet; \n"+
				 "\t \t \t //objet.getGraphique().setFocus(); \n"+
				 "\t \t }\n"+
				 "\n \n "+
				 "\t \t public function flecheBas():void \n"+
				 "\t \t { \n" + 
				 "\t \t  \t // code qui doit être executé lorsque la flèche bas est appuyée \n" + 
				 "\t \t } \n" + 
				 "\n" + 
				 "\t \t public function flecheHaut():void \n" + 
				 "\t \t { \n" + 
				 "\t \t \t // code qui doit être executé lorsque la flèche haut est appuyée \n" + 
				 "\t \t } \n" + 
				 "\n"+
				 "\t \t public function flecheGauche():void \n" + 
				 "\t \t { \n" + 
				 "\t \t \t // code qui doit être executé lorsque la flèche gauche est appuyée \n" + 
				 "\t \t } \n" + 
				 "\n"+
				 "\t \t public function flecheDroite():void \n" + 
				 "\t \t { \n" + 
				 "\t \t  \t // code qui doit être executé lorsque la flèche droite est appuyée \n" + 
				 "\t \t } \n" + 
				 "\n"+
				 "\t \t public function entree():void \n" + 
				 "\t \t { \n" + 
				 "\t \t  \t // code qui doit être executé lorsque la touche Entrée est appuyée \n" + 
				 "\t \t } \n" + 
				 "\n"+
				 "\t \t public function espace():void \n" + 
				 "\t \t { \n" + 
				 "\t \t  \t // code qui doit être executé lorsque la touche espace est appuyée \n" +
				 "\t \t } \n" +
				 "\n"+
				  "\t \t public function touche(touche:uint):void \n" + 
				 "\t \t { \n" + 
				 "\t \t  \t // fonction appelée lorsque l'utilisateur appuie une touche autre que celles repérées param touche: code de la touche appuyée \n"+ 
				 "\t \t } \n" +
				 "\n"+
				 "\t } \n";
			str+="}";
			return str;
		}


		// fonction permettant de gerer le controle de la souris : 
		public function genererCodeEcouteurSouris():String
		{
			var str:String = "";
			str+="package \n"+
				 "{ \n"+
				 "\timport Controleur.MSouris; \n"+
				 "\timport Controleur.MIEcouteurSouris \n"+
				 "\timport Graphique.MIObjetGraphique; \n"+
				 "\n \n" +
				 "\t public class MonEcouteurSouris implements MIEcouteurSouris \n"+
				 "\t { \n"+
				 "\t \t private var objet:MIObjetGraphique; \n"+
				 "\t \t public function MonEcouteurSouris(objet:MIObjetGraphique)\n" + 
				 "\t \t {\n"+
				 "\t \t \t this.objet = objet; \n"+
				 "\t \t }\n"+
				 "\n"+
				 "\t \t public function bougeGauche():void \n" + 
				 "\t \t { \n" + 
				 "\t \t  \t // code qui doit être executé lorsque la souris se déplace vers la gauche est appuyée \n" +
				 "\t \t } \n" + 
				 "\n"+
				 "\t \t public function bougeDroite():void \n" + 
				 "\t \t { \n" + 
				 "\t \t  \t // code qui doit être executé lorsque la souris se déplace vers la droite est appuyée \n"+ 
				 "\t \t } \n" + 
				 "\n"+
				 "\t \t public function bougeHaut():void \n" + 
				 "\t \t { \n" + 
				 "\t \t  \t // code qui doit être executé lorsque la souris se déplace vers la haut est appuyée \n"+ 
				 "\t \t } \n" + 
				 "\n"+
				 "\t \t public function bougeBas():void \n" + 
				 "\t \t { \n" + 
				 "\t \t  \t // code qui doit être executé lorsque la souris se déplace vers la bas est appuyée \n" + 
				 "\t \t } \n" + 
				 "\n"+
				 "\t \t public function clic():void \n" + 
				 "\t \t { \n" + 
				 "\t \t  \t // code qui doit être executé lorsque la souris est cliqué \n" + 
				 "\t \t } \n" + 
				  "\n"+
				 "\t \t public function doubleClic():void \n" + 
				 "\t \t { \n" + 
				 "\t \t  \t // code qui doit être executé lorsque la souris est double-cliqué \n" + 
				 "\t \t } \n" + 
				 "\t } \n"+
				 "}";
				 return str;
		}
		
		// fonction permettant de transformer un uint en hexadecimal :
		public static function uint2hex(dec:uint):String 
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