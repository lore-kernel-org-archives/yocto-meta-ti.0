Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6A9F5E00DD9; Wed, 28 Feb 2018 16:02:09 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76897E00DCA
	for <meta-ti@yoctoproject.org>; Wed, 28 Feb 2018 16:02:07 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8B7D320B77;
	Thu,  1 Mar 2018 00:02:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id S48xbd6a36se; Thu,  1 Mar 2018 00:02:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5E13020059;
	Thu,  1 Mar 2018 00:02:06 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id BE8B01632DB;
	Wed, 28 Feb 2018 19:02:05 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 28 Feb 2018 19:02:04 -0500
Message-Id: <1519862524-48510-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519862524-48510-1-git-send-email-denys@ti.com>
References: <1519862524-48510-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 2/2] machines: update DTBs and other cleanups
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
X-List-Received-Date: Thu, 01 Mar 2018 00:02:09 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am57xx-evm.conf   |  5 +++--
 conf/machine/beagle-x15.conf   | 12 ++++++++----
 conf/machine/beaglebone.conf   | 12 +++++++-----
 conf/machine/dra7xx-evm.conf   |  2 +-
 conf/machine/include/ti33x.inc |  7 ++++++-
 conf/machine/include/ti43x.inc |  6 +++++-
 6 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 3419b39..b00460a 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -14,8 +14,9 @@ KERNEL_DEVICETREE = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-be
                     ti/am57xx-evm.dtbo ti/mt9t111.dtbo ti/ov10635.dtbo ti/am57xx-evm.itb \
                     am571x-idk.dtb am571x-idk-lcd-osd101t2045.dtb am571x-idk-lcd-osd101t2587.dtb \
                     am572x-idk.dtb am572x-idk-lcd-osd101t2045.dtb am572x-idk-lcd-osd101t2587.dtb \
-                    am574x-idk.dtb am574x-idk-lcd-osd101t2587.dtb \
-                    ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am574x-idk-pru-excl-uio.dtb am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
+                    am574x-idk.dtb am574x-idk-lcd-osd101t2587.dtb"
+
+KERNEL_DEVICETREE += "${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am574x-idk-pru-excl-uio.dtb am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
 
 UBOOT_MACHINE = "am57xx_evm_config"
 
diff --git a/conf/machine/beagle-x15.conf b/conf/machine/beagle-x15.conf
index e4552cd..da275ad 100644
--- a/conf/machine/beagle-x15.conf
+++ b/conf/machine/beagle-x15.conf
@@ -4,16 +4,20 @@
 
 require conf/machine/include/dra7xx.inc
 
-MACHINE_GUI_CLASS = "bigscreen"
+KERNEL_DEVICETREE = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-beagle-x15-revc.dtb"
 
-IMAGE_FSTYPES += "tar.xz"
+MACHINE_GUI_CLASS = "bigscreen"
 
 SERIAL_CONSOLE = "115200 ttyS2"
 
-KERNEL_DEVICETREE = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb"
-
 UBOOT_MACHINE = "am57xx_evm_config"
 
+WKS_FILE = "sdimage-bootpart.wks"
+IMAGE_BOOT_FILES = "MLO u-boot.img"
+IMAGE_FSTYPES += "tar.xz wic.xz"
+
+do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
+
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more
 # details about this board please see
diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index 715d2f2..06f4386 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -5,19 +5,21 @@
 require conf/machine/include/ti33x.inc
 require conf/machine/include/beaglebone.inc
 
-KERNEL_DEVICETREE = "am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
+KERNEL_DEVICETREE = "am335x-bone.dtb am335x-boneblue.dtb \
+                    am335x-boneblack.dtb am335x-boneblack-wireless.dtb \
+                    am335x-bonegreen.dtb am335x-bonegreen-wireless.dtb"
 
 # Only has DVI connector for external screen
 MACHINE_GUI_CLASS = "bigscreen"
 
-WKS_FILE = "sdimage-bootpart.wks"
-IMAGE_BOOT_FILES = "MLO u-boot.img"
-IMAGE_FSTYPES += "tar.xz wic.xz"
-
 SERIAL_CONSOLE = "115200 ttyS0"
 
 UBOOT_MACHINE = "am335x_boneblack_config"
 
+WKS_FILE = "sdimage-bootpart.wks"
+IMAGE_BOOT_FILES = "MLO u-boot.img"
+IMAGE_FSTYPES += "tar.xz wic.xz"
+
 do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
 
 # Refine the list of device targets for ti-pdk class recipes
diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index e0717c5..9a65a27 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -13,7 +13,7 @@ SERIAL_CONSOLE = "115200 ttyS0"
 KERNEL_DEVICETREE = "dra7-evm.dtb dra7-evm-lcd-osd101t2045.dtb dra7-evm-lcd-osd101t2587.dtb \
                     dra72-evm.dtb dra72-evm-lcd-osd101t2045.dtb dra72-evm-lcd-osd101t2587.dtb \
                     dra72-evm-revc.dtb dra72-evm-revc-lcd-osd101t2045.dtb dra72-evm-revc-lcd-osd101t2587.dtb \
-                    dra71-evm.dtb dra71-evm-lcd-auo-g101evn01.0.dtb \
+                    dra71-evm.dtb dra71-evm-lcd-auo-g101evn01.0.dtb dra71-lcard.dtb \
                     dra76-evm.dtb dra76-evm-tfp410.dtb"
 
 UBOOT_MACHINE = "dra7xx_evm_config"
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 4014f79..412bbac 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -26,7 +26,12 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
 KERNEL_IMAGETYPE = "zImage"
 
-KERNEL_DEVICETREE = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb am335x-icev2.dtb ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-pru-excl-uio.dtb', '', d)}"
+KERNEL_DEVICETREE = "am335x-evm.dtb am335x-evmsk.dtb am335x-icev2.dtb \
+                    am335x-bone.dtb am335x-boneblue.dtb \
+                    am335x-boneblack.dtb am335x-boneblack-wireless.dtb \
+                    am335x-bonegreen.dtb am335x-bonegreen-wireless.dtb"
+
+KERNEL_DEVICETREE += "${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-pru-excl-uio.dtb', '', d)}"
 
 UBOOT_ARCH = "arm"
 UBOOT_MACHINE = "am335x_evm_config"
diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index 243bc5a..85bc076 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -26,7 +26,11 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
 KERNEL_IMAGETYPE = "zImage"
 
-KERNEL_DEVICETREE = "am43x-epos-evm.dtb am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb am437x-sk-evm.dtb am437x-idk-evm.dtb ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am437x-idk-pru-excl-uio.dtb', '', d)}"
+KERNEL_DEVICETREE = "am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb \
+                    am437x-sk-evm.dtb am437x-idk-evm.dtb \
+                    am43x-epos-evm.dtb am43x-epos-evm-hdmi.dtb"
+
+KERNEL_DEVICETREE += "${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am437x-idk-pru-excl-uio.dtb', '', d)}"
 
 UBOOT_ARCH = "arm"
 UBOOT_MACHINE = "am43xx_evm_config"
-- 
2.7.4


