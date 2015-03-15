# Introduction #

L'actionScript est un langage qui supporte l'introspection, il est donc possible d'en savoir plus sur nos méthodes ou nos attributs.

Les fonctions permettant d'utiliser l'introspection se situent dans le package : `flash.utils.*;`.

Pour en savoir plus sur un objet il suffit de faire :
```
var fic_xml:XML;
fic_xml=describeType(event.currentTarget);
panel_opt.sysout.text+="fic_xml : "+fic_xml.toXMLString();
```

  * La fonction describeType renvoi une "liste" xml, il suffit de la mettre dans une variable (ici fic\_xml) puis de la faire afficher. Dans cet exemple, je veux avoir des informations sur l'objet sur lequel je clique, c'est pour cela que je passe en paramètre: `event.currentTarget` puis je fait afficher tout ça dans un panel muni d'un textAera nommé sysout.
  * J'ai essayé de cliquer sur une simple image, et ça m'a généré 593 lignes de code xml... je sais pas trop quoi en faire, mais au moins on sait faire de l'instrospection en actionScript ! en plus, je pense qu'il doit y avoir d'autre fonction plus interressante dont on pourrait peut être se servir !
  * la signature de la fonction est : `function describeType(value:*):XML` avec `value` qui peut prendre la valeur de n'importe quel objet.