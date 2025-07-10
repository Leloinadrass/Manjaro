## Contexte :

J'ai installé Manjaro sur un PC familial dont le but est qu'il remplace consoles et PC portables poussifs pour le jeu. Au coeur du système : Steam.
Mais Steam a un souci en multi-utilisateur sous linux : le dossier compatdata des jeux non natifs doit appartenir à l'utilisateur qui joue. 
Donc il faut que chaque utilisateur ait le sien. Et si on ne veut pas installer le même jeu pour chaque utilisateur, ce qui peut rapidement 
prendre beaucoup de place, il faut ruser un peu.

## Partitions

j'ai installé Manjaro avec un partitionnement manuel comme suit :
- Swap manuel de 10 Go
- Partition Boot EFI de 2 Go en `FAT 32` et drapeau `boot`
- Partition système / de 200 Go en `btrfs`
- Partition /home de 600 Go pour les utilisateurs et les dossiers compatdata en `btrfs`
- Partition /mnt/steam de 1000 Go, possédée par root:SteamGroup, en `btrfs`, qui contiendra les jeux.

*volumes approximatifs sur un NVMe de 2 To*

L'idée ce faisant est que les différentes partitions permettent une éventuelle récupération en cas de réinstallation.
Je peux aussi modifier des droits par parition directement si cela m'intéresse. Techniquement, au lieu de partitionner comme je l'ai fait, 
on peut simplement créer des dossiers et gérer les droits par dossier. 
