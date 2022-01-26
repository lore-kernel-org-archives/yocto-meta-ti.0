Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.20760.1643238549464324367
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 15:09:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9E29440CC6;
	Wed, 26 Jan 2022 23:09:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UT7bvFX7DqZ7; Wed, 26 Jan 2022 23:09:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8A20240CC9;
	Wed, 26 Jan 2022 23:09:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6DEF8174733;
	Wed, 26 Jan 2022 18:09:04 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC][master][PATCH 11/19] conf/machine: remove Keystone1/2 SoC/machine configs
Date: Wed, 26 Jan 2022 18:08:51 -0500
Message-Id: <1643238539-20686-12-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643238539-20686-1-git-send-email-denis@denix.org>
References: <1643238539-20686-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

As Keystone1/2 platforms are being deprecated.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 conf/machine/c665x-evm.conf       |  9 ---------
 conf/machine/c667x-evm.conf       |  9 ---------
 conf/machine/include/c66x.inc     |  9 ---------
 conf/machine/include/k2e.inc      |  6 ------
 conf/machine/include/k2g.inc      |  6 ------
 conf/machine/include/k2hk.inc     |  6 ------
 conf/machine/include/k2l.inc      |  6 ------
 conf/machine/include/keystone.inc | 30 ------------------------------
 conf/machine/k2e-evm.conf         | 32 --------------------------------
 conf/machine/k2e-hs-evm.conf      | 15 ---------------
 conf/machine/k2g-evm.conf         | 35 -----------------------------------
 conf/machine/k2g-hs-evm.conf      | 15 ---------------
 conf/machine/k2hk-evm.conf        | 32 --------------------------------
 conf/machine/k2hk-hs-evm.conf     | 15 ---------------
 conf/machine/k2l-evm.conf         | 32 --------------------------------
 conf/machine/k2l-hs-evm.conf      | 15 ---------------
 16 files changed, 272 deletions(-)
 delete mode 100644 conf/machine/c665x-evm.conf
 delete mode 100644 conf/machine/c667x-evm.conf
 delete mode 100644 conf/machine/include/c66x.inc
 delete mode 100644 conf/machine/include/k2e.inc
 delete mode 100644 conf/machine/include/k2g.inc
 delete mode 100644 conf/machine/include/k2hk.inc
 delete mode 100644 conf/machine/include/k2l.inc
 delete mode 100644 conf/machine/include/keystone.inc
 delete mode 100644 conf/machine/k2e-evm.conf
 delete mode 100644 conf/machine/k2e-hs-evm.conf
 delete mode 100644 conf/machine/k2g-evm.conf
 delete mode 100644 conf/machine/k2g-hs-evm.conf
 delete mode 100644 conf/machine/k2hk-evm.conf
 delete mode 100644 conf/machine/k2hk-hs-evm.conf
 delete mode 100644 conf/machine/k2l-evm.conf
 delete mode 100644 conf/machine/k2l-hs-evm.conf

diff --git a/conf/machine/c665x-evm.conf b/conf/machine/c665x-evm.conf
deleted file mode 100644
index d0af754..0000000
--- a/conf/machine/c665x-evm.conf
+++ /dev/null
@@ -1,9 +0,0 @@
-#@TYPE: Machine
-#@NAME: Keystone 1 c665x machine
-#@DESCRIPTION: Machine configuration for the TI Keystone 1 c665x EVM
-
-require conf/machine/include/c66x.inc
-
-# Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_SOCS = "c6657"
-TI_PDK_LIMIT_BOARDS = "evmC6657"
diff --git a/conf/machine/c667x-evm.conf b/conf/machine/c667x-evm.conf
deleted file mode 100644
index 11a90e4..0000000
--- a/conf/machine/c667x-evm.conf
+++ /dev/null
@@ -1,9 +0,0 @@
-#@TYPE: Machine
-#@NAME: Keystone 1 c667x machine
-#@DESCRIPTION: Machine configuration for the TI Keystone 1 c667x EVM
-
-require conf/machine/include/c66x.inc
-
-# Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_SOCS = "c6678"
-TI_PDK_LIMIT_BOARDS = "evmC6678"
diff --git a/conf/machine/include/c66x.inc b/conf/machine/include/c66x.inc
deleted file mode 100644
index 33a657f..0000000
--- a/conf/machine/include/c66x.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-require conf/machine/include/keystone.inc
-SOC_FAMILY:append = ":c66x"
-
-# HACK: The c66x family is composed of devices with only DSP cores, and no ARM
-#       cores. The Linux kernel is not supported on these machines.
-PREFERRED_PROVIDER_virtual/kernel ?= "linux-dummy"
-EXTRA_IMAGEDEPENDS = ""
-
-IMAGE_FSTYPES = "tar.xz"
diff --git a/conf/machine/include/k2e.inc b/conf/machine/include/k2e.inc
deleted file mode 100644
index a6d58bb..0000000
--- a/conf/machine/include/k2e.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-require conf/machine/include/keystone.inc
-SOC_FAMILY:append = ":k2e"
-
-# Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_SOCS = "k2e"
-TI_PDK_LIMIT_BOARDS = "evmK2E"
diff --git a/conf/machine/include/k2g.inc b/conf/machine/include/k2g.inc
deleted file mode 100644
index be40d9e..0000000
--- a/conf/machine/include/k2g.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-require conf/machine/include/keystone.inc
-SOC_FAMILY:append = ":k2g"
-
-# Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_SOCS = "k2g"
-TI_PDK_LIMIT_BOARDS = "evmK2G iceK2G"
diff --git a/conf/machine/include/k2hk.inc b/conf/machine/include/k2hk.inc
deleted file mode 100644
index 456fda7..0000000
--- a/conf/machine/include/k2hk.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-require conf/machine/include/keystone.inc
-SOC_FAMILY:append = ":k2hk"
-
-# Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_SOCS = "k2h k2k"
-TI_PDK_LIMIT_BOARDS = "evmK2H evmK2K"
diff --git a/conf/machine/include/k2l.inc b/conf/machine/include/k2l.inc
deleted file mode 100644
index b6a4bc7..0000000
--- a/conf/machine/include/k2l.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-require conf/machine/include/keystone.inc
-SOC_FAMILY:append = ":k2l"
-
-# Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_SOCS = "k2l"
-TI_PDK_LIMIT_BOARDS = "evmK2L"
diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
deleted file mode 100644
index 851328a..0000000
--- a/conf/machine/include/keystone.inc
+++ /dev/null
@@ -1,30 +0,0 @@
-require conf/machine/include/ti-soc.inc
-SOC_FAMILY:append = ":keystone"
-
-DEFAULTTUNE ?= "armv7athf-neon"
-require conf/machine/include/arm/armv7a/tune-cortexa15.inc
-
-PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
-
-# Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r10"
-
-KERNEL_IMAGETYPE = "zImage"
-
-UBOOT_ENTRYPOINT = "0x80008000"
-UBOOT_LOADADDRESS = "0x80008000"
-
-SPL_BINARY = "MLO"
-UBOOT_SUFFIX = "bin"
-
-# Use the expected value of the ubifs filesystem's volume name in the kernel
-# and u-boot.
-UBI_VOLNAME = "rootfs"
-
-EXTRA_IMAGEDEPENDS += "u-boot"
-EXTRA_IMAGEDEPENDS += "boot-monitor"
-
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat pci dsp"
-MACHINE_FEATURES_BACKFILL_CONSIDERED = "rtc"
diff --git a/conf/machine/k2e-evm.conf b/conf/machine/k2e-evm.conf
deleted file mode 100644
index 662f5c8..0000000
--- a/conf/machine/k2e-evm.conf
+++ /dev/null
@@ -1,32 +0,0 @@
-#@TYPE: Machine
-#@NAME: Keystone 2 K2E machine
-#@DESCRIPTION: Machine configuration for the TI Keystone 2 K2E EVM
-
-require conf/machine/include/k2e.inc
-
-KERNEL_DEVICETREE = "keystone-k2e-evm.dtb"
-
-UBOOT_MACHINE = "k2e_evm_config"
-
-BOOT_MONITOR_MAKE_TARGET = "k2e"
-
-IMAGE_FSTYPES += "ubifs ubi tar.xz"
-
-SERIAL_CONSOLES = "115200;ttyS0"
-
-SYSVINIT_ENABLED_GETTYS = ""
-
-# do ubiattach /dev/ubi_ctrl -m 4
-# From dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: logical eraseblock size:    126976 bytes
-# from ubiattach stdout:
-# UBI device number 0, total 3856 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3856"
-
-# do ubiattach /dev/ubi_ctrl -m 4
-# from dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: physical eraseblock size:   131072 bytes (128 KiB)
-# UBI: sub-page size:              2048
-UBINIZE_ARGS = "-m 2048 -p 128KiB -s 2048 -O 2048"
diff --git a/conf/machine/k2e-hs-evm.conf b/conf/machine/k2e-hs-evm.conf
deleted file mode 100644
index 1fc03d6..0000000
--- a/conf/machine/k2e-hs-evm.conf
+++ /dev/null
@@ -1,15 +0,0 @@
-#@TYPE: Machine
-#@NAME: Keystone 2 K2E HS EVM
-#@DESCRIPTION: Machine configuration for the TI Keystone 2 K2E HS EVM
-
-require conf/machine/k2e-evm.conf
-
-UBOOT_MACHINE = "k2e_hs_evm_config"
-SPL_BINARY = ""
-
-UBOOT_ENTRYPOINT = "0x82000000"
-UBOOT_LOADADDRESS = "0x82000000"
-UBOOT_RD_LOADADDRESS = "0x84000000"
-UBOOT_RD_ENTRYPOINT = "0x84000000"
-
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/k2e"
diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
deleted file mode 100644
index d4cf060..0000000
--- a/conf/machine/k2g-evm.conf
+++ /dev/null
@@ -1,35 +0,0 @@
-#@TYPE: Machine
-#@NAME: Keystone 2 K2G machine
-#@DESCRIPTION: Machine configuration for the TI Keystone 2 K2G EVM
-
-require conf/machine/include/k2g.inc
-
-MACHINE_FEATURES += "alsa"
-
-KERNEL_DEVICETREE = "keystone-k2g-evm.dtb keystone-k2g-ice.dtb \
-                     ${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'keystone-k2g-ice-pru-excl-uio.dtb', '', d)}"
-
-UBOOT_MACHINE = "k2g_evm_config"
-
-BOOT_MONITOR_MAKE_TARGET = "k2g"
-
-IMAGE_FSTYPES += "ubifs ubi tar.xz"
-
-SERIAL_CONSOLES = "115200;ttyS0"
-
-SYSVINIT_ENABLED_GETTYS = ""
-
-# do ubiattach /dev/ubi_ctrl -m 4
-# From dmesg:
-# UBI: smallest flash I/O unit:    4096
-# UBI: logical eraseblock size:    253952 bytes
-# from ubiattach stdout:
-# UBI device number 0, total 1926 LEBs
-MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 1926"
-
-# do ubiattach /dev/ubi_ctrl -m 4
-# from dmesg:
-# UBI: smallest flash I/O unit:    4096
-# UBI: physical eraseblock size:   256 KiB
-# UBI: sub-page size:              4096
-UBINIZE_ARGS = "-m 4096 -p 256KiB -s 4096 -O 4096"
diff --git a/conf/machine/k2g-hs-evm.conf b/conf/machine/k2g-hs-evm.conf
deleted file mode 100644
index 0620b1f..0000000
--- a/conf/machine/k2g-hs-evm.conf
+++ /dev/null
@@ -1,15 +0,0 @@
-#@TYPE: Machine
-#@NAME: Keystone 2 K2G HS EVM
-#@DESCRIPTION: Machine configuration for the TI Keystone 2 K2G HS EVM
-
-require conf/machine/k2g-evm.conf
-
-UBOOT_MACHINE = "k2g_hs_evm_config"
-SPL_BINARY = ""
-
-UBOOT_ENTRYPOINT = "0x82000000"
-UBOOT_LOADADDRESS = "0x82000000"
-UBOOT_RD_LOADADDRESS = "0x84000000"
-UBOOT_RD_ENTRYPOINT = "0x84000000"
-
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/k2g"
diff --git a/conf/machine/k2hk-evm.conf b/conf/machine/k2hk-evm.conf
deleted file mode 100644
index 89386f1..0000000
--- a/conf/machine/k2hk-evm.conf
+++ /dev/null
@@ -1,32 +0,0 @@
-#@TYPE: Machine
-#@NAME: Keystone 2 K2HK machine
-#@DESCRIPTION: Machine configuration for the TI Keystone 2 K2HK EVM
-
-require conf/machine/include/k2hk.inc
-
-KERNEL_DEVICETREE = "keystone-k2hk-evm.dtb"
-
-UBOOT_MACHINE = "k2hk_evm_config"
-
-BOOT_MONITOR_MAKE_TARGET = "k2hk"
-
-IMAGE_FSTYPES += "ubifs ubi tar.xz"
-
-SERIAL_CONSOLES = "115200;ttyS0"
-
-SYSVINIT_ENABLED_GETTYS = ""
-
-# do ubiattach /dev/ubi_ctrl -m 4
-# From dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: logical eraseblock size:    126976 bytes
-# from ubiattach stdout:
-# UBI device number 0, total 3856 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3856"
-
-# do ubiattach /dev/ubi_ctrl -m 4
-# from dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: physical eraseblock size:   131072 bytes (128 KiB)
-# UBI: sub-page size:              2048
-UBINIZE_ARGS = "-m 2048 -p 128KiB -s 2048 -O 2048"
diff --git a/conf/machine/k2hk-hs-evm.conf b/conf/machine/k2hk-hs-evm.conf
deleted file mode 100644
index 5c93ca4..0000000
--- a/conf/machine/k2hk-hs-evm.conf
+++ /dev/null
@@ -1,15 +0,0 @@
-#@TYPE: Machine
-#@NAME: Keystone 2 K2HK HS EVM
-#@DESCRIPTION: Machine configuration for the TI Keystone 2 K2HK HS EVM
-
-require conf/machine/k2hk-evm.conf
-
-UBOOT_MACHINE = "k2hk_hs_evm_config"
-SPL_BINARY = ""
-
-UBOOT_ENTRYPOINT = "0x82000000"
-UBOOT_LOADADDRESS = "0x82000000"
-UBOOT_RD_LOADADDRESS = "0x84000000"
-UBOOT_RD_ENTRYPOINT = "0x84000000"
-
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/k2hk"
diff --git a/conf/machine/k2l-evm.conf b/conf/machine/k2l-evm.conf
deleted file mode 100644
index dddc01f..0000000
--- a/conf/machine/k2l-evm.conf
+++ /dev/null
@@ -1,32 +0,0 @@
-#@TYPE: Machine
-#@NAME: Keystone 2 K2L machine
-#@DESCRIPTION: Machine configuration for the TI Keystone 2 K2L EVM
-
-require conf/machine/include/k2l.inc
-
-KERNEL_DEVICETREE = "keystone-k2l-evm.dtb"
-
-UBOOT_MACHINE = "k2l_evm_config"
-
-BOOT_MONITOR_MAKE_TARGET = "k2l"
-
-IMAGE_FSTYPES += "ubifs ubi tar.xz"
-
-SERIAL_CONSOLES = "115200;ttyS0"
-
-SYSVINIT_ENABLED_GETTYS = ""
-
-# do ubiattach /dev/ubi_ctrl -m 4
-# From dmesg:
-# UBI: smallest flash I/O unit:    4096
-# UBI: logical eraseblock size:    253952 bytes
-# from ubiattach stdout:
-# UBI device number 0, total 1926 LEBs
-MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 1926"
-
-# do ubiattach /dev/ubi_ctrl -m 4
-# from dmesg:
-# UBI: smallest flash I/O unit:    4096
-# UBI: physical eraseblock size:   256 KiB
-# UBI: sub-page size:              4096
-UBINIZE_ARGS = "-m 4096 -p 256KiB -s 4096 -O 4096"
diff --git a/conf/machine/k2l-hs-evm.conf b/conf/machine/k2l-hs-evm.conf
deleted file mode 100644
index 097f94d..0000000
--- a/conf/machine/k2l-hs-evm.conf
+++ /dev/null
@@ -1,15 +0,0 @@
-#@TYPE: Machine
-#@NAME: Keystone 2 K2L HS EVM
-#@DESCRIPTION: Machine configuration for the TI Keystone 2 K2L HS EVM
-
-require conf/machine/k2l-evm.conf
-
-UBOOT_MACHINE = "k2l_hs_evm_config"
-SPL_BINARY = ""
-
-UBOOT_ENTRYPOINT = "0x82000000"
-UBOOT_LOADADDRESS = "0x82000000"
-UBOOT_RD_LOADADDRESS = "0x84000000"
-UBOOT_RD_ENTRYPOINT = "0x84000000"
-
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/k2l"
-- 
2.7.4

