Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3361CE002AB
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 18:46:50 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id BCC0252A51; Tue, 26 Feb 2013 02:46:49 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130226024649.BCC0252A51@arago-project.org>
Date: Tue, 26 Feb 2013 02:46:49 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : machine configs: Add SGX to MACHINE_FEATURES
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
X-List-Received-Date: Tue, 26 Feb 2013 02:46:50 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: e851afed41ab2d29fc5f91a527a971e32c013118
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e851afed41ab2d29fc5f91a527a971e32c013118

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Mon Feb 18 22:45:16 2013 -0600

machine configs: Add SGX to MACHINE_FEATURES

* Add sgx to MACHINE_FEATURES to indicate that a particular machine supports
  sgx.
* TI chips are available in multiple variants including some that supports sgx
  while others do not.
* By adding sgx as a machine feature other layers can create generic
  packagegroups or images for a particular soc but will only include sgx
  dependencies if the particular machine has sgx support.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am335x-evm.conf      |    2 +-
 conf/machine/am3517-evm.conf      |    2 +-
 conf/machine/am37x-evm.conf       |    2 +-
 conf/machine/am387x-evm.conf      |    2 ++
 conf/machine/am389x-evm.conf      |    2 ++
 conf/machine/beagleboard.conf     |    2 +-
 conf/machine/beaglebone.conf      |    2 +-
 conf/machine/c6a814x-evm.conf     |    2 ++
 conf/machine/c6a816x-evm.conf     |    2 ++
 conf/machine/dm814x-evm.conf      |    2 ++
 conf/machine/omap3-touchbook.conf |    2 +-
 conf/machine/omap3evm.conf        |    2 +-
 conf/machine/pandaboard.conf      |    2 +-
 13 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index cd30594..2889358 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -43,4 +43,4 @@ PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
 UBOOT_ARCH = "arm"
 UBOOT_MACHINE = "am335x_evm_config"
 
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen"
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen sgx"
diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
index 536d337..d9ce758 100644
--- a/conf/machine/am3517-evm.conf
+++ b/conf/machine/am3517-evm.conf
@@ -30,7 +30,7 @@ UBOOT_ARCH = "arm"
 UBOOT_MACHINE = "am3517_evm_config"
 XLOAD_MACHINE = "am3517evm_config"
 
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen ethernet"
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen ethernet sgx"
 
 # NOTE: there are NAND and OneNAND versions of this board...
 
diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
index 866abc5..2d1d44d 100644
--- a/conf/machine/am37x-evm.conf
+++ b/conf/machine/am37x-evm.conf
@@ -29,7 +29,7 @@ UBOOT_ARCH = "arm"
 UBOOT_MACHINE = "omap3_evm_config"
 XLOAD_MACHINE = "omap3evm_config"
 
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen"
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen sgx"
 
 # NOTE: there are NAND and OneNAND versions of this board...
 
diff --git a/conf/machine/am387x-evm.conf b/conf/machine/am387x-evm.conf
index 5d9cc8f..b2df370 100644
--- a/conf/machine/am387x-evm.conf
+++ b/conf/machine/am387x-evm.conf
@@ -5,3 +5,5 @@
 require conf/machine/include/ti814x.inc
 
 IMAGE_FSTYPES += "ubi tar.gz"
+
+MACHINE_FEATURES += "sgx"
diff --git a/conf/machine/am389x-evm.conf b/conf/machine/am389x-evm.conf
index 2a84cad..3b2145d 100644
--- a/conf/machine/am389x-evm.conf
+++ b/conf/machine/am389x-evm.conf
@@ -5,3 +5,5 @@
 require conf/machine/include/ti816x.inc
 
 IMAGE_FSTYPES += "ubi tar.gz"
+
+MACHINE_FEATURES += "sgx"
diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
index 8f84c6c..e8b6279 100644
--- a/conf/machine/beagleboard.conf
+++ b/conf/machine/beagleboard.conf
@@ -45,7 +45,7 @@ MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"
 UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
 
 # and sdio
-MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
+MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa sgx"
 
 # For a modularized kernel we want to drag in networking, sound, rtc etc."
 MACHINE_EXTRA_RRECOMMENDS = "kernel-module-smsc95xx kernel-module-snd-soc-twl4030 kernel-module-rtc-twl \
diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index 3803edf..43af461 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -23,4 +23,4 @@ SERIAL_CONSOLE = "115200 ttyO0"
 UBOOT_MACHINE = "am335x_evm_config"
 
 # and sdio
-MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
+MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa sgx"
diff --git a/conf/machine/c6a814x-evm.conf b/conf/machine/c6a814x-evm.conf
index b85c489..a81d7fd 100644
--- a/conf/machine/c6a814x-evm.conf
+++ b/conf/machine/c6a814x-evm.conf
@@ -3,3 +3,5 @@
 #@DESCRIPTION: Machine configuration for the c6a814x evm
 
 require conf/machine/include/ti814x.inc
+
+MACHINE_FEATURES += "sgx"
diff --git a/conf/machine/c6a816x-evm.conf b/conf/machine/c6a816x-evm.conf
index a7ab9b0..380c4b8 100644
--- a/conf/machine/c6a816x-evm.conf
+++ b/conf/machine/c6a816x-evm.conf
@@ -3,3 +3,5 @@
 #@DESCRIPTION: Machine configuration for the c6a816x evm
 
 require conf/machine/include/ti816x.inc
+
+MACHINE_FEATURES += "sgx"
diff --git a/conf/machine/dm814x-evm.conf b/conf/machine/dm814x-evm.conf
index 140dcc1..4fa1e24 100644
--- a/conf/machine/dm814x-evm.conf
+++ b/conf/machine/dm814x-evm.conf
@@ -3,3 +3,5 @@
 #@DESCRIPTION: Machine configuration for the DM814x evm
 
 require conf/machine/include/ti814x.inc
+
+MACHINE_FEATURES += "sgx"
diff --git a/conf/machine/omap3-touchbook.conf b/conf/machine/omap3-touchbook.conf
index 8439e0a..6c52d9e 100644
--- a/conf/machine/omap3-touchbook.conf
+++ b/conf/machine/omap3-touchbook.conf
@@ -43,4 +43,4 @@ MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"
 UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
 
 # and sdio
-MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa touchscreen"
+MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa touchscreen sgx"
diff --git a/conf/machine/omap3evm.conf b/conf/machine/omap3evm.conf
index dfedf0f..0719671 100644
--- a/conf/machine/omap3evm.conf
+++ b/conf/machine/omap3evm.conf
@@ -30,7 +30,7 @@ UBOOT_ARCH = "arm"
 UBOOT_MACHINE = "omap3_evm_config"
 XLOAD_MACHINE = "omap3evm_config"
 
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen"
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen sgx"
 
 # NOTE: there are NAND and OneNAND versions of this board...
 
diff --git a/conf/machine/pandaboard.conf b/conf/machine/pandaboard.conf
index 2c37b4f..3ebd6d9 100644
--- a/conf/machine/pandaboard.conf
+++ b/conf/machine/pandaboard.conf
@@ -13,6 +13,6 @@ IMAGE_FSTYPES += "tar.bz2"
 SERIAL_CONSOLE = "115200 ttyO2"
 
 MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
-MACHINE_FEATURES = "kernel26 wifi bluetooth alsa apm ext2 screen touchscreen usbgadget usbhost vfat"
+MACHINE_FEATURES = "kernel26 wifi bluetooth alsa apm ext2 screen touchscreen usbgadget usbhost vfat sgx"
 
 


