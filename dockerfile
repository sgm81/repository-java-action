FROM maven:3.9.6-eclipse-temurin-21

# Instalar utilidad para descomprimir
RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/*

# 1. Copiamos el ZIP y el settings.xml a la ruta /tmp del contenedor
COPY ./repository.zip /tmp/repository.zip
COPY ./settings.xml /tmp/settings.xml

# 2. Copiamos y damos permisos al script de entrada
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]