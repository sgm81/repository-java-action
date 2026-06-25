#!/bin/bash
set -e

echo "========================================================="
echo "  Aprovisionando Dependencias Corporativas en el Workspace "
echo "========================================================="

# Carpetas en el volumen compartido con el host
SHARED_WORKSPACE="/github/workspace"
TARGET_DIR="$SHARED_WORKSPACE/.m2-shared"

echo "⚙️ Creando directorio de destino en el host..."
mkdir -p "$TARGET_DIR"

echo "📦 Descomprimiendo catálogo de Jars internos..."
# Descomprimimos el ZIP directamente dentro de la carpeta compartida.
# Esto creará la estructura '$TARGET_DIR/repository/com/banco/...'
unzip -q /tmp/repository.zip -d "$TARGET_DIR/"

echo "========================================================="
echo "✅ Dependencias listas en: $TARGET_DIR/repository"
echo "========================================================="