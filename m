Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1AAF8E00283; Mon, 23 Jun 2014 15:23:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 65C46E0027B
	for <meta-ti@yoctoproject.org>; Mon, 23 Jun 2014 15:23:55 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7N00FPX7JTZ510@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 23 Jun 2014 17:23:54 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7A7ED2009B; Mon,
	23 Jun 2014 18:23:53 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 23 Jun 2014 18:23:52 -0400
Message-id: <1403562232-14628-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH] conf/machine: update legacy machines to use latest mainline kernel and u-boot
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
X-List-Received-Date: Mon, 23 Jun 2014 22:23:59 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am180x-evm.conf     | 4 ----
 conf/machine/am3517-evm.conf     | 5 -----
 conf/machine/am37x-evm.conf      | 4 ----
 conf/machine/beagleboard.conf    | 4 ----
 conf/machine/include/davinci.inc | 2 +-
 conf/machine/include/omap3.inc   | 2 +-
 conf/machine/omap3evm.conf       | 2 --
 7 files changed, 2 insertions(+), 21 deletions(-)

diff --git a/conf/machine/am180x-evm.conf b/conf/machine/am180x-evm.conf
index 44ca0c6..3182e8a 100644
--- a/conf/machine/am180x-evm.conf
+++ b/conf/machine/am180x-evm.conf
@@ -12,7 +12,3 @@ UBOOT_LOADADDRESS = "0xc0008000"
 IMAGE_FSTYPES += "tar.gz"
 
 SERIAL_CONSOLE = "115200 ttyS2"
-
-PREFERRED_PROVIDER_virtual/kernel = "linux-omapl138-psp"
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-am180x"
-PREFERRED_PROVIDER_u-boot = "u-boot-am180x"
diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
index b9b6d17..7295c1f 100644
--- a/conf/machine/am3517-evm.conf
+++ b/conf/machine/am3517-evm.conf
@@ -15,11 +15,6 @@ EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 SERIAL_CONSOLE = "115200 ttyO2"
 USE_VT = "2"
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
-
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-am3517"
-PREFERRED_PROVIDER_u-boot = "u-boot-am3517"
-
 UBOOT_MACHINE = "am3517_evm_config"
 XLOAD_MACHINE = "am3517evm_config"
 
diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
index 0d53d50..16ce73c 100644
--- a/conf/machine/am37x-evm.conf
+++ b/conf/machine/am37x-evm.conf
@@ -14,10 +14,6 @@ EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
 SERIAL_CONSOLE = "115200 ttyO0"
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-am37x"
-PREFERRED_PROVIDER_u-boot = "u-boot-am37x"
-
 # NOTE: there are NAND and OneNAND versions of this board...
 # do ubiattach /dev/ubi_ctrl -m 4
 # From dmesg:
diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
index f923119..32985b3 100644
--- a/conf/machine/beagleboard.conf
+++ b/conf/machine/beagleboard.conf
@@ -7,10 +7,6 @@ require conf/machine/include/omap3.inc
 # Only has DVI connector for external screen
 GUI_MACHINE_CLASS = "bigscreen"
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-mainline"
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-beagleboard"
-PREFERRED_PROVIDER_u-boot = "u-boot-beagleboard"
-
 IMAGE_FSTYPES += "tar.gz ubi"
 EXTRA_IMAGECMD_jffs2 = "-lnp"
 
diff --git a/conf/machine/include/davinci.inc b/conf/machine/include/davinci.inc
index 6be5eb7..9f90f24 100644
--- a/conf/machine/include/davinci.inc
+++ b/conf/machine/include/davinci.inc
@@ -5,7 +5,7 @@ MACHINE_KERNEL_PR = "r53"
 
 KERNEL_IMAGETYPE = "uImage"
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-davinci"
+PREFERRED_PROVIDER_virtual/kernel = "linux-mainline"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
 
 UBOOT_MACHINE = "davinci_dvevm_config"
diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index e71630b..0757b43 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -22,7 +22,7 @@ MACHINE_KERNEL_PR = "r126"
 KERNEL_IMAGETYPE = "uImage"
 
 # Default providers, may need to override for specific machines
-PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
+PREFERRED_PROVIDER_virtual/kernel = "linux-mainline"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
 
 UBOOT_ARCH = "arm"
diff --git a/conf/machine/omap3evm.conf b/conf/machine/omap3evm.conf
index 584866c..6bfd808 100644
--- a/conf/machine/omap3evm.conf
+++ b/conf/machine/omap3evm.conf
@@ -15,8 +15,6 @@ EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 SERIAL_CONSOLE = "115200 ttyS0"
 USE_VT = "0"
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
-
 EXTRA_IMAGEDEPENDS += "x-load"
 
 # NOTE: there are NAND and OneNAND versions of this board...
-- 
2.0.0


