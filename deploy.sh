#!/bin/bash
echo "Iniciando deploy do projeto..."

PROJECT_PATH="C:/Users/Guilherme.Januario/Documents/Pipeline/MobEAD"
BUILD_PATH="$PROJECT_PATH/src/build"

REMOTE_USER="guilherme.januario"
REMOTE_HOST="http://localhost:8080/"
REMOTE_PATH="/var/www/html/index.html"

scp -r "$BUILD_PATH"/* "$REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH"

if [ $? -ne 0 ]; then
  echo "Deploy falhou."
  exit 1
fi

ssh "$REMOTE_USER@$REMOTE_HOST" << EOF
  cd $REMOTE_PATH
  pm2 stop all || true  # Tenta parar qualquer instância em execução do pm2
  pm2 start app.js      # Substitua por seu arquivo de entrada do Node.js
EOF

if [ $? -ne 0 ]; then
  echo "Falha ao iniciar a aplicação no servidor remoto."
  exit 1
fi

echo "Deploy concluído com sucesso."