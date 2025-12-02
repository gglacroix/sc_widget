FROM debian:12-slim

# Pour éviter les questions interactives
ENV DEBIAN_FRONTEND=noninteractive

# Mise à jour + dépendances système
RUN apt-get update && apt-get install -y \
    python3 \
    python3-venv \
    python3-pip \
    ffmpeg \
    xvfb \
    chromium \
    iproute2 \
    ca-certificates \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Création d'un venv + installation de yt-dlp
RUN python3 -m venv /app/venv \
  && /app/venv/bin/pip install --no-cache-dir yt-dlp \
  && mkdir -p /app/bin \
  && ln -s /app/venv/bin/yt-dlp /app/bin/yt-dlp

# On met le venv dans le PATH, au cas où
ENV PATH="/app/venv/bin:${PATH}"

# Copie du script + de la page HTML SoundCloud
COPY record_headless.sh /app/record_headless.sh
COPY sc_player.html /app/sc_player.html

# Exécution du script au démarrage
RUN chmod +x /app/record_headless.sh

# ENTRYPOINT : ton script est lancé direct,
# tous les arguments passés à "docker run" lui seront transmis
ENTRYPOINT ["/app/record_headless.sh"]

