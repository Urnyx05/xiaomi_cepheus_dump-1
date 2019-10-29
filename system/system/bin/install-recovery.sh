#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:a9b67ea5c4d8b7c6c1e0dfd1b36e79a2c946153a; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:134217728:30d83e98d34cc53f41c11fc3d5cad4edc350abd4 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:a9b67ea5c4d8b7c6c1e0dfd1b36e79a2c946153a && \
      log -t recovery "Installing new recovery image: succeeded" && \
        echo "Installing new recovery image: succeeded" > /cache/recovery/last_install_recovery_status || \
      (log -t recovery "Installing new recovery image: failed" && \
        echo "Installing new recovery image: failed" > /cache/recovery/last_install_recovery_status)
else
  log -t recovery "Recovery image already installed" && \
  echo "Recovery image already installed" > /cache/recovery/last_install_recovery_status
fi
