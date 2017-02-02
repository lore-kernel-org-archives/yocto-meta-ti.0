Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B121E009CF; Thu,  2 Feb 2017 15:35:33 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01D38E009C3
	for <meta-ti@yoctoproject.org>; Thu,  2 Feb 2017 15:35:30 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 21E4C52B2E; Thu,  2 Feb 2017 23:35:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170202233529.21E4C52B2E@arago-project.org>
Date: Thu,  2 Feb 2017 23:35:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : conf/machine: set KERNEL_DEVICETREE dtb list per machine
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
X-List-Received-Date: Thu, 02 Feb 2017 23:35:33 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: morty
Commit: ca30444d7223477c897c9b30577bfade8dfd40ef
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ca30444d7223477c897c9b30577bfade8dfd40ef

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Feb  2 04:36:53 2017 +0000

conf/machine: set KERNEL_DEVICETREE dtb list per machine

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am3517-evm.conf   |    2 ++
 conf/machine/am37x-evm.conf    |    2 ++
 conf/machine/am57xx-evm.conf   |    5 +++++
 conf/machine/beagleboard.conf  |    2 ++
 conf/machine/beaglebone.conf   |    2 ++
 conf/machine/dra7xx-evm.conf   |    5 +++++
 conf/machine/include/omap3.inc |    2 ++
 conf/machine/include/ti33x.inc |    2 ++
 conf/machine/include/ti43x.inc |    2 ++
 conf/machine/k2e-evm.conf      |    2 ++
 conf/machine/k2g-evm.conf      |    2 ++
 conf/machine/k2hk-evm.conf     |    2 ++
 conf/machine/k2l-evm.conf      |    2 ++
 conf/machine/omap5-evm.conf    |    2 ++
 conf/machine/pandaboard.conf   |    2 ++
 15 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
index 4fef634..883e9a4 100644
--- a/conf/machine/am3517-evm.conf
+++ b/conf/machine/am3517-evm.conf
@@ -15,6 +15,8 @@ EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 SERIAL_CONSOLE = "115200 ttyO2"
 USE_VT = "2"
 
+KERNEL_DEVICETREE = "am3517-evm.dtb"
+
 UBOOT_MACHINE = "am3517_evm_config"
 XLOAD_MACHINE = "am3517evm_config"
 
diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
index 99adb08..c1776df 100644
--- a/conf/machine/am37x-evm.conf
+++ b/conf/machine/am37x-evm.conf
@@ -12,6 +12,8 @@ MACHINE_FEATURES += "touchscreen ethernet"
 IMAGE_FSTYPES += "ubi tar.gz"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
+KERNEL_DEVICETREE = "omap3-evm-37xx.dtb"
+
 SERIAL_CONSOLE = "115200 ttyO0"
 
 # NOTE: there are NAND and OneNAND versions of this board...
diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 98698e6..ec63418 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -12,6 +12,11 @@ SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyO2"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
+KERNEL_DEVICETREE = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb \
+                    am57xx-evm.dtb am57xx-evm-reva3.dtb \
+                    am571x-idk.dtb \
+                    am572x-idk.dtb"
+
 UBOOT_MACHINE = "am57xx_evm_config"
 
 # UBI information.  Note that this is board and kernel specific.  Changes
diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
index 955961f..4f05a0e 100644
--- a/conf/machine/beagleboard.conf
+++ b/conf/machine/beagleboard.conf
@@ -10,6 +10,8 @@ MACHINE_GUI_CLASS = "bigscreen"
 IMAGE_FSTYPES += "tar.gz ubi"
 EXTRA_IMAGECMD_jffs2 = "-lnp"
 
+KERNEL_DEVICETREE = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-beagle-xm-ab.dtb"
+
 SERIAL_CONSOLE = "115200 ttyO2"
 
 UBOOT_MACHINE = "omap3_beagle_config"
diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index e168560..72f3ba5 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -5,6 +5,8 @@
 require conf/machine/include/ti33x.inc
 require conf/machine/include/beaglebone.inc
 
+KERNEL_DEVICETREE = "am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
+
 # Only has DVI connector for external screen
 MACHINE_GUI_CLASS = "bigscreen"
 
diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index 09f758d..6049914 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -12,6 +12,11 @@ SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
+KERNEL_DEVICETREE = "dra7-evm.dtb \
+                    dra72-evm.dtb \
+                    dra72-evm-revc.dtb \
+                    dra71-evm.dtb"
+
 UBOOT_MACHINE = "dra7xx_evm_config"
 
 # UBI information.  Note that this is board and kernel specific.  Changes
diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 4fe4cb3..8c6423d 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -26,6 +26,8 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
+KERNEL_DEVICETREE = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-beagle-xm-ab.dtb omap3-evm.dtb omap3-evm-37xx.dtb am3517-evm.dtb"
+
 UBOOT_ARCH = "arm"
 UBOOT_MACHINE = "omap3_evm_config"
 XLOAD_MACHINE = "omap3evm_config"
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 6d1a45b..73d9aa4 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -26,6 +26,8 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
 KERNEL_IMAGETYPE = "zImage"
 
+KERNEL_DEVICETREE = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb am335x-icev2.dtb"
+
 UBOOT_ARCH = "arm"
 UBOOT_MACHINE = "am335x_evm_config"
 
diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index 807a42e..8f2e11f 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -26,6 +26,8 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
 KERNEL_IMAGETYPE = "zImage"
 
+KERNEL_DEVICETREE = "am43x-epos-evm.dtb am437x-gp-evm.dtb am437x-sk-evm.dtb am437x-idk-evm.dtb"
+
 UBOOT_ARCH = "arm"
 UBOOT_MACHINE = "am43xx_evm_config"
 
diff --git a/conf/machine/k2e-evm.conf b/conf/machine/k2e-evm.conf
index 43362dd..530e6dc 100644
--- a/conf/machine/k2e-evm.conf
+++ b/conf/machine/k2e-evm.conf
@@ -6,6 +6,8 @@ require conf/machine/include/k2e.inc
 
 MACHINE_FEATURES += "opencl"
 
+KERNEL_DEVICETREE = "keystone-k2e-evm.dtb"
+
 UBOOT_MACHINE = "k2e_evm_config"
 
 BOOT_MONITOR_MAKE_TARGET = "k2e"
diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
index 4d03f87..b8e55e4 100644
--- a/conf/machine/k2g-evm.conf
+++ b/conf/machine/k2g-evm.conf
@@ -6,6 +6,8 @@ require conf/machine/include/k2g.inc
 
 MACHINE_FEATURES += "alsa opencl"
 
+KERNEL_DEVICETREE = "keystone-k2g-evm.dtb keystone-k2g-ice.dtb"
+
 UBOOT_MACHINE = "k2g_evm_config"
 
 BOOT_MONITOR_MAKE_TARGET = "k2g"
diff --git a/conf/machine/k2hk-evm.conf b/conf/machine/k2hk-evm.conf
index 220f7fc..c753e68 100644
--- a/conf/machine/k2hk-evm.conf
+++ b/conf/machine/k2hk-evm.conf
@@ -6,6 +6,8 @@ require conf/machine/include/keystone.inc
 
 MACHINE_FEATURES += "opencl"
 
+KERNEL_DEVICETREE = "keystone-k2hk-evm.dtb"
+
 UBOOT_MACHINE = "k2hk_evm_config"
 
 BOOT_MONITOR_MAKE_TARGET = "k2hk"
diff --git a/conf/machine/k2l-evm.conf b/conf/machine/k2l-evm.conf
index 54931e2..7a54492 100644
--- a/conf/machine/k2l-evm.conf
+++ b/conf/machine/k2l-evm.conf
@@ -6,6 +6,8 @@ require conf/machine/include/keystone.inc
 
 MACHINE_FEATURES += "opencl"
 
+KERNEL_DEVICETREE = "keystone-k2l-evm.dtb"
+
 UBOOT_MACHINE = "k2l_evm_config"
 
 BOOT_MONITOR_MAKE_TARGET = "k2l"
diff --git a/conf/machine/omap5-evm.conf b/conf/machine/omap5-evm.conf
index 2a19e77..7a71acc 100644
--- a/conf/machine/omap5-evm.conf
+++ b/conf/machine/omap5-evm.conf
@@ -6,6 +6,8 @@ require conf/machine/include/omap-a15.inc
 
 IMAGE_FSTYPES += "ubi tar.gz"
 
+KERNEL_DEVICETREE = "omap5-uevm.dtb"
+
 SERIAL_CONSOLE = "115200 ttyO2"
 
 # UBI information.  Note that this is board and kernel specific.  Changes
diff --git a/conf/machine/pandaboard.conf b/conf/machine/pandaboard.conf
index 99497c1..920cd1e 100644
--- a/conf/machine/pandaboard.conf
+++ b/conf/machine/pandaboard.conf
@@ -8,6 +8,8 @@ MACHINE_GUI_CLASS = "bigscreen"
 
 IMAGE_FSTYPES += "tar.gz"
 
+KERNEL_DEVICETREE = "omap4-panda.dtb omap4-panda-a4.dtb omap4-panda-es.dtb"
+
 SERIAL_CONSOLE = "115200 ttyO2"
 
 MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"


