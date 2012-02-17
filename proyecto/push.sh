#!/bin/bash
if [ -z "$1" ]; then
  echo "Debe especificar un mensaje!"
else
  if [ -f ./tmp/pids/passenger.3000.pid ]; then
    echo "\nDeteniendo servidor...\n"
    passenger stop
  else
    echo "\nEl servidor está detenido"
  fi

  echo "Limpiando logs..."
  rake log:clear

  echo "Limpiando temporales..."
  rm -rf tmp

  echo "Agregando todos los archivos al repositorio..."
  git add -A

  echo "Commiteando los cambios...\n"
  git commit -am "$1"

  echo "\nPUSHEANDO...\n"
  git push heroku master

  echo "\nCorriendo el servidor..."
  passenger start
fi
