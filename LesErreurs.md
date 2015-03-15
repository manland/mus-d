# Introduction #

Throw, try et catch sont les 3 mots clés pour gérer les erreurs en ActionScript. Petit rappel de ce que j'ai pu comprendre :
  * throw permet de lancer une erreur qui est captable par un try-catch
  * try permet permet d'essayer de faire quelque chose
  * catch capte l'erreur lancer par le throw

# Classe #

Pour ce faire je vous propose donc de créer une classe Erreur dans le package Utilitaire. Cette classe descend directement de Error comme ça nous n'avons pas à nous intéresser au mécanisme interne des throw. Mais nous ajoutons des paramètres au constructeur :
  * classe:String = la classe générant l'erreur
  * méthode:String = la méthode de l'erreur
  * desciption:String = la description de l'erreur
  * param:Array = [.md](.md) = un tableau optionel permettant d'ajouter les valeurs de variables

# Trace et Debug #

Une solution existe pour faciliter le déboguage de nos programmes, plus pratique que le sysout actuellement utilisé par Romain. Cette solution fonction avec Windows + FlexBuilder... A voir sous linux pour les autres. Voici la marche à suivre :
  * désinstallez Flash Player http://www.adobe.com/shockwave/download/alternates/
  * reinstallez Flash Player :  telechargez le fichier de 44Mo ici http://www.adobe.com/support/flashplayer/downloads.html puis dezippez les, rendez vous au répertoire Debug et lancer l'installation du plugin.
  * redémarrez votre ordi (quand je ne l'ai pas fait j'ai eu des problèmes)
  * pour vérifier que cela marche : lancer une application flash, clique droit dessus. Le mode deboggueur devrait apparaitre dans le menu contextuel.
  * pour l'utiliser : lancez flexBuilder puis écrivez dans votre programe : trace("Hello World"). Ensuite lancez votre programme en mode Debug (Run> Debug MonAppli). Dans la console d'eclipse va apparaitre HelloWorld.

# Conclusion #

Je ne sais pas du tout si tout ça est vrai et/ou réalisable merci de corriger en cas de faute.