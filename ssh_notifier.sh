#!/bin/bash

# URL du webhook Discord
WEBHOOK_URL="https://discord.com/api/webhooks/..."

# Nom du site ou serveur
SITE="votre-site.fr"

# ID Discord de l'utilisateur à ping (mettre vide pour aucun ping)
USER_PING=""  # Exemple : USER_PING="1234567891234567890"

if [ "$PAM_TYPE" != "open_session" ]; then
    exit 0
fi

USER=$PAM_USER
IP=$PAM_RHOST
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Préparer la mention si USER_PING n'est pas vide
if [ -n "$USER_PING" ]; then
    PING="<@$USER_PING>"
else
    PING=""
fi

# Construire le message multi-lignes
MESSAGE="# :bell: Nouvelle connexion SSH sur le serveur [$SITE] détectée !
**Utilisateur** : $USER
**IP** : $IP
**Date** : $DATE
$PING"

# Envoyer le message sur Discord
curl -H "Content-Type: application/json" \
     -X POST \
     -d "{\"content\": \"$MESSAGE\"}" \
     $WEBHOOK_URL
