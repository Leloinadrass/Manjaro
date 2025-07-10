Avec les partitions précédemment explicitées.

pour trois utilisateurs : user1 user2 et user3

1. Créer le groupe et ajouter les utilisateurs au groupe
```
sudo groupadd SteamGroup
sudo usermod -aG SteamGroup user1
sudo usermod -aG SteamGroup user2
sudo usermod -aG SteamGroup user3
```
(can also use `sudo gpasswd -a user1 SteamGroup` )

2. Installer Steam avec l'utilisateur user1
- Configurer la langue, quitter steam

3. Installer protonup-qt
- Lancer protonup-qt et ajouter "protonGE XX.Y" pour steam

4. Démarrer Steam, menu `Steam`, `paramètres`, `Compatibilité`, sélectionner `GE Proton XX.Y` comme outil de compatibilité par défaut.
Redémarrer Steam.

5. Créer une librairie Steam sur la partition partagée.
Démarrer Steam, menu `Steam`, `paramètres`, `Stockage`
Par défaut c'est sur /home. Cliquer dessus et `ajouter un disque`. Sélectionner /mnt/steam .
Sélectionner la nouvelle bibliothèque, cliquer sur les 3 petits points (`paramètres`) et `définir par défaut`.

6. Installer un petit jeu non natif linux, le lancer. Le dossier `compatdata` va être créé avec l'identifiant du jeu dedans.
Supprimer ce dossier. Si si.

7. Créer un dossier `compatdata` dans l'utilisateur local. Par exemple :
```mkdir -p /home/user1/.steam/steam/steamapps/compatdata```

8. Créer un dossier protonfixe (Normalement inutile pour le premier utilisateur, mais indispensable pour les autres.)
```mkdir -p /home/user1/.config/protonfixes
chown user1:user1 /home/user1/.config/protonfixes```

La ligne `chown` permet, si le dossier a été créé en ligne de commande via l'utilisateur root 
(utile pour créer des dossiers dans le /home des autres utilisateurs), de redonner la possession du dossier à l'utilisateur,
sinon, il ne pourra pas l'utiliser.

9. déclarer le dossier SteamLibrary et le protonfixes_test.log comme modifiables par le groupe SteamGroup
```sudo chmod 775 /tmp/protonfixes_test.log
sudo chmod -R 775 /mnt/steam/SteamLibrary```

10. Créer un script qui va créer un lien symbolique entre /mnt/steam/SteamLibrary/steamapps/compatdata et 
/home/user1/.steam/steam/steamapps/compatdata.


`nano /home/user1/.config/scripts/script_steam_symlink.sh`

code :
```
#!/bin/bash

# Chemins
USER_COMPATDATA="/home/$USER/.steam/steam/steamapps/compatdata"
SHARED_COMPATDATA="/mnt/steam/SteamLibrary/steamapps/compatdata"

# Supprimer le lien ou dossier existant s'il existe
if [ -L "$SHARED_COMPATDATA" ] || [ -d "$SHARED_COMPATDATA" ]; then
    rm -rf "$SHARED_COMPATDATA"
fi

# Créer le lien symbolique vers le dossier personnel
ln -s "$USER_COMPATDATA" "$SHARED_COMPATDATA"
```

A finir...
