#!/bin/bash

# Nombre del volumen
VOLUME=$1

# Archivo .tar.gz a importar
ARCHIVO=$2

# Verificar que se haya especificado el nombre del volumen y el archivo
if [[ -z $VOLUME || -z $ARCHIVO ]]; then
  echo "Por favor, especifica el nombre del volumen y el archivo .tar.gz a importar."
  exit 1
fi

# Verificar que el archivo exista
if [[ ! -f $ARCHIVO ]]; then
  echo "El archivo $ARCHIVO no existe."
  exit 1
fi

# Crear el volumen si no existe
docker volume inspect $VOLUME &> /dev/null || docker volume create $VOLUME

# Importar el contenido del archivo al volumen
docker run --rm -v $VOLUME:/var -v $(pwd):/backup alpine:latest tar -xzvf /backup/$ARCHIVO -C /var

# Confirmar que se completó la tarea
if [[ $? -eq 0 ]]; then
  echo "Se completó la importación del archivo $ARCHIVO al volumen $VOLUME."
else
  echo "Se produjo un error al importar el archivo $ARCHIVO al volumen $VOLUME."
  exit 1
fi
