#!/bin/bash
echo "Iniciando build do projeto..."

PROJECT_PATH="C:/Users/Guilherme.Januario/Documents/Pipeline/MobEAD"
SRC_PATH="$PROJECT_PATH/src"

cd "$SRC_PATH" || exit

npm install
npm run build

echo "Build concluído."