Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B3F97E00DE5; Mon,  5 Feb 2018 10:30:13 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 405 seconds by postgrey-1.32 at yocto-www;
	Mon, 05 Feb 2018 10:30:01 PST
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4A22CE00DE5
	for <meta-ti@yoctoproject.org>; Mon,  5 Feb 2018 10:30:01 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D897020B04;
	Mon,  5 Feb 2018 18:23:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id eA7VUwgg2UMg; Mon,  5 Feb 2018 18:23:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B4E7020862;
	Mon,  5 Feb 2018 18:23:14 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 478D51631FD;
	Mon,  5 Feb 2018 13:23:14 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon,  5 Feb 2018 13:23:13 -0500
Message-Id: <1517854993-29354-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] conf/machine: deprecate use of base_conditional()
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
X-List-Received-Date: Mon, 05 Feb 2018 18:30:13 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am57xx-evm.conf   | 2 +-
 conf/machine/include/ti33x.inc | 2 +-
 conf/machine/include/ti43x.inc | 2 +-
 conf/machine/k2g-evm.conf      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 1832548..8e38982 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -16,7 +16,7 @@ KERNEL_DEVICETREE = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-be
                     am571x-idk.dtb am571x-idk-lcd-osd101t2045.dtb am571x-idk-lcd-osd101t2587.dtb \
                     am572x-idk.dtb am572x-idk-lcd-osd101t2045.dtb am572x-idk-lcd-osd101t2587.dtb \
                     am574x-idk.dtb am574x-idk-lcd-osd101t2587.dtb \
-                    ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am574x-idk-pru-excl-uio.dtb am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
+                    ${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am574x-idk-pru-excl-uio.dtb am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
 
 UBOOT_MACHINE = "am57xx_evm_config"
 
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 4014f79..4c62fb9 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -26,7 +26,7 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
 KERNEL_IMAGETYPE = "zImage"
 
-KERNEL_DEVICETREE = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb am335x-icev2.dtb ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-pru-excl-uio.dtb', '', d)}"
+KERNEL_DEVICETREE = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb am335x-icev2.dtb ${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-pru-excl-uio.dtb', '', d)}"
 
 UBOOT_ARCH = "arm"
 UBOOT_MACHINE = "am335x_evm_config"
diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index 243bc5a..87dcf55 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -26,7 +26,7 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
 KERNEL_IMAGETYPE = "zImage"
 
-KERNEL_DEVICETREE = "am43x-epos-evm.dtb am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb am437x-sk-evm.dtb am437x-idk-evm.dtb ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am437x-idk-pru-excl-uio.dtb', '', d)}"
+KERNEL_DEVICETREE = "am43x-epos-evm.dtb am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb am437x-sk-evm.dtb am437x-idk-evm.dtb ${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am437x-idk-pru-excl-uio.dtb', '', d)}"
 
 UBOOT_ARCH = "arm"
 UBOOT_MACHINE = "am43xx_evm_config"
diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
index da0234b..e77fecc 100644
--- a/conf/machine/k2g-evm.conf
+++ b/conf/machine/k2g-evm.conf
@@ -7,7 +7,7 @@ require conf/machine/include/k2g.inc
 MACHINE_FEATURES += "alsa"
 
 KERNEL_DEVICETREE = "keystone-k2g-evm.dtb keystone-k2g-evm-lcd.dtb keystone-k2g-ice.dtb \
-                     ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'keystone-k2g-ice-pru-excl-uio.dtb', '', d)}"
+                     ${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'keystone-k2g-ice-pru-excl-uio.dtb', '', d)}"
 
 UBOOT_MACHINE = "k2g_evm_config"
 
-- 
2.7.4


