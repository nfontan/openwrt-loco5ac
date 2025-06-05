FROM debian:12

# Instalamos dependencias
RUN apt update && apt install -y \
  build-essential \
  flex \
  bison \
  gawk \
  gcc \
  g++ \
  gettext \
  libncurses-dev \
  python3 \
  python3-distutils \
  unzip \
  zlib1g-dev \
  subversion \
  git \
  curl \
  wget \
  rsync \
  file \
  libssl-dev \
  ca-certificates \
  quilt \
  time \
  cpio \
  && apt clean
WORKDIR /home/builder
COPY build.sh .
COPY nano-loco.config .

RUN chmod +x build.sh

# En tiempo de ejecución, se monta la carpeta openwrt desde el host
CMD ["./build.sh"]
