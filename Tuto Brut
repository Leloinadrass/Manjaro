🎮 Tutoriel : Gestion dynamique du dossier compatdata pour Steam
🧭 Objectif

Permettre à un utilisateur (ex. melgrin) d’utiliser son propre dossier compatdata tout en accédant à une bibliothèque Steam partagée dans /mnt/steam/SteamLibrary.
📁 1. Script de démarrage : création du lien symbolique
📌 Emplacement :

/home/melgrin/.config/old-autostart-scripts/script_steam_symlink.sh
📜 Contenu du script :

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

✅ Permissions :

chmod +x /home/melgrin/.config/old-autostart-scripts/script_steam_symlink.sh

🖥️ 2. Fichier .desktop pour lancer le script au démarrage
📌 Emplacement :

/home/melgrin/.config/autostart/compatdata_symlink.desktop
📜 Contenu :

[Desktop Entry]
Type=Application
Exec=/home/melgrin/.config/old-autostart-scripts/script_steam_symlink.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Compatdata Symlink
Comment=Crée un lien symbolique pour compatdata
X-KDE-AutostartScript=true

✅ Propriétaire :

chown melgrin:melgrin /home/melgrin/.config/autostart/compatdata_symlink.desktop

🔚 3. Script de fin de session : suppression du lien symbolique
📌 Emplacement :

/home/melgrin/.config/plasma-workspace/shutdown/cleanup_steam_symlink.sh

    Ce dossier est reconnu par KDE Plasma pour exécuter des scripts à la fermeture de session.

📜 Contenu :

#!/bin/bash

SHARED_COMPATDATA="/mnt/steam/SteamLibrary/steamapps/compatdata"

# Supprimer le lien symbolique s'il pointe vers le dossier de l'utilisateur
if [ -L "$SHARED_COMPATDATA" ]; then
    LINK_TARGET=$(readlink "$SHARED_COMPATDATA")
    if [[ "$LINK_TARGET" == "/home/$USER/"* ]]; then
        rm "$SHARED_COMPATDATA"
    fi
fi

✅ Permissions :

chmod +x /home/melgrin/.config/plasma-workspace/shutdown/cleanup_steam_symlink.sh

🛡️ Conseils supplémentaires

    Assure-toi que /mnt/steam/SteamLibrary/steamapps/ est accessible en écriture par le groupe SteamGroup.

    Tous les utilisateurs doivent appartenir à ce groupe :

    sudo usermod -aG SteamGroup melgrin

    Et les permissions doivent être correctement définies :

    sudo chgrp -R SteamGroup /mnt/steam
    sudo chmod -R g+rwX /mnt/steam


