#!/bin/bash
echo "Iniciando pipeline de CI/CD..."

./build.sh
if [ $? -ne 0 ]; then
  echo "Build falhou. Abortando pipeline."
  exit 1
fi

./test.sh
if [ $? -ne 0 ]; then
  echo "Testes falharam. Abortando pipeline."
  exit 1
fi

./deploy.sh
if [ $? -ne 0 ]; then
  echo "Deploy falhou. Abortando pipeline."
  exit 1
fi

echo "Pipeline concluída com sucesso."