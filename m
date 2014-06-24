Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3C1FAE00509; Tue, 24 Jun 2014 16:35:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	TO_NO_BRKTS_DYNIP autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  1.1 TO_NO_BRKTS_DYNIP To: misformatted and dynamic rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30A5DE003FA
	for <meta-ti@yoctoproject.org>; Tue, 24 Jun 2014 16:35:09 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 58C62529F2; Tue, 24 Jun 2014 23:35:08 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140624233508.58C62529F2@arago-project.org>
Date: Tue, 24 Jun 2014 23:35:08 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : conf/machine: update legacy machines to use latest mainline kernel and u-boot
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
X-List-Received-Date: Tue, 24 Jun 2014 23:35:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 7241b9d0c20745a317d2fc6e5a0e22c12f256bd9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7241b9d0c20745a317d2fc6e5a0e22c12f256bd9

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Jun 24 04:23:52 2014 +0000

conf/machine: update legacy machines to use latest mainline kernel and u-boot

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am180x-evm.conf     |    4 ----
 conf/machine/am3517-evm.conf     |    5 -----
 conf/machine/am37x-evm.conf      |    4 ----
 conf/machine/beagleboard.conf    |    4 ----
 conf/machine/include/davinci.inc |    2 +-
 conf/machine/include/omap3.inc   |    2 +-
 conf/machine/omap3evm.conf       |    2 --
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


