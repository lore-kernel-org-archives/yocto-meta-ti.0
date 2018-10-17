Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 650D6E00AB9; Wed, 17 Oct 2018 15:04:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4BF2EE00A0C
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 15:04:52 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F181C20D44;
	Wed, 17 Oct 2018 21:58:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id DrqzRjBXOtSu; Wed, 17 Oct 2018 21:58:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AFEAE20D4C;
	Wed, 17 Oct 2018 21:58:46 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 2B4D31648F0;
	Wed, 17 Oct 2018 17:58:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 17 Oct 2018 17:58:40 -0400
Message-Id: <1539813520-35570-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539813520-35570-1-git-send-email-denis@denix.org>
References: <1539813520-35570-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/3] conf/machine: deprecate use of SERIAL_CONSOLE
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
X-List-Received-Date: Wed, 17 Oct 2018 22:04:53 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am335x-evm.conf     | 1 -
 conf/machine/am3517-evm.conf     | 2 +-
 conf/machine/am37x-evm.conf      | 2 +-
 conf/machine/am437x-evm.conf     | 2 +-
 conf/machine/am57xx-evm.conf     | 2 +-
 conf/machine/am65xx-evm.conf     | 2 +-
 conf/machine/beagle-x15.conf     | 2 +-
 conf/machine/beagleboard.conf    | 2 +-
 conf/machine/dra7xx-evm.conf     | 2 +-
 conf/machine/include/davinci.inc | 2 +-
 conf/machine/k2e-evm.conf        | 2 +-
 conf/machine/k2g-evm.conf        | 2 +-
 conf/machine/k2hk-evm.conf       | 2 +-
 conf/machine/k2l-evm.conf        | 2 +-
 conf/machine/omap3evm.conf       | 2 +-
 conf/machine/omap5-evm.conf      | 2 +-
 conf/machine/omapl138-lcdk.conf  | 2 +-
 conf/machine/pandaboard.conf     | 2 +-
 18 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index ba452db..f8696dc 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -10,7 +10,6 @@ MACHINE_FEATURES += "touchscreen"
 IMAGE_FSTYPES += "ubifs ubi tar.xz"
 
 # Normally AM335 boards use ttyS0, but ICE uses ttyS3, so try both
-SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS3"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
index e14ec1e..87e3f1e 100644
--- a/conf/machine/am3517-evm.conf
+++ b/conf/machine/am3517-evm.conf
@@ -10,7 +10,7 @@ MACHINE_FEATURES += "touchscreen ethernet"
 IMAGE_FSTYPES += "ubi tar.gz"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
-SERIAL_CONSOLE = "115200 ttyS2"
+SERIAL_CONSOLES = "115200;ttyS2"
 USE_VT = "2"
 
 KERNEL_DEVICETREE = "am3517-evm.dtb"
diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
index f96be3c..e9d1838 100644
--- a/conf/machine/am37x-evm.conf
+++ b/conf/machine/am37x-evm.conf
@@ -12,7 +12,7 @@ EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
 KERNEL_DEVICETREE = "omap3-evm-37xx.dtb"
 
-SERIAL_CONSOLE = "115200 ttyS0"
+SERIAL_CONSOLES = "115200;ttyS0"
 
 # NOTE: there are NAND and OneNAND versions of this board...
 # do ubiattach /dev/ubi_ctrl -m 4
diff --git a/conf/machine/am437x-evm.conf b/conf/machine/am437x-evm.conf
index 06ce4f8..43353ce 100644
--- a/conf/machine/am437x-evm.conf
+++ b/conf/machine/am437x-evm.conf
@@ -9,7 +9,7 @@ MACHINE_FEATURES += "touchscreen"
 
 IMAGE_FSTYPES += "ubifs ubi tar.xz"
 
-SERIAL_CONSOLE = "115200 ttyS0"
+SERIAL_CONSOLES = "115200;ttyS0"
 
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more
diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 545cd95..329f33f 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -8,7 +8,7 @@ MACHINE_FEATURES += "touchscreen"
 
 IMAGE_FSTYPES += "tar.xz"
 
-SERIAL_CONSOLE = "115200 ttyS2"
+SERIAL_CONSOLES = "115200;ttyS2"
 
 KERNEL_DEVICETREE = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-beagle-x15-revc.dtb \
                     am57xx-evm.dtb am57xx-evm-cam-mt9t111.dtb am57xx-evm-cam-ov10635.dtb \
diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
index 4bf8993..49e9c10 100644
--- a/conf/machine/am65xx-evm.conf
+++ b/conf/machine/am65xx-evm.conf
@@ -8,7 +8,7 @@ MACHINE_FEATURES += "touchscreen"
 
 IMAGE_FSTYPES += "tar.xz cpio cpio.xz wic.xz"
 
-SERIAL_CONSOLE = "115200 ttyS2"
+SERIAL_CONSOLES = "115200;ttyS2"
 
 KERNEL_DEVICETREE = " \
     ti/k3-am654-base-board.dtb \
diff --git a/conf/machine/beagle-x15.conf b/conf/machine/beagle-x15.conf
index da275ad..275a5ce 100644
--- a/conf/machine/beagle-x15.conf
+++ b/conf/machine/beagle-x15.conf
@@ -8,7 +8,7 @@ KERNEL_DEVICETREE = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-be
 
 MACHINE_GUI_CLASS = "bigscreen"
 
-SERIAL_CONSOLE = "115200 ttyS2"
+SERIAL_CONSOLES = "115200;ttyS2"
 
 UBOOT_MACHINE = "am57xx_evm_config"
 
diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
index 8dc77b1..37d23aa 100644
--- a/conf/machine/beagleboard.conf
+++ b/conf/machine/beagleboard.conf
@@ -12,7 +12,7 @@ EXTRA_IMAGECMD_jffs2 = "-lnp"
 
 KERNEL_DEVICETREE = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-beagle-xm-ab.dtb"
 
-SERIAL_CONSOLE = "115200 ttyS2"
+SERIAL_CONSOLES = "115200;ttyS2"
 
 UBOOT_MACHINE = "omap3_beagle_config"
 
diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index b9554ab..f8df957 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -8,7 +8,7 @@ MACHINE_FEATURES += "touchscreen"
 
 IMAGE_FSTYPES += "tar.xz"
 
-SERIAL_CONSOLE = "115200 ttyS0"
+SERIAL_CONSOLES = "115200;ttyS0"
 
 KERNEL_DEVICETREE = "dra7-evm.dtb dra7-evm-lcd-osd101t2045.dtb dra7-evm-lcd-osd101t2587.dtb \
                     dra72-evm.dtb dra72-evm-lcd-osd101t2045.dtb dra72-evm-lcd-osd101t2587.dtb \
diff --git a/conf/machine/include/davinci.inc b/conf/machine/include/davinci.inc
index 59e423d..6de6483 100644
--- a/conf/machine/include/davinci.inc
+++ b/conf/machine/include/davinci.inc
@@ -16,7 +16,7 @@ UBOOT_LOADADDRESS = "0x80008000"
 
 EXTRA_IMAGEDEPENDS += "u-boot"
 
-SERIAL_CONSOLE ?= "115200 ttyS0"
+SERIAL_CONSOLES ?= "115200;ttyS0"
 EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
 
 MACHINE_FEATURES = "kernel26 serial ethernet usbhost usbgadget mmc alsa"
diff --git a/conf/machine/k2e-evm.conf b/conf/machine/k2e-evm.conf
index 072d5af..e9f500f 100644
--- a/conf/machine/k2e-evm.conf
+++ b/conf/machine/k2e-evm.conf
@@ -12,7 +12,7 @@ BOOT_MONITOR_MAKE_TARGET = "k2e"
 
 IMAGE_FSTYPES += "ubifs ubi tar.xz"
 
-SERIAL_CONSOLE = "115200 ttyS0"
+SERIAL_CONSOLES = "115200;ttyS0"
 
 SYSVINIT_ENABLED_GETTYS = ""
 
diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
index e77fecc..a8ddc66 100644
--- a/conf/machine/k2g-evm.conf
+++ b/conf/machine/k2g-evm.conf
@@ -15,7 +15,7 @@ BOOT_MONITOR_MAKE_TARGET = "k2g"
 
 IMAGE_FSTYPES += "ubifs ubi tar.xz"
 
-SERIAL_CONSOLE = "115200 ttyS0"
+SERIAL_CONSOLES = "115200;ttyS0"
 
 SYSVINIT_ENABLED_GETTYS = ""
 
diff --git a/conf/machine/k2hk-evm.conf b/conf/machine/k2hk-evm.conf
index 6f1762d..de79de9 100644
--- a/conf/machine/k2hk-evm.conf
+++ b/conf/machine/k2hk-evm.conf
@@ -12,7 +12,7 @@ BOOT_MONITOR_MAKE_TARGET = "k2hk"
 
 IMAGE_FSTYPES += "ubifs ubi tar.xz"
 
-SERIAL_CONSOLE = "115200 ttyS0"
+SERIAL_CONSOLES = "115200;ttyS0"
 
 SYSVINIT_ENABLED_GETTYS = ""
 
diff --git a/conf/machine/k2l-evm.conf b/conf/machine/k2l-evm.conf
index c021161..e326ba2 100644
--- a/conf/machine/k2l-evm.conf
+++ b/conf/machine/k2l-evm.conf
@@ -12,7 +12,7 @@ BOOT_MONITOR_MAKE_TARGET = "k2l"
 
 IMAGE_FSTYPES += "ubifs ubi tar.xz"
 
-SERIAL_CONSOLE = "115200 ttyS0"
+SERIAL_CONSOLES = "115200;ttyS0"
 
 SYSVINIT_ENABLED_GETTYS = ""
 
diff --git a/conf/machine/omap3evm.conf b/conf/machine/omap3evm.conf
index a38bd7a..a7457c0 100644
--- a/conf/machine/omap3evm.conf
+++ b/conf/machine/omap3evm.conf
@@ -10,7 +10,7 @@ MACHINE_FEATURES += "touchscreen ethernet"
 IMAGE_FSTYPES += "jffs2 tar.gz"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
-SERIAL_CONSOLE = "115200 ttyS0"
+SERIAL_CONSOLES = "115200;ttyS0"
 USE_VT = "0"
 
 EXTRA_IMAGEDEPENDS += "x-load"
diff --git a/conf/machine/omap5-evm.conf b/conf/machine/omap5-evm.conf
index 290efc7..28044cb 100644
--- a/conf/machine/omap5-evm.conf
+++ b/conf/machine/omap5-evm.conf
@@ -8,7 +8,7 @@ IMAGE_FSTYPES += "ubi tar.gz"
 
 KERNEL_DEVICETREE = "omap5-uevm.dtb"
 
-SERIAL_CONSOLE = "115200 ttyS2"
+SERIAL_CONSOLES = "115200;ttyS2"
 
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more
diff --git a/conf/machine/omapl138-lcdk.conf b/conf/machine/omapl138-lcdk.conf
index a6d6bf9..06db2f8 100644
--- a/conf/machine/omapl138-lcdk.conf
+++ b/conf/machine/omapl138-lcdk.conf
@@ -14,7 +14,7 @@ UBOOT_LOADADDRESS = "0xc0008000"
 
 IMAGE_FSTYPES += "tar.xz"
 
-SERIAL_CONSOLE = "115200 ttyS2"
+SERIAL_CONSOLES = "115200;ttyS2"
 
 KERNEL_DEVICETREE = "da850-evm.dtb da850-lcdk.dtb"
 
diff --git a/conf/machine/pandaboard.conf b/conf/machine/pandaboard.conf
index 8a0a284..f01472d 100644
--- a/conf/machine/pandaboard.conf
+++ b/conf/machine/pandaboard.conf
@@ -10,7 +10,7 @@ IMAGE_FSTYPES += "tar.gz"
 
 KERNEL_DEVICETREE = "omap4-panda.dtb omap4-panda-a4.dtb omap4-panda-es.dtb"
 
-SERIAL_CONSOLE = "115200 ttyS2"
+SERIAL_CONSOLES = "115200;ttyS2"
 
 MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
 MACHINE_FEATURES = "kernel26 wifi bluetooth alsa apm ext2 screen usbgadget usbhost vfat sgx"
-- 
2.7.4


