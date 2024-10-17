FROM elixir:latest

# Installer les dépendances nécessaires
RUN apt-get update && \
    apt-get install --yes build-essential inotify-tools postgresql-client git && \
    apt-get clean

# Ajouter les fichiers de l'application dans le conteneur
ADD ./api /app

# Installer Hex et Rebar ainsi que Phoenix
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix archive.install --force hex phx_new 1.5.1

# Donner les permissions d'exécution au script entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Définir le répertoire de travail
WORKDIR /app

# Exposer le port sur lequel l'application fonctionne
EXPOSE 4000

# Lancer le script entrypoint.sh comme commande de démarrage
CMD ["/app/entrypoint.sh"]
