# Pasamos de ~500MB a escasos 5MB con Alpine Linux
FROM alpine:3.19

# Instalar 'unzip' y 'bash' (ya que entrypoint.sh usa #!/bin/bash)
RUN apk add --no-cache unzip bash

# 1. Copiamos el ZIP y el settings.xml a la ruta /tmp del contenedor
COPY ./repository.zip /tmp/repository.zip
COPY ./settings.xml /tmp/settings.xml

# 2. Copiamos y damos permisos al script de entrada
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]