package Coeur.Forme
{
	import Utilitaires.*;
	
	public interface MIForme
	{
		//nom:
		function getNomClasse():String;
		
		//coordonnées:
		function setX(x:Number):void;
		function getX():Number;
		function setY(y:Number):void;
		function getY():Number;
		function deplacement(x:Number, y:Number):void;
		function deplacementCirculaire(centre:MCoordonnee, angle_degre:Number):void;
		function calculMinX():Number;
		function calculMinY():Number;
		function calculMaxX():Number;
		function calculMaxY():Number;
		
		//taille: 
		function getLargeur():Number;
		function setHauteur(hauteur:Number):void;
		function getHauteur():Number;
		function setLargeur(largeur:Number):void;
		function getAire():Number;
		function getPerimetre():Number;
				
		function affiche():void;
		
		//collision:
 		/**
 		 * retourne l'axe selon lequel collisionne la forme receveur et la forme passée en paramètre ou null si elles ne collisionnent pas
 		 * <p> cette fonction utilise la méthode des axes séparateurs pour detecter la collision</p>
 		 * @param forme2: forme pour laquelle on cherche l'axe de collision
 		 * @return axe selon laquelle a lieu la collision entre la forme receveur et celle passée en paramètre ou null s'il n'y a pas collision
 		 */	
 		function axeCollision(forme:MIForme):MAxe;
 		/**
		 * renvoie dans un tableau les axes séparateurs potentiels entre la forme receveur et celle passée en paramètre
		 * @param vecteur: forme dont on cherche les axes qui la sépare de la forme receveur
		 * @return un tableau contenant les axes séparateur potentiels entre la forme receveur et celle passée en paramètre
		 */
		function getAxesSeparateurs(obj:MIForme):Array;
		/**
		 * renvoie dans un tableau la valeurs minimale et la valeur maximale de la projection de la forme receveur sur le vecteur passé en paramètre
		 * @param vecteur: vecteur sur lequel on veut projeter la forme
		 * @return un tableau contenant la valeur minimale de projection à l'indice 0 et la valeur maximale de projection à l'indice 1
		 */
 		function seProjeteSur(vecteur:MVecteur):Array;
		/**
		 * renvoie dans un tableau les points à projeter pour effectuer la projection de la forme receveur sur le vecteur passé en paramètre
		 * @param vecteur: vecteur sur lequel on veut projeter la forme
		 * @return un tableau contenant les points à projeter pour effectuer la projection de la forme receveur sur le vecteur passé en paramètre
		 */
 		function getPointsProjection(vect:MVecteur):Array;
 		/**
		 * renvoie dans un tableau les points particuliers d'une forme, pour les polygones les sommets, pour les cercles le centre...
		 * <p> utiliser dans getAxesSeparateurs pour les cercles et points pour créer les axes entre leur point particuliers et ceux de la forme qu'il collisionne </p>
		 * @see Coeur.Forme.MFormeRond.getAxesSeparateurs
		 * @see Coeur.Forme.MFormePoint.getAxesSeparateurs
		 * @return un tableau contenant les points particuliers d'une forme, pour les polygones les sommets, pour les cercles le centre...
		 */
 		function getPointsParticuliers():Array;
		
		function clone():MIForme;
		
		function getDecalage():MCoordonneePositive;
		function setDecalage(decalage:MCoordonneePositive):void;
	
	}
}