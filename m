Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.8934.1645503196374859894
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:13:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6B4B540C52
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rY4pKcWzb4Fm for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:13:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 485E840C2E
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:15 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 01AB117476C
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:13:15 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 01/19] conf/machine: remove SoC/platforms in DaVinci and OMAP3/4 families
Date: Tue, 22 Feb 2022 04:12:56 +0000
Message-Id: <20220222041314.2840028-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041314.2840028-1-denis@denix.org>
References: <20220222041314.2840028-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Those platforms are being deprecated and not supported in future meta-ti =
releases.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 conf/machine/am3517-evm.conf                  | 35 ----------------
 conf/machine/am37x-evm.conf                   | 31 --------------
 conf/machine/beagleboard.conf                 | 38 -----------------
 conf/machine/include/davinci.inc              | 22 ----------
 conf/machine/include/omap3.inc                | 42 -------------------
 conf/machine/include/omap4.inc                | 26 ------------
 conf/machine/include/omapl137.inc             |  5 ---
 conf/machine/lego-ev3.conf                    | 22 ----------
 conf/machine/omap3evm.conf                    | 32 --------------
 conf/machine/omap5-evm.conf                   | 34 ---------------
 conf/machine/omapl137-evm.conf                | 15 -------
 conf/machine/pandaboard.conf                  | 16 -------
 .../ti-sgx-ddk-km_1.17.4948957.bb             |  4 +-
 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     |  4 +-
 recipes-ti/ipc/ti-ipc-common.inc              |  1 -
 recipes-ti/ipc/ti-ipc_git.bb                  |  1 -
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
index f194c648..00000000
--- a/conf/machine/am3517-evm.conf
+++ /dev/null
@@ -1,35 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM3517 EVM
-#@DESCRIPTION: Machine configuration for the TI Sitara AM3517 EVM
-
-require conf/machine/include/omap3.inc
-
-MACHINE_GUI_CLASS =3D "smallscreen"
-MACHINE_FEATURES +=3D "touchscreen ethernet"
-
-IMAGE_FSTYPES +=3D "ubi tar.xz"
-EXTRA_IMAGECMD:jffs2 =3D "-lnp -e 0x20000 -s 2048"
-
-SERIAL_CONSOLES =3D "115200;ttyS2"
-USE_VT =3D "2"
-
-KERNEL_DEVICETREE =3D "am3517-evm.dtb"
-
-UBOOT_MACHINE =3D "am3517_evm_config"
-XLOAD_MACHINE =3D "am3517evm_config"
-
-# NOTE: there are NAND and OneNAND versions of this board...
-# do ubiattach /dev/ubi_ctrl -m 4
-# From dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: logical eraseblock size:    129024 bytes
-# from ubiattach stdout:
-# UBI device number 0, total 1996 LEBs
-MKUBIFS_ARGS =3D "-m 2048 -e 129024 -c 1996"
-
-# do ubiattach /dev/ubi_ctrl -m 4
-# from dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: physical eraseblock size:   131072 bytes (128 KiB)
-# UBI: sub-page size:              512
-UBINIZE_ARGS =3D "-m 2048 -p 128KiB -s 512"
diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
deleted file mode 100644
index 9750fe64..00000000
--- a/conf/machine/am37x-evm.conf
+++ /dev/null
@@ -1,31 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM37x EVM
-#@DESCRIPTION: Machine configuration for the TI AM37x EVM
-
-require conf/machine/include/omap3.inc
-
-MACHINE_GUI_CLASS =3D "smallscreen"
-MACHINE_FEATURES +=3D "touchscreen ethernet"
-
-IMAGE_FSTYPES +=3D "ubi tar.xz"
-EXTRA_IMAGECMD:jffs2 =3D "-lnp -e 0x20000 -s 2048"
-
-KERNEL_DEVICETREE =3D "omap3-evm-37xx.dtb"
-
-SERIAL_CONSOLES =3D "115200;ttyS0"
-
-# NOTE: there are NAND and OneNAND versions of this board...
-# do ubiattach /dev/ubi_ctrl -m 4
-# From dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: logical eraseblock size:    129024 bytes
-# from ubiattach stdout:
-# UBI device number 0, total 1996 LEBs
-MKUBIFS_ARGS =3D "-m 2048 -e 129024 -c 1996"
-
-# do ubiattach /dev/ubi_ctrl -m 4
-# from dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: physical eraseblock size:   131072 bytes (128 KiB)
-# UBI: sub-page size:              512
-UBINIZE_ARGS =3D "-m 2048 -p 128KiB -s 512"
diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.con=
f
deleted file mode 100644
index 06777795..00000000
--- a/conf/machine/beagleboard.conf
+++ /dev/null
@@ -1,38 +0,0 @@
-#@TYPE: Machine
-#@NAME: Beagleboard machine
-#@DESCRIPTION: Machine configuration for the http://beagleboard.org/ boa=
rd=20
-
-require conf/machine/include/omap3.inc
-
-# Only has DVI connector for external screen
-MACHINE_GUI_CLASS =3D "bigscreen"
-
-IMAGE_FSTYPES +=3D "tar.xz ubi"
-EXTRA_IMAGECMD:jffs2 =3D "-lnp"
-
-KERNEL_DEVICETREE =3D "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-beagle=
-xm-ab.dtb"
-
-SERIAL_CONSOLES =3D "115200;ttyS2"
-
-UBOOT_MACHINE =3D "omap3_beagle_config"
-
-# do ubiattach /dev/ubi_ctrl -m 4
-# From dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: logical eraseblock size:    129024 bytes
-# from ubiattach stdout:
-# UBI device number 0, total 1996 LEBs
-#=20
-# Beagleboard C5 has 3998 LEBS (490MiB)
-MKUBIFS_ARGS =3D "-m 2048 -e 129024 -c 1996"
-
-# do ubiattach /dev/ubi_ctrl -m 4
-# from dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: physical eraseblock size:   131072 bytes (128 KiB)
-# UBI: sub-page size:              512
-UBINIZE_ARGS =3D "-m 2048 -p 128KiB -s 512"
-
-# For a modularized kernel we want to drag in networking, sound, rtc etc=
."
-MACHINE_EXTRA_RRECOMMENDS =3D "kernel-module-smsc95xx kernel-module-snd-=
soc-twl4030 kernel-module-rtc-twl \
-  kernel-module-snd-soc-omap kernel-module-snd-soc-omap-mcbsp kernel-mod=
ule-snd-soc-omap3beagle"
diff --git a/conf/machine/include/davinci.inc b/conf/machine/include/davi=
nci.inc
deleted file mode 100644
index b8d207de..00000000
--- a/conf/machine/include/davinci.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-require conf/machine/include/arm/armv5/tune-arm926ejs.inc
-
-# Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR =3D "r54"
-
-KERNEL_IMAGETYPE =3D "zImage"
-
-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
-PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
-
-UBOOT_MACHINE =3D "davinci_dvevm_config"
-
-UBOOT_ENTRYPOINT =3D "0x80008000"
-UBOOT_LOADADDRESS =3D "0x80008000"
-
-EXTRA_IMAGEDEPENDS +=3D "u-boot"
-
-SERIAL_CONSOLES ?=3D "115200;ttyS0"
-EXTRA_IMAGECMD:jffs2 =3D "--pad --little-endian --eraseblock=3D0x20000 -=
n"
-
-MACHINE_FEATURES =3D "kernel26 serial ethernet usbhost usbgadget mmc als=
a"
diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.=
inc
deleted file mode 100644
index 6e0d8dbc..00000000
--- a/conf/machine/include/omap3.inc
+++ /dev/null
@@ -1,42 +0,0 @@
-require conf/machine/include/ti-soc.inc
-SOC_FAMILY:append =3D ":omap3"
-
-DEFAULTTUNE ?=3D "armv7athf-neon"
-require conf/machine/include/arm/armv7a/tune-cortexa8.inc
-
-PREFERRED_PROVIDER_virtual/xserver =3D "xserver-xorg"
-
-# For built-in LCD, add xf86-input-tslib
-XSERVER =3D "xserver-xorg \
-           xf86-input-evdev \
-           xf86-input-mouse \
-           xf86-video-fbdev \
-           xf86-input-keyboard"
-
-# Default to external video, change to smallscreen for built-in LCD
-MACHINE_GUI_CLASS =3D "bigscreen"
-
-# Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR =3D "r127"
-
-KERNEL_IMAGETYPE =3D "zImage"
-
-# Default providers, may need to override for specific machines
-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
-PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
-
-KERNEL_DEVICETREE =3D "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-beagle=
-xm-ab.dtb omap3-evm.dtb omap3-evm-37xx.dtb am3517-evm.dtb"
-
-UBOOT_ARCH =3D "arm"
-UBOOT_MACHINE =3D "omap3_evm_config"
-XLOAD_MACHINE =3D "omap3evm_config"
-
-UBOOT_ENTRYPOINT =3D "0x80008000"
-UBOOT_LOADADDRESS =3D "0x80008000"
-
-# If SPL is not used, may need to add x-load
-EXTRA_IMAGEDEPENDS +=3D "u-boot"
-
-# List common SoC features, may need to add touchscreen/ethernet for spe=
cific machines
-MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen al=
sa gpu"
diff --git a/conf/machine/include/omap4.inc b/conf/machine/include/omap4.=
inc
deleted file mode 100644
index b8bd9d37..00000000
--- a/conf/machine/include/omap4.inc
+++ /dev/null
@@ -1,26 +0,0 @@
-require conf/machine/include/ti-soc.inc
-SOC_FAMILY:append =3D ":omap4"
-
-DEFAULTTUNE ?=3D "armv7athf-neon"
-require conf/machine/include/arm/armv7a/tune-cortexa9.inc
-
-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
-PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
-
-PREFERRED_PROVIDER_virtual/xserver =3D "xserver-xorg"
-XSERVER =3D "xserver-xorg \
-           xf86-input-evdev \
-           xf86-video-fbdev"
-
-# Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR =3D "r4"
-
-KERNEL_IMAGETYPE =3D "zImage"
-
-UBOOT_MACHINE =3D "omap4_panda_config"
-
-UBOOT_ENTRYPOINT =3D "0x80008000"
-UBOOT_LOADADDRESS =3D "0x80008000"
-
-EXTRA_IMAGEDEPENDS +=3D "u-boot"
diff --git a/conf/machine/include/omapl137.inc b/conf/machine/include/oma=
pl137.inc
deleted file mode 100644
index 6dd49418..00000000
--- a/conf/machine/include/omapl137.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-require conf/machine/include/omapl1.inc
-SOC_FAMILY:append =3D ":omapl137"
-
-# Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_SOCS =3D "omapl137"
diff --git a/conf/machine/lego-ev3.conf b/conf/machine/lego-ev3.conf
deleted file mode 100644
index 5b89a6a7..00000000
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
-UBOOT_MACHINE =3D "legoev3_config"
-UBOOT_SUFFIX =3D "bin"
-UBOOT_ENTRYPOINT =3D "0xC0008000"
-UBOOT_LOADADDRESS =3D "0xC0008000"
-SPL_BINARY =3D ""
-
-KERNEL_DEVICETREE =3D "da850-lego-ev3.dtb"
-KERNEL_IMAGETYPES =3D "uImage"
-KERNEL_DEVICETREE_BUNDLE =3D "1"
-SERIAL_CONSOLES =3D "115200;ttyS1"
-
-IMAGE_FSTYPES +=3D " wic"
-WKS_FILE ?=3D "sdimage-bootpart.wks"
-WIC_CREATE_EXTRA_ARGS +=3D " --no-fstab-update"
-IMAGE_BOOT_FILES =3D "${KERNEL_IMAGETYPES}"
diff --git a/conf/machine/omap3evm.conf b/conf/machine/omap3evm.conf
deleted file mode 100644
index dc56d57a..00000000
--- a/conf/machine/omap3evm.conf
+++ /dev/null
@@ -1,32 +0,0 @@
-#@TYPE: Machine
-#@NAME: OMAP3 EVM
-#@DESCRIPTION: Machine configuration for the TI OMAP3 EVM
-
-require conf/machine/include/omap3.inc
-
-MACHINE_GUI_CLASS =3D "smallscreen"
-MACHINE_FEATURES +=3D "touchscreen ethernet"
-
-IMAGE_FSTYPES +=3D "jffs2 tar.xz"
-EXTRA_IMAGECMD:jffs2 =3D "-lnp -e 0x20000 -s 2048"
-
-SERIAL_CONSOLES =3D "115200;ttyS0"
-USE_VT =3D "0"
-
-EXTRA_IMAGEDEPENDS +=3D "x-load"
-
-# NOTE: there are NAND and OneNAND versions of this board...
-# do ubiattach /dev/ubi_ctrl -m 4
-# From dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: logical eraseblock size:    129024 bytes
-# from ubiattach stdout:
-# UBI device number 0, total 1996 LEBs
-MKUBIFS_ARGS =3D "-m 2048 -e 129024 -c 1996"
-
-# do ubiattach /dev/ubi_ctrl -m 4
-# from dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: physical eraseblock size:   131072 bytes (128 KiB)
-# UBI: sub-page size:              512
-UBINIZE_ARGS =3D "-m 2048 -p 128KiB -s 512"
diff --git a/conf/machine/omap5-evm.conf b/conf/machine/omap5-evm.conf
deleted file mode 100644
index b4cec1a2..00000000
--- a/conf/machine/omap5-evm.conf
+++ /dev/null
@@ -1,34 +0,0 @@
-#@TYPE: Machine
-#@NAME: OMAP5 EVM
-#@DESCRIPTION: Machine configuration for the TI OMAP5 uEVM
-
-require conf/machine/include/omap-a15.inc
-
-IMAGE_FSTYPES +=3D "ubi tar.xz"
-
-KERNEL_DEVICETREE =3D "omap5-uevm.dtb"
-
-SERIAL_CONSOLES =3D "115200;ttyS2"
-
-# UBI information.  Note that this is board and kernel specific.  Change=
s
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
-MKUBIFS_ARGS =3D "-F -m 2048 -e 126976 -c 4300"
-
-# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
-# from dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: physical eraseblock size:   131072 bytes (128 KiB)
-# UBI: sub-page size:              512
-# UBI: VID header offset:          2048 (aligned 2048)
-UBINIZE_ARGS =3D "-m 2048 -p 128KiB -s 512 -O 2048"
-
-UBOOT_MACHINE =3D "omap5_uevm_config"
diff --git a/conf/machine/omapl137-evm.conf b/conf/machine/omapl137-evm.c=
onf
deleted file mode 100644
index 207b213a..00000000
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
-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-dummy"
-EXTRA_IMAGEDEPENDS =3D ""
-
-IMAGE_FSTYPES =3D "tar.xz"
-
-# Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_BOARDS =3D "evmOMAPL137"
diff --git a/conf/machine/pandaboard.conf b/conf/machine/pandaboard.conf
deleted file mode 100644
index 4dd6fa29..00000000
--- a/conf/machine/pandaboard.conf
+++ /dev/null
@@ -1,16 +0,0 @@
-#@TYPE: Machine
-#@NAME: Pandaboard
-#@DESCRIPTION: Machine configuration for the OMAP4430 Panda
-
-require conf/machine/include/omap4.inc
-
-MACHINE_GUI_CLASS =3D "bigscreen"
-
-IMAGE_FSTYPES +=3D "tar.xz"
-
-KERNEL_DEVICETREE =3D "omap4-panda.dtb omap4-panda-a4.dtb omap4-panda-es=
.dtb"
-
-SERIAL_CONSOLES =3D "115200;ttyS2"
-
-MACHINE_EXTRA_RRECOMMENDS =3D " kernel-modules"
-MACHINE_FEATURES =3D "kernel26 wifi bluetooth alsa apm ext2 screen usbga=
dget usbhost vfat gpu"
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/=
recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index 5657408f..5fe6c201 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -7,7 +7,7 @@ inherit module features_check
=20
 REQUIRED_MACHINE_FEATURES =3D "gpu"
=20
-COMPATIBLE_MACHINE =3D "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
+COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k3"
=20
 MACHINE_KERNEL_PR:append =3D "x"
 PR =3D "${MACHINE_KERNEL_PR}"
@@ -30,8 +30,6 @@ TARGET_PRODUCT:omap-a15 =3D "jacinto6evm"
 TARGET_PRODUCT:ti33x =3D "ti335x"
 TARGET_PRODUCT:ti43x =3D "ti437x"
 TARGET_PRODUCT:k3 =3D "ti654x"
-TARGET_PRODUCT:beagleboard =3D "ti343x"
-TARGET_PRODUCT:pandaboard =3D "ti443x"
=20
 EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${STAGING_KERNEL_DIR}" TARGET_PRODUCT=3D=
${TARGET_PRODUCT} WINDOW_SYSTEM=3Dnulldrmws'
=20
diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/rec=
ipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index 9d55122c..d4b7a1a6 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -8,7 +8,7 @@ inherit features_check
 REQUIRED_MACHINE_FEATURES =3D "gpu"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE =3D "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
+COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k3"
=20
 PR =3D "r37"
=20
@@ -21,8 +21,6 @@ TARGET_PRODUCT:omap-a15 =3D "jacinto6evm"
 TARGET_PRODUCT:ti33x =3D "ti335x"
 TARGET_PRODUCT:ti43x =3D "ti437x"
 TARGET_PRODUCT:k3 =3D "ti654x"
-TARGET_PRODUCT:beagleboard =3D "ti343x"
-TARGET_PRODUCT:pandaboard =3D "ti443x"
=20
 INITSCRIPT_NAME =3D "rc.pvr"
 INITSCRIPT_PARAMS =3D "defaults 8"
diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-com=
mon.inc
index a32aad09..1879a3f2 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -6,7 +6,6 @@ COMPATIBLE_HOST ?=3D "null"
 COMPATIBLE_HOST:ti-soc =3D "(.*)"
=20
 PLATFORM =3D "UNKNOWN"
-PLATFORM:omap5-evm =3D "OMAP54XX"
 PLATFORM:dra7xx =3D "DRA7XX"
 PLATFORM:k2hk =3D "TCI6638"
 PLATFORM:k2l =3D "TCI6630"
diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index c3a58472..ed712bab 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -15,7 +15,6 @@ SRC_URI +=3D "file://tiipclad-daemon.sh \
            "
=20
 DAEMON =3D "UNKNOWN"
-DAEMON:omap5-evm =3D "lad_omap54xx_smp"
 DAEMON:dra7xx =3D "lad_dra7xx"
 DAEMON:k2hk =3D "lad_tci6638"
 DAEMON:k2l =3D "lad_tci6630"
--=20
2.25.1

