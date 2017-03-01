Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4AB45E008D0; Wed,  1 Mar 2017 12:50:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E1278E00826
	for <meta-ti@yoctoproject.org>; Wed,  1 Mar 2017 12:50:46 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C674920BA4;
	Wed,  1 Mar 2017 20:50:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id rm7OTZTQC4fy; Wed,  1 Mar 2017 20:50:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A4C3020B6A;
	Wed,  1 Mar 2017 20:50:44 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id B1E7E16239A;
	Wed,  1 Mar 2017 15:50:43 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed,  1 Mar 2017 15:50:43 -0500
Message-Id: <1488401443-81952-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488401443-81952-1-git-send-email-denys@ti.com>
References: <1488401443-81952-1-git-send-email-denys@ti.com>
Subject: [morty/master][PATCH 2/2] conf/machine: deprecate opencl feature, introduce dsp feature
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
X-List-Received-Date: Wed, 01 Mar 2017 20:50:50 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/dra7xx.inc   | 2 +-
 conf/machine/include/keystone.inc | 2 +-
 conf/machine/include/omap-a15.inc | 2 +-
 conf/machine/k2e-evm.conf         | 2 --
 conf/machine/k2g-evm.conf         | 2 +-
 conf/machine/k2hk-evm.conf        | 2 --
 conf/machine/k2l-evm.conf         | 2 --
 7 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/conf/machine/include/dra7xx.inc b/conf/machine/include/dra7xx.inc
index 42941fd..857e1b3 100644
--- a/conf/machine/include/dra7xx.inc
+++ b/conf/machine/include/dra7xx.inc
@@ -1,4 +1,4 @@
 require conf/machine/include/omap-a15.inc
 SOC_FAMILY_append = ":dra7xx"
 
-MACHINE_FEATURES += "pci opencl"
+MACHINE_FEATURES += "pci"
diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
index dd1cbae..51ef563 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -23,5 +23,5 @@ UBI_VOLNAME = "rootfs"
 EXTRA_IMAGEDEPENDS += "u-boot"
 EXTRA_IMAGEDEPENDS += "boot-monitor"
 
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat pci"
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat pci dsp"
 MACHINE_FEATURES_BACKFILL_CONSIDERED = "rtc"
diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index a434456..d5ce54a 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -31,4 +31,4 @@ MACHINE_GUI_CLASS = "smallscreen"
 UBI_VOLNAME = "rootfs"
 
 # List common SoC features, may need to add touchscreen for specific machines
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet sgx mmip"
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet sgx mmip dsp"
diff --git a/conf/machine/k2e-evm.conf b/conf/machine/k2e-evm.conf
index 530e6dc..95b0e42 100644
--- a/conf/machine/k2e-evm.conf
+++ b/conf/machine/k2e-evm.conf
@@ -4,8 +4,6 @@
 
 require conf/machine/include/k2e.inc
 
-MACHINE_FEATURES += "opencl"
-
 KERNEL_DEVICETREE = "keystone-k2e-evm.dtb"
 
 UBOOT_MACHINE = "k2e_evm_config"
diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
index d7bf609..458dfe4 100644
--- a/conf/machine/k2g-evm.conf
+++ b/conf/machine/k2g-evm.conf
@@ -4,7 +4,7 @@
 
 require conf/machine/include/k2g.inc
 
-MACHINE_FEATURES += "alsa opencl"
+MACHINE_FEATURES += "alsa"
 
 KERNEL_DEVICETREE = "keystone-k2g-evm.dtb keystone-k2g-evm-lcd.dtb keystone-k2g-ice.dtb"
 
diff --git a/conf/machine/k2hk-evm.conf b/conf/machine/k2hk-evm.conf
index c753e68..6adb016 100644
--- a/conf/machine/k2hk-evm.conf
+++ b/conf/machine/k2hk-evm.conf
@@ -4,8 +4,6 @@
 
 require conf/machine/include/keystone.inc
 
-MACHINE_FEATURES += "opencl"
-
 KERNEL_DEVICETREE = "keystone-k2hk-evm.dtb"
 
 UBOOT_MACHINE = "k2hk_evm_config"
diff --git a/conf/machine/k2l-evm.conf b/conf/machine/k2l-evm.conf
index 7a54492..b4721d0 100644
--- a/conf/machine/k2l-evm.conf
+++ b/conf/machine/k2l-evm.conf
@@ -4,8 +4,6 @@
 
 require conf/machine/include/keystone.inc
 
-MACHINE_FEATURES += "opencl"
-
 KERNEL_DEVICETREE = "keystone-k2l-evm.dtb"
 
 UBOOT_MACHINE = "k2l_evm_config"
-- 
2.7.4


