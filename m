Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.20759.1643238548168364440
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 15:09:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 10C1A40CC1;
	Wed, 26 Jan 2022 23:09:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RnVUabXtyxhk; Wed, 26 Jan 2022 23:09:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DF0FD40C8E;
	Wed, 26 Jan 2022 23:09:05 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id E7D71174729;
	Wed, 26 Jan 2022 18:09:03 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC][master][PATCH 01/19] conf/machine: remove SoC/platforms in DaVinci and OMAP3/4 families
Date: Wed, 26 Jan 2022 18:08:41 -0500
Message-Id: <1643238539-20686-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643238539-20686-1-git-send-email-denis@denix.org>
References: <1643238539-20686-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Those platforms are being deprecated and not supported in future meta-ti releases.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 conf/machine/am3517-evm.conf                       | 35 ------------------
 conf/machine/am37x-evm.conf                        | 31 ----------------
 conf/machine/beagleboard.conf                      | 38 --------------------
 conf/machine/include/davinci.inc                   | 22 ------------
 conf/machine/include/omap3.inc                     | 42 ----------------------
 conf/machine/include/omap4.inc                     | 26 --------------
 conf/machine/include/omapl137.inc                  |  5 ---
 conf/machine/lego-ev3.conf                         | 22 ------------
 conf/machine/omap3evm.conf                         | 32 -----------------
 conf/machine/omap5-evm.conf                        | 34 ------------------
 conf/machine/omapl137-evm.conf                     | 15 --------
 conf/machine/pandaboard.conf                       | 16 ---------
 .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb  |  4 +--
 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb          |  4 +--
 recipes-ti/ipc/ti-ipc-common.inc                   |  1 -
 recipes-ti/ipc/ti-ipc_git.bb                       |  1 -
 16 files changed, 2 insertions(+), 326 deletions(-)
 delete mode 100644 conf/machine/am3517-evm.conf
 delete mode 100644 conf/machine/am37x-evm.conf
 delete mode 100644 conf/machine/beagleboard.conf
 delete mode 100644 conf/machine/include/davinci.inc
 delete mode 100644 conf/machine/include/omap3.inc
 delete mode 100644 conf/machine/include/omap4.inc
 delete mode 100644 conf/machine/include/omapl137.inc
 delete mode 100644 conf/machine/lego-ev3.conf
 delete mode 100644 conf/machine/omap3evm.conf
 delete mode 100644 conf/machine/omap5-evm.conf
 delete mode 100644 conf/machine/omapl137-evm.conf
 delete mode 100644 conf/machine/pandaboard.conf

diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
deleted file mode 100644
index f194c64..0000000
--- a/conf/machine/am3517-evm.conf
+++ /dev/null
@@ -1,35 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM3517 EVM
-#@DESCRIPTION: Machine configuration for the TI Sitara AM3517 EVM
-
-require conf/machine/include/omap3.inc
-
-MACHINE_GUI_CLASS = "smallscreen"
-MACHINE_FEATURES += "touchscreen ethernet"
-
-IMAGE_FSTYPES += "ubi tar.xz"
-EXTRA_IMAGECMD:jffs2 = "-lnp -e 0x20000 -s 2048"
-
-SERIAL_CONSOLES = "115200;ttyS2"
-USE_VT = "2"
-
-KERNEL_DEVICETREE = "am3517-evm.dtb"
-
-UBOOT_MACHINE = "am3517_evm_config"
-XLOAD_MACHINE = "am3517evm_config"
-
-# NOTE: there are NAND and OneNAND versions of this board...
-# do ubiattach /dev/ubi_ctrl -m 4
-# From dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: logical eraseblock size:    129024 bytes
-# from ubiattach stdout:
-# UBI device number 0, total 1996 LEBs
-MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"
-
-# do ubiattach /dev/ubi_ctrl -m 4
-# from dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: physical eraseblock size:   131072 bytes (128 KiB)
-# UBI: sub-page size:              512
-UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
deleted file mode 100644
index 9750fe6..0000000
--- a/conf/machine/am37x-evm.conf
+++ /dev/null
@@ -1,31 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM37x EVM
-#@DESCRIPTION: Machine configuration for the TI AM37x EVM
-
-require conf/machine/include/omap3.inc
-
-MACHINE_GUI_CLASS = "smallscreen"
-MACHINE_FEATURES += "touchscreen ethernet"
-
-IMAGE_FSTYPES += "ubi tar.xz"
-EXTRA_IMAGECMD:jffs2 = "-lnp -e 0x20000 -s 2048"
-
-KERNEL_DEVICETREE = "omap3-evm-37xx.dtb"
-
-SERIAL_CONSOLES = "115200;ttyS0"
-
-# NOTE: there are NAND and OneNAND versions of this board...
-# do ubiattach /dev/ubi_ctrl -m 4
-# From dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: logical eraseblock size:    129024 bytes
-# from ubiattach stdout:
-# UBI device number 0, total 1996 LEBs
-MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"
-
-# do ubiattach /dev/ubi_ctrl -m 4
-# from dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: physical eraseblock size:   131072 bytes (128 KiB)
-# UBI: sub-page size:              512
-UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
deleted file mode 100644
index 0677779..0000000
--- a/conf/machine/beagleboard.conf
+++ /dev/null
@@ -1,38 +0,0 @@
-#@TYPE: Machine
-#@NAME: Beagleboard machine
-#@DESCRIPTION: Machine configuration for the http://beagleboard.org/ board 
-
-require conf/machine/include/omap3.inc
-
-# Only has DVI connector for external screen
-MACHINE_GUI_CLASS = "bigscreen"
-
-IMAGE_FSTYPES += "tar.xz ubi"
-EXTRA_IMAGECMD:jffs2 = "-lnp"
-
-KERNEL_DEVICETREE = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-beagle-xm-ab.dtb"
-
-SERIAL_CONSOLES = "115200;ttyS2"
-
-UBOOT_MACHINE = "omap3_beagle_config"
-
-# do ubiattach /dev/ubi_ctrl -m 4
-# From dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: logical eraseblock size:    129024 bytes
-# from ubiattach stdout:
-# UBI device number 0, total 1996 LEBs
-# 
-# Beagleboard C5 has 3998 LEBS (490MiB)
-MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"
-
-# do ubiattach /dev/ubi_ctrl -m 4
-# from dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: physical eraseblock size:   131072 bytes (128 KiB)
-# UBI: sub-page size:              512
-UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
-
-# For a modularized kernel we want to drag in networking, sound, rtc etc."
-MACHINE_EXTRA_RRECOMMENDS = "kernel-module-smsc95xx kernel-module-snd-soc-twl4030 kernel-module-rtc-twl \
-  kernel-module-snd-soc-omap kernel-module-snd-soc-omap-mcbsp kernel-module-snd-soc-omap3beagle"
diff --git a/conf/machine/include/davinci.inc b/conf/machine/include/davinci.inc
deleted file mode 100644
index b8d207d..0000000
--- a/conf/machine/include/davinci.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-require conf/machine/include/arm/armv5/tune-arm926ejs.inc
-
-# Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r54"
-
-KERNEL_IMAGETYPE = "zImage"
-
-PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
-
-UBOOT_MACHINE = "davinci_dvevm_config"
-
-UBOOT_ENTRYPOINT = "0x80008000"
-UBOOT_LOADADDRESS = "0x80008000"
-
-EXTRA_IMAGEDEPENDS += "u-boot"
-
-SERIAL_CONSOLES ?= "115200;ttyS0"
-EXTRA_IMAGECMD:jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
-
-MACHINE_FEATURES = "kernel26 serial ethernet usbhost usbgadget mmc alsa"
diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
deleted file mode 100644
index 6e0d8db..0000000
--- a/conf/machine/include/omap3.inc
+++ /dev/null
@@ -1,42 +0,0 @@
-require conf/machine/include/ti-soc.inc
-SOC_FAMILY:append = ":omap3"
-
-DEFAULTTUNE ?= "armv7athf-neon"
-require conf/machine/include/arm/armv7a/tune-cortexa8.inc
-
-PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
-
-# For built-in LCD, add xf86-input-tslib
-XSERVER = "xserver-xorg \
-           xf86-input-evdev \
-           xf86-input-mouse \
-           xf86-video-fbdev \
-           xf86-input-keyboard"
-
-# Default to external video, change to smallscreen for built-in LCD
-MACHINE_GUI_CLASS = "bigscreen"
-
-# Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r127"
-
-KERNEL_IMAGETYPE = "zImage"
-
-# Default providers, may need to override for specific machines
-PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
-
-KERNEL_DEVICETREE = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-beagle-xm-ab.dtb omap3-evm.dtb omap3-evm-37xx.dtb am3517-evm.dtb"
-
-UBOOT_ARCH = "arm"
-UBOOT_MACHINE = "omap3_evm_config"
-XLOAD_MACHINE = "omap3evm_config"
-
-UBOOT_ENTRYPOINT = "0x80008000"
-UBOOT_LOADADDRESS = "0x80008000"
-
-# If SPL is not used, may need to add x-load
-EXTRA_IMAGEDEPENDS += "u-boot"
-
-# List common SoC features, may need to add touchscreen/ethernet for specific machines
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa gpu"
diff --git a/conf/machine/include/omap4.inc b/conf/machine/include/omap4.inc
deleted file mode 100644
index b8bd9d3..0000000
--- a/conf/machine/include/omap4.inc
+++ /dev/null
@@ -1,26 +0,0 @@
-require conf/machine/include/ti-soc.inc
-SOC_FAMILY:append = ":omap4"
-
-DEFAULTTUNE ?= "armv7athf-neon"
-require conf/machine/include/arm/armv7a/tune-cortexa9.inc
-
-PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
-
-PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
-XSERVER = "xserver-xorg \
-           xf86-input-evdev \
-           xf86-video-fbdev"
-
-# Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r4"
-
-KERNEL_IMAGETYPE = "zImage"
-
-UBOOT_MACHINE = "omap4_panda_config"
-
-UBOOT_ENTRYPOINT = "0x80008000"
-UBOOT_LOADADDRESS = "0x80008000"
-
-EXTRA_IMAGEDEPENDS += "u-boot"
diff --git a/conf/machine/include/omapl137.inc b/conf/machine/include/omapl137.inc
deleted file mode 100644
index 6dd4941..0000000
--- a/conf/machine/include/omapl137.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-require conf/machine/include/omapl1.inc
-SOC_FAMILY:append = ":omapl137"
-
-# Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_SOCS = "omapl137"
diff --git a/conf/machine/lego-ev3.conf b/conf/machine/lego-ev3.conf
deleted file mode 100644
index 5b89a6a..0000000
--- a/conf/machine/lego-ev3.conf
+++ /dev/null
@@ -1,22 +0,0 @@
-#@TYPE: Machine
-#@NAME: LEGO Mindstorms EV3
-#@DESCRIPTION: Machine configuration for the LEGO Mindstorms EV3
-
-require conf/machine/include/davinci.inc
-require conf/machine/include/omapl138.inc
-
-UBOOT_MACHINE = "legoev3_config"
-UBOOT_SUFFIX = "bin"
-UBOOT_ENTRYPOINT = "0xC0008000"
-UBOOT_LOADADDRESS = "0xC0008000"
-SPL_BINARY = ""
-
-KERNEL_DEVICETREE = "da850-lego-ev3.dtb"
-KERNEL_IMAGETYPES = "uImage"
-KERNEL_DEVICETREE_BUNDLE = "1"
-SERIAL_CONSOLES = "115200;ttyS1"
-
-IMAGE_FSTYPES += " wic"
-WKS_FILE ?= "sdimage-bootpart.wks"
-WIC_CREATE_EXTRA_ARGS += " --no-fstab-update"
-IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPES}"
diff --git a/conf/machine/omap3evm.conf b/conf/machine/omap3evm.conf
deleted file mode 100644
index dc56d57..0000000
--- a/conf/machine/omap3evm.conf
+++ /dev/null
@@ -1,32 +0,0 @@
-#@TYPE: Machine
-#@NAME: OMAP3 EVM
-#@DESCRIPTION: Machine configuration for the TI OMAP3 EVM
-
-require conf/machine/include/omap3.inc
-
-MACHINE_GUI_CLASS = "smallscreen"
-MACHINE_FEATURES += "touchscreen ethernet"
-
-IMAGE_FSTYPES += "jffs2 tar.xz"
-EXTRA_IMAGECMD:jffs2 = "-lnp -e 0x20000 -s 2048"
-
-SERIAL_CONSOLES = "115200;ttyS0"
-USE_VT = "0"
-
-EXTRA_IMAGEDEPENDS += "x-load"
-
-# NOTE: there are NAND and OneNAND versions of this board...
-# do ubiattach /dev/ubi_ctrl -m 4
-# From dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: logical eraseblock size:    129024 bytes
-# from ubiattach stdout:
-# UBI device number 0, total 1996 LEBs
-MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"
-
-# do ubiattach /dev/ubi_ctrl -m 4
-# from dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: physical eraseblock size:   131072 bytes (128 KiB)
-# UBI: sub-page size:              512
-UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
diff --git a/conf/machine/omap5-evm.conf b/conf/machine/omap5-evm.conf
deleted file mode 100644
index b4cec1a..0000000
--- a/conf/machine/omap5-evm.conf
+++ /dev/null
@@ -1,34 +0,0 @@
-#@TYPE: Machine
-#@NAME: OMAP5 EVM
-#@DESCRIPTION: Machine configuration for the TI OMAP5 uEVM
-
-require conf/machine/include/omap-a15.inc
-
-IMAGE_FSTYPES += "ubi tar.xz"
-
-KERNEL_DEVICETREE = "omap5-uevm.dtb"
-
-SERIAL_CONSOLES = "115200;ttyS2"
-
-# UBI information.  Note that this is board and kernel specific.  Changes
-# in your kernel port may require changes in these variables.  For more
-# details about this board please see
-# http://processors.wiki.ti.com/index.php/UBIFS_Support
-
-# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
-# From dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: logical eraseblock size:    126976 bytes
-# from ubiattach stdout:
-# UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 4300"
-
-# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
-# from dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: physical eraseblock size:   131072 bytes (128 KiB)
-# UBI: sub-page size:              512
-# UBI: VID header offset:          2048 (aligned 2048)
-UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
-
-UBOOT_MACHINE = "omap5_uevm_config"
diff --git a/conf/machine/omapl137-evm.conf b/conf/machine/omapl137-evm.conf
deleted file mode 100644
index 207b213..0000000
--- a/conf/machine/omapl137-evm.conf
+++ /dev/null
@@ -1,15 +0,0 @@
-#@TYPE: Machine
-#@NAME: OMAP-L137 EVM
-#@DESCRIPTION: Machine configuration for the TI OMAP-L137 EVM board
-
-require conf/machine/include/davinci.inc
-require conf/machine/include/omapl137.inc
-
-# HACK: The omapl137 family does not have linux kernel support.
-PREFERRED_PROVIDER_virtual/kernel ?= "linux-dummy"
-EXTRA_IMAGEDEPENDS = ""
-
-IMAGE_FSTYPES = "tar.xz"
-
-# Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_BOARDS = "evmOMAPL137"
diff --git a/conf/machine/pandaboard.conf b/conf/machine/pandaboard.conf
deleted file mode 100644
index 4dd6fa2..0000000
--- a/conf/machine/pandaboard.conf
+++ /dev/null
@@ -1,16 +0,0 @@
-#@TYPE: Machine
-#@NAME: Pandaboard
-#@DESCRIPTION: Machine configuration for the OMAP4430 Panda
-
-require conf/machine/include/omap4.inc
-
-MACHINE_GUI_CLASS = "bigscreen"
-
-IMAGE_FSTYPES += "tar.xz"
-
-KERNEL_DEVICETREE = "omap4-panda.dtb omap4-panda-a4.dtb omap4-panda-es.dtb"
-
-SERIAL_CONSOLES = "115200;ttyS2"
-
-MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
-MACHINE_FEATURES = "kernel26 wifi bluetooth alsa apm ext2 screen usbgadget usbhost vfat gpu"
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index e6247e0..51d0202 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -7,7 +7,7 @@ inherit module features_check
 
 REQUIRED_MACHINE_FEATURES = "gpu"
 
-COMPATIBLE_MACHINE = "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
 
 MACHINE_KERNEL_PR:append = "x"
 PR = "${MACHINE_KERNEL_PR}"
@@ -33,8 +33,6 @@ TARGET_PRODUCT:omap-a15 = "jacinto6evm"
 TARGET_PRODUCT:ti33x = "ti335x"
 TARGET_PRODUCT:ti43x = "ti437x"
 TARGET_PRODUCT:k3 = "ti654x"
-TARGET_PRODUCT:beagleboard = "ti343x"
-TARGET_PRODUCT:pandaboard = "ti443x"
 
 EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" TARGET_PRODUCT=${TARGET_PRODUCT} WINDOW_SYSTEM=nulldrmws'
 
diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index 9d55122..d4b7a1a 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -8,7 +8,7 @@ inherit features_check
 REQUIRED_MACHINE_FEATURES = "gpu"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
 
 PR = "r37"
 
@@ -21,8 +21,6 @@ TARGET_PRODUCT:omap-a15 = "jacinto6evm"
 TARGET_PRODUCT:ti33x = "ti335x"
 TARGET_PRODUCT:ti43x = "ti437x"
 TARGET_PRODUCT:k3 = "ti654x"
-TARGET_PRODUCT:beagleboard = "ti343x"
-TARGET_PRODUCT:pandaboard = "ti443x"
 
 INITSCRIPT_NAME = "rc.pvr"
 INITSCRIPT_PARAMS = "defaults 8"
diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
index a32aad0..1879a3f 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -6,7 +6,6 @@ COMPATIBLE_HOST ?= "null"
 COMPATIBLE_HOST:ti-soc = "(.*)"
 
 PLATFORM = "UNKNOWN"
-PLATFORM:omap5-evm = "OMAP54XX"
 PLATFORM:dra7xx = "DRA7XX"
 PLATFORM:k2hk = "TCI6638"
 PLATFORM:k2l = "TCI6630"
diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index c3a5847..ed712ba 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -15,7 +15,6 @@ SRC_URI += "file://tiipclad-daemon.sh \
            "
 
 DAEMON = "UNKNOWN"
-DAEMON:omap5-evm = "lad_omap54xx_smp"
 DAEMON:dra7xx = "lad_dra7xx"
 DAEMON:k2hk = "lad_tci6638"
 DAEMON:k2l = "lad_tci6630"
-- 
2.7.4

