Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 21EFBE00BDF; Wed, 17 Oct 2018 15:04:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C7D9E00AB9
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 15:04:57 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DA0F920D50;
	Wed, 17 Oct 2018 21:58:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id P9SIDsam6x02; Wed, 17 Oct 2018 21:58:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AD1B920D4B;
	Wed, 17 Oct 2018 21:58:46 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 111B1164879;
	Wed, 17 Oct 2018 17:58:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 17 Oct 2018 17:58:38 -0400
Message-Id: <1539813520-35570-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/3] conf/machine: define UBOOT_SUFFIX and SPL_BINARY in machine configs
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
X-List-Received-Date: Wed, 17 Oct 2018 22:04:58 -0000

From: Denys Dmytriyenko <denys@ti.com>

---
 conf/machine/beaglebone.conf      | 6 ------
 conf/machine/include/k3.inc       | 7 ++++---
 conf/machine/include/keystone.inc | 3 +++
 conf/machine/include/omap-a15.inc | 3 +++
 conf/machine/include/ti33x.inc    | 3 +++
 conf/machine/include/ti43x.inc    | 3 +++
 conf/machine/k2e-hs-evm.conf      | 1 +
 conf/machine/k2g-hs-evm.conf      | 1 +
 conf/machine/k2hk-hs-evm.conf     | 1 +
 conf/machine/k2l-hs-evm.conf      | 1 +
 conf/machine/omapl138-lcdk.conf   | 1 +
 11 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index 5e7348a..450a189 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -13,12 +13,6 @@ MACHINE_GUI_CLASS = "bigscreen"
 
 SERIAL_CONSOLES = "115200;ttyS0"
 
-# fall back on generic am335x_evm_config for now
-#UBOOT_MACHINE = "am335x_boneblack_config"
-
-SPL_BINARY = "MLO"
-UBOOT_SUFFIX = "img"
-
 WKS_FILE = "sdimage-bootpart.wks"
 
 do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index 1c540f3..22fdeb9 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -17,9 +17,10 @@ UBOOT_ARCH = "arm"
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
-EXTRA_IMAGEDEPENDS += " \
-    virtual/bootloader \
-"
+SPL_BINARY = "tispl.bin"
+UBOOT_SUFFIX = "img"
+
+EXTRA_IMAGEDEPENDS += "virtual/bootloader"
 
 MACHINE_GUI_CLASS = "smallscreen"
 
diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
index 3e96e92..ef33975 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -16,6 +16,9 @@ KERNEL_IMAGETYPE = "zImage"
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
+SPL_BINARY = "MLO"
+UBOOT_SUFFIX = "bin"
+
 # Use the expected value of the ubifs filesystem's volume name in the kernel
 # and u-boot.
 UBI_VOLNAME = "rootfs"
diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index 6dcff82..233b45f 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -19,6 +19,9 @@ UBOOT_ARCH = "arm"
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
+SPL_BINARY = "MLO"
+UBOOT_SUFFIX = "img"
+
 EXTRA_IMAGEDEPENDS += "virtual/bootloader"
 
 PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 05527b8..487ceb4 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -40,6 +40,9 @@ UBOOT_MACHINE = "am335x_evm_config"
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
+SPL_BINARY = "MLO"
+UBOOT_SUFFIX = "img"
+
 # Use the expected value of the ubifs filesystem's volume name in the kernel
 # and u-boot.
 UBI_VOLNAME = "rootfs"
diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index ddc270a..9adf140 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -38,6 +38,9 @@ UBOOT_MACHINE = "am43xx_evm_config"
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
+SPL_BINARY = "MLO"
+UBOOT_SUFFIX = "img"
+
 # Use the expected value of the ubifs filesystem's volume name in the kernel
 # and u-boot.
 UBI_VOLNAME = "rootfs"
diff --git a/conf/machine/k2e-hs-evm.conf b/conf/machine/k2e-hs-evm.conf
index 98d595d..1fc03d6 100644
--- a/conf/machine/k2e-hs-evm.conf
+++ b/conf/machine/k2e-hs-evm.conf
@@ -5,6 +5,7 @@
 require conf/machine/k2e-evm.conf
 
 UBOOT_MACHINE = "k2e_hs_evm_config"
+SPL_BINARY = ""
 
 UBOOT_ENTRYPOINT = "0x82000000"
 UBOOT_LOADADDRESS = "0x82000000"
diff --git a/conf/machine/k2g-hs-evm.conf b/conf/machine/k2g-hs-evm.conf
index 852e93b..0620b1f 100644
--- a/conf/machine/k2g-hs-evm.conf
+++ b/conf/machine/k2g-hs-evm.conf
@@ -5,6 +5,7 @@
 require conf/machine/k2g-evm.conf
 
 UBOOT_MACHINE = "k2g_hs_evm_config"
+SPL_BINARY = ""
 
 UBOOT_ENTRYPOINT = "0x82000000"
 UBOOT_LOADADDRESS = "0x82000000"
diff --git a/conf/machine/k2hk-hs-evm.conf b/conf/machine/k2hk-hs-evm.conf
index a5861e2..5c93ca4 100644
--- a/conf/machine/k2hk-hs-evm.conf
+++ b/conf/machine/k2hk-hs-evm.conf
@@ -5,6 +5,7 @@
 require conf/machine/k2hk-evm.conf
 
 UBOOT_MACHINE = "k2hk_hs_evm_config"
+SPL_BINARY = ""
 
 UBOOT_ENTRYPOINT = "0x82000000"
 UBOOT_LOADADDRESS = "0x82000000"
diff --git a/conf/machine/k2l-hs-evm.conf b/conf/machine/k2l-hs-evm.conf
index fe58b1d..097f94d 100644
--- a/conf/machine/k2l-hs-evm.conf
+++ b/conf/machine/k2l-hs-evm.conf
@@ -5,6 +5,7 @@
 require conf/machine/k2l-evm.conf
 
 UBOOT_MACHINE = "k2l_hs_evm_config"
+SPL_BINARY = ""
 
 UBOOT_ENTRYPOINT = "0x82000000"
 UBOOT_LOADADDRESS = "0x82000000"
diff --git a/conf/machine/omapl138-lcdk.conf b/conf/machine/omapl138-lcdk.conf
index c2ffb40..a6d6bf9 100644
--- a/conf/machine/omapl138-lcdk.conf
+++ b/conf/machine/omapl138-lcdk.conf
@@ -7,6 +7,7 @@ require conf/machine/include/omapl138.inc
 
 UBOOT_MACHINE = "omapl138_lcdk_config"
 UBOOT_SUFFIX = "ais"
+SPL_BINARY = ""
 
 UBOOT_ENTRYPOINT = "0xc0008000"
 UBOOT_LOADADDRESS = "0xc0008000"
-- 
2.7.4


