package Graphique {
	import Coeur.MIObjetEcouteur;
	import mx.core.UIComponent;
	import Coeur.MIObjet;
	import Graphique.Textures.MITexture;
	import Coeur.MElement;
	import Graphique.Textures.MCouleur;
	import mx.controls.Text;
	import Coeur.Forme.MIForme;
	import flash.events.TimerEvent;
	import Graphique.Textures.MBordure;
	import Utilitaires.MErreur;
	import mx.olap.aggregators.MaxAggregator;
	import Utilitaires.MAxe;
	import Coeur.Elements.MTireurMouvementPerpetuel;
	import Utilitaires.MUtilitaire;
	
	/**
	 * Classe abstraite gérant les comportements généraux des <u>MIObjetGraphique</u>.
	 * <p>Représente le plus haut élément graphique de notre framework, tous les autres sont des sous-classes.<br /> 
	 * Cette classe permet de gérer :
	 * <li> l'objet MIObjet du code métier (package Coeur) </li>
	 * <li> la forme MIForme (package Coeur.Forme)</li>
	 * <li> les déplacements du graphique vers le coeur et vice versa</li>
	 * <li> les redimensionnements du graphique vers le coeur et vice versa</li>
	 * <li> les textures MITexture (package Graphique.Texture) </li>
	 * <li> la bordure MITexture (package Graphique.Texture) </li>
	 * </p>
	 * <p>Enfin elle se charge des écouteurs MIObjetGraphiqueEcouteur en appellant les fire apropriés.</p>
	 * <p>Atention ! Si vous réimplentez cette classe vous ne devez surtout pas écouter un objet model. Vous devez utiliser setObjet pour positionner votre objet personnalisé.</p>
	 * @see MIObjetGraphique
	 * @see MIObjetGraphiqueEcouteur
	 * @see Coeur.MIObjet
	 * @see Coeur.Forme.MIForme
	 * @see Graphique.Textures.MITexture
	 */ 
	public class MGraphiqueAbstrait extends UIComponent implements MIObjetEcouteur {
		/**
		 * Représente this sous forme d'un MIObjetGraphique. Permet de rendre la classe Abstraite.
		 */
		private var sous_classe:MIObjetGraphique;
		/**
		 * L'objet du code métier que représente cet objet graphique.
		 * @see MGraphiqueAbstrait#getObjet()
		 * @see MGraphiqueAbstrait#setObjet()
		 */
		protected var objet:MIObjet;
		/**
		 * La forme de cet objet graphique. Doit être instanciée dans les sous-classes.
		 */
		protected var forme:MIForme;
		/**
		 * La texture de cet objet graphique.
		 * <p>Un objet peut avoir plusieurs textures en même temps, il suffit pour cela d'utiliser ajouterTexture().</p>
		 * @see MGraphiqueAbstrait#getTexture()
		 * @see MGraphiqueAbstrait#setTexture()
		 * @see MGraphiqueAbstrait#texture
		 * @see MGraphiqueAbstrait#ajouterTexture()
		 */
		protected var ma_texture:MITexture;
		/**
		 * La bordure de cet objet graphique.
		 * <p>Un objet peut avoir plusieurs bordures en même temps, il suffit pour cela d'utiliser ajouterBordure().</p>
		 * @see MGraphiqueAbstrait#getBordure()
		 * @see MGraphiqueAbstrait#setBordure()
		 * @see MGraphiqueAbstrait#bordure
		 * @see MGraphiqueAbstrait#ajouterBordure()
		 */
		protected var ma_bordure:MBordure;
		/**
		 * Le nom de cette classe, est égale à "MGraphiqueAbstrait".
		 * @see MIObjetGraphique#getNomClasse()
		 */
		protected var nom_classe:String;
		/**
		 * Les écouteurs de la classe.
		 * <p>Ceux-ci sont prévenues lorsque l'objet :
		 * <li> se dessine, graphiqueSeDessine() </li>
		 * <li> meurt, graphiqueMeurt() </li>
		 * <li> collisionne, graphiqueCollision() </li>
		 * <li> se déplace, graphiqueSeDeplace() </li>
		 * <li> se redimenssionne, graphiqueChangeTaille() </li>
		 * <li> est prévenue que le jeu débute, debutDuJeu() </li>
		 * <li> est prévenue que le jeu se termine, finDuJeu() </li>
		 * </p>
		 * @see MIObjetGraphiqueEcouteur
		 * @see MGraphiqueAbstrait#ajouterEcouteur()
		 * @see MGraphiqueAbstrait#fireSeDessine()
		 * @see MGraphiqueAbstrait#fireMeurt()
		 * @see MGraphiqueAbstrait#fireCollision()
		 * @see MGraphiqueAbstrait#fireDeplacement()
		 * @see MGraphiqueAbstrait#fireChangementTaille()
		 * @see MGraphiqueAbstrait#fireDebutDuJeu()
		 * @see MGraphiqueAbstrait#fireFinDuJeu()
		 */
		protected var ecouteurs:Array = new Array();
		
		/**
		 * @private
		 */
		public var sysout:Text;
		
		/**
		 * Constructeur de la classe.
		 * <p>Cette classe étant abstraite il ne peut pas être appelé directement mais par une sous-classe. 
		 * Elle instancie dans cet ordre les attributs suivants :
		 * <li> objet = MElement et s'ajoute dans la liste de ses écouteurs </li>
		 * <li> forme = null !! Doit être instancié absolument dans la sous-classe </li>
		 * <li> ma_texture en tant que MCouleur </li>
		 * <li> ma_bordure = null </li>
		 * <li> sous_classe = this casté en MIObjetGraphique </li>
		 * </p>
		 * @throws Utilitaires.MErreur générée si le cast de this en MIObjetGraphique n'a pas marché.
		 * @see Coeur.MElement
		 * @see Graphique.Textures.MCouleur
		 * @see Graphique.MIObjetGraphique
		 */
		public function MGraphiqueAbstrait() {
			objet = new MElement();
			objet.ajoutObjetEcouteur(this);
			forme = null;
			ma_texture = new MCouleur();
			ma_bordure = null;
			nom_classe = "MGraphiqueAbstrait";
			sous_classe = MIObjetGraphique(this);
			if(sous_classe == null) {
				throw new MErreur(this.nom_classe, "Constructeur", "Les classes qui étendent MGraphiqueAbstrait doivent implementer MIObjetGraphique");
			}
		}
		
		/**
		 * Permet d'ajouter un écouteur à cet objet graphique.
		 * <p>Celui-ci sera prévenue lorsque l'objet :
		 * <li> se dessine, graphiqueSeDessine() </li>
		 * <li> meurt, graphiqueMeurt() </li>
		 * <li> collisionne, graphiqueCollision() </li>
		 * <li> se déplace, graphiqueSeDeplace() </li>
		 * <li> se redimenssionne, graphiqueChangeTaille() </li>
		 * <li> est prévenue que le jeu débute, debutDuJeu() </li>
		 * <li> est prévenue que le jeu se termine, finDuJeu() </li>
		 * </p>
		 * @see MIObjetGraphiqueEcouteur
		 * @see MGraphiqueAbstrait#ajouterEcouteur()
		 * @see MGraphiqueAbstrait#fireSeDessine()
		 * @see MGraphiqueAbstrait#fireMeurt()
		 * @see MGraphiqueAbstrait#fireCollision()
		 * @see MGraphiqueAbstrait#fireDeplacement()
		 * @see MGraphiqueAbstrait#fireChangementTaille()
		 * @see MGraphiqueAbstrait#fireDebutDuJeu()
		 * @see MGraphiqueAbstrait#fireFinDuJeu()
		 */
		public function ajouterEcouteur(ecouteur:MIObjetGraphiqueEcouteur):void {
			ecouteurs.push(ecouteur);
		}
		
		/**
		 * Permet de supprimer un écouteur de cet objet graphique.
		 * @param ecouteur l'écouteur à enlever de la liste des écouteurs de cet objet graphique.
		 * @see MIObjetGraphiqueEcouteur
		 * @see MGraphiqueAbstrait#ecouteurs
		 * @see MGraphiqueAbstrait#ajouterEcouteur()
		 */
		public function supprimerEcouteur(ecouteur:MIObjetGraphiqueEcouteur):void {
			var temp:Array = MUtilitaire.enlever(ecouteurs,ecouteur);
			ecouteurs = temp;
		}
		
		/**
		 * Prévient les écouteurs que cet objet graphique se déssine.
		 * @see MGraphiqueAbstrait#ecouteurs
		 */
		public function fireSeDessine():void {
			for(var i:int=0; i<ecouteurs.length; i++) {
				(ecouteurs[i] as MIObjetGraphiqueEcouteur).graphiqueSeDessine(sous_classe);
			}
		}
		
		/**
		 * Prévient les écouteurs que cet objet graphique meurt, donc disparait visuellement
		 * @see MGraphiqueAbstrait#ecouteurs
		 */
		public function fireMeurt():void {
			for(var i:int=0; i<ecouteurs.length; i++) {
				(ecouteurs[i] as MIObjetGraphiqueEcouteur).graphiqueMeurt(sous_classe);
			}
		}
		
		/**
		 * Prévient les écouteurs que cet objet graphique collisionne avec un autre objet.
		 * @param axe l'axe suivant lequel l'objet vient collisionner l'autre objet
		 * @see MGraphiqueAbstrait#ecouteurs
		 */
		public function fireCollision(objet:MIObjet, axe:MAxe):void {
			for(var i:int=0; i<ecouteurs.length; i++) {
				(ecouteurs[i] as MIObjetGraphiqueEcouteur).graphiqueCollision(objet, axe);
			}
		}
		
		/**
		 * Prévient les écouteurs que cet objet graphique se déplace.
		 * @see MGraphiqueAbstrait#ecouteurs
		 */
		public function fireDeplacement():void {
			for(var i:int=0; i<ecouteurs.length; i++) {
				(ecouteurs[i] as MIObjetGraphiqueEcouteur).graphiqueSeDeplace(sous_classe);
			}
		}
		
		/**
		 * Prévient les écouteurs que cet objet graphique se redimenssionne.
		 * @see MGraphiqueAbstrait#ecouteurs
		 */
		public function fireChangementTaille():void {
			for(var i:int=0; i<ecouteurs.length; i++) {
				(ecouteurs[i] as MIObjetGraphiqueEcouteur).graphiqueChangeTaille(sous_classe);
			}
		}
		
		/**
		 * Prévient les écouteurs que cet objet graphique a été prévenue du début du jeu.
		 * @see MGraphiqueAbstrait#ecouteurs
		 */
		public function fireDebutDuJeu():void {
			for(var i:int=0; i<ecouteurs.length; i++) {
				(ecouteurs[i] as MIObjetGraphiqueEcouteur).debutDuJeuGraphique(sous_classe);
			}
		}
		
		/**
		 * Prévient les écouteurs que cet objet graphique a été prévenue de la fin du jeu.
		 * @see MGraphiqueAbstrait#ecouteurs
		 */
		public function fireFinDuJeu():void {
			for(var i:int=0; i<ecouteurs.length; i++) {
				(ecouteurs[i] as MIObjetGraphiqueEcouteur).finDuJeuGraphique(sous_classe);
			}
		}
		
		/**
		 * Retourne la forme de cet objet graphique.
		 * @return la forme de cet objet graphique
		 * @see Coeur.Forme.MIForme
		 */
		public function getForme():MIForme {
			return forme;
		}
		
		/**
		 * Retourne l'objet model que représente cet objet graphique.
		 * @return l'objet model de cet objet graphique
		 * @see Coeur.MIObjet
		 */
		public function getObjet():MIObjet {
			return objet;
		}
		
		/**
		 * Permet de faire "mourir" cet objet graphique.
		 * <p>Autrement dit cela permet de retirer cet objet du visuel, et donc l'objet du model de la scene model.</p>
		 * @see Coeur.MIObjet#mourir()
		 */
		public function mourir():void {
			objet.mourir();
		}
		
		/**
		 * Retourne sous la forme d'un UIComponent cet objet graphique.
		 * @return cet objet graphique sous forme d'UIComponent
		 */
		public function getGraphique():UIComponent {
			return this;
		}
		
		/**
		 * Permet de positionner un nouvel objet model pour cet objet graphique.
		 * <p>Cet objet graphique se positionne en tant qu'écouteur de ce nouvel objet model. 
		 * De plus on appel les fonctions deplacementObjet() et changementTaille() afin que l'objet graphique se redessine correctement.</p>
		 * <p>Si cet objet graphique avait un model alors on se supprime de ça liste de ses écouteurs.</p>
		 * <p>Enfin on repositionne la forme de l'objet à la forme de cet objet graphique, afin de ne pas pouvoir se retrouver avec un rond dans un MGraphiqueRectangle, par exemple.</p>
		 * @param objet le nouvel objet model
		 * @see Coeur.MIObjet
		 * @see Coeur.MIObjet#supprimerObjetEcouteur()
		 * @see Coeur.MIObjet#ajoutObjetEcouteur()
		 * @see Coeur.MIObjet#setForme()
		 * @see MGraphiqueAbstrait#changementTaille()
		 * @see MGraphiqueAbstrait#deplacementObjet()
		 */
		public function setObjet(objet:MIObjet):void {
			if(this.objet != null) {
				this.objet.supprimeObjetEcouteur(this);
			}
			this.objet = objet;
			this.objet.ajoutObjetEcouteur(this);
			this.objet.setForme(forme);
			changementTaille(objet);
			deplacementObjet(objet);
		}
		
		/**
		 * Permet de positionner une nouvelle texture à cet objet graphique.
		 * <p>Fonction permettant d'utiliser le moyen "traditionnel" mais en réalité fait appel à la fonction set texture().</p>
		 * @param t la nouvelle texture de cet objet graphique
		 * @see MGraphiqueAbstrait#texture
		 * @see MGraphiqueAbstrait#bordure
		 */
		public function setTexture(t:MITexture):void {
			texture = t;
		}
		
		/**
		 * Retourne la texture cet objet graphique.
		 * <p>Fonction permettant d'utiliser le moyen "traditionnel" mais en réalité fait appel à la fonction get texture().</p>
		 * @return la texture de cet objet graphique
		 * @see MGraphiqueAbstrait#texture
		 */
		public function getTexture():MITexture {
			return ma_texture;
		}
		
		/**
		 * Permet de positionner une nouvelle texture à cet objet graphique.
		 * <p>Positionne l'objet de la texture à sous_classe qui est en réalité cette classe caster en MIObjetGraphique, avant d'appeler redessiner() pour redessiner cet objet graphique.</p>
		 * <p>Pourrait permettre d'ajouter une bordure puisque celle-ci est aussi une MITexture mais il est conseillé d'utiliser set bordure().</p>
		 * @param texture la nouvelle texture de cet objet graphique
		 * @see Graphique.Textures.MITexture
		 * @see Graphique.Textures.MITexture#setObjetADessiner()
		 * @see MGraphiqueAbstrait#redessiner()
		 */
		public function set texture(texture:MITexture):void {
			ma_texture = texture;
			if(ma_texture != null) {
				ma_texture.setObjetADessiner(sous_classe);
			}
			redessiner();
		}
		
		/**
		 * Retourne la texture cet objet graphique.
		 * @return la texture de cet objet graphique
		 * @see Graphique.Textures.MITexture
		 */
		public function get texture():MITexture {
			return ma_texture;
		}
		
		/**
		 * Permet d'ajouter une nouvelle texture à la texture de cet objet.
		 * <p>Si la texture était nul alors elle devient la nouvelle texture.</p>
		 * <p>Sinon, on ajoute, par le biai d'un pattern décorator, la texture à l'ancienne texture. Puis on se positionne comme l'objet a dessiner de cette nouvelle texture. Finalement on redessine l'objet en appelant la fonction redessiner().</p>
		 * <p>Pourrait permettre d'ajouter une bordure puisque celle-ci est aussi une MITexture mais il est conseillé d'utiliser ajouterBordure().</p>
		 * @param texture la nouvelle texture à ajouter à l'ancienne
		 * @see MGraphiqueAbstrait#texture
		 * @see Graphique.Textures.MITexture#setADecorer()
		 * @see Graphique.Textures.MITexture#setObjetADessiner()
		 * @see MGraphiqueAbstrait#redessiner()
		 * @see MGraphiqueAbstrait#ajouterBordure()
		 */
		public function ajouterTexture(texture:MITexture):void {
			if(ma_texture == null) {
				ma_texture = texture;
			}
			else {
				ma_texture = texture.setADecorer(ma_texture);
				ma_texture.setObjetADessiner(sous_classe);
				redessiner();
			}
		}
		
		/**
		 * Permet de positionner une nouvelle bordure à cet objet graphique.
		 * <p>Fonction permettant d'utiliser le moyen "traditionnel" mais en réalité fait appel à la fonction set bordure().</p>
		 * @param b la nouvelle bordure de cet objet graphique
		 * @see MGraphiqueAbstrait#bordure
		 */
		public function setBordure(b:MBordure):void {
			bordure = b;
		}
		
		/**
		 * Retourne la bordure cet objet graphique.
		 * <p>Fonction permettant d'utiliser le moyen "traditionnel" mais en réalité fait appel à la fonction get bordure().</p>
		 * @return la bordure de cet objet graphique
		 * @see MGraphiqueAbstrait#bordure
		 */
		public function getBordure():MBordure {
			return ma_bordure;
		}
		
		/**
		 * Permet de positionner une nouvelle bordure à cet objet graphique.
		 * <p>Positionne l'objet de la bordure à sous_classe qui est en réalité cette classe caster en MIObjetGraphique, avant d'appeler redessiner() pour redessiner cet objet graphique.</p>
		 * @param bordure la nouvelle bordure de cet objet graphique
		 * @see Graphique.Textures.MBordure
		 * @see Graphique.Textures.MBordure#setObjetADessiner()
		 * @see MGraphiqueAbstrait#redessiner()
		 */
		public function set bordure(bordure:MBordure):void {
			ma_bordure = bordure;
			if(ma_bordure != null) {
				ma_bordure.setObjetADessiner(sous_classe);
			}
			redessiner();
		}
		
		/**
		 * Retourne la bordure cet objet graphique.
		 * @return la bordure de cet objet graphique
		 * @see Graphique.Textures.MBordure
		 */
		public function get bordure():MBordure {
			return ma_bordure;
		}
		
		/**
		 * Permet d'ajouter une nouvelle bordure à la bordure de cet objet.
		 * <p>Si la bordure était nul alors elle devient la nouvelle bordure.</p>
		 * <p>Sinon, on ajoute, par le biai d'un pattern décorator, la bordure à l'ancienne bordure. Puis on se positionne comme l'objet a dessiner de cette nouvelle bordure. Finalement on redessine l'objet en appelant la fonction redessiner().</p>
		 * @param bordure la nouvelle bordure à ajouter à l'ancienne
		 * @see MGraphiqueAbstrait#bordure
		 * @see Graphique.Textures.MITexture#setADecorer()
		 * @see Graphique.Textures.MITexture#setObjetADessiner()
		 * @see MGraphiqueAbstrait#redessiner()
		 * @see MGraphiqueAbstrait#ajouterTexture()
		 */
		public function ajouterBordure(bordure:MBordure):void {
			if(ma_bordure == null) {
				ma_bordure = bordure;
			}
			else {
				var bordure_temp:MITexture = bordure.setADecorer(ma_bordure);
				ma_bordure = bordure_temp as MBordure;
				ma_bordure.setObjetADessiner(sous_classe);
				redessiner();
			}
		}
		
		/**
		 * Appelé par l'objet model lorsque celui-ci se déplace.
		 * <p>Cette fonction appelle super.x = x et super.y = y pour se mettre en conformité avec l'API flex.</p>
		 * <p>Puis cet objet graphique met à jours ses coordonnées avant d'appeler fireDeplacement() et pour finalement se redessiner.</p>
		 * @param objet l'objet qui se déplace
		 * @see MGraphiqueAbstrait#objet
		 * @see Coeur.MIObjetEcouteur#deplacementObjet()
		 * @see MGraphiqueAbstrait#x
		 * @see MGraphiqueAbstrait#y
		 * @see MGraphiqueAbstrait#fireDeplacement()
		 * @see MGraphiqueAbstrait#redessiner()
		 */
		public function deplacementObjet(objet:MIObjet):void {
			super.x = objet.getX();
			super.y = objet.getY();
			x = objet.getX();
			y = objet.getY();
			fireDeplacement();
			redessiner();
		}
		
		/**
		 * Appelé par l'objet model lorsque celui-ci se redimenssionne.
		 * <p>Cet objet graphique met à jours sa taille avant d'appeler fireChangementTaille() et pour finalement se redessiner.</p>
		 * @param objet l'objet qui se redimenssionne
		 * @see MGraphiqueAbstrait#objet
		 * @see Coeur.MIObjetEcouteur#changementTaille()
		 * @see MGraphiqueAbstrait#width
		 * @see MGraphiqueAbstrait#height
		 * @see MGraphiqueAbstrait#fireChangementTaille()
		 * @see MGraphiqueAbstrait#redessiner()
		 */
		public function changementTaille(objet:MIObjet):void {
			width = objet.getLargeur();
			height = objet.getHauteur();
			fireChangementTaille();
			redessiner();
		}
		
		/**
		 * Appelée par l'objet du code métier lorsque l'objet model collisionne avec un otre objet model.
		 * <p>Cette fonction ne fait rien d'autre que d'appeler fireCollision().</p>
		 * @param objet l'autre objet collisionné
		 * @param axe l'axe suivant lequel l'objet vient collisionner l'autre objet
		 * @see MGraphiqueAbstrait#objet
		 * @see Coeur.MIObjetEcouteur#objetCollision()
		 * @see MGraphiqueAbstrait#fireCollision()
		 */
		public function objetCollision(objet:MIObjet, axe:MAxe):void {
			fireCollision(objet, axe);
		}
		
		/**
		 * Appelée par l'objet model lorsqu'il meurt, donc lorsque la fonction mourir de celui-ci est appelée.
		 * <p>Cette fonction appel parent.removeChild() afin que cet objet graphique soit enlevé visuellement avant d'appeler fireMeurt pour prévenir ses écouteurs.</p>
		 * @param objet l'objet qui meurt
		 * @see MGraphiqueAbstrait#objet
		 * @see Coeur.MIObjetEcouteur#objetMeurt()
		 * @see MGraphiqueAbstrait#fireMeurt()
		 */
		public function objetMeurt(objet:MIObjet):void {
			if(parent != null)
				parent.removeChild(this);
//			else
//				throw new MErreur("MGraphiqueAbstrait", "objetMeurt", "l'objet"+objet.getNomClasse()+" n'est plus dans la classe");
			fireMeurt();
		}
		
		/**
		 * Appelée par l'objet model lorsque celui-ci nait, autrement dit à la fin de son constructeur.
		 * <p>Cette fonction ne fait rien, elle doit être réimplémentée par une classe fille si celle-ci en a besoins.</p>
		 * @param objet l'objet qui nait
		 * @see MGraphiqueAbstrait#objet
		 * @see Coeur.MIObjetEcouteur#objetNait()
		 */
		public function objetNait(objet:MIObjet):void {
		}
		
		/**
		 * Appelée par l'objet model lorsque le jeu commence.
		 * <p>Le modèle est lui même lancé lorsque le jeu représenté par MJeu est lancé.</p>
		 * <p>Cette fonction ne fait rien d'autre que d'appeler fireDebutDuJeu, elle doit être réimplémentée par une classe fille si celle-ci en a besoins.</p>
		 * @param objet l'objet qui est appelé par MJeu ou la scene du jeu
		 * @see MGraphiqueAbstrait#objet
		 * @see MGraphiqueAbstrait#fireDebutDuJeu()
		 * @see Coeur.MIObjetEcouteur#debutDuJeu()
		 * @see Coeur.MJeu#debut()
		 */
		public function debutDuJeu(objet:MIObjet):void {
			fireDebutDuJeu();
		}
		
		/**
		 * Appelée par l'objet model lorsque le jeu fini.
		 * <p>Le modèle est lui même lancé lorsque le jeu représenté par MJeu est terminé.</p>
		 * <p>Cette fonction ne fait rien d'autre que d'appeler fireFinDuJeu, elle doit être réimplémentée par une classe fille si celle-ci en a besoins.</p>
		 * @param objet l'objet qui est appelé par MJeu ou la scene du jeu
		 * @see MGraphiqueAbstrait#objet
		 * @see MGraphiqueAbstrait#fireFinDuJeu()
		 * @see Coeur.MIObjetEcouteur#finDuJeu()
		 * @see Coeur.MJeu#fin()
		 */
		public function finDuJeu(objet:MIObjet):void {
			fireFinDuJeu();
		}
		
		/**
		 * Permet de postionner la largeur de cet objet graphique.
		 * <p>Fonction équivalente à set width.</p>
		 * <p>Appelle super.width afin de se mettre en conformité avec l'API flex.</p>
		 * <p>Puis si l'objet model à une largeur différente alors on la lui met à jour. Par le biai du mvc la fonction deplacementObjet sera alors appelée.</p>
		 * @param largeur la nouvelle largeur de cet objet graphique
		 * @see MGraphiqueAbstrait#objet
		 * @see Coeur.MIObjet#setLargeur()
		 */
		public function set largeur(largeur:Number):void {
			super.width = largeur;
			if(objet.getLargeur() != largeur) {
				objet.setLargeur(largeur);
			}
		}
		
		/**
		 * Permet de récupérer la largeur de cet objet graphique en passant par l'objet model.
		 * <p>Fonction équivalente à get width.</p>
		 * @return la largeur de l'objet model que représente cet objet graphique
		 * @see MGraphiqueAbstrait#objet
		 * @see Coeur.MIObjet#getLargeur()
		 */
		public function get largeur():Number {
			return objet.getLargeur();
		}
		
		/**
		 * Permet de postionner la hauteur de cet objet graphique.
		 * <p>Fonction équivalente à set height.</p>
		 * <p>Appelle super.height afin de se mettre en conformité avec l'API flex.</p>
		 * <p>Puis si l'objet model à une hauteur différente alors on la lui met à jour. Par le biai du mvc la fonction changementTaille sera alors appelée.</p>
		 * @param hauteur la nouvelle hauteur de cet objet graphique
		 * @see MGraphiqueAbstrait#objet
		 * @see Coeur.MIObjet#setHauteur()
		 */
		public function set hauteur(hauteur:Number):void {
			super.height = hauteur;
			if(objet.getHauteur() != hauteur) {
				objet.setHauteur(hauteur);
			}
		}
		
		/**
		 * Permet de récupérer la hauteur de cet objet graphique en passant par l'objet model.
		 * <p>Fonction équivalente à get height.</p>
		 * @return la hauteur de l'objet model que représente cet objet graphique
		 * @see MGraphiqueAbstrait#objet
		 * @see Coeur.MIObjet#getLargeur()
		 */
		public function get hauteur():Number {
			return objet.getHauteur();
		}
		
		/**
		 * Permet de positionner la coordoonée x de cet objet graphique.
		 * <p>Puis met à jour la coordoonée x de l'objet model que représente cet objet graphique. Par le biai du MVC cet objet graphique sera bien redessiner.</p>
		 * @param x la nouvelle coordoonée x de cet objet graphique
		 * @see Coeur.MIObjet#setX()
		 * @see MGraphiqueAbstrait#objet
		 */
		override public function set x(x:Number):void {
			if(objet.getX() != x) {
				objet.setX(x);
			}
		}
		
		/**
		 * Permet de positionner la coordoonée y de cet objet graphique.
		 * <p>Puis met à jour la coordoonée y de l'objet model que représente cet objet graphique. Par le biai du MVC cet objet graphique sera bien redessiner.</p>
		 * @param y la nouvelle coordoonée y de cet objet graphique
		 * @see Coeur.MIObjet#setY()
		 * @see MGraphiqueAbstrait#objet
		 */
		override public function set y(y:Number):void {
			if(objet.getY() != y) {
				objet.setY(y);
			}
		}
		
		/**
		 * Permet de positionner la largeur de cet objet graphique.
		 * <p>Cette fonction appelle super.width = width pour se mettre en conformité avec l'API flex.</p>
		 * <p>Puis met à jour la largeur de l'objet model que représente cet objet graphique. Par le biai du MVC cet objet graphique sera bien redessiner.</p>
		 * @param width la nouvelle largeur de cet objet graphique
		 * @see Coeur.MIObjet#setLargeur()
		 * @see MGraphiqueAbstrait#objet
		 */
		override public function set width(width:Number):void {
			super.width = width;
			if(objet.getLargeur() != width) {
				objet.setLargeur(width);
			}
		}
		
		/**
		 * Permet de positionner la hauteur de cet objet graphique.
		 * <p>Cette fonction appelle super.height = height pour se mettre en conformité avec l'API flex.</p>
		 * <p>Puis met à jour la hauteur de l'objet model que représente cet objet graphique. Par le biai du MVC cet objet graphique sera bien redessiner.</p>
		 * @param height la nouvelle hauteur de cet objet graphique
		 * @see Coeur.MIObjet#setHauteur()
		 * @see MGraphiqueAbstrait#objet
		 */
		override public function set height(height:Number):void {
			super.height = height;
			if(objet.getHauteur() != height) {
				objet.setHauteur(height);
			}
		}
		
		/**
		 * Fonction appelée par l'API flex à chaque fois que cet objet graphique doit se dessiner.
		 * <p>Cette fonction appelle super.updateDisplayList pour se mettre en conformité avec l'API flex.</p>
		 * <p>Puis appelle fireSeDessine pour prévenir les écouteurs que cet objet graphique se déssine.</p>
		 * <p>Finalement cette fonction appelle dessiner().</p>
		 * @param unscaledWidth la largeur de cet objet graphique sans tenir compte du scaleX
		 * @param unscaledHeight la hauteur de cet objet graphique sans tenir compte du scaleY
		 * @see MGraphiqueAbstrait#fireSeDessine()
		 * @see MGraphiqueAbstrait#dessiner()
		 */
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			fireSeDessine();
			dessiner();
		}
		
		/**
		 * Fonction qui dessine cet objet graphique.
		 * <p>Cette fonction devrait être abstraite, mais ActionScript3.5 ne le permet pas. 
		 * Son corps est donc vide, mais puisque les sous-classes de MGraphiqueAbstrait doivent implémentées MIObjetGraphique, cette fonction sera obligatoirement implémentée dans les classes-filles.</p>
		 * @see MIObjetGraphique#dessiner()
		 */
		protected function dessiner():void {}
		
		/**
		 * Redessine cet objet graphique.
		 * <p>Peut être appelée avec aucun paramètre pour qu'il se redessine tout de suite. 
		 * Ou peu être appelée régulièrement avec un timer.</p>
		 * <p>Cette fonction appelle invelidateDisplayList() pour redessiner l'objet en conformité avec l'API flex.</p>
		 * @param e l'évennement généré par un timer de l'API flex, ne sert à rien ici 
		 * @see MGraphiqueAbstrait#invalidateDisplayList()
		 */
		public function redessiner(e:TimerEvent=null):void {
			invalidateDisplayList();
		}
		
		/**
		 * Permet d'obtenir un clone de cet objet graphique.
		 * <p>Cette fonction devrait être abstraite, mais ActionScript3.5 ne le permet pas. 
		 * Elle retourne donc null, mais puisque les sous-classes de MGraphiqueAbstrait doivent implémentées MIObjetGraphique, cette fonction sera obligatoirement implémentée dans les classes-filles.</p>
		 * @return un clone de cet objet graphique.
		 * @see MIObjetGraphique#clone()
		 */		
		public function clone():MIObjetGraphique {
			return null;
		}
		
		/**
		 * Permet d'obtenir le nom de cette classes sous forme d'un String.
		 * @return le nom de cette classe soit "MGraphiqueAbstrait"
		 */
		public function getNomClasse():String {
			return nom_classe;
		}

	}
}