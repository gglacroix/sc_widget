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
-v "$PWD/output:/exports" soundcloud-widget \
--track-url "https://soundcloud.com/bcco/bcco-mix-619-yasmin-gardezi" \
--duration 30 \
--audio-tc-in 00:07:49 \
--background-url "https://www.youtube.com/watch?v=WDU1UXiUZhs" \
--background-tc-in 00:08:01 \
--output "/exports/mon_export.mp4"

