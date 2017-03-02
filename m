Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 52492E00887; Thu,  2 Mar 2017 15:44:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED2D1E0049D
	for <meta-ti@yoctoproject.org>; Thu,  2 Mar 2017 15:44:00 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3ABEA20B64;
	Thu,  2 Mar 2017 23:44:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bQEFuFtLsdAl; Thu,  2 Mar 2017 23:44:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 175682088F;
	Thu,  2 Mar 2017 23:43:59 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 923031623A5;
	Thu,  2 Mar 2017 18:43:58 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu,  2 Mar 2017 18:43:58 -0500
Message-Id: <1488498238-119605-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] conf/machine: simplify console settings, deprecate ttyO use
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
X-List-Received-Date: Thu, 02 Mar 2017 23:44:02 -0000

Now, that 4.9 finally switched from ttyO to ttyS and all issues were addressed,
no need to try all possible combinations in most cases.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am335x-evm.conf  | 3 ++-
 conf/machine/am3517-evm.conf  | 2 +-
 conf/machine/am37x-evm.conf   | 2 +-
 conf/machine/am437x-evm.conf  | 4 +---
 conf/machine/am57xx-evm.conf  | 4 +---
 conf/machine/beagleboard.conf | 2 +-
 conf/machine/beaglebone.conf  | 2 +-
 conf/machine/dra7xx-evm.conf  | 4 +---
 conf/machine/k2e-evm.conf     | 4 +---
 conf/machine/k2g-evm.conf     | 4 +---
 conf/machine/k2hk-evm.conf    | 4 +---
 conf/machine/k2l-evm.conf     | 4 +---
 conf/machine/omap5-evm.conf   | 2 +-
 conf/machine/pandaboard.conf  | 2 +-
 14 files changed, 15 insertions(+), 28 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index 86a828c..1833d71 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -11,8 +11,9 @@ MACHINE_FEATURES += "touchscreen"
 
 IMAGE_FSTYPES += "ubifs ubi tar.xz"
 
+# Normally AM335 boards use ttyS0, but ICE uses ttyS3, so try both
 SERIAL_CONSOLE = ""
-SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0 115200;ttyS3 115200;ttyO3"
+SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS3"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 # UBI information.  Note that this is board and kernel specific.  Changes
diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
index 883e9a4..23a1832 100644
--- a/conf/machine/am3517-evm.conf
+++ b/conf/machine/am3517-evm.conf
@@ -12,7 +12,7 @@ MACHINE_FEATURES += "touchscreen ethernet"
 IMAGE_FSTYPES += "ubi tar.gz"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
-SERIAL_CONSOLE = "115200 ttyO2"
+SERIAL_CONSOLE = "115200 ttyS2"
 USE_VT = "2"
 
 KERNEL_DEVICETREE = "am3517-evm.dtb"
diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
index c1776df..0e5ba69 100644
--- a/conf/machine/am37x-evm.conf
+++ b/conf/machine/am37x-evm.conf
@@ -14,7 +14,7 @@ EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
 KERNEL_DEVICETREE = "omap3-evm-37xx.dtb"
 
-SERIAL_CONSOLE = "115200 ttyO0"
+SERIAL_CONSOLE = "115200 ttyS0"
 
 # NOTE: there are NAND and OneNAND versions of this board...
 # do ubiattach /dev/ubi_ctrl -m 4
diff --git a/conf/machine/am437x-evm.conf b/conf/machine/am437x-evm.conf
index 98af5ec..fa2e514 100644
--- a/conf/machine/am437x-evm.conf
+++ b/conf/machine/am437x-evm.conf
@@ -11,9 +11,7 @@ MACHINE_FEATURES += "touchscreen"
 
 IMAGE_FSTYPES += "ubifs ubi tar.xz"
 
-SERIAL_CONSOLE = ""
-SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
+SERIAL_CONSOLE = "115200 ttyS0"
 
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more
diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index eef98f2..d8a729a 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -8,9 +8,7 @@ MACHINE_FEATURES += "touchscreen"
 
 IMAGE_FSTYPES += "tar.xz"
 
-SERIAL_CONSOLE = ""
-SERIAL_CONSOLES = "115200;ttyS2 115200;ttyO2"
-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
+SERIAL_CONSOLE = "115200 ttyS2"
 
 KERNEL_DEVICETREE = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb \
                     am57xx-evm.dtb am57xx-evm-reva3.dtb \
diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
index 4f05a0e..8dc77b1 100644
--- a/conf/machine/beagleboard.conf
+++ b/conf/machine/beagleboard.conf
@@ -12,7 +12,7 @@ EXTRA_IMAGECMD_jffs2 = "-lnp"
 
 KERNEL_DEVICETREE = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-beagle-xm-ab.dtb"
 
-SERIAL_CONSOLE = "115200 ttyO2"
+SERIAL_CONSOLE = "115200 ttyS2"
 
 UBOOT_MACHINE = "omap3_beagle_config"
 
diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index 72f3ba5..ff964ac 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -12,6 +12,6 @@ MACHINE_GUI_CLASS = "bigscreen"
 
 IMAGE_FSTYPES += "tar.gz"
 
-SERIAL_CONSOLE = "115200 ttyO0"
+SERIAL_CONSOLE = "115200 ttyS0"
 
 UBOOT_MACHINE = "am335x_boneblack_config"
diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index 86d2dbf..ed37770 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -8,9 +8,7 @@ MACHINE_FEATURES += "touchscreen"
 
 IMAGE_FSTYPES += "tar.xz"
 
-SERIAL_CONSOLE = ""
-SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
+SERIAL_CONSOLE = "115200 ttyS0"
 
 KERNEL_DEVICETREE = "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-evm-lcd-osd101t2045.dtb dra7-evm-lcd-osd101t2587.dtb \
                     dra72-evm.dtb dra72-evm-lcd-lg.dtb dra72-evm-lcd-osd101t2045.dtb dra72-evm-lcd-osd101t2587.dtb \
diff --git a/conf/machine/k2e-evm.conf b/conf/machine/k2e-evm.conf
index bb6b5fb..b26861b 100644
--- a/conf/machine/k2e-evm.conf
+++ b/conf/machine/k2e-evm.conf
@@ -12,9 +12,7 @@ BOOT_MONITOR_MAKE_TARGET = "k2e"
 
 IMAGE_FSTYPES += "ubifs ubi tar.xz"
 
-SERIAL_CONSOLE = ""
-SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
+SERIAL_CONSOLE = "115200 ttyS0"
 
 SYSVINIT_ENABLED_GETTYS = ""
 
diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
index 997406b..32c45d4 100644
--- a/conf/machine/k2g-evm.conf
+++ b/conf/machine/k2g-evm.conf
@@ -14,9 +14,7 @@ BOOT_MONITOR_MAKE_TARGET = "k2g"
 
 IMAGE_FSTYPES += "ubifs ubi tar.xz"
 
-SERIAL_CONSOLE = ""
-SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
+SERIAL_CONSOLE = "115200 ttyS0"
 
 SYSVINIT_ENABLED_GETTYS = ""
 
diff --git a/conf/machine/k2hk-evm.conf b/conf/machine/k2hk-evm.conf
index 88d1608..ad19dea 100644
--- a/conf/machine/k2hk-evm.conf
+++ b/conf/machine/k2hk-evm.conf
@@ -12,9 +12,7 @@ BOOT_MONITOR_MAKE_TARGET = "k2hk"
 
 IMAGE_FSTYPES += "ubifs ubi tar.xz"
 
-SERIAL_CONSOLE = ""
-SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
+SERIAL_CONSOLE = "115200 ttyS0"
 
 SYSVINIT_ENABLED_GETTYS = ""
 
diff --git a/conf/machine/k2l-evm.conf b/conf/machine/k2l-evm.conf
index 9b00a20..a1184f9 100644
--- a/conf/machine/k2l-evm.conf
+++ b/conf/machine/k2l-evm.conf
@@ -12,9 +12,7 @@ BOOT_MONITOR_MAKE_TARGET = "k2l"
 
 IMAGE_FSTYPES += "ubifs ubi tar.xz"
 
-SERIAL_CONSOLE = ""
-SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
+SERIAL_CONSOLE = "115200 ttyS0"
 
 SYSVINIT_ENABLED_GETTYS = ""
 
diff --git a/conf/machine/omap5-evm.conf b/conf/machine/omap5-evm.conf
index 7a71acc..290efc7 100644
--- a/conf/machine/omap5-evm.conf
+++ b/conf/machine/omap5-evm.conf
@@ -8,7 +8,7 @@ IMAGE_FSTYPES += "ubi tar.gz"
 
 KERNEL_DEVICETREE = "omap5-uevm.dtb"
 
-SERIAL_CONSOLE = "115200 ttyO2"
+SERIAL_CONSOLE = "115200 ttyS2"
 
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more
diff --git a/conf/machine/pandaboard.conf b/conf/machine/pandaboard.conf
index 920cd1e..8a0a284 100644
--- a/conf/machine/pandaboard.conf
+++ b/conf/machine/pandaboard.conf
@@ -10,7 +10,7 @@ IMAGE_FSTYPES += "tar.gz"
 
 KERNEL_DEVICETREE = "omap4-panda.dtb omap4-panda-a4.dtb omap4-panda-es.dtb"
 
-SERIAL_CONSOLE = "115200 ttyO2"
+SERIAL_CONSOLE = "115200 ttyS2"
 
 MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
 MACHINE_FEATURES = "kernel26 wifi bluetooth alsa apm ext2 screen usbgadget usbhost vfat sgx"
-- 
2.7.4


