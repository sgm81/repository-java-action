FROM maven:3.9.6-eclipse-temurin-21

# Instalar utilidad para descomprimir
RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/*

# Copiar el ZIP y el script extractor
COPY ./repository.zip /tmp/repository.zip
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]