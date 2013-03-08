Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70717E01588
	for <meta-ti@yoctoproject.org>; Fri,  8 Mar 2013 13:18:19 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 8E8D452AB3; Fri,  8 Mar 2013 21:18:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130308211818.8E8D452AB3@arago-project.org>
Date: Fri,  8 Mar 2013 21:18:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : omap3, am37x, am3517, beagleboard: unify and cleanup configs
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Mar 2013 21:18:19 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 21ffcc76147448401f1b1aa2f04ea3678958d0fd
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=21ffcc76147448401f1b1aa2f04ea3678958d0fd

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Mar  5 16:24:39 2013 -0500

omap3, am37x, am3517, beagleboard: unify and cleanup configs

* Centralize common/SoC settings in omap3.inc SOC_FAMILY config.
* Set/override uncommon specifics in machine configs.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am3517-evm.conf   |   22 ++++------------------
 conf/machine/am37x-evm.conf    |   25 ++++---------------------
 conf/machine/beagleboard.conf  |   18 ++----------------
 conf/machine/include/omap3.inc |   23 ++++++++++++++++++++++-
 conf/machine/omap3evm.conf     |   24 +++++-------------------
 5 files changed, 37 insertions(+), 75 deletions(-)

diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
index d9ce758..0151fe9 100644
--- a/conf/machine/am3517-evm.conf
+++ b/conf/machine/am3517-evm.conf
@@ -2,19 +2,12 @@
 #@NAME: AM3517 EVM
 #@DESCRIPTION: Machine configuration for the TI Sitara AM3517 EVM
 
-PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
-XSERVER = "xserver-xorg \
-           xf86-input-evdev \
-           xf86-input-mouse \
-           xf86-input-tslib \
-           xf86-video-omapfb \
-           xf86-input-keyboard"
-
-GUI_MACHINE_CLASS = "smallscreen"
-
 require conf/machine/include/omap3.inc
 
-# Ship all kernel modules
+# Use built-in LCD by default
+XSERVER += "xf86-input-tslib"
+GUI_MACHINE_CLASS = "smallscreen"
+MACHINE_FEATURES += "touchscreen ethernet"
 
 IMAGE_FSTYPES += "ubi tar.gz"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
@@ -24,16 +17,10 @@ USE_VT = "2"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
 
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
-
-UBOOT_ARCH = "arm"
 UBOOT_MACHINE = "am3517_evm_config"
 XLOAD_MACHINE = "am3517evm_config"
 
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen ethernet sgx"
-
 # NOTE: there are NAND and OneNAND versions of this board...
-
 # do ubiattach /dev/ubi_ctrl -m 4
 # From dmesg:
 # UBI: smallest flash I/O unit:    2048
@@ -48,4 +35,3 @@ MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"
 # UBI: physical eraseblock size:   131072 bytes (128 KiB)
 # UBI: sub-page size:              512
 UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
-
diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
index 2d1d44d..3122e10 100644
--- a/conf/machine/am37x-evm.conf
+++ b/conf/machine/am37x-evm.conf
@@ -2,19 +2,12 @@
 #@NAME: AM37x EVM
 #@DESCRIPTION: Machine configuration for the TI AM37x EVM
 
-PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
-XSERVER = "xserver-xorg \
-           xf86-input-evdev \
-           xf86-input-mouse \
-           xf86-input-tslib \
-           xf86-video-omapfb \
-           xf86-input-keyboard"
-
-GUI_MACHINE_CLASS = "smallscreen"
-
 require conf/machine/include/omap3.inc
 
-# Ship all kernel modules
+# Use built-in LCD by default
+XSERVER += "xf86-input-tslib"
+GUI_MACHINE_CLASS = "smallscreen"
+MACHINE_FEATURES += "touchscreen ethernet"
 
 IMAGE_FSTYPES += "ubi tar.gz"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
@@ -23,16 +16,7 @@ SERIAL_CONSOLE = "115200 ttyO0"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
 
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
-
-UBOOT_ARCH = "arm"
-UBOOT_MACHINE = "omap3_evm_config"
-XLOAD_MACHINE = "omap3evm_config"
-
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen sgx"
-
 # NOTE: there are NAND and OneNAND versions of this board...
-
 # do ubiattach /dev/ubi_ctrl -m 4
 # From dmesg:
 # UBI: smallest flash I/O unit:    2048
@@ -47,4 +31,3 @@ MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"
 # UBI: physical eraseblock size:   131072 bytes (128 KiB)
 # UBI: sub-page size:              512
 UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
-
diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
index e8b6279..a65e360 100644
--- a/conf/machine/beagleboard.conf
+++ b/conf/machine/beagleboard.conf
@@ -2,27 +2,16 @@
 #@NAME: Beagleboard machine
 #@DESCRIPTION: Machine configuration for the http://beagleboard.org/ board 
 
-PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
-XSERVER = "xserver-xorg \
-           xf86-input-evdev \
-           xf86-input-mouse \
-           xf86-video-omapfb \
-           xf86-input-keyboard"
+require conf/machine/include/omap3.inc
 
 # Only has DVI connector for external screen
 GUI_MACHINE_CLASS = "bigscreen"
 
-require conf/machine/include/omap3.inc
-
-# SPL build
-EXTRA_IMAGEDEPENDS = "u-boot"
-
 PREFERRED_PROVIDER_virtual/kernel = "linux-mainline"
 
 IMAGE_FSTYPES += "tar.gz ubi"
-EXTRA_IMAGECMD_jffs2 = "-lnp "
+EXTRA_IMAGECMD_jffs2 = "-lnp"
 
-# Guesswork
 SERIAL_CONSOLE = "115200 ttyO2"
 
 UBOOT_MACHINE = "omap3_beagle_config"
@@ -44,9 +33,6 @@ MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"
 # UBI: sub-page size:              512
 UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
 
-# and sdio
-MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa sgx"
-
 # For a modularized kernel we want to drag in networking, sound, rtc etc."
 MACHINE_EXTRA_RRECOMMENDS = "kernel-module-smsc95xx kernel-module-snd-soc-twl4030 kernel-module-rtc-twl \
   kernel-module-snd-soc-omap kernel-module-snd-soc-omap-mcbsp kernel-module-snd-soc-omap3beagle"
diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 8ebbb08..99f0c80 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -3,15 +3,36 @@ require conf/machine/include/soc-family.inc
 
 require conf/machine/include/tune-cortexa8.inc
 
+PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
+
+# For built-in LCD, add xf86-input-tslib
+XSERVER = "xserver-xorg \
+           xf86-input-evdev \
+           xf86-input-mouse \
+           xf86-video-omapfb \
+           xf86-input-keyboard"
+
+# Default to external video, change to smallscreen for built-in LCD
+GUI_MACHINE_CLASS = "bigscreen"
+
 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR = "r123"
 
 KERNEL_IMAGETYPE = "uImage"
 
+# Default providers, may need to override for specific machines
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
 
+UBOOT_ARCH = "arm"
+UBOOT_MACHINE = "omap3_evm_config"
+XLOAD_MACHINE = "omap3evm_config"
+
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
-EXTRA_IMAGEDEPENDS += "u-boot x-load"
+# If SPL is not used, may need to add x-load
+EXTRA_IMAGEDEPENDS += "u-boot"
+
+# List common SoC features, may need to add touchscreen/ethernet for specific machines
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa sgx"
diff --git a/conf/machine/omap3evm.conf b/conf/machine/omap3evm.conf
index 0719671..a793798 100644
--- a/conf/machine/omap3evm.conf
+++ b/conf/machine/omap3evm.conf
@@ -2,19 +2,12 @@
 #@NAME: OMAP3 EVM
 #@DESCRIPTION: Machine configuration for the TI OMAP3 EVM
 
-PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
-XSERVER = "xserver-xorg \
-           xf86-input-evdev \
-           xf86-input-mouse \
-           xf86-input-tslib \
-           xf86-video-omapfb \
-           xf86-input-keyboard"
-
-GUI_MACHINE_CLASS = "smallscreen"
-
 require conf/machine/include/omap3.inc
 
-# Ship all kernel modules
+# Use built-in LCD by default
+XSERVER += "xf86-input-tslib"
+GUI_MACHINE_CLASS = "smallscreen"
+MACHINE_FEATURES += "touchscreen ethernet"
 
 IMAGE_FSTYPES += "jffs2 tar.bz2"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
@@ -24,16 +17,9 @@ USE_VT = "0"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
 
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
-
-UBOOT_ARCH = "arm"
-UBOOT_MACHINE = "omap3_evm_config"
-XLOAD_MACHINE = "omap3evm_config"
-
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen sgx"
+EXTRA_IMAGEDEPENDS += "x-load"
 
 # NOTE: there are NAND and OneNAND versions of this board...
-
 # do ubiattach /dev/ubi_ctrl -m 4
 # From dmesg:
 # UBI: smallest flash I/O unit:    2048


