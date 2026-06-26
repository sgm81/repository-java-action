#!/bin/bash
# Forzamos que el script termine inmediatamente si falla cualquier comando previo
set -e

echo "========================================================="
echo "  Aprovisionando Dependencias Corporativas en el Workspace "
echo "========================================================="

# 1. Definimos rutas absolutas claras
SHARED_WORKSPACE="/github/workspace"
TARGET_DIR="$SHARED_WORKSPACE/.m2-shared"
ORIGEN_ZIP="/tmp/repository.zip"
ORIGEN_SETTINGS="/tmp/settings.xml"

# 🔍 CHIVATO DE DEBUGGING: Vamos a ver qué hay realmente en /tmp
echo "🔍 Verificando el contenido de la carpeta /tmp del contenedor:"
ls -la /tmp

echo "⚙️ Creando directorio de destino en el host..."
mkdir -p "$TARGET_DIR"

echo "📦 Descomprimiendo catálogo de Jars en el volumen del host..."
if [ -f "$ORIGEN_ZIP" ]; then
    unzip -o -q "$ORIGEN_ZIP" -d "$TARGET_DIR/"
else
    echo "❌ ERROR CRÍTICO: No se encuentra el archivo $ORIGEN_ZIP"
    exit 1
fi

echo "⚙️ Moviendo configuración settings.xml al volumen compartido..."
# Usamos rutas 100% absolutas para que el comando 'cp' no dependa de dónde esté situado el terminal
if [ -f "$ORIGEN_SETTINGS" ]; then
    cp "$ORIGEN_SETTINGS" "$TARGET_DIR/settings.xml"
else
    echo "❌ ERROR CRÍTICO: El archivo $ORIGEN_SETTINGS no existe en el contenedor."
    exit 1
fi

echo "========================================================="
echo "✅ Entorno listo en el host: $TARGET_DIR"
echo "========================================================="