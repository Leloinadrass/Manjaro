#!/bin/bash

SHARED_COMPATDATA="/mnt/steam/SteamLibrary/steamapps/compatdata"

# Supprimer le lien symbolique s'il pointe vers le dossier de l'utilisateur
if [ -L "$SHARED_COMPATDATA" ]; then
    LINK_TARGET=$(readlink "$SHARED_COMPATDATA")
    if [[ "$LINK_TARGET" == "/home/$USER/"* ]]; then
        rm "$SHARED_COMPATDATA"
    fi
fi

# Corriger les permissions du dossier partagé
/usr/bin/sudo /usr/bin/chgrp -R SteamGroup /mnt/steam/SteamLibrary
/usr/bin/chmod -R 775 /mnt/steam/SteamLibrary
echo "✔ Permissions corrigées pour /mnt/steam/SteamLibrary avec $USER" >> /var/log/steam-shutdown.log
