# Introduction #

Petite présentation d'un logiciel très simple d'utilisation pour ajour/modifier/supprimer le code de notre application. Toutes les classes seront automatiquement mises à jour, et vous pourrez très simplement nous envoyer vos nouveaux fichiers. De plus, vous pouvez nous signaler toute remarque directement dans le code par le biais de l'onglet source, browse puis trunk.


# Client Graphique - RapidSvn #

## Installation ##
  * Ouvrez un ti terminal
  * Entrez "sudo apt-get install rapidsvn"
  * Votre mot de passe
  * Et c'est fini

## Utilisation ##

Tout d'abord il vous faut vous connecter une première fois en récupérant les données, et ouais c'est bizard !! Donc pour cela :
  * cliquez sur Repository
  * Checkout
  * Entrez dans la case URL "https://mus-d.googlecode.com/svn/trunk/"
  * Dans destination directory "~/M1S2/TER"
  * dans la nouvelle fenêtre qui souvre vous devez mettre comme pseudo votre pseudo google et le mot de passe se trouve là : https://code.google.com/hosting/settings

Ensuite vous êtes libre de faire un update pour importer les fichiers vers votre dossier ~/M1S2/TER (en local) et du coup de travailler à partir des fichiers nouveaux !!

Une fois votre code niquel (bien commenté serais un plus) vous pouvez l'envoyer sur le serveur en fesant un commit sur les fichiers en question.

# Indication de la couleur des feuilles (au dessus à droite) #

  * Rouge si vous l'avez modifié mais pas encore envoyer (click droit -> commit)
  * Blanche vous êtes à jour
  * Point d'intérrogation vous avez ajouter un nouveau dossier ou fichier vous devez donc l'ajouter sur le serveur (click droit -> add ou add recursive pour tous les sous fichiers si c'est un dossier)

# Comment voir les fichiers depuis GoogleCode #

J'ai trouvé le moyen de voir les images, et autres fichiers sans ouvrir de client SVN.

Pour se faire rendez vous dans le browser de googleCode : http://code.google.com/p/mus-d/source/browse/ puis sélectionné le fichier que vous souhaitez voir.

Enfin clicker sur "View raw file" ce qui vous permettra de télécharger le fichier !!! Pratique pour voir une image par exemple !!