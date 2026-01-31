# sc_widget

# 🎶 SC Widget

Ce projet permet de générer une vidéo **Picture-in-Picture** avec un widget SoundCloud incrusté sur un fond vidéo (YouTube) et synchronisé avec un timecode précis.  
L’ensemble s’appuie sur `chromium` en mode headless et `ffmpeg`.

---

## 📥 Installation

Cloner le dépôt :

```bash
git clone git@github.com:gglacroix/sc_widget.git
cd sc_widget.git

Depuis le répertoire du dépôt, build l'image docker :
sudo docker build -t soundcloud-widget .

Lorsque l'image est construite, lancer une capture avec la commande suivante :
sudo docker run --rm \
# map le dossier output de l'host avec le dossier /exports du container
  -v "$PWD/output:/exports" \
  soundcloud-widget \
# url de la track soundcloud
  --track-url "https://soundcloud.com/bcco/bcco-mix-619-yasmin-gardezi" \
# durée de la capture
  --duration 30 \
# timecode début de capture track soundcloud
  --audio-tc-in 00:07:49 \
# url de la vidéo youtube utilisé pour le background
  --background-url "https://www.youtube.com/watch?v=WDU1UXiUZhs" \
# timecode début de capture background youtube
  --background-tc-in 00:08:01 \
# nom du fichier créé
  --output "/exports/mon_export.mp4"

