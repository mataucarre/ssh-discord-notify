# Notification Discord pour connexions SSH

Envoyer une notification sur Discord à chaque connexion SSH sur votre serveur.

---
## 1) Récupérer le Webhook Discord

1. Allez dans votre serveur Discord.  
2. Cliquez sur le **nom du serveur** → `Paramètres du serveur` → `Intégrations` → `Webhooks`.  
3. Créez un nouveau webhook ou utilisez un existant.  
4. Copiez l'URL du webhook et collez-la dans `$WEBHOOK_URL` du script.

---

## 2) Récupérer l'ID Discord d’un utilisateur

1. Dans Discord, allez dans `Paramètres utilisateur` → `Apparence` → activez le **Mode développeur**.  
2. Faites un clic droit sur votre pseudo → `Copier l'identifiant` et gardez-le de côté.  

---

## 3) Création du script

1. Créez le fichier du script :

```bash
sudo nano /usr/local/bin/ssh-notify.sh
```
- Modifier la variable SITE et USER_PING
---

## 4) Configuration de PAM pour SSH

1. Éditez le fichier PAM pour SSH :

```bash
sudo nano /etc/pam.d/sshd
```

2. Ajoutez **à la fin** du fichier :

```text
session optional pam_exec.so /usr/local/bin/ssh-notify.sh
```
---

## 5) Tester le fonctionnement

1. Connectez-vous via SSH depuis un autre terminal ou une autre machine.  
2. Vérifiez votre serveur Discord : vous devriez recevoir un message avec l’utilisateur, l’IP, la date et éventuellement le ping.

---

## 6) Sécurisation du script

```bash
sudo chown root:root /usr/local/bin/ssh-notify.sh
sudo chmod 700 /usr/local/bin/ssh-notify.sh
```

