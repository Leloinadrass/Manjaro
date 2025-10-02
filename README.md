# Manjaro

![Visitors](https://api.visitorbadge.io/api/combined?path=Leloinadrass%2FManjaro&label=Visiteurs&countColor=%2337d67a&style=plastic)


## TUTO STEAM MULTI USER
Ce github inclut un TUTO pour permettre d'avoir plusieurs comptes utilisateurs sur une machine tournant avec KDE qui partagent un dossier d'installation des jeux Steam, mais pas les dossiers Compatdata qui contiennent les données personnelles.
Chaque utilisateur a donc son propre /home, peut utiliser la bibliothèque partagée steam, sans pour autant voir les comptes steam des autres utilisateurs, et en sachant que ses sauvegardes sont dans des dossiers non visibles par les autres utilisateurs.

Voir les fichiers suivants :

* [1. Partitions Manjaro Familial :](https://github.com/Leloinadrass/Manjaro/blob/main/1.%20Partitions%20Manjaro%20Familial.md) contient les informations pour l'installation de la distribution Manjaro avec le choix des partitions.
* [2. Tuto Steam Partagé :](https://github.com/Leloinadrass/Manjaro/blob/main/2.%20Tuto%20steam%20partag%C3%A9.md) toutes les infos et les scripts pour que Steam puisse fonctionner avec plusieurs utilisateurs sans avoir de conflit. Mais nécessite encore une saisie régulière de commandes lors des bugs de permissions.
* [3. Points de vigilance :](https://github.com/Leloinadrass/Manjaro/blob/main/3.%20Points%20de%20vigilance.md) Jouer sur linux avec un clavier français (par exemple) nécessite des petites manip' pour contourner le problème.
* [4. Aller plus loin : sudoers :](https://github.com/Leloinadrass/Manjaro/blob/main/4.%20Aller%20plus%20loin%20%3A%20sudoers.md) Permet de finir d'automatiser l'installation multi-utilisateurs de façons à ce que la commande qui donne à tout le groupe Steam de modifier le dossier SteamLibrary soit lancée à chaque fin de session.




## Bilan des actions réalisées pour utiliser Manjaro

Stockage ici des différentes étapes qu'il m'a fallu suivre pour installer correctement Manjaro et jouer avec.

Fait :
- Description du partitionnement d'un ordinateur familial partageant des jeux entre plusieurs utilisateurs.
- Création de plusieurs utilisateurs qui partagent un dossier steam où sont stockés les jeux, puis liens symboliques vers des dossiers compatdata locaux par utilisateur pour ne pas avoir de conflit de sauvegardes.
- Mise en garde sur le mot de passe à l'installation
- Mise en garde relative aux dispositions clavier pour la reconnaissance des touches é ; è et ç dans les jeux sous linux
- Méthode d'installation de l'imprimante multifonction Brother DCP-J1050DW
- Package à installer pour bénéficier du scanner de l'imprimante Brother.*
- Modification des règles sudoers pour ne plus avoir de problèmes d'autorisation en écriture sur les fichiers Steam pour les différents utilisateurs.


