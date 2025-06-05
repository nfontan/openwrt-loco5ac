# OpenWrt Custom Build for Ubiquiti NanoStation loco AC

This project contains a custom configuration to build OpenWrt 24.10.1 for the **Ubiquiti NanoStation loco AC** device (`ubnt_nanostation-ac-loco`), featuring:

- The LuCI web interface
- A kernel patch for early MTD SPI setup (Thanks [@aanon4](https://github.com/aanon4)) https://github.com/openwrt/openwrt/issues/17285
- Reproducible builds using Docker
- A stripped-down config for faster builds

---

## 🧱 Requirements

- Docker
- Internet connection (to fetch sources and packages)
- An `openwrt` folder with the source code (can be mounted or copied)

---

## 🚀 Build Instructions

1. Clone this repository:

```bash
git clone https://github.com/nfontan/openwrt-loco5ac.git
```
2. Clone openwrt repository:
```bash
cd openwrt-loco5ac
git clone https://git.openwrt.org/openwrt/openwrt.git
cd openwrt
git checkout v24.10.1
```
3. Copy the fix:
```bash
cp ../436-mtd-spi-earlier-mtd-setup.patch target/linux/generic/pending-6.6/
```
4. Edit the nano-loco.config file and add/remove the necessary packages as you wish.
5. Create docker image
```bash
docker build -t openwrt-nano .
```
6. Build
```bash
docker run --rm -v $(pwd)/openwrt/bin:/home/builder/openwrt/bin openwrt-nano
```

If all goes well, we will be able to flash with that image.

Output
```bash
openwrt/bin/targets/ath79/generic/
```
