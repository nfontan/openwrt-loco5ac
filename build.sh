#!/bin/bash
set -e

cd openwrt
# Exportar la variable para evitar el error de "configure as root"
export FORCE_UNSAFE_CONFIGURE=1
# Usamos la configuración predefinida
cp ../nano-loco.config .config

# Preparamos los feeds
./scripts/feeds update -a
./scripts/feeds install -a

# Aceptamos todas las configuraciones predeterminadas
make defconfig

# Compilamos la imagen
make -j$(nproc)
