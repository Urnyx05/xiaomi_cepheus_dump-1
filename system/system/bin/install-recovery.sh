#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:67108864:23dbf39f6b4cb7404295cb87052d7cfacac884cd; then
  applypatch  EMMC:/dev/block/bootdevice/by-name/boot:134217728:5638f9c20e6393ae7f3ee42b27643347c347095d EMMC:/dev/block/bootdevice/by-name/recovery 23dbf39f6b4cb7404295cb87052d7cfacac884cd 67108864 5638f9c20e6393ae7f3ee42b27643347c347095d:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
