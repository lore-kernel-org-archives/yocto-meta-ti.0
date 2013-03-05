Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37FF0E014CA
	for <meta-ti@yoctoproject.org>; Tue,  5 Mar 2013 14:11:33 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJ700EQAKAGFVS0@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 05 Mar 2013 16:11:17 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9630420173; Tue,
	05 Mar 2013 17:11:04 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 05 Mar 2013 17:10:30 -0500
Message-id: <1362521433-9996-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
In-reply-to: <1362521433-9996-1-git-send-email-denis@denix.org>
References: <1362521433-9996-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/5] ti33x, am335x, beaglebone: unify and cleanup configs
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
X-List-Received-Date: Tue, 05 Mar 2013 22:11:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Centralize common/SoC settings in ti33x.inc SOC_FAMILY config.
* Set/override uncommon specifics in machine configs.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am335x-evm.conf   | 17 ++++-------------
 conf/machine/beaglebone.conf   | 14 ++------------
 conf/machine/include/ti33x.inc | 19 +++++++++++++++++++
 3 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index 2889358..91f7e54 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -2,14 +2,12 @@
 #@NAME: AM335x EVM
 #@DESCRIPTION: Machine configuration for the TI AM335x EVM
 
-PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
-XSERVER = "xserver-xorg \
-           xf86-input-evdev \
-           xf86-video-fbdev"
+require conf/machine/include/ti33x.inc
 
+# Use built-in LCD by default
+XSERVER += "xf86-input-tslib"
 GUI_MACHINE_CLASS = "smallscreen"
-
-require conf/machine/include/ti33x.inc
+MACHINE_FEATURES += "touchscreen"
 
 IMAGE_FSTYPES += "ubi tar.gz"
 
@@ -37,10 +35,3 @@ MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3836"
 # UBI: sub-page size:              512
 # UBI: VID header offset:          2048 (aligned 2048)
 UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
-
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
-
-UBOOT_ARCH = "arm"
-UBOOT_MACHINE = "am335x_evm_config"
-
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen sgx"
diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index 43af461..dc77dd7 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -2,25 +2,15 @@
 #@NAME: BeagleBone machine
 #@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone board 
 
-PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
-XSERVER = "xserver-xorg \
-           xf86-input-evdev \
-           xf86-video-fbdev"
+require conf/machine/include/ti33x.inc
 
 # Only has DVI connector for external screen
 GUI_MACHINE_CLASS = "bigscreen"
 
-require conf/machine/include/ti33x.inc
-EXTRA_IMAGEDEPENDS = "u-boot"
-
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
 
-IMAGE_FSTYPES += "tar.bz2 "
+IMAGE_FSTYPES += "tar.bz2"
 
-# Guesswork
 SERIAL_CONSOLE = "115200 ttyO0"
 
 UBOOT_MACHINE = "am335x_evm_config"
-
-# and sdio
-MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa sgx"
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 93c5042..cf49721 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -3,15 +3,34 @@ require conf/machine/include/soc-family.inc
 
 require conf/machine/include/tune-cortexa8.inc
 
+PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
+
+# For built-in LCD, add xf86-input-tslib
+XSERVER = "xserver-xorg \
+           xf86-input-evdev \
+           xf86-input-mouse \
+           xf86-video-fbdev \
+           xf86-input-keyboard"
+
+# Default to external video, change to smallscreen for built-in LCD
+GUI_MACHINE_CLASS = "bigscreen"
+
 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR = "r17"
 
+# Default providers, may need to override for specific machines
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
 
 KERNEL_IMAGETYPE = "uImage"
 
+UBOOT_ARCH = "arm"
+UBOOT_MACHINE = "am335x_evm_config"
+
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
 EXTRA_IMAGEDEPENDS += "u-boot"
+
+# List common SoC features, may need to add touchscreen for specific machines
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet sgx"
-- 
1.8.1.5


