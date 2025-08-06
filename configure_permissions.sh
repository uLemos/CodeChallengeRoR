#!/bin/bash

# Garantir que as permissões do diretório tmp/pids estejam corretas
echo "Ajustando permissões para o diretório tmp..."
chmod -R 777 tmp

# Garantir que o arquivo server.pid não exista
if [ -f tmp/pids/server.pid ]; then
  echo "Removendo o arquivo server.pid..."
  rm tmp/pids/server.pid
fi

echo "Configuração concluída. Agora você pode rodar o servidor com 'rails s'!"
