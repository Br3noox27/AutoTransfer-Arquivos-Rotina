#!/bin/bash

# Caminho do pendrive montado (no Mac é em /Volumes/)
PENDRIVE_PATH="/Volumes/BINGA"

# Caminho da pasta onde os arquivos serão copiados no Mac
DESTINO_APP="/Users/pc1/Desktop/teste"

# Verificar se o pendrive está montado
if [ -d "$PENDRIVE_PATH" ]; then
    echo "Pendrive encontrado em $PENDRIVE_PATH"
    
    # Verificar se a pasta de destino existe, se não, criar
    if [ ! -d "$DESTINO_APP" ]; then
        echo "A pasta de destino não existe. Criando..."
        mkdir -p "$DESTINO_APP"
    fi

    # Copiar arquivos do pendrive para a pasta de destino, ignorando .Spotlight-V100
    rsync -avh --ignore-existing --exclude='.Spotlight-V100' "$PENDRIVE_PATH"/ "$DESTINO_APP"/
    
    echo "Projetos sincronizados com sucesso para $DESTINO_APP!"
else
    echo "Pendrive não encontrado! Verifique se está conectado."
fi

