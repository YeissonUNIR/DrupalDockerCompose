#!/bin/bash

# Nombre del volumen
VOLUME=$1

# Verificar que se haya especificado el nombre del volumen
if [[ -z $VOLUME ]]; then
  echo "Por favor, especifica el nombre del volumen."
  exit 1
fi

# Crear el volumen si no existe
docker volume inspect $VOLUME &> /dev/null || docker volume create $VOLUME

# Exportar el contenido del volumen
docker run --rm -v $VOLUME:/var -v $(pwd):/backup alpine:latest tar -czvf /backup/$VOLUME.tar.gz /var

# Confirmar que se completó la tarea
if [[ $? -eq 0 ]]; then
  echo "Se completó el backup del volumen $VOLUME en $(pwd)/$VOLUME.tar.gz."
else
  echo "Se produjo un error al realizar el backup del volumen $VOLUME."
  exit 1
fi
