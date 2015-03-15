# Introduction #

AsDoc est une copie plus ou moins cachée de la JavaDoc. Par contre pour faire compiler la doc c'est bien plus compliqué !!
Je ferais ici un résumé de tout ce que j'ai pu glaner sur le net !!
Par contre je le fais pour Linux les windowien devront s'arranger (ça doit pas être bien différent) !!

# Préparation de la compilation #

Le plus simple apparament, est de créer 2 fichiers XML l'un pour le squelette générale de la doc générée l'autr epour savoir quoi générer.

## Configuration du squelette ##

Il suffit de créer un fichier xml du type :

```
<?xml version="1.0" encoding="utf-8"?>
<flex-config>
	<compiler>
		<source-path>
			<path-element>./</path-element>
		</source-path>
		<namespaces>
			<namespace>
				<uri>TER</uri>
				<manifest>asdoc-manifest.xml</manifest>
			</namespace>
		</namespaces>
	</compiler>
	<main-title>Framework MUS-D</main-title>
	<window-title>Framework MUS-D</window-title>
	<footer>Framework MUS-D :: http://code.google.com/p/mus-d</footer>
	<output>docs</output>
	<doc-namespaces>
		<uri>TER</uri>
	</doc-namespaces>

	<packages>
		<package>
			<string>Coeur</string>
			<string>Le code métier de notre framework.</string>
		</package>
		<package>
			<string>Coeur.Forme</string>
			<string>Le code métier des différentes formes de notre framework.</string>
		</package>
		<package>
			<string>Coeur.Elements</string>
			<string>Les différents éléments que l'on peut ajouter dans les scenes de notre framework.</string>
		</package>
		<package>
			<string>Controleur</string>
			<string>Les controleurs de notre framework. Soit l'écoute du clavier, de la souris mais aussi les effets que l'on peut appliquer aux objets de notre framework.</string>
		</package>
		<package>
			<string>Graphique</string>
			<string>Les différents objets graphiques de notre framework. Ceux-ci contiennent des références vers les éléments du code métier.</string>
		</package>
		<package>
			<string>Graphique.Textures</string>
			<string>Les textures pouvant être appliquées aux objets graphiques.</string>
		</package>
		<package>
			<string>Graphique.Textures.Degrades</string>
			<string>Les dégradés pouvant être appliquées aux objets graphiques.</string>
		</package>
		<package>
			<string>Utilitaires</string>
			<string>Classes aidant à la programmation.</string>
		</package>
	</packages>

	<metadata>
		<title>Framework MUS-D documentation</title>
		<description>Documentation du framework MUS-D pour la réalisation de jeux d'arcade en flex et/ou actionscript</description>
		<publisher>MUS-D</publisher>
		<creator>MUS-D</creator>
		<language>FR</language>
	</metadata>
</flex-config>
```

Explication des éléments :
  * 

&lt;path-element&gt;

 : l'emplacement des packages ou des classes du projet
  * 

&lt;namespaces&gt;

 : le namespace de la doc (j'ai pas trouvé où sa sert)
  * 

&lt;main-title&gt;

 et 

&lt;window-title&gt;

 : ce qui sera dans le navigateur internet
  * 

&lt;footer&gt;

 : le pied de page de la doc
  * 

&lt;output&gt;

 : le dossier où sera créé la doc
  * 

&lt;packages&gt;

 : tous les packages de l'application avec en premier le nom puis la description (génère une erreur s'il n'y a pas les 2).
  * 

&lt;metadata&gt;

 : je pense que c'est ce qui est dans les méta-données HTML

Info : je n'est pas réussi à mettre du HTML notamment pour créer un lien hypertext dans le footer

## Configuration des classes à inspecter ##

Pareil ça marche avec un fichier xml, voici le notre pour le framework mais simplifié :

```
<?xml version="1.0" encoding="utf-8"?>
<componentPackage>
	<!-- COEUR -->
	<component id="MBonus" class="Coeur.MBonus"/>
	<component id="MControle" class="Coeur.MControle"/>
	<component id="MDynamique" class="Coeur.MDynamique"/>
	<component id="MElement" class="Coeur.MElement"/>
	<component id="MIObjet" class="Coeur.MIObjet"/>
	<!-- COEUR.FORME -->
	<component id="MForme" class="Coeur.Forme.MForme"/>
	<component id="MFormeCarre" class="Coeur.Forme.MFormeCarre"/>
	<component id="MFormeComplexe" class="Coeur.Forme.MFormeComplexe"/>
	<component id="MFormeCompose" class="Coeur.Forme.MFormeCompose"/>
	<component id="MFormeEllipse" class="Coeur.Forme.MFormeEllipse"/>
	<component id="MFormeEtoile" class="Coeur.Forme.MFormeEtoile"/>
	<!-- CONTROLEUR -->
	<component id="MClavier" class="Controleur.MClavier"/>
	<component id="MIEcouteurClavier" class="Controleur.MIEcouteurClavier"/>
	<component id="MIEcouteurSouris" class="Controleur.MIEcouteurSouris"/>
	<!-- GRAPHIQUE -->
	<component id="MGraphiqueAbstrait" class="Graphique.MGraphiqueAbstrait"/>
	<component id="MGraphiqueEtoile" class="Graphique.MGraphiqueEtoile"/>
	<component id="MGraphiqueFormeCompose" class="Graphique.MGraphiqueFormeCompose"/>
	<component id="MGraphiqueRectangle" class="Graphique.MGraphiqueRectangle"/>
	<component id="MGraphiqueRond" class="Graphique.MGraphiqueRond"/>
	<!-- GRAPHIQUE.TEXTURES -->
	<component id="MBordure" class="Graphique.Textures.MBordure"/>
	<component id="MCouleur" class="Graphique.Textures.MCouleur"/>
	<component id="MImage" class="Graphique.Textures.MImage"/>
</componentPackage>
```

Info : il faudra le remettre à jour en cas de nouvelles classes ou de classes supprimées !!

## Ligne de commande ##

linux :
sudo /opt/Adobe\_Flex\_Builder\_Linux/sdks/3.0.0/bin/asdoc -load-config+=/home/manland/workspace/TER/doc-config.xml

Windob :
c:/Program Files/Adobe/sdks/3.0.0/bin/asdoc.exe -load-config+=C:/worspace/TER/doc-config.xml

Info : pensez à remplacer les chemins par ceux de chez vous !!

# Syntaxe #

## Package ##

Tout ce passe dans le fichier du squelette donc rien à faire pour vous.

## Descriptions ##

```
/**
 * Description de la classe, fonction ou attribut.
 * <p>Description secondaire de la classe, fonction ou attribut</p>//optionnel
*/
```

## Liens ##

En mettre partout et dans tous les sens car je pense que ça permet de bien comprendre à quoi fait références la fonction ou classe et à quoi elle touche dans notre framework.

```
/**
 * Description...
 * @see Package.Classe#fonction
 * @see http://code.google.com/p/mus-d //permet de renvoyer vers un site internet
*/
```

Info : J'ai remarqué un petit bug si on fait que #fonction pour une fonction de la même classe, je vous recommande donc de faire Classe#fonction même si c'est dans la même classe.

## Examples ##

Cette balise permet de mettre des examples dans vos commentaires, je vous encourage également à en mettre a foison.

```
/**
 * Description...
 * @see ...
 * @example description de l'example : 
 *   <listing version="3.0" > 
 *      var mon_etoile:MFormeEtoile = new MFormeEtoile(); 
 *      mon_etoile.instancie(...);
 *   </listing>
 */
```

Info : la balise 

&lt;listing&gt;

 permet en fait de déplacer le code tout en bas de la page comme vous pouvez le voir sur toutes les AsDoc.

## Commentaires hérités ##

Une autre petites balises très pratique !! Elle permet en effet de récupérer les commentaires du parent en regardant dans l'ordre : les interfaces, les classes mères.

```
/**
 * @inheritDoc
 */
```

## Privée ##

Cette balise permet de ne pas afficher une classe, une fonction ou un attribut dans l'asDoc.
Ne devrait pas servir dans notre framework puisque l'asDoc ne détecte pas les attributs privée !!

```
/**
 * @private
 */
```

## Fonctions ##

Voici les balises pour décrire vos fonctions, c'est identique à la javaDoc.

```
/**
 * @param nom_parametre description parametre
 * @return description de ce qu'on retourne
 */
```

## Valeurs par défaut ##

Une autre fonctionnalité très utilie qui permet de spécifier la valeur par défaut d'un attribut.

```
/**
 * @default value
 */
```

## Exceptions ##

Les exceptions ou erreurs que peuvent générer vos fonctions.

```
/**
 * @throws MError Erreur généré par... ou ...
 */
```