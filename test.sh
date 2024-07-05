#!/bin/bash
echo "Iniciando testes do projeto..."

PROJECT_PATH="C:/Users/Guilherme.Januario/Documents/Pipeline/MobEAD"
SRC_PATH="$PROJECT_PATH/src"

cd "$SRC_PATH" || exit

npm install

npm test

if [ $? -ne 0 ]; then
  echo "Testes falharam."
  exit 1
fi

echo "Enviando resultados para SonarQube..."
sonar-scanner

if [ $? -ne 0 ]; then
  echo "Análise SonarQube falhou."
  exit 1
fi

echo "Testes concluídos com sucesso."
